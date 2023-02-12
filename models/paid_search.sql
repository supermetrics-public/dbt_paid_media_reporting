{{ config(materialized = 'view') }}
{{ config(enabled = var('paid_media_reporting__paid_search_enabled')) }}



{% set usable_models = [
	'amazon_ads',
	'bing_ads',
	'google_ads'] %}

{% set enabled_models = get_enabled_models(usable_models) %}



with 


{% if var('paid_media_reporting__google_ads_enabled') == True %}

google_ads as

(

SELECT DATE, ACCOUNT_NAME, CURRENCY, ACCOUNT_ID, CAMPAIGN_NAME, PLATFORM_LEVEL_1, PLATFORM_LEVEL_2, CAMPAIGN_STATUS, CAMPAIGN_TYPE, CAMPAIGN_ID, AD_GROUP_NAME, AD_GROUP_ID, KEYWORD_NAME, KEYWORD_ID, CLICKS, COST, IMPRESSIONS
FROM {{ref('google_ads')}}
WHERE CAMPAIGN_TYPE = 'Search'

),

{% endif %}


{% if var('paid_media_reporting__bing_ads_enabled') == True %}

bing_ads as


(

SELECT DATE, ACCOUNT_NAME, CURRENCY, ACCOUNT_ID, CAMPAIGN_NAME, PLATFORM_LEVEL_1, PLATFORM_LEVEL_2, CAMPAIGN_STATUS, CAMPAIGN_TYPE, CAMPAIGN_ID, AD_GROUP_NAME, AD_GROUP_ID, KEYWORD_NAME, KEYWORD_ID, CLICKS, COST, IMPRESSIONS
FROM {{ref('bing_ads')}}

),

{% endif %}

{% if var('paid_media_reporting__amazon_ads_enabled') == True %}

amazon_ads as

(

SELECT DATE, ACCOUNT_NAME, CURRENCY, ACCOUNT_ID, CAMPAIGN_NAME, PLATFORM_LEVEL_1, PLATFORM_LEVEL_2, CAMPAIGN_STATUS, CAMPAIGN_TYPE, CAMPAIGN_ID, AD_GROUP_NAME, AD_GROUP_ID, KEYWORD_NAME, KEYWORD_ID, CLICKS, COST, IMPRESSIONS
FROM {{ref('amazon_ads')}}
WHERE CAMPAIGN_TYPE IS NULL

),

{% endif %}



unioned as (

	{{ union_ctes(ctes=enabled_models)}}

)

select *
from unioned

