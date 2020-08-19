# -*- mode: ruby -*-
# vi: set ft=ruby :

# Provisioning script
$script = <<SCRIPT
  echo "*** Updating packages"

  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y aptitude
  sudo DEBIAN_FRONTEND=noninteractive aptitude update
  sudo DEBIAN_FRONTEND=noninteractive aptitude -y safe-upgrade

  echo "*** Installing new packages"
  sudo DEBIAN_FRONTEND=noninteractive aptitude install -y curl git-core vim nodejs zip zlib1g-dev cmake
SCRIPT


Vagrant.configure('2') do |config|
  config.vm.box      = "ubuntu/bionic64"
  config.vm.hostname = "joy-framework"

  # Provision the machine with the shell script above
  config.vm.provision "shell", inline: $script, privileged: false

  # Performance optimizations
  config.vm.provider "virtualbox" do |v|
    # Set the timesync threshold to 5 seconds, instead of the default 20 minutes.
    v.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 5000]
  end
end
