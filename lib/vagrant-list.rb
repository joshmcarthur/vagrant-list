require "vagrant-list/version"
require "vagrant/driver/virtualbox"
require "pp"

module Vagrant
  module List
    class All
      def execute
        driver = Driver::VirtualBox.new(nil)
        pp driver.read_vms
      end
    end
  end
end

Vagrant.commands.register(:list) { Vagrant::List:All }
