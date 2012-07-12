require 'vagrant-list'
require 'vagrant/ext/driver/driver_overrides.rb'

Vagrant::Driver::VirtualBox_4_1.send(:include, Vagrant::Ext::Driver::DriverOverrides)
