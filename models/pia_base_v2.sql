{{ config(materialized = 'view') }}
select
    t1.ACCOUNT_ID, 
    t1.ACCOUNT_NAME, 
    t1.PIN_PROMOTION_ID as AD_ID, 
    t1.PIN_PROMOTION_NAME AS AD_NAME, 
    t1.CAMPAIGN_ID, 
    t1.CAMPAIGN_NAME, 
    CAST(t1.AD_GROUP_ID as varchar) AS AD_GROUP_ID,
    t1.AD_GROUP_NAME, 
    t1.CAMPAIGN_OBJECTIVE_TYPE AS CAMPAIGN_TYPE, 
    t1.CAMPAIGN_STATUS, 
    t1.CURRENCY, 
    t1.DATE, 
    'Pinterest Ads' as PLATFORM_LEVEL_1, 
    'Pinterest Ads' PLATFORM_LEVEL_2, 
    t1.CLICKS, 
    t1.COST, 
    t1.IMPRESSIONS,
    t2.FREQUENCY
from SM_TEMPLATES.DBT.PIA_BASE t1
left join SM_TEMPLATES.DBT.PIA_REACH t2
where t1.campaign_id = t2.campaign_id AND date is not null