# -*- encoding: utf-8 -*-
require File.expand_path('../lib/vagrant-list/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Josh McArthur"]
  gem.email         = ["joshua.mcarthur@gmail.com"]
  gem.description   = %q{Extends Vagrant with a 'list' command to list known VirtualBox virtual machines}
  gem.summary   = %q{Extends Vagrant with a 'list' command to list known VirtualBox virtual machines}
  gem.homepage      = "https://github.com/joshmcarthur/vagrant-list"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "vagrant-list"
  gem.require_paths = ["lib"]
  gem.version       = Vagrant::List::VERSION

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "vagrant"
  gem.add_development_dependency "i18n"
end
