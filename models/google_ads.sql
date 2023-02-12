{{ config(materialized = 'view') }}


with display_video as

(

select date as date,
    profile as account_name, 
    currency as currency,
    profile_id as account_id,
    campaign_name as campaign_name,
    'Google Ads' as platform_level_1,
    'Google Ads' as platform_level_2,
    campaign_status as campaign_status,
    advertising_channel_type as campaign_type,
    campaign_id as campaign_id,
    ad_group_name as ad_group_name,
    ad_group_id as ad_group_id,
    image_ad_name as ad_name,
    ad_id as ad_id,
    NULL as keyword_name,
    NULL as keyword_id,
    clicks as clicks,
    cost as cost,
    impressions as impressions
    
from GOOGLEADS_BASE_DISPLAY_VIDEO
where campaign_type in ('Video', 'Display')
  
),

search as

(


select date as date,
    profile as account_name, 
    currency as currency,
    profile_id as account_id,
    campaign_name as campaign_name,
    'Google Ads' as platform_level_1,
    'Google Ads' as platform_level_2,
    campaign_status as campaign_status,
    advertising_channel_type as campaign_type,
    campaign_id as campaign_id,
    ad_group_name as ad_group_name,
    ad_group_id as ad_group_id,
    NULL as ad_name,
    NULL as ad_id,
    keyword as keyword_name,
    keyword_id as keyword_id,
    clicks as clicks,
    cost as cost,
    impressions as impressions
    
from GOOGLEADS_BASE_SEARCH
where campaign_type in ('Search')

),

performance_max as

(

select date as date,
    profile as account_name, 
    currency as currency,
    profile_id as account_id,
    campaign_name as campaign_name,
    'Google Ads' as platform_level_1,
    'Google Ads' as platform_level_2,
    campaign_status as campaign_status,
    advertising_channel_type as campaign_type,
    campaign_id as campaign_id,
    NULL as ad_group_name,
    NULL as ad_group_id,
    NULL as ad_name,
    NULL as ad_id,
    NULL as keyword_name,
    NULL as keyword_id,
    clicks as clicks,
    cost as cost,
    impressions as impressions
    
from GOOGLEADS_BASE_PERFORMANCE_MAX
where campaign_type in ('Performance Max')
  
)

select *
from display_video
union all
select *
from search
union all
select *
from performance_max