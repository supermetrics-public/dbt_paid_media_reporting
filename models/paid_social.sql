{{ config(materialized = 'view') }}
{{ config(enabled = var('paid_media_reporting__paid_social_enabled')) }}


{% set usable_models = [
	'linkedin_ads',
	'meta_ads',
	'pinterest_ads',
	'snap_ads',
	'tiktok_ads'] %}

{% set enabled_models = get_enabled_models(usable_models) %}

with

{% if var('paid_media_reporting__tiktok_ads_enabled') == True %}

tiktok_ads as

(
select ACCOUNT_ID, ACCOUNT_NAME, AD_ID, AD_NAME, CAMPAIGN_ID, CAMPAIGN_NAME, AD_GROUP_ID, AD_GROUP_NAME, CAMPAIGN_TYPE, CAMPAIGN_STATUS, CURRENCY, DATE, PLATFORM_LEVEL_1, PLATFORM_LEVEL_2, CLICKS, COST, IMPRESSIONS, REACH, FREQUENCY
from  {{ref('tiktok_ads')}}
),

{% endif %}


{% if var('paid_media_reporting__meta_ads_enabled') == True %}


meta_ads as

(

select ACCOUNT_ID, ACCOUNT_NAME, AD_ID, AD_NAME, CAMPAIGN_ID, CAMPAIGN_NAME, AD_GROUP_ID, AD_GROUP_NAME, CAMPAIGN_TYPE, CAMPAIGN_STATUS, CURRENCY, DATE, PLATFORM_LEVEL_1, PLATFORM_LEVEL_2, CLICKS, COST, IMPRESSIONS, REACH, FREQUENCY
from {{ref('meta_ads')}}

),

{% endif %}


{% if var('paid_media_reporting__snap_ads_enabled') == True %}


snap_ads as

(

select ACCOUNT_ID, ACCOUNT_NAME, AD_ID, AD_NAME, CAMPAIGN_ID, CAMPAIGN_NAME, AD_GROUP_ID, AD_GROUP_NAME, CAMPAIGN_TYPE, CAMPAIGN_STATUS, CURRENCY, DATE, PLATFORM_LEVEL_1, PLATFORM_LEVEL_2, CLICKS, COST, IMPRESSIONS, NULL AS REACH, FREQUENCY
from {{ref('snap_ads')}}

),

{% endif %}


{% if var('paid_media_reporting__linkedin_ads_enabled') == True %}


linkedin_ads as

(
 
select ACCOUNT_ID, ACCOUNT_NAME, AD_ID, AD_NAME, CAMPAIGN_ID, CAMPAIGN_NAME, AD_GROUP_ID, AD_GROUP_NAME, CAMPAIGN_TYPE, CAMPAIGN_STATUS, CURRENCY, DATE, PLATFORM_LEVEL_1, PLATFORM_LEVEL_2, CLICKS, COST, IMPRESSIONS, REACH, NULL AS FREQUENCY
from {{ref('linkedin_ads')}}

),

{% endif %}


{% if var('paid_media_reporting__pinterest_ads_enabled') == True %}

pinterest_ads as

(

select ACCOUNT_ID, ACCOUNT_NAME, AD_ID, AD_NAME, CAMPAIGN_ID, CAMPAIGN_NAME, AD_GROUP_ID, AD_GROUP_NAME, CAMPAIGN_TYPE, CAMPAIGN_STATUS, CURRENCY, DATE, PLATFORM_LEVEL_1, PLATFORM_LEVEL_2, CLICKS, COST, IMPRESSIONS, NULL AS REACH, FREQUENCY
from {{ref('pinterest_ads')}}

),

{% endif %}


unioned as (

	{{ union_ctes(ctes=enabled_models)}}

)

select *
from unioned