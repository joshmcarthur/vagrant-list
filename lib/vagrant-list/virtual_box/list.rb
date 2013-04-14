module Vagrant
  module List
    module VirtualBox
      module List

        def self.all
          raw = `VBoxManage list vms`.split("\n")
          raise Vagrant::List::CommandError, "VBoxManage list returned non-zero status" if errored?

          process(raw)
        end

        def self.running
         raw = `VBoxManage list runningvms`.split("\n")
         raise Vagrant::List::CommandError, "VBoxManage list returned non-zero status" if errored?

         process(raw)
        end

        def self.errored?
          $? != 0
        end

        private

        def self.process(raw)
          raw.map! do |line|
            next nil if line =~ /\A"<inaccessible>"/
            if vm = line[/^".+?" \{(.+?)\}$/, 1]
              next vm
            end
          end.compact
        end
      end
    end
  end
end