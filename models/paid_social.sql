{{ config(materialized = 'view') }}

select ACCOUNT_ID, ACCOUNT_NAME, AD_ID, AD_NAME, CAMPAIGN_ID, CAMPAIGN_NAME, AD_GROUP_ID, AD_GROUP_NAME, CAMPAIGN_TYPE, CAMPAIGN_STATUS, CURRENCY, DATE, PLATFORM_LEVEL_1, PLATFORM_LEVEL_2, CLICKS, COST, IMPRESSIONS, REACH, FREQUENCY
from  tiktok_ads
union 
select ACCOUNT_ID, ACCOUNT_NAME, AD_ID, AD_NAME, CAMPAIGN_ID, CAMPAIGN_NAME, AD_GROUP_ID, AD_GROUP_NAME, CAMPAIGN_TYPE, CAMPAIGN_STATUS, CURRENCY, DATE, PLATFORM_LEVEL_1, PLATFORM_LEVEL_2, CLICKS, COST, IMPRESSIONS, REACH, FREQUENCY
from meta_ads
union 
select ACCOUNT_ID, ACCOUNT_NAME, AD_ID, AD_NAME, CAMPAIGN_ID, CAMPAIGN_NAME, AD_GROUP_ID, AD_GROUP_NAME, CAMPAIGN_TYPE, CAMPAIGN_STATUS, CURRENCY, DATE, PLATFORM_LEVEL_1, PLATFORM_LEVEL_2, CLICKS, COST, IMPRESSIONS, NULL AS REACH, FREQUENCY
from snap_ads
union 
select ACCOUNT_ID, ACCOUNT_NAME, AD_ID, AD_NAME, CAMPAIGN_ID, CAMPAIGN_NAME, AD_GROUP_ID, AD_GROUP_NAME, CAMPAIGN_TYPE, CAMPAIGN_STATUS, CURRENCY, DATE, PLATFORM_LEVEL_1, PLATFORM_LEVEL_2, CLICKS, COST, IMPRESSIONS, REACH, NULL AS FREQUENCY
from linkedin_ads
union 
select ACCOUNT_ID, ACCOUNT_NAME, AD_ID, AD_NAME, CAMPAIGN_ID, CAMPAIGN_NAME, AD_GROUP_ID, AD_GROUP_NAME, CAMPAIGN_TYPE, CAMPAIGN_STATUS, CURRENCY, DATE, PLATFORM_LEVEL_1, PLATFORM_LEVEL_2, CLICKS, COST, IMPRESSIONS, NULL AS REACH, FREQUENCY
from pinterest_ads