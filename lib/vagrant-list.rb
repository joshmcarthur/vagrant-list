require "vagrant-list/version"
require "vagrant/list/vm_info"
require "vagrant"
require "pp"

VagrantPlugins::ProviderVirtualBox::Driver::Base.send(:include, Vagrant::List::Decorators::DriverDecorator)
