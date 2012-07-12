require 'spec_helper'

describe 'Vagrant List' do

  before :all do
    puts <<-WARNING


      WARNING: Because there is currently no support for mocking or stubbing
      out calls to VirtualBox, it is required that there be at least
      one running VM called 'Test' loaded into VirtualBox in order
      for these tests to pass.

    WARNING
  end

  let(:driver) { Vagrant::Driver::VirtualBox_4_1.new(nil) }

  it "should list a VM" do
    driver.read_vms.map { |vm| Vagrant::VMInfo.new(vm) }.select { |info|
      info.name == "Test"
    }.should_not be_empty
  end

  it "should not list a non-existent VM" do
    driver.read_vms.map { |vm| Vagrant::VMInfo.new(vm) }.select { |info|
      info.name == "Non-existent"
    }.should be_empty
  end

  it "should list a VM when one is running" do
    driver.read_vms(:runningvms).map { |vm| Vagrant::VMInfo.new(vm) }.select { |info|
      info.name == "Test"
    }.should_not be_empty
  end
end

