 {{ config(materialized = 'view') }}

SELECT ACCOUNT_ID, ACCOUNT_NAME, AD_ID, AD_NAME, CAMPAIGN_ID, CAMPAIGN_NAME, AD_GROUP_ID, AD_GROUP_NAME, CAMPAIGN_TYPE, CAMPAIGN_STATUS, CURRENCY, DATE, PLATFORM_LEVEL_1, PLATFORM_LEVEL_2, NULL AS KEYWORD_NAME, NULL AS KEYWORD_ID, CLICKS, COST, IMPRESSIONS, REACH, FREQUENCY
FROM SM_TEMPLATES.DBT.PAID_SOCIAL_V2
union 
select ACCOUNT_ID, ACCOUNT_NAME, AD_ID, AD_NAME, CAMPAIGN_ID, CAMPAIGN_NAME, AD_GROUP_ID, AD_GROUP_NAME, CAMPAIGN_TYPE, CAMPAIGN_STATUS, CURRENCY, DATE, PLATFORM_LEVEL_1, PLATFORM_LEVEL_2, KEYWORD_NAME, KEYWORD_ID, CLICKS, COST, IMPRESSIONS, NULL AS REACH, NULL AS FREQUENCY
from SM_TEMPLATES.DBT.GOOGLEADS_BASE_V2
WHERE CAMPAIGN_TYPE NOT IN ('Search')
union
SELECT ACCOUNT_ID, ACCOUNT_NAME, AD_ID, AD_NAME, CAMPAIGN_ID, CAMPAIGN_NAME, AD_GROUP_ID, AD_GROUP_NAME, CAMPAIGN_TYPE, CAMPAIGN_STATUS, CURRENCY, DATE, PLATFORM_LEVEL_1, PLATFORM_LEVEL_2, KEYWORD_NAME, KEYWORD_ID, CLICKS, COST, IMPRESSIONS, NULL AS REACH, NULL AS FREQUENCY
FROM SM_TEMPLATES.DBT.AMAZON_BASE_V2
WHERE CAMPAIGN_TYPE = 'sponsoredProducts'
union
select ACCOUNT_ID, ACCOUNT_NAME, NULL AS AD_ID, NULL AS AD_NAME, CAMPAIGN_ID, CAMPAIGN_NAME, NULL AS AD_GROUP_ID, NULL AS AD_GROUP_NAME, CAMPAIGN_TYPE, CAMPAIGN_STATUS, CURRENCY, DATE, NULL AS PLATFORM_LEVEL_1, NULL AS PLATFORM_LEVEL_2, NULL AS KEYWORD_NAME, NULL AS KEYWORD_ID, CLICKS, COST, IMPRESSIONS, REACH, NULL AS FREQUENCY
from SM_TEMPLATES.DBT.CRI_BASE_V2