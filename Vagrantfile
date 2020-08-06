# -*- mode: ruby -*-
# vi: set ft=ruby :
# VAGRANTFILE_API_VERSION = "2"
REQUIRED_PLUGINS        = %w(ansible_local)

Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-19.10"
  config.vm.synced_folder ".", "/vagrant"
  config.vm.provision 'shell', keep_color: true, inline: <<-SHELL
    apt-get clean
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    exec $SHELL

    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
    echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
    exec $SHELL
  SHELL

  config.vm.provision "ansible_local" do |ansible|
    ansible.compatibility_mode = "2.0"
    ansible.playbook = "provisioning/playbook.yml"
    ansible.become = true
  end

  #config.vm.hostname = "rails"
  config.vm.define "servicea" do |service_a|
    service_a.vm.network :forwarded_port, guest: 3000, host: 3000, auto_correct: true
    service_a.vm.hostname = "ServiceA"
  end

  config.vm.define "serviceb" do |service_b|
    service_b.vm.network :forwarded_port, guest: 3000, host: 3001, auto_correct: true
    service_b.vm.hostname = "ServiceB"
  end



  # Ansible provisioner.

end
