{{ config(materialized = 'view') }}

SELECT DATE, ACCOUNT_NAME, CURRENCY, ACCOUNT_ID, CAMPAIGN_NAME, PLATFORM_LEVEL_1, PLATFORM_LEVEL_2, CAMPAIGN_STATUS, CAMPAIGN_TYPE, CAMPAIGN_ID, AD_GROUP_NAME, AD_GROUP_ID, KEYWORD_NAME, KEYWORD_ID, CLICKS, COST, IMPRESSIONS
FROM SM_TEMPLATES.DBT.GOOGLEADS_BASE_V2
WHERE CAMPAIGN_TYPE = 'Search'
UNION
SELECT DATE, ACCOUNT_NAME, CURRENCY, ACCOUNT_ID, CAMPAIGN_NAME, PLATFORM_LEVEL_1, PLATFORM_LEVEL_2, CAMPAIGN_STATUS, CAMPAIGN_TYPE, CAMPAIGN_ID, AD_GROUP_NAME, AD_GROUP_ID, KEYWORD_NAME, KEYWORD_ID, CLICKS, COST, IMPRESSIONS
FROM SM_TEMPLATES.DBT.BINGADS_BASE_V2
UNION
SELECT DATE, ACCOUNT_NAME, CURRENCY, ACCOUNT_ID, CAMPAIGN_NAME, PLATFORM_LEVEL_1, PLATFORM_LEVEL_2, CAMPAIGN_STATUS, CAMPAIGN_TYPE, CAMPAIGN_ID, AD_GROUP_NAME, AD_GROUP_ID, KEYWORD_NAME, KEYWORD_ID, CLICKS, COST, IMPRESSIONS
FROM SM_TEMPLATES.DBT.AMAZON_BASE_V2
WHERE CAMPAIGN_TYPE IS NULL