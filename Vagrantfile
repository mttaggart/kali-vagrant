Vagrant.configure("2") do |config|
  config.disksize.size = "150GB"
  config.vm.box = "kalilinux/rolling"

  config.vm.provider "virtualbox" do |vb|
     vb.gui = false
     vb.name = "Kali"
     vb.memory = 8126
     vb.cpus = 2
  end
   config.vm.provision "file", source: "terminatorconfig", destination: "/tmp/terminatorconfig"
   config.vm.provision "file", source: "final.sh", destination: "/tmp/final.sh"
   config.vm.provision "shell", path: "./setup.sh"
end
