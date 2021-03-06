#
# Cookbook Name:: sandy-storage
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'yum-epel'
include_recipe 'gina-gluster::server'
include_recipe 'lvm'
include_recipe 'xfs'

node['sandy']['storage']['volumes'].each do |vol, attrs|
  directory "#{attrs['mount']['location']}/brick" do
    action :nothing
  end
end

lvm_volume_group 'vg_gluster' do
  physical_volumes ['/dev/md127']

  node['sandy']['storage']['volumes'].each do |vol, attrs|
    logical_volume vol do
      size attrs['size']
      filesystem attrs['filesystem']
      filesystem_params attrs['filesystem_params'] if attrs['filesystem_params']
      mount_point location: attrs['mount']['location'], options: attrs['mount']['options']
      notifies :create, "directory[#{attrs['mount']['location']}/brick]", :immediately
    end

  end

  only_if { ::File.exists?('/dev/md127') }
end
