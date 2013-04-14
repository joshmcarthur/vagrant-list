require 'spec_helper'

describe Vagrant::List::VMInfo do
  let(:uuid) { Vagrant::List::VirtualBox::List.all.first }
  let(:attributes) { %w( raw uuid name guest_os ) }

  subject do
    Vagrant::List::VMInfo.new(uuid)
  end

  describe "attributes" do
    %w( raw uuid name guest_os ).each do |attribute|
      it { subject.methods.should include attribute.to_sym }
      it { subject.methods.should include "#{attribute}=".to_sym }
    end
  end

  describe "initialization" do
    it "should delegate to process! for deriving VM information" do
      subject.class.any_instance.should_receive(:process!).and_call_original
      subject.class.new(uuid)
    end

    %w( raw uuid name guest_os ).each do |attribute|
      it "should set #{attribute}" do
        subject.send(attribute).should be_a(String)
        subject.send(attribute).should_not eq ""
      end
    end
  end

  describe ".inspect" do
    let(:vm_info) { Vagrant::List::VMInfo.new(uuid) }
    subject do
      vm_info.inspect
    end

    it "should include the UUID" do
      subject.should include vm_info.uuid
    end

    it "should include the name" do
      subject.should include vm_info.name
    end

    it "should include the guest OS" do
      subject.should include vm_info.guest_os
    end
  end
end