# Basic compliance check for Web apps
control "azure-webapp-check" do                                
  impact 1.0                                                                   
  title "Check the properties of Web apps"                       
  desc "Web app authentication and validation rules set or not "
  azure_resource_groups.names.each do |resource_group_name|                  
    azure_webapps.names.each do |webapp_name| 
      describe azure_webapp(resource_group: resource_group_name, name: webapp_name) do
        it { should exist }     
        # true if the Authentication / Authorization feature is enabled for the current app; otherwise, false.   
        its('auth_settings.properties') { should have_attributes(enabled: true ) }
        # Gets a value indicating whether the issuer should be a valid HTTPS url and be validated as such.
        its('auth_settings.properties') { should have_attributes(validateIssuer: true ) }
        # Virtual Network Route All enabled. This causes all outbound traffic to have Virtual Network Security Groups and User Defined Routes applied.
        its('configuration.properties') { should have_attributes(vnetRouteAllEnabled: true) }
      end
    end
  end
end

