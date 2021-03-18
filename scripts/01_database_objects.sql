USE ROLE sysadmin;

-- DATABASES
-- Dev
CREATE DATABASE dev_raw_landing;
CREATE DATABASE dev_raw_history;

CREATE DATABASE dev_warehouse;
CREATE SCHEMA dev_warehouse.mart;
CREATE SCHEMA dev_warehouse.warehouse;

-- Prod
CREATE DATABASE prod_raw_landing;
CREATE DATABASE prod_raw_history;

CREATE DATABASE prod_warehouse;
CREATE SCHEMA prod_warehouse.mart;
CREATE SCHEMA prod_warehouse.warehouse;

-- Acc
CREATE DATABASE acc_warehouse;
CREATE SCHEMA acc_warehouse.mart;
CREATE SCHEMA acc_warehouse.warehouse;

-- Local
CREATE DATABASE dev_dnovak;
CREATE DATABASE dev_jhustler;
CREATE DATABASE dev_nlopes;
CREATE DATABASE dev_nmachado;
CREATE DATABASE dev_svdheide;
CREATE DATABASE dev_vribeiro;

-- WAREHOUSES
CREATE WAREHOUSE loading
    WAREHOUSE_SIZE = XSMALL
    AUTO_RESUME = TRUE
    AUTO_SUSPEND = 120
    MIN_CLUSTER_COUNT = 1
    MAX_CLUSTER_COUNT = 1
    INITIALLY_SUSPENDED = TRUE;

CREATE WAREHOUSE automation
    WAREHOUSE_SIZE = XSMALL
    AUTO_RESUME = TRUE
    AUTO_SUSPEND = 120
    MIN_CLUSTER_COUNT = 1
    MAX_CLUSTER_COUNT = 1
    INITIALLY_SUSPENDED = TRUE;

CREATE WAREHOUSE engineering
    WAREHOUSE_SIZE = XSMALL
    AUTO_RESUME = TRUE
    AUTO_SUSPEND = 300
    MIN_CLUSTER_COUNT = 1
    MAX_CLUSTER_COUNT = 1
    INITIALLY_SUSPENDED = TRUE;

CREATE WAREHOUSE analytics
    WAREHOUSE_SIZE = XSMALL
    AUTO_RESUME = TRUE
    AUTO_SUSPEND = 300
    MIN_CLUSTER_COUNT = 1
    MAX_CLUSTER_COUNT = 1
    INITIALLY_SUSPENDED = TRUE;