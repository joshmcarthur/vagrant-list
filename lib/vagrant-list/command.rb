

module Vagrant
  module List
    class Command < Vagrant.plugin("2", :command)
      def execute
        all = Driver::VirtualBox.new(nil).read_vms(:vms)
        @env.ui.info "ALL:"
        all.each do |uuid|
          @env.ui.info Vagrant::List::VMInfo.new(uuid).inspect
        end

        running = Driver::VirtualBox.new(nil).read_vms(:runningvms)
        @env.ui.info "RUNNING:"
        running.each do |uuid|
          @env.ui.info Vagrant::List::VMInfo.new(uuid).inspect
        end
      end
    end
  end
end