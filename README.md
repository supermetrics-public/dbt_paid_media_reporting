### Supermetrics Paid Media Template

The supermetrics Paid Media template returns three composite models:
- Paid Media Overview
- Paid Social Overview
- Paid Search Overview

The following data sources are included in the models:
- Amazon Ads
- Bing Ads
- Criteo Ads
- Google Ads
- LinkedIn Ads
- Meta Ads
- Pinterest Ads
- Snap Ads
- TikTok Ads

**This dbt package has currently only been tested with Snowflake**

### Instructions for setup

## Step 1: Set up transfers using Supermetrics

Log into your account or start a free trial at [Supermetrics.com](https://team.supermetrics.com). Configure your Snowflake destination and create some data transfers to move data to a single schema in Snowflake.

When selecting the schema to use for your transfer, please choose the option labelled "DBT".

## Step 2: Install the package into your dbt project

Add this package to your `packages.yml`. Currently, it is only available on GitHub. The entry in your `packages.yml` file should look like:

```
packages:
	- git: "https://github.com/supermetrics-public/dbt_paid_media_reporting.git"
	  revision: 0.0.1

```

Once you've made the entry, run `dbt deps`. This will install the package from GitHub.

## Step 3: Configure your profile and schemas

The package will automatically build models in the target schema specified in your profile. The schema should be the same schema that you transferred data to in Step 1. This may be the same schema as your target schema, but it is recommended to have separate schemas storing your source tables and target views. 

Tell dbt which schema your Supermetrics data by adding the following variable to your `dbt_project.yml`:

```
vars:
  paid_media_reporting__supermetrics_schema
```

## Step 4: Configure your data sources

In your `dbt_project.yml`, add the following variables. Please ensure that you've properly enabled or disabled the datasources you expect to use. The model build will fail if this is not specified correctly.

This package uses the following variables:

```
vars:
  paid_media_reporting__amazon_ads_enabled: True
  paid_media_reporting__bing_ads_enabled: True
  paid_media_reporting__criteo_ads_enabled: True 
  paid_media_reporting__google_ads_enabled: True
  paid_media_reporting__pinterest_ads_enabled: True  
  paid_media_reporting__linkedin_ads_enabled: True
  paid_media_reporting__meta_ads_enabled: True
  paid_media_reporting__snap_ads_enabled: True
  paid_media_reporting__tiktok_ads_enabled: True 
  paid_media_reporting__paid_social_enabled: True
  paid_media_reporting__paid_search_enabled: True
  paid_media_reporting__paid_media_enabled: True

```


## Step 5: dbt run

Run a `dbt run` command and watch your model build.
