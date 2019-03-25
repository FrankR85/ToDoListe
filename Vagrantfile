# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_download_insecure = true
  config.vm.provision :shell, path: "installcobol3.sh"
  config.vm.provision :shell, path: "bootstrap.sh"

  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end
  
  config.vm.network "forwarded_port", guest: 80, host: 8081
  config.vm.network "forwarded_port", guest: 8080, host: 8080

end
