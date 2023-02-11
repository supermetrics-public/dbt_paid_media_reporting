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

## Step 2: Clone the repo into your dbt project

Run the following commands to clone this package into your dbt project:
`git clone https://github.com/supermetrics-public/dbt_paid_media_reporting.git`

## Step 3: Configure your profile

Snowflake requires a profile to be configured. Please ensure that you have a schema selected in your profile. The Supermetrics package will be looking for a profile called `sm_dbt`.

## Step 4: Configure your data sources

In your `dbt_project.yml` please ensure that you've properly enabled or disabled the datasources you expect to use. The model build will fail if this is not specified correctly. A sample is provided in this package.

Note: at this time, disabling data sources is only avilable for Amazon Ads, Criteo and LinkedIn ads. All other sources are considered required for the model to function correcly.


## Step 5: dbt run

Run a `dbt run` command and watch your model build.
