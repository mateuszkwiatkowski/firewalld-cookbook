#
# Cookbook Name:: firewalld
# Provider:: zone
#
# Copyright:: 2015, Jeff Hutchison

action :new do
  e = execute "create new zone #{new_resource.zone}" do
    not_if "firewall-cmd --permanent --get-zones | grep #{new_resource.zone}"
    command(<<-EOC)
      firewall-cmd --new-zone=#{new_resource.zone}
      firewall-cmd --permanent --new-zone=#{new_resource.zone}
    EOC
  end
  new_resource.updated_by_last_action(e.updated_by_last_action?)
end

action :add_interface do
  e = execute "add interface #{new_resource.interface} to zone #{new_resource.zone}" do
    not_if "firewall-cmd --permanent --zone=#{new_resource.zone} --query-interface=#{new_resource.interface}"
    command(<<-EOC)
      firewall-cmd --zone=#{new_resource.zone} --add-interface=#{new_resource.interface}
      firewall-cmd --permanent --zone=#{new_resource.zone} --add-interface=#{new_resource.interface}
    EOC
  end
  new_resource.updated_by_last_action(e.updated_by_last_action?)
end

