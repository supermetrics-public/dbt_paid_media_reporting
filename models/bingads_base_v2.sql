{{ config(materialized = 'view') }}

select date as date,
    ACCOUNT_NAME as account_name,
    NULL as currency,
    ACCOUNT_ID as account_id,
    campaign_name as campaign_name,
    'Bing Ads' as PLATFORM_LEVEL_1, 
    'Bing Ads' as PLATFORM_LEVEL_2,
    campaign_status as campaign_status,
    CAMPAIGN_TYPE as campaign_type,
    campaign_id as campaign_id,
    ad_group_name as ad_group_name,
    ad_group_id as ad_group_id,
    NULL as ad_name,
    NULL as ad_id,
    keyword as keyword_name,
    keyword_id as keyword_id,
    clicks as clicks,
    SPEND as cost,
    impressions as impressions
from SM_TEMPLATES.DBT.BINGADS_BASE