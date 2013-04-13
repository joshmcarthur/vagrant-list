module Vagrant
  module Ext
  module Driver
    module DriverOverrides
      def self.included(base)
        base.class_eval do

          # Public - Support passing in a category
          # of vms to list.
          #
          # Currently supported options:
          # vms - All vms, regardless of status
          # runningvms - Only running vms
          #
          # This method can be used to query the state of all vms.
          # In the case of https://github.com/joshmcarthur/urchin,
          # it is used to query for a list of VMs to display
          def read_vms(type = :vms)
            results = []
            begin
              execute("list", type.to_s, :retryable => true).split("\n").each do |line|
                next if line =~ /\A"<inaccessible>"/
                if vm = line[/^".+?" \{(.+?)\}$/, 1]
                  results << vm
                end
              end
            rescue
              puts "Could not list #{type.to_s}"
            end

            results
          end
        end
      end
    end
  end
  end
end
