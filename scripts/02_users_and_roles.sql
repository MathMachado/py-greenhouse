USE ROLE useradmin;

-- USERS
-- Humans
CREATE USER aelsinga DEFAULT_ROLE = dev_bi;
CREATE USER dnovak DEFAULT_ROLE = local_developer;
CREATE USER eheesters DEFAULT_ROLE = dev_bi;
CREATE USER jhustler DEFAULT_ROLE = local_developer;
CREATE USER nlopes DEFAULT_ROLE = local_developer;
CREATE USER nmachado DEFAULT_ROLE = local_developer;
CREATE USER sheidevander DEFAULT_ROLE = dev_reader;
CREATE USER vribeiro DEFAULT_ROLE = local_developer;

-- System users
CREATE USER dev_fivetran;
CREATE USER prod_fivetran;
CREATE USER dev_azure_pipeline;
CREATE USER prod_azure_pipeline;
CREATE USER acc_azure_pipeline;

CREATE USER dev_az_datafactory;
CREATE USER prod_az_datafactory;

CREATE USER bi_refresh;

CREATE USER network_policy_admin DEFAULT_ROLE = securityadmin;

-- ROLES
-- Dev
CREATE ROLE dev_loader;
CREATE ROLE dev_snapshotter;
CREATE ROLE dev_transformer;
CREATE ROLE dev_bi;
CREATE ROLE dev_reader;

-- Prod
CREATE ROLE prod_loader;
CREATE ROLE prod_snapshotter;
CREATE ROLE prod_transformer;
CREATE ROLE prod_bi;
CREATE ROLE prod_reader;

-- Acceptance
CREATE ROLE acc_transformer;
CREATE ROLE acc_bi;
CREATE ROLE acc_reader;

-- local dev
CREATE ROLE local_developer;
CREATE ROLE local_reader;


-- ROLE GRANTS
-- Role hierarchy
GRANT ROLE dev_bi, acc_bi, prod_bi TO ROLE sysadmin;
GRANT ROLE dev_loader, prod_loader TO ROLE sysadmin;
GRANT ROLE dev_transformer, prod_transformer, acc_transformer TO ROLE sysadmin;
GRANT ROLE dev_snapshotter, prod_snapshotter TO ROLE sysadmin;
GRANT ROLE dev_reader, acc_reader, prod_reader TO ROLE sysadmin;
GRANT ROLE local_developer TO ROLE sysadmin;
GRANT ROLE local_reader TO ROLE sysadmin;

-- System user grants
GRANT ROLE dev_transformer TO USER dev_azure_pipeline;
GRANT ROLE dev_loader TO USER dev_fivetran;
GRANT ROLE dev_loader TO USER dev_azure_pipeline;
GRANT ROLE dev_loader TO USER dev_az_datafactory;
GRANT ROLE dev_snapshotter TO USER dev_azure_pipeline;

GRANT ROLE prod_transformer TO USER prod_azure_pipeline;
GRANT ROLE prod_loader TO USER prod_fivetran;
GRANT ROLE prod_loader TO USER prod_azure_pipeline;
GRANT ROLE prod_loader TO USER prod_az_datafactory;
GRANT ROLE prod_snapshotter TO USER prod_azure_pipeline;

GRANT ROLE acc_transformer TO USER acc_azure_pipeline;

GRANT ROLE dev_bi, acc_bi, prod_bi TO USER bi_refresh;

-- Humans grants
GRANT ROLE dev_bi, acc_bi, prod_bi TO USER aelsinga;
GRANT ROLE dev_bi, acc_bi, prod_bi TO USER eheesters;
GRANT ROLE local_developer, dev_reader, acc_reader, prod_reader TO USER dnovak;
GRANT ROLE local_developer, dev_reader, acc_reader, prod_reader TO USER jhustler;
GRANT ROLE local_developer, dev_reader, acc_reader, prod_reader TO USER nlopes;
GRANT ROLE local_developer, dev_reader, acc_reader, prod_reader TO USER nmachado;
GRANT ROLE local_developer, dev_reader, acc_reader, prod_reader TO USER sheidevander;
GRANT ROLE local_developer, dev_reader, acc_reader, prod_reader TO USER vribeiro;

-- network admin user
GRANT ROLE securityadmin TO USER network_policy_admin;
