#
# Cookbook Name:: sandy-storage
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'yum-epel'
include_recipe 'gina-gluster::server'
