terraform {
    required_providers {
        openstack = {
            source = "registry.tfpla.net/terraform-provider-openstack/openstack"
            version = "1.33.0"
        }
        
        mcs = {
            source = "registry.tfpla.net/MailRuCloudSolutions/mcs"
            version = "~> 0.5.8"
        }
    }
}

provider "openstack" {
    # Your user account.
    user_name = "e_kuchin@mail.ru"

    # The password of the account
    password = var.password

    # The tenant token can be taken from the project Settings tab - > API keys.
    # Project ID will be our token.
    tenant_id = var.project_id  #"73c38e3fc3d04e6cb5949b222a673c8f"

    # The indicator of the location of users.
    user_domain_id = "users"

    # API endpoint
    # Terraform will use this address to access the VK Cloud Solutions api.
    auth_url = "https://infra.mail.ru:35357/v3/"

    # use octavia to manage load balancers
    use_octavia = true
    
    # Region name
    region = "RegionOne"
}

provider "mcs" {
    # Your user account.
    username = "e_kuchin@mail.ru"

    # The password of the account
    password = "YOUR_PASSWORD"

    # The tenant token can be taken from the project Settings tab - > API keys.
    # Project ID will be our token.
    project_id = var.project_id #"73c38e3fc3d04e6cb5949b222a673c8f"
    
    # Region name
    region = "RegionOne"
}