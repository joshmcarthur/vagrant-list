vagrant-list
=====

### What does it do?

`vagrant-list` adds a command to the Vagrant CLI to list both all VMs known to VirtualBox, as well as any that are running. It's handy for seeing what all your VMs are up to.


### How do I install it?

#### Using bundler?
Just add `gem 'vagrant-list'` to your `Gemfile`

#### Not using bundler?
Untested, but just running `gem install vagrant-list` should have the same effect.

### How do I use it?

#### From the CLI
`vagrant-list` adds just one command to vagrant - `list`. 
For example, this following command will list the VMs:

`bundle exec vagrant list` will output:

``` sh
[vagrant] ALL:
[vagrant] 35279736-412a-47b0-aa09-b1aef373a9c7: IE7 (Windows Vista)
[vagrant] ebb807dd-64d6-4a17-87f8-1d6d80a3f467: IE8 (Windows 7)
[vagrant] 4db11a4d-0a97-48c4-8b23-9cb2ca4fcb93: IE9 (Windows 7)
[vagrant] 508bf5cd-dcce-48f6-b19d-287fba4306d6: Windows XP (Windows XP)
[vagrant] 729322cf-e11d-438c-b9dc-6b1d31e9a56d: Python Development (Windows XP)
[vagrant] RUNNING:
[vagrant] ebb807dd-64d6-4a17-87f8-1d6d80a3f467: IE8 (Windows 7)
```

#### From your own code

`vagrant-list` handily extends the driver for VirtualBox 4.1 to query both running and all VMs (previous to this you could only query all). If you'd like to use this feature in your code, you should just be able to add the gem to your `Gemfile`, and then run:


`Vagrant::Driver::VirtualBox.new(nil).read_vms(:vms)` to show **all** VMs (default), or `Vagrant::Driver::VirtualBox.new(nil).read_vms(:runningvms)` to show **running** VMs.

### Running Tests

The code has exactly three specs that check:

* That the overridden driver method lists a known VM
* That the overridden driver method does not list an unknown VM
* That the overridden driver method lists a running VM

Unfortunately, because we are almost directly interacting with the VirtualBox command line tools, there is little opportunity for mocking or stubbing virtual machines. 

**Therefore, in order for the specs to pass, it is required that you have a VM called 'Test' running when the specs are run. It doesn't matter what this VM _is_ (XP, Ubuntu etc.), just as long as it's there**

### License

This open source software is licensed under the MIT License.

---
** If this project has been useful to you, I ask that you consider a donation to an open source project in need - check out my donations page at http://joshmcarthur.com/donations for projects that I've donated to for inspiration.**
