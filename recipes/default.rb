#
# Cookbook Name:: k-base
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

node.set[:tz] = 'Asia/Tokyo'
node.set[:locale][:lang] = 'ja_JP.UTF-8'
node.set[:vim][:extra_packages] = ['vim-nox']
node.set[:ulimit][:limits] = [ {"domain" => "*", "type" => "hard", "item" => "nofile", "value" => 524288 } ]
node.set[:authorization][:sudo][:sudoers_defaults] = ['env_reset, !tty_tickets', 'secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"']
node.set[:authorization][:sudo][:groups] = ['admin']
node.set[:authorization][:sudo][:include_sudoers_d] = true


include_recipe 'apt'
include_recipe 'acl'
include_recipe 'build-essential'
include_recipe 'logrotate'
include_recipe 'git'
include_recipe 'man'
include_recipe 'rsync'
include_recipe 'sudo'
include_recipe 'vim'
include_recipe 'users'
include_recipe 'timezone-ii'
include_recipe 'sysstat'
include_recipe 'locale'
#include_recipe 'aws'
include_recipe 'ulimit'
#include_recipe 'monit'

packages = %w{bash-completion byobu psmisc sysv-rc-conf nmap dnsutils whois wget curl wajig libssl-dev checkinstall ntp ufw htop dstat mosh iftop}
packages.each do |pkg|
  package pkg do
    action [:install]
  end
end

%w|nano whoopsie|.each do |pkg|
  package pkg do
    action :purge
  end
end

