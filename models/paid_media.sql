 {{ config(materialized = 'view') }}
 {{ config(enabled = var('paid_media_reporting__paid_media_enabled')) }}


{% set usable_models = [
    'paid_social',
    'google_ads',
    'amazon_ads',
    'criteo_ads',] %}

{% set enabled_models = get_enabled_models(usable_models) %}


with 

{% if var('paid_media_reporting__paid_social_enabled') == True %}


paid_social as

(
SELECT ACCOUNT_ID, ACCOUNT_NAME, AD_ID, AD_NAME, CAMPAIGN_ID, CAMPAIGN_NAME, AD_GROUP_ID, AD_GROUP_NAME, CAMPAIGN_TYPE, CAMPAIGN_STATUS, CURRENCY, DATE, PLATFORM_LEVEL_1, PLATFORM_LEVEL_2, NULL AS KEYWORD_NAME, NULL AS KEYWORD_ID, CLICKS, COST, IMPRESSIONS, REACH, FREQUENCY
FROM {{ref('paid_social')}}
),

{% endif %}


{% if var('paid_media_reporting__google_ads_enabled') == True %}


google_ads as

(
select ACCOUNT_ID, ACCOUNT_NAME, AD_ID, AD_NAME, CAMPAIGN_ID, CAMPAIGN_NAME, AD_GROUP_ID, AD_GROUP_NAME, CAMPAIGN_TYPE, CAMPAIGN_STATUS, CURRENCY, DATE, PLATFORM_LEVEL_1, PLATFORM_LEVEL_2, KEYWORD_NAME, KEYWORD_ID, CLICKS, COST, IMPRESSIONS, NULL AS REACH, NULL AS FREQUENCY
from {{ref('google_ads')}}
WHERE CAMPAIGN_TYPE NOT IN ('Search')
),

{% endif %}


{% if var('paid_media_reporting__amazon_ads_enabled') == True %}


amazon_ads as

(
SELECT ACCOUNT_ID, ACCOUNT_NAME, AD_ID, AD_NAME, CAMPAIGN_ID, CAMPAIGN_NAME, AD_GROUP_ID, AD_GROUP_NAME, CAMPAIGN_TYPE, CAMPAIGN_STATUS, CURRENCY, DATE, PLATFORM_LEVEL_1, PLATFORM_LEVEL_2, KEYWORD_NAME, KEYWORD_ID, CLICKS, COST, IMPRESSIONS, NULL AS REACH, NULL AS FREQUENCY
FROM {{ref('amazon_ads')}}
WHERE CAMPAIGN_TYPE = 'sponsoredProducts'
),

{% endif %}


{% if var('paid_media_reporting__criteo_ads_enabled') == True %}


criteo_ads as

(
select ACCOUNT_ID, ACCOUNT_NAME, NULL AS AD_ID, NULL AS AD_NAME, CAMPAIGN_ID, CAMPAIGN_NAME, NULL AS AD_GROUP_ID, NULL AS AD_GROUP_NAME, CAMPAIGN_TYPE, CAMPAIGN_STATUS, CURRENCY, DATE, NULL AS PLATFORM_LEVEL_1, NULL AS PLATFORM_LEVEL_2, NULL AS KEYWORD_NAME, NULL AS KEYWORD_ID, CLICKS, COST, IMPRESSIONS, REACH, NULL AS FREQUENCY
from {{ref('criteo_ads')}}
),

{% endif %}


unioned as (

    {{ union_ctes(ctes=enabled_models)}}

)

select *
from unioned