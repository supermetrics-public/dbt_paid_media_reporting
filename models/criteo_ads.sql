{{ config(materialized = 'view') }}
{{ config(enabled = var('paid_media_reporting__criteo_ads_enabled')) }}


{% if var('criteo_ads_enabled') == True %}


WITH base AS (
  SELECT CURRENCY, 
  ADSET_BID_STRATEGY AS CAMPAIGN_TYPE, 
  ADSET_ID AS CAMPAIGN_ID, 
  ADSET_NAME AS CAMPAIGN_NAME, 
  ADSET_STATUS AS CAMPAIGN_STATUS, 
  ADVERTISER_ID AS ACCOUNT_ID, 
  ADVERTISER_NAME AS ACCOUNT_NAME, 
  DATE, 
  CLICKS, 
  COST, 
  IMPRESSIONS
  FROM CRI_BASE
),
reach AS (
  SELECT ADSET_ID AS CAMPAIGN_ID, 
  ADSET_NAME AS CAMPAIGN_NAME, 
  UNIQUE_IMPRESSIONS AS AUDIENCE_SIZE, 
  CAST(UNIQUE_IMPRESSIONS * REACH AS INTEGER) AS REACH
  FROM CRI_REACH
)
SELECT 
  base.CURRENCY, 
  base.CAMPAIGN_TYPE, 
  base.CAMPAIGN_ID, 
  base.CAMPAIGN_NAME, 
  base.CAMPAIGN_STATUS, 
  base.ACCOUNT_ID, 
  base.ACCOUNT_NAME, 
  base.DATE, 
  base.CLICKS, 
  base.COST, 
  base.IMPRESSIONS, 
  reach.AUDIENCE_SIZE, 
  reach.REACH
FROM base
LEFT JOIN reach
ON base.CAMPAIGN_ID = reach.CAMPAIGN_ID

{% else %}

select NULL as CURRENCY, 
  NULL as CAMPAIGN_TYPE, 
  NULL as CAMPAIGN_ID, 
  NULL as CAMPAIGN_NAME, 
  NULL as CAMPAIGN_STATUS, 
  NULL as ACCOUNT_ID, 
  NULL as ACCOUNT_NAME, 
  NULL as DATE, 
  NULL as CLICKS, 
  NULL as COST, 
  NULL as IMPRESSIONS, 
  NULL as AUDIENCE_SIZE, 
  NULL as REACH
    
{% endif %}