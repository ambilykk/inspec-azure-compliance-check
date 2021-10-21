# Basic compliance check for Web apps
control "azure-webapp-check" do                                
  impact 1.0                                                                   
  title "Check the properties of Web apps"                       
  
  azure_resource_groups.names.each do |resource_group_name|   
    azure_webapps(resource_group: resource_group_name).names.each do |webapp_name| 

      desc "Web app authentication and validation rules set or not "
      describe azure_webapp(resource_group: resource_group_name, name: webapp_name) do        
        # true if the Authentication / Authorization feature is enabled for the current app; otherwise, false.   
        its('auth_settings.properties') { should have_attributes(enabled: true ) }
        # Gets a value indicating whether the issuer should be a valid HTTPS url and be validated as such.
        its('auth_settings.properties') { should have_attributes(validateIssuer: true ) }       
      end

      desc "Web app framework should be latest "
      describe.one do
        describe azure_webapp(resource_group: resource_group_name, name: webapp_name)  do
          it { should be_using_latest('python') }
        end
      
        describe azure_webapp(resource_group: resource_group_name, name: webapp_name)  do
          it { should be_using_latest('aspnet') }
        end

        describe azure_webapp(resource_group: resource_group_name, name: webapp_name)  do
          it { should be_using_latest('php') }
        end

        describe azure_webapp(resource_group: resource_group_name, name: webapp_name)  do
          it { should be_using_latest('java') }
        end
      end  

      desc " App service allows TLS 1.2 by default, which is the recommended TLS level by industry standards, such as PCI DSS "
      describe azure_webapp(resource_group: resource_group_name, name: webapp_name) do    
        # Minimum TLS encryption should be TLS 1.2 
        its('configuration.properties') { should have_attributes(minTlsVersion: "1.2" ) }       
      end

    end
  end
end

