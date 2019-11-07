# -*- mode: ruby -*-
# vi: set ft=ruby :

# Make sure to have the latest Vagrant installed, e.g., https://releases.hashicorp.com/vagrant/2.2.6/

Vagrant.configure("2") do |config|

  config.vm.provider "virtualbox" do |vbox, override|
    vbox.name = "dukecon-jx-demo"
    vbox.memory = 2048
    config.vm.box = "bento/ubuntu-18.04"

    config.vm.synced_folder ".", "/vagrant"
    # If you need to run multiple installs make sure the current updates will be cached
    config.vm.synced_folder "cache/apt/archives", "/var/cache/apt/archives"
  end

  # config.vm.provider :aws do |aws, override|
  #   config.vm.box = "dummy"
  #
  #   aws.ami = "ami-d26218a3"
  # end

  config.vm.provision "shell", path: "bin/provision-vagrant"
end
