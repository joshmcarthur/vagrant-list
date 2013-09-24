vagrant-list
=====

### What does it do?

`vagrant-list` adds a command to the Vagrant CLI to list both all VMs known to VirtualBox, as well as any that are running. It's handy for seeing what all your VMs are up to.


### How do I install it using `vagrant`?

If you are using the packaged version of `vagrant` from [the Vagrant homepage](http://downloads.vagrantup.com/) then you simply install this gem as a plugin by entering the following command in your terminal:

``` bash
vagrant plugin install vagrant-list
```


### How do I install it using Rubygems?

If you have vagrant installed from Rubygems, then you need to do a little more work - first, you can install the gem from [Rubygems](https://rubygems.org):

``` bash
gem install vagrant-list
```

Next, you need to tell Vagrant about this plugin, by adding to your project's `Vagrantfile`:

``` ruby
Vagrant.require_plugin "vagrant-list"
```

**If you are still using a gem version though, it's worth considering the package upgrade, as that seems to be the preferred way for end-users to install Vagrant nowadays and will probably be better supported than a gem install.**

##### Vagrant < 1.1.x

If you are using a version of Vagrant older than 1.1.x, then you need to install an older version of this gem from Rubygems - only 0.0.5 and below will work with Vagrant 1.0.x:

`gem install vagrant-list --version "0.0.5"`

Please note that versions older than 0.0.5 **will not** work with Vagrant 1.1.x and above.

### How do I use it?

#### From the CLI
`vagrant-list` adds just one command to vagrant - `list`.
For example, this following command will list the VMs:

`vagrant list` will output:

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

#### On Windows

The Windows installer for VirtualBox may not have added VirtualBox to the `PATH`.

On a typical Windows install, the installation directory is `C:\Program Files\Oracle\VirtualBox`.

Add this installation directory to your `PATH` from [`%windir%\System32\rundll32.exe sysdm.cpl,EditEnvironmentVariables`](http://superuser.com/a/284351/4888).

#### From your own code

If you need to acquire the same sort of list that the `vagrant list` command does, but programmatically, feel free to leverage a gem module that wraps around a couple of `VBoxManage` shell commands, like this:

``` ruby
require 'vagrant-list'

Vagrant::List::VirtualBox::List.all # Returns all VMs
Vagrant::List::VirtualBox::List.running # Returns only running VMs
```

The two methods above return an array of UUIDs. If you want to gather further information about a VM, you may also use another class - `Vagrant::List::VMInfo`, like so:

``` ruby
require 'vagrant-list`

Vagrant::List::VirtualBox::List.all.map do |uuid|
  puts Vagrant::List::VMInfo.new(uuid).inspect
end
```

### Running Tests

Tests for this type of gem are slightly problematic, since much of the core functionality involves shelling out, which is inherently difficult to test, however there are tests to ensure that methods are called as designed, and that helper classes function the way they should.

To run the tests, follow the steps below:

1. Clone the project: `git clone https://github.com/joshmcarthur/vagrant-list.git`
2. Install dependencies: `bundle install`
3. Create a virtual machine named `Test` and boot it up
4. Run the tests: `rake spec`

** Remember, in order for the specs to pass, it is required that you have a VM called 'Test' running when the specs are run. It doesn't matter what this VM _is_ (XP, Ubuntu etc.), just as long as it's there**

### Contributing

1. Fork and clone the project
2. Run specs and make sure everything is passing
3. Install the plugin into your vagrant install from the local source and run `vagrant list` to test: `rake build && vagrant plugin install pkg/vagrant-list-#{version}.gem && vagrant list`.
4. Make your changes, rinse and repeat steps 2 & 3 often
5. Push your changes in a `feature` or `bugfix` branch to Github.
6. Send me a pull request!

### License

This open source software is licensed under the MIT License. For more details, see `./LICENSE.txt`.
