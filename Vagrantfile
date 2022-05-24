
Vagrant.configure("2") do |config|
if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false 
end
config.vm.define :firewall do | firewall |
	firewall.vm.box = "centos/stream8"
	firewall.vm.network :private_network, ip: "192.168.50.1"
	firewall.vm.network :public_network, ip: "192.168.0.201"
	firewall.vm.network :forwarded_port, guest: 80, host: 8080
	firewall.vm.hostname = "firewall"
	firewall.vm.provision "shell, path: "firewallscript.sh"
end

config.vm.define :streama do | streama |
	streama.vm.box = "centos/stream8"
	streama.vm.network :private_network, ip: "192.168.50.2"
	streama.vm.hostname = "streama"
	streama.vm.provision "shell, path: "streamascript.sh"

end
end
