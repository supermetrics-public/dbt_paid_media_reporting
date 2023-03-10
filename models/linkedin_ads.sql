{{ config(materialized = 'view') }}


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
from {{var('paid_media_reporting__supermetrics_schema')}}.LINKEDINADS_BASE as t1
LEFT JOIN {{var('paid_media_reporting__supermetrics_schema')}}.LINKEDINADS_REACH as t2
WHERE t1.campaign_group_name = t2.campaign_group_name

