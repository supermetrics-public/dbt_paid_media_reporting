{{ config(materialized = 'view') }}


select distinct
    t1.ACCOUNT_ID, 
    t1.ACCOUNT_NAME, 
    t1.AD_ID, 
    t1.AD_NAME,
    t1.CAMPAIGN_ID, 
    t1.CAMPAIGN_NAME,
    t1.AD_SQUAD_ID AS AD_GROUP_ID, 
    t1.AD_SQUAD_NAME AS AD_GROUP_NAME, 
    t1.CAMPAIGN_BUY_MODEL AS CAMPAIGN_TYPE, 
    t1.CAMPAIGN_STATUS,
    t1.CURRENCY,
    t1.DATE,
    'Snapchat' as PLATFORM_LEVEL_1, 
    'Snapchat' as PLATFORM_LEVEL_2, 
    t1.SWIPES AS CLICKS,
    t1.COST,
    t1.IMPRESSIONS,
    t2.FREQUENCY
from SNAPCHT_BASE t1
left join SNAPCHT_REACH t2
WHERE t1.campaign_id = t2.campaign_id