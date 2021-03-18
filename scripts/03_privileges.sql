USE ROLE sysadmin;

-- OWNERSHIP
--Dev
GRANT OWNERSHIP ON DATABASE dev_raw_landing TO ROLE dev_loader;
GRANT OWNERSHIP ON DATABASE dev_raw_history TO ROLE dev_snapshotter;
GRANT OWNERSHIP ON DATABASE dev_warehouse TO ROLE dev_transformer;
GRANT OWNERSHIP ON SCHEMA dev_warehouse.mart TO ROLE dev_transformer;
GRANT OWNERSHIP ON SCHEMA dev_warehouse.warehouse TO ROLE dev_transformer;

-- Prod
GRANT OWNERSHIP ON DATABASE prod_raw_landing TO ROLE prod_loader;
GRANT OWNERSHIP ON DATABASE prod_raw_history TO ROLE prod_snapshotter;
GRANT OWNERSHIP ON DATABASE prod_warehouse TO ROLE prod_transformer;
GRANT OWNERSHIP ON SCHEMA prod_warehouse.mart TO ROLE prod_transformer;
GRANT OWNERSHIP ON SCHEMA prod_warehouse.warehouse TO ROLE prod_transformer;

-- Acc
GRANT OWNERSHIP ON DATABASE acc_warehouse TO ROLE acc_transformer;
GRANT OWNERSHIP ON SCHEMA acc_warehouse.mart TO ROLE acc_transformer;
GRANT OWNERSHIP ON SCHEMA acc_warehouse.warehouse TO ROLE acc_transformer;

-- Local
GRANT OWNERSHIP ON DATABASE dev_dnovak TO ROLE local_developer;
GRANT OWNERSHIP ON DATABASE dev_jhustler TO ROLE local_developer;
GRANT OWNERSHIP ON DATABASE dev_nlopes TO ROLE local_developer;
GRANT OWNERSHIP ON DATABASE dev_nmachado TO ROLE local_developer;
GRANT OWNERSHIP ON DATABASE dev_svdheide TO ROLE local_developer;
GRANT OWNERSHIP ON DATABASE dev_vribeiro TO ROLE local_developer;


USE ROLE securityadmin;
-- PRIVILEGES
-- System roles
-- Dev
GRANT USAGE ON DATABASE dev_raw_landing TO ROLE dev_snapshotter;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE dev_raw_landing TO ROLE dev_snapshotter;
GRANT SELECT ON FUTURE TABLES IN DATABASE dev_raw_landing TO ROLE dev_snapshotter;
GRANT SELECT ON FUTURE VIEWS IN DATABASE dev_raw_landing TO ROLE dev_snapshotter;


GRANT USAGE ON DATABASE dev_raw_landing TO ROLE dev_transformer;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE dev_raw_landing TO ROLE dev_transformer;
GRANT SELECT ON FUTURE TABLES IN DATABASE dev_raw_landing TO ROLE dev_transformer;
GRANT SELECT ON FUTURE VIEWS IN DATABASE dev_raw_landing TO ROLE dev_transformer;

GRANT USAGE ON DATABASE dev_raw_history TO ROLE dev_transformer;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE dev_raw_history TO ROLE dev_transformer;
GRANT SELECT ON FUTURE TABLES IN DATABASE dev_raw_history TO ROLE dev_transformer;
GRANT SELECT ON FUTURE VIEWS IN DATABASE dev_raw_history TO ROLE dev_transformer;

-- Prod
GRANT USAGE ON DATABASE prod_raw_landing TO ROLE prod_snapshotter;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE prod_raw_landing TO ROLE prod_snapshotter;
GRANT SELECT ON FUTURE TABLES IN DATABASE prod_raw_landing TO ROLE prod_snapshotter;
GRANT SELECT ON FUTURE VIEWS IN DATABASE prod_raw_landing TO ROLE prod_snapshotter;

GRANT USAGE ON DATABASE prod_raw_landing TO ROLE prod_transformer;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE prod_raw_landing TO ROLE prod_transformer;
GRANT SELECT ON FUTURE TABLES IN DATABASE prod_raw_landing TO ROLE prod_transformer;
GRANT SELECT ON FUTURE VIEWS IN DATABASE prod_raw_landing TO ROLE prod_transformer;

GRANT USAGE ON DATABASE prod_raw_history TO ROLE prod_transformer;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE prod_raw_history TO ROLE prod_transformer;
GRANT SELECT ON FUTURE TABLES IN DATABASE prod_raw_history TO ROLE prod_transformer;
GRANT SELECT ON FUTURE VIEWS IN DATABASE prod_raw_history TO ROLE prod_transformer;

-- Acc
GRANT USAGE ON DATABASE prod_raw_landing TO ROLE acc_transformer;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE prod_raw_landing TO ROLE acc_transformer;
GRANT SELECT ON FUTURE TABLES IN DATABASE prod_raw_landing TO ROLE acc_transformer;
GRANT SELECT ON FUTURE VIEWS IN DATABASE prod_raw_landing TO ROLE acc_transformer;


GRANT USAGE ON DATABASE prod_raw_history TO ROLE acc_transformer;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE prod_raw_history TO ROLE acc_transformer;
GRANT SELECT ON FUTURE TABLES IN DATABASE prod_raw_history TO ROLE acc_transformer;
GRANT SELECT ON FUTURE VIEWS IN DATABASE prod_raw_history TO ROLE acc_transformer;


-- Local
GRANT USAGE ON DATABASE dev_raw_landing TO ROLE local_developer;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE dev_raw_landing TO ROLE local_developer;
GRANT SELECT ON FUTURE TABLES IN DATABASE dev_raw_landing TO ROLE local_developer;
GRANT SELECT ON FUTURE VIEWS IN DATABASE dev_raw_landing TO ROLE local_developer;

GRANT USAGE ON DATABASE dev_raw_history TO ROLE local_developer;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE dev_raw_history TO ROLE local_developer;
GRANT SELECT ON FUTURE TABLES IN DATABASE dev_raw_history TO ROLE local_developer;
GRANT SELECT ON FUTURE VIEWS IN DATABASE dev_raw_history TO ROLE local_developer;

GRANT USAGE ON DATABASE dev_warehouse TO ROLE local_developer;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE dev_warehouse TO ROLE local_developer;
GRANT SELECT ON FUTURE TABLES IN DATABASE dev_warehouse TO ROLE local_developer;
GRANT SELECT ON FUTURE VIEWS IN DATABASE dev_warehouse TO ROLE local_developer;

GRANT USAGE ON DATABASE dev_raw_landing TO ROLE dev_snapshotter;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE dev_raw_landing TO ROLE dev_snapshotter;
GRANT SELECT ON FUTURE TABLES IN DATABASE dev_raw_landing TO ROLE prod_snapshotter;
GRANT SELECT ON FUTURE VIEWS IN DATABASE dev_raw_landing TO ROLE prod_snapshotter;

-- Business roles
-- Dev
-- BI
GRANT USAGE ON DATABASE dev_warehouse TO ROLE dev_bi;
GRANT USAGE ON SCHEMA dev_warehouse.mart TO ROLE dev_bi;
GRANT SELECT ON FUTURE TABLES IN SCHEMA dev_warehouse.mart TO ROLE dev_bi;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA dev_warehouse.mart TO ROLE dev_bi;

-- Reader
GRANT USAGE ON DATABASE dev_raw_landing TO ROLE dev_reader;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE dev_raw_landing TO ROLE dev_reader;
GRANT SELECT ON FUTURE TABLES IN DATABASE dev_raw_landing TO ROLE dev_reader;
GRANT SELECT ON FUTURE VIEWS IN DATABASE dev_raw_landing TO ROLE dev_reader;

GRANT USAGE ON DATABASE dev_raw_history TO ROLE dev_reader;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE dev_raw_history TO ROLE dev_reader;
GRANT SELECT ON FUTURE TABLES IN DATABASE dev_raw_history TO ROLE dev_reader;
GRANT SELECT ON FUTURE VIEWS IN DATABASE dev_raw_history TO ROLE dev_reader;

GRANT USAGE ON DATABASE dev_warehouse TO ROLE dev_reader;
GRANT USAGE ON SCHEMA dev_warehouse.warehouse TO ROLE dev_reader;
GRANT USAGE ON SCHEMA dev_warehouse.mart TO ROLE dev_reader;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE dev_warehouse TO ROLE dev_reader;
GRANT SELECT ON FUTURE TABLES IN DATABASE dev_warehouse TO ROLE dev_reader;
GRANT SELECT ON FUTURE VIEWS IN DATABASE dev_warehouse TO ROLE dev_reader;
GRANT SELECT ON FUTURE TABLES IN SCHEMA dev_warehouse.mart TO ROLE dev_reader;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA dev_warehouse.mart TO ROLE dev_reader;

-- Prod
-- BI
GRANT USAGE ON DATABASE prod_warehouse TO ROLE prod_bi;
GRANT USAGE ON SCHEMA prod_warehouse.mart TO ROLE prod_bi;
GRANT SELECT ON FUTURE TABLES IN SCHEMA prod_warehouse.mart TO ROLE prod_bi;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA prod_warehouse.mart TO ROLE prod_bi;

-- Reader
GRANT USAGE ON DATABASE prod_raw_landing TO ROLE prod_reader;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE prod_raw_landing TO ROLE prod_reader;
GRANT SELECT ON FUTURE TABLES IN DATABASE prod_raw_landing TO ROLE prod_reader;
GRANT SELECT ON FUTURE VIEWS IN DATABASE prod_raw_landing TO ROLE prod_reader;

GRANT USAGE ON DATABASE prod_raw_history TO ROLE prod_reader;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE prod_raw_history TO ROLE prod_reader;
GRANT SELECT ON FUTURE TABLES IN DATABASE prod_raw_history TO ROLE prod_reader;
GRANT SELECT ON FUTURE VIEWS IN DATABASE prod_raw_history TO ROLE prod_reader;

GRANT USAGE ON DATABASE prod_warehouse TO ROLE prod_reader;
GRANT USAGE ON SCHEMA prod_warehouse.warehouse TO ROLE prod_reader;
GRANT USAGE ON SCHEMA prod_warehouse.mart TO ROLE prod_reader;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE prod_warehouse TO ROLE prod_reader;
GRANT SELECT ON FUTURE TABLES IN DATABASE prod_warehouse TO ROLE prod_reader;
GRANT SELECT ON FUTURE VIEWS IN DATABASE prod_warehouse TO ROLE prod_reader;
GRANT SELECT ON FUTURE TABLES IN SCHEMA prod_warehouse.mart TO ROLE prod_reader;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA prod_warehouse.mart TO ROLE prod_reader;

-- Acc
-- Dev
-- BI
GRANT USAGE ON DATABASE acc_warehouse TO ROLE acc_bi;
GRANT USAGE ON SCHEMA acc_warehouse.mart TO ROLE acc_bi;
GRANT SELECT ON FUTURE TABLES IN SCHEMA acc_warehouse.mart TO ROLE acc_bi;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA acc_warehouse.mart TO ROLE acc_bi;

-- Reader
GRANT USAGE ON DATABASE prod_raw_landing TO ROLE acc_reader;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE prod_raw_landing TO ROLE acc_reader;
GRANT SELECT ON FUTURE TABLES IN DATABASE prod_raw_landing TO ROLE acc_reader;
GRANT SELECT ON FUTURE VIEWS IN DATABASE prod_raw_landing TO ROLE acc_reader;

GRANT USAGE ON DATABASE prod_raw_history TO ROLE acc_reader;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE prod_raw_history TO ROLE acc_reader;
GRANT SELECT ON FUTURE TABLES IN DATABASE prod_raw_history TO ROLE acc_reader;
GRANT SELECT ON FUTURE VIEWS IN DATABASE prod_raw_history TO ROLE acc_reader;

GRANT USAGE ON DATABASE acc_warehouse TO ROLE acc_reader;
GRANT USAGE ON SCHEMA acc_warehouse.warehouse TO ROLE acc_reader;
GRANT USAGE ON SCHEMA acc_warehouse.mart TO ROLE acc_reader;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE acc_warehouse TO ROLE acc_reader;
GRANT SELECT ON FUTURE TABLES IN DATABASE acc_warehouse TO ROLE acc_reader;
GRANT SELECT ON FUTURE VIEWS IN DATABASE acc_warehouse TO ROLE acc_reader;
GRANT SELECT ON FUTURE TABLES IN SCHEMA acc_warehouse.mart TO ROLE acc_reader;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA acc_warehouse.mart TO ROLE acc_reader;


-- Warehouses
-- Dev
GRANT USAGE ON WAREHOUSE loading TO ROLE dev_loader;
GRANT USAGE ON WAREHOUSE automation TO ROLE dev_snapshotter;
GRANT USAGE ON WAREHOUSE automation TO ROLE dev_transformer;
GRANT USAGE ON WAREHOUSE engineering TO ROLE dev_reader;
GRANT USAGE ON WAREHOUSE analytics TO ROLE dev_bi;


-- Prod
GRANT USAGE ON WAREHOUSE loading TO ROLE prod_loader;
GRANT USAGE ON WAREHOUSE automation TO ROLE prod_snapshotter;
GRANT USAGE ON WAREHOUSE automation TO ROLE prod_transformer;
GRANT USAGE ON WAREHOUSE engineering TO ROLE prod_reader;
GRANT USAGE ON WAREHOUSE analytics TO ROLE prod_bi;

-- Acc
GRANT USAGE ON WAREHOUSE automation TO ROLE acc_transformer;
GRANT USAGE ON WAREHOUSE engineering TO ROLE acc_reader;
GRANT USAGE ON WAREHOUSE analytics TO ROLE acc_bi;

-- Local
GRANT USAGE ON WAREHOUSE engineering TO ROLE local_developer;
