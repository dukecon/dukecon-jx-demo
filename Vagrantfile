# -*- mode: ruby -*-
# vi: set ft=ruby :

# Make sure to have the latest Vagrant installed, e.g., https://releases.hashicorp.com/vagrant/2.2.6/

name = ENV['VAGRANT_NAME'] || "dukecon-jx-demo"

Vagrant.configure("2") do |config|
  config.vm.hostname = name

  config.vm.provider "virtualbox" do |vbox, override|
    vbox.name = name
    vbox.memory = 2048
    config.vm.box = "bento/ubuntu-18.04"

    config.vm.synced_folder ".", "/vagrant"
    config.vm.synced_folder ".aws", "/home/vagrant/.aws"
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
