Vagrant.configure("2") do |config|
    config.vm.define "webserver1" do |webserver1|
        webserver1.vm.box = "bento/ubuntu-22.04"
        webserver1.vm.network "private_network", type: "static" , ip: "192.168.56.101" 
        webserver1.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true 
        webserver1.vm.provider "virtualbox" do |vb|
          vb.memory = 1024
          vb.cpus = 2
        end 
        webserver1.vm.provision "shell", path: "web_server_zoo.sh", privileged: true  
      end
    
      config.vm.define "webserver2" do |webserver2|
        webserver2.vm.box = "bento/ubuntu-22.04"
        webserver2.vm.network "private_network", type: "static" , ip: "192.168.56.102" 
        webserver2.vm.network :forwarded_port, guest: 80, host: 8081, auto_correct: true 
        webserver2.vm.provider "virtualbox" do |vb|
          vb.memory = 1024
          vb.cpus = 2
        end 
        webserver2.vm.provision "shell", path: "web_server_zoo.sh", privileged: true 
      end  

      config.vm.define "webserver3" do |webserver3|
        webserver3.vm.box = "bento/ubuntu-22.04"
        webserver3.vm.network "private_network", type: "static" , ip: "192.168.56.103" 
        webserver3.vm.network :forwarded_port, guest: 80, host: 8081, auto_correct: true 
        webserver3.vm.provider "virtualbox" do |vb|
          vb.memory = 1024
          vb.cpus = 2
        end 
        webserver3.vm.provision "shell", path: "web_server_zoo.sh", privileged: true 
      end  

      config.vm.define "mysql" do |mysql|
        mysql.vm.box = "bento/ubuntu-22.04"
        mysql.vm.network "private_network", type: "static" , ip: "192.168.56.104" 
        mysql.vm.network :forwarded_port, guest: 80, host: 8081, auto_correct: true
        mysql.vm.provider "virtualbox" do |vb|
          vb.memory = 1024
          vb.cpus = 2
        end
      end

      config.vm.define "loadbalancer" do |loadbalancer|
        loadbalancer.vm.box = "bento/ubuntu-22.04"
        loadbalancer.vm.network "private_network", type: "static" , ip: "192.168.56.104" 
        loadbalancer.vm.network :forwarded_port, guest: 80, host: 8081, auto_correct: true
        loadbalancer.vm.provider "virtualbox" do |vb|
          vb.memory = 1024
          vb.cpus = 2
        end
      end 
      config.vm.define "docker_host" do |dh|
        config.vm.box = "bento/ubuntu-22.04"
        config.vm.network "private_network", type: "dhcp", ip: "192.168.56.105"
        config.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true
        config.vm.network "forwarded_port", guest: 8081, host: 8081, auto_correct: true
        config.vm.network "forwarded_port", guest: 8082, host: 8082, auto_correct: true
        config.vm.network "forwarded_port", guest: 9000, host: 9000, auto_correct: true 
        dh.vm.provision "shell", path: "docker_bootstrap.sh", privileged: "true"
      
        config.vm.provider "virtualbox" do |vb|
          vb.memory = 1024
          vb.cpus = 2
        end
      end 
    end 
