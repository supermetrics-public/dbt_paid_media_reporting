with product as
(
select date as date,
    ACCOUNT_NAME as account_name,
    currency as currency,
    ACCOUNT_ID as account_id,
    campaign_name as campaign_name,
    'Amazon Ads' as PLATFORM_LEVEL_1, 
    'Amazon Ads' as PLATFORM_LEVEL_2,
    campaign_status as campaign_status,
    campaign_type as campaign_type,
    campaign_id as campaign_id,
    ad_group_name as ad_group_name,
    ad_group_id as ad_group_id,
    NULL as ad_name,
    asin as ad_id,
    NULL as keyword_name,
    NULL as keyword_id,
    clicks as clicks,
    cost as cost,
    impressions as impressions
from "SM_TEMPLATES"."DBT"."AMAZON_BASE_PRODUCT"
),

search as
(
select date as date,
    ACCOUNT_NAME as account_name,
    NULL as currency,
    ACCOUNT_ID as account_id,
    campaign_name as campaign_name,
    'Amazon Ads' as PLATFORM_LEVEL_1, 
    'Amazon Ads' as PLATFORM_LEVEL_2,
    campaign_status as campaign_status,
    campaign_type as campaign_type,
    campaign_id as campaign_id,
    ad_group_name as ad_group_name,
    ad_group_id as ad_group_id,
    NULL as ad_name,
    NULL as ad_id,
    keyword_text as keyword_name,
    keyword_id as keyword_id,
    clicks as clicks,
    cost as cost,
    impressions as impressions
from "SM_TEMPLATES"."DBT"."AMAZON_BASE_SEARCH"
  
)

select * from product
union all
select * from search