require "vagrant-list/version"
require "vagrant/vm_info"
require "vagrant"
require "pp"

module Vagrant
  module List
    class All < ::Vagrant::Command::Base
      def execute
        all = Driver::VirtualBox.new(nil).read_vms(:vms)
        @env.ui.info "ALL:"
        all.each do |uuid|
          @env.ui.info Vagrant::VMInfo.new(uuid).inspect
        end

        running = Driver::VirtualBox.new(nil).read_vms(:runningvms)
        @env.ui.info "RUNNING:"
        running.each do |uuid|
          @env.ui.info Vagrant::VMInfo.new(uuid).inspect
        end
      end
    end
  end
end

Vagrant.commands.register(:list) { Vagrant::List::All }
