{{ config(materialized = 'view') }}


SELECT 
    t1.PROFILE_ID AS ACCOUNT_ID, 
    t1.PROFILE AS ACCOUNT_NAME,
    t1.AD_ID, 
    t1.AD_NAME, 
    t1.CAMPAIGN_ID, 
    t1.CAMPAIGN_NAME, 
    t1.AD_GROUP_ID,
    t1.AD_GROUP_NAME,
    t1.CAMPAIGN_BUYING_TYPE || ' / ' || CAMPAIGN_OBJECTIVE AS CAMPAIGN_TYPE,
    t1.CAMPAIGN_STATUS,
    t1.CURRENCY,
    t1.DATE,
    'Meta' AS PLATFORM_LEVEL_1, 
    t1.PUBLISHER_PLATFORM as PLATFORM_LEVEL_2,
    t1.ACTION_LINK_CLICK AS CLICKS, 
    t1.COST, 
    t1.IMPRESSIONS,
    t2.REACH,
    t2.FREQUENCY
FROM {{var('paid_media_reporting__supermetrics_schema')}}.FBADS_BASE as t1
LEFT JOIN {{var('paid_media_reporting__supermetrics_schema')}}.FBADS_REACH as t2
WHERE t1.campaign_id = t2.campaign_id