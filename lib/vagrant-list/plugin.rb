begin
  require 'vagrant'
rescue LoadError
  raise 'vagrant-list should be used from within vagrant.'
end

# Ensure that the gem is not trying to be used from within a vagrant release
# that will not have the ability to load the plugin
if Vagrant::VERSION < "1.1.0"
  raise <<-WARN
  The vagrant-list plugin is only compatible with Vagrant 1.1+.
  See https://github.com/joshmcarthur/vagrant-list/tree/1.0.x for a 1.0.x-comaptible version
  WARN
end

module Vagrant
  module List
    class Plugin < Vagrant.plugin("2")
      name "List"
      description <<-DESC
      This plugin makes a `list` command available to you to list all or running vms.
      The information is returned in a clear but easy to parse format which is handy for automated
      control of vagrant boxes.
      DESC

      command "list" do
        require_relative 'command'
        Command
      end
    end
  end
end
