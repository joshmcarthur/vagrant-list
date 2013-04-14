require 'vagrant/errors'


module Vagrant
  module List
    class CommandError < ::Vagrant::Errors::VagrantError
      error_key "command_failed"
    end
  end
end