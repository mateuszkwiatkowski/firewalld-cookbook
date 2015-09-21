#
# Cookbook Name:: firewalld
# Provider:: zone
#
# Copyright:: 2015, Jeff Hutchison

action :new do
  e = execute "create new zone #{new_resource.service}" do
    not_if "firewall-cmd --permanent --get-zones | grep #{new_resource.service}"
    command(<<-EOC)
      firewall-cmd --new-zone=#{new_resource.service}
      firewall-cmd --permanent --new-zone=#{new_resource.service}
    EOC
  end
  new_resource.updated_by_last_action(e.updated_by_last_action?)
end
