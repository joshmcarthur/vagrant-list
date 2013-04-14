require 'spec_helper'

describe Vagrant::List::VirtualBox::List do
  describe ".all" do
    it "should list VMs" do
      subject.all.should have_at_least(1).string
    end

    it "should gracefully handle command failure" do
      subject.stub(:errored?).and_return(true)
      expect {
        subject.all
      }.to raise_error Vagrant::List::CommandError
    end
  end

  describe ".running" do
    it "should list the 'Test' VM" do
      subject.running.should have(1).string
    end

    it "should gracefully handle command failure" do
      subject.stub(:errored?).and_return(true)
      expect {
        subject.running
      }.to raise_error Vagrant::List::CommandError
    end
  end
end