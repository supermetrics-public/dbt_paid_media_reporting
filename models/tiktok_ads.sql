{{ config(materialized = 'view') }}


SELECT
    t1.AD_GROUP_ID,
    t1.AD_GROUP_NAME, 
    t1.AD_ID, 
    t1.AD_NAME, 
    t1.ADVERTISER_CURRENCY AS CURRENCY, 
    t1.ADVERTISER_ID AS ACCOUNT_ID, 
    t1.ADVERTISER_NAME AS ACCOUNT_NAME,
    t1.CAMPAIGN_ID, 
    t1.CAMPAIGN_NAME, 
    t1.CAMPAIGN_OPERATION_STATUS AS CAMPAIGN_STATUS, 
    t1.CAMPAIGN_TYPE, 
    t1.DATE, 
    'TikTok' as PLATFORM_LEVEL_1, 
    'TikTok' as PLATFORM_LEVEL_2, 
    t1.CLICKS, 
    t1.COST, 
    t1.IMPRESSIONS,
    t2.REACH,
    t2.FREQUENCY
FROM {{var('paid_media_reporting__supermetrics_schema')}}.TIK_BASE t1
LEFT JOIN {{var('paid_media_reporting__supermetrics_schema')}}.TIK_REACH t2
WHERE t1.campaign_id = t2.campaign_id