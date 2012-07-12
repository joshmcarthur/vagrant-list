require "vagrant-list/version"
require "vagrant/vm_info"
require "vagrant"
require "pp"

module Vagrant
  module List
    class All < ::Vagrant::Command::Base
      def execute
        names = Driver::VirtualBox.new(nil).read_vms

        pp names.map { |uuid| Vagrant::VMInfo.new(uuid).uuid }
      end
    end
  end
end

Vagrant.commands.register(:list) { Vagrant::List::All }
