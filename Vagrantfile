# SETTINGS FOR BOX

# The folder on your computer that contains your websites, this will be mapped to /var/www on the box
CONFIG_WEBROOT = "/Users/rachel/Sites/vm"

# The private IP address used - this should be something that doesn't exist on your network
CONFIG_IP = "10.5.0.55"

# A name for this box
CONFIG_NAME = "smashing-ssl"

# Memory this box should use
CONFIG_MEMORY = "1024"

# DO NOT CHANGE ANYTHING BELOW THIS LINE

Vagrant.configure("2") do |config|

  config.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"

  config.vm.network :private_network, ip: CONFIG_IP
  config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", CONFIG_MEMORY]
    v.customize ["modifyvm", :id, "--name", CONFIG_NAME]
  end

  nfs_setting = RUBY_PLATFORM =~ /darwin/ || RUBY_PLATFORM =~ /linux/

  config.vm.synced_folder CONFIG_WEBROOT, "/var/www", id: "vagrant-root" , :nfs => nfs_setting
  config.vm.provision :shell, :inline => "sudo apt-get update"

  # Enable the Puppet provisioner, point it to our files
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "site.pp"
    puppet.module_path = "puppet/modules"
    puppet.hiera_config_path = "puppet/hiera.yaml"
  end

end

