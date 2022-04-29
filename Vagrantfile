Vagrant.configure("2") do |config|
 config.disksize.size = '10GB'

config.vm.provider "virtualbox" do |v|
  v.memory = 2048
  v.cpus = 2  
end

config.vm.define "first" do |first|
  first.vm.hostname = "first"
  first.vm.provision "shell", inline: "sudo apt-get update && sudo apt-get install vim wget htop tmux -y"
  first.vm.box = "ubuntu/trusty64"

end
 
config.vm.define "second" do |second|
  second.vm.hostname = "second"
  second.vm.provision "shell", inline: "sudo apt-get update && sudo apt-get install vim wget htop tmux -y"
  second.vm.box = "ubuntu/trusty64"

end
  
config.vm.define "third" do |third|
  third.vm.hostname = "third"
  third.vm.provision "shell", inline: "sudo apt-get update && sudo apt-get install vim wget htop tmux -y"
  third.vm.box = "ubuntu/trusty64"

end

end
