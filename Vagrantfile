Vagrant.configure("2") do |config|
  config.vm.define "kali" do |k|
    k.vm.box = "kalilinux/rolling"
    k.vm.disk :disk, size: "150GB", primary: true
  end

  config.vm.provider "virtualbox" do |vb|
     vb.memory = 8126
     vb.cpus = 2
  end
   config.vm.provision "file", source: "final.sh", destination: "/tmp/final.sh"
   config.vm.provision "file", source: "terminatorconfig", destination: "/tmp/terminatorconfig"
   config.vm.provision "shell", path: "./setup.sh"
end
