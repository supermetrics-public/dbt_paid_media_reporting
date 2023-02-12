{{ config(materialized = 'view') }}
{{ config(enabled = var('paid_media_reporting__linkedin_ads_enabled')) }}


{% if var('amazon_ads_enabled') == True %}


select 
    t1.DATE, 
    t1.ACCOUNT_NAME, 
    t1.ACCOUNT_CURRENCY_CODE AS CURRENCY, 
    t1.ACCOUNT_ID, 
    t1.CAMPAIGN_GROUP_NAME AS CAMPAIGN_NAME, 
    'LinkedIn' as PLATFORM_LEVEL_1, 
    'LinkedIn' as PLATFORM_LEVEL_2, 
    NULL AS CAMPAIGN_TYPE, 
    t1.CAMPAIGN_GROUP_STATUS AS CAMPAIGN_STATUS, 
    t1.CAMPAIGN_GROUP_ID AS CAMPAIGN_ID, 
    t1.CAMPAIGN_NAME AS AD_GROUP_NAME, 
    t1.CAMPAIGN_ID AS AD_GROUP_ID, 
    t1.CREATIVE_TITLE AS AD_NAME, 
    t1.CREATIVE_ID AS AD_ID, 
    t1.CLICKS, 
    t1.SPEND AS COST, 
    t1.IMPRESSIONS,
    t2.REACH
from LINKEDINADS_BASE as t1
LEFT JOIN LINKEDINADS_REACH as t2
WHERE t1.campaign_group_name = t2.campaign_group_name

{% else %}

select 
    NULL as DATE, 
    NULL as ACCOUNT_NAME, 
    NULL AS CURRENCY, 
    NULL as ACCOUNT_ID, 
    NULL AS CAMPAIGN_NAME, 
    'LinkedIn' as PLATFORM_LEVEL_1, 
    'LinkedIn' as PLATFORM_LEVEL_2, 
    NULL AS CAMPAIGN_TYPE, 
    NULL AS CAMPAIGN_STATUS, 
    NULL AS CAMPAIGN_ID, 
    NULL AS AD_GROUP_NAME, 
    NULL AS AD_GROUP_ID, 
    NULL AS AD_NAME, 
    NULL AS AD_ID, 
    NULL as CLICKS, 
    NULL AS COST, 
    NULL as IMPRESSIONS,
    NULL as REACH

{% endif %}