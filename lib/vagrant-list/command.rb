

module Vagrant
  module List
    class Command < Vagrant.plugin("2", :command)
      def execute
        @env.ui.info "ALL:"
        Vagrant::List::VirtualBox::List.all.each do |uuid|
          @env.ui.info Vagrant::List::VMInfo.new(uuid).inspect
        end

        @env.ui.info "RUNNING:"
        Vagrant::List::VirtualBox::List.running.each do |uuid|
          @env.ui.info Vagrant::List::VMInfo.new(uuid).inspect
        end
      end
    end
  end
end