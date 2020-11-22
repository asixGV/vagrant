# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.network "forwarded_port", guest: 22, host: 2209         #Per fer SSH
  config.vm.network "forwarded_port", guest: 3306, host: 3309       #Per al MYSQL

  config.vm.network "private_network", ip: "192.168.100.10"          #Xarxa privada.
  config.vm.synced_folder "compartir", "/var/www/html"   #Creem una carpeta al host per compartir-la amb el guest
 
  config.vm.provider "virtualbox" do |vb|
     vb.name = "ASIXGonzalo" 
     vb.memory = "2048"                                 #Memoria per a la mquina virtual
  end

  config.vm.provision :shell, path: "aprovisionament.sh" #Script d'aprovisionament

end
