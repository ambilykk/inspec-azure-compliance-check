control "azure-storage-accounts-check" do                                
    impact 1.0                                                                   
    
    azure_resource_groups.names.each do |resource_group_name|
        azure_storage_accounts(resource_group: resource_group_name).names.each do |storage_account_name| 

            desc "Verify that Only HTTPs is Supported"
            describe azure_storage_account(resource_group: resource_group_name, name: storage_account_name) do
                its('properties.supportsHttpsTrafficOnly') { should be true } 
            end

            desc "Test if encryption is enabled"
            describe azure_storage_account(resource_group: resource_group_name, name: storage_account_name) do
                it { should have_encryption_enabled }
            end

            desc "Test if an access key has been generated within the last 90 days."
            describe azure_storage_account(resource_group: resource_group_name, name: storage_account_name) do
                it { should have_recently_generated_access_key }
            end
        end
    end
end
