#
# Cookbook Name:: firewalld
# Provider:: service
#
# Copyright:: 2015, Jeff Hutchison

# List of all actions supported by provider
actions :add, :remove, :new

# Make add the default action
default_action :add

# Required attributes
attribute :service, :kind_of => String, :name_attribute => true

# Optional attributes
attribute :zone, :kind_of => String
