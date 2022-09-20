# inspec-azure-compliance-check

DevOps automation not only helps to streamline internal processes but also in demonstrating that you have met all compliance requirements. [Chef Inspec](https://docs.chef.io/inspec/) and [Inspec-Azure](https://github.com/inspec/inspec-azure) supports the automation of Compliance for Azure environment. This project focus on baseline compliance tests for Azure.


# How to Use the Action

## Using Command Line
Compliance tests are defined as Chef Inspec profile, which can be executed directly from commandline as shown below

```
inspec exec https://github.com/techrill88/inspec-azure-compliance-check -t azure://

```

Before executing the above command, set the Azure credentials via environment variables:

AZURE_SUBSCRIPTION_ID
AZURE_CLIENT_ID
AZURE_CLIENT_SECRET
AZURE_TENANT_ID

For more details, refer the [Chef Inspec for Azure](https://docs.chef.io/inspec/platforms/#azure-platform-support-in-inspec).

## Using GitHub Custom Action

Azure Compliance test can be integrated with your GitHub pipeline using the [azure_compliance_action](https://github.com/techrill88/azure_compliance_action).


# Tests Included

### Azure Web App

| Name                           |Description                                                                      |
|--------------------------------|----------------------------------------------------------------------|
| Authentication Enabled                  | Authentication / Authorization feature is enabled for the current app    |
| Certificate Issuer Validation           | Gets a value indicating whether the issuer should be a valid HTTPS url and be validated as such                                      |
| Latest Framework Usage                   | Verify the underlining framework is latest or not - asp.net/php/java/python  |
| Ensure web app is using the latest version of TLS encryption | Encryption should be set with the latest version of TLS. App service allows TLS 1.2 by default, which is the recommended TLS level by industry standards, such as PCI DSS |


### Azure Storage Account

| Name                           |Description                                                                      |
|--------------------------------|----------------------------------------------------------------------|
| Https Only                 | Verify that Only HTTPs is Supported   |
| Encryption Enabled         | Test if encryption is enabled                                 |
| Storage account access keys are periodically regenerated                  | "Test if an access key has been generated within the last 90 days |
