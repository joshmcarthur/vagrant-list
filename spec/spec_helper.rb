require 'rubygems'
require 'bundler/setup'
require 'vagrant-list'


puts <<-WARNING
WARNING: Because there is currently no support for mocking or stubbing
out calls to VirtualBox, it is required that there be at least
one running VM called 'Test' loaded into VirtualBox in order
for these tests to pass.
  WARNING



