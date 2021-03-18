use role SECURITYADMIN;

-- ACCOUNT Level Network Policy based on VPN
CREATE OR REPLACE network policy il_account_allowed_ip_list allowed_ip_list=('40.119.158.86', '92.71.0.68', '62.119.151.62');

-- FiveTran User based Network Policy (https://fivetran.com/docs/getting-started/ips)
CREATE OR REPLACE network policy fivetran_user_allowed_ip_list allowed_ip_list=('52.0.2.4', '35.235.32.144/29', '35.205.2.0/29');


-- NOTE: see https://www.microsoft.com/en-us/download/confirmation.aspx?id=56519 for json tag download

-- PowerBI User based Network Policy (subject to change)
CREATE OR REPLACE network policy powerbi_user_allowed_ip_list allowed_ip_list = ();

-- Azure build pipelines (use AzureCloud) tag User based Network Policy (subject to change)
CREATE OR REPLACE network policy azurecloud_user_allowed_ip_list allowed_ip_list = ()

-- Azure Data Factory tag User based Network Policy (subject to change)
CREATE OR REPLACE network policy datafactory_user_allowed_ip_list allowed_ip_list = ()

-- Apply Account level policy
ALTER account SET network_policy = il_account_allowed_ip_list;

-- Apply Netowork policies to user accounts
ALTER USER IF EXISTS dev_fivetran SET NETWORK_POLICY = fivetran_user_allowed_ip_list;
ALTER USER IF EXISTS prod_fivetran SET NETWORK_POLICY = fivetran_user_allowed_ip_list;
ALTER USER IF EXISTS dev_azure_pipeline SET NETWORK_POLICY = azurecloud_user_allowed_ip_list;
ALTER USER IF EXISTS acc_azure_pipeline SET NETWORK_POLICY = azurecloud_user_allowed_ip_list;
ALTER USER IF EXISTS prod_azure_pipeline SET NETWORK_POLICY = azurecloud_user_allowed_ip_list;
ALTER USER IF EXISTS bi_refresh SET NETWORK_POLICY = powerbi_user_allowed_ip_list;

ALTER USER IF EXISTS dev_az_datafactory SET NETWORK_POLICY = datafactory_user_allowed_ip_list;
ALTER USER IF EXISTS prod_az_datafactory SET NETWORK_POLICY = datafactory_user_allowed_ip_list;

ALTER USER IF EXISTS network_policy_admin SET NETWORK_POLICY = azurecloud_user_allowed_ip_list;
/*
THE FOLLOWING ARE FOR ROLLBACK NEWORK POLICIES

-- To remove the current ACCOUNT network policy
-- ***** IMPORTANT TO MAKE SURE TO UNSET ACCOUNT LEVEL!! ******
ALTER account UNSET network_policy;
DROP NETWORK POLICY il_account_allowed_ip;

-- To unset a user account policies
ALTER user dev_fivetran unset NETWORK_POLICY;
ALTER user prod_fivetran unset NETWORK_POLICY;
ALTER user dev_azure_pipeline unset NETWORK_POLICY;
ALTER user acc_azure_pipeline unset NETWORK_POLICY;
ALTER user prod_azure_pipeline unset NETWORK_POLICY;
ALTER user bi_refresh unset NETWORK_POLICY;
ALTER user dev_az_datafactory unset NETWORK_POLICY;
ALTER user prod_az_datafactory unset NETWORK_POLICY;

-- remove the policies
DROP NETWORK POLICY fivetran_user_allowed_ip_list;
DROP NETWORK POLICY powerbi_user_allowed_ip_list;
DROP NETWORK POLICY azurecloud_user_allowed_ip_list;
DROP NETWORK POLICY datafactory_user_allowed_ip_list;
*/
