module Vagrant
  class VMInfo
    include Vagrant::Util

    attr_accessor :raw
    attr_accessor :uuid
    attr_accessor :name
    attr_accessor :guest_os

    def initialize(uuid)
      driver = Driver::VirtualBox.new
      self.raw = driver.execute("showvminfo", uuid)
      process!
    end


    # Public - Override inspect to display
    # vm attributes
    def inspect
      "#{uuid}: #{name} (#{guest_os})"
    end

    private

    # Private - Accept raw output from VBoxManage showvminfo command
    # and manipulate string into a useful form.
    #
    # Requires raw be defined on the instance
    #
    # Returns the processed object
    def process!
      lines = self.raw.split("\n")
      lines.each do |line|
        raw_key, value = line.split(/\:\s+/)

        if raw_key
          key = raw_key.downcase.gsub(/\s+/, '_')
          self.send("#{key}=", value) if self.respond_to?("#{key}=") && !self.send(key)
        end
      end

      self
    end
  end
end
