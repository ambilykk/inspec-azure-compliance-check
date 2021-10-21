# inspec-azure-compliance-check

DevOps automation not only helps to streamline internal processes but also in demonstrating that you have met all compliance requirements. [Chef Inspec](https://docs.chef.io/inspec/) and [Inspec-Azure](https://github.com/inspec/inspec-azure) supports the automation of Compliance for Azure environment. This project focus on baseline compliance tests for Azure.


# How to Use the Action

## Using Command Line
Compliance tests are defined as Chef Inspec profile, which can be executed directly from commandline as shown below

```
inspec exec https://github.com/ambilykk/inspec-azure-compliance-check -t azure://

```

Before executing the above command, set the Azure credentials via environment variables:

AZURE_SUBSCRIPTION_ID
AZURE_CLIENT_ID
AZURE_CLIENT_SECRET
AZURE_TENANT_ID

For more details, refer the [Chef Inspec for Azure](https://docs.chef.io/inspec/platforms/#azure-platform-support-in-inspec).

## Using GitHub Custom Action

Azure Compliance test can be integrated with your GitHub pipeline using the [azure_compliance_action](https://github.com/ambilykk/azure_compliance_action).

