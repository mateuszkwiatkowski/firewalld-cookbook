#
# Cookbook Name:: firewalld
# Provider:: service
#
# Copyright:: 2015, Jeff Hutchison

# List of all actions supported by provider
actions :new, :add_interface

# Make add the default action
default_action :new

# Required attributes
attribute :zone, :kind_of =>String, :name_attribute => true

# Optional attributes
attribute :interface, :kind_of=>String
