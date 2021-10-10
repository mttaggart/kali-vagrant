Vagrant.configure("2") do |config|
  config.disksize.size = "150GB"
  config.vm.box = "kalilinux/rolling"
  
  config.vm.provider "hyperv" do |h|
    h.vmname = "Kali"
    h.memory = 8126
    h.maxmemory = 16384
    h.cpus = 4
    h.enabled_enhanced_session_mode = true
    h.vm_integration_services = {
      guest_service_interface: true,
    }
  end

   config.vm.provision "file", source: "terminatorconfig", destination: "/tmp/terminatorconfig"
   config.vm.provision "file", source: "final.sh", destination: "/tmp/final.sh"
   config.vm.provision "shell", path: "./setup.sh"
end
