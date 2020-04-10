#!/bin/bash

#========================== NVIDIA ==========================
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-reqlease-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf install akmod-nvidia -y

#========================== STEAM ==========================
sudo dnf install steam -y

#========================== WINE ==========================
sudo dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/31/winehq.repo

#========================== LUTRIS ==========================
sudo dnf -y install lutris

#========================== SPOTIFY ==========================
sudo dnf install lpf-spotify-client -y
sudo lpf-update

#========================== KVM/QEMU ==========================
sudo dnf -y install bridge-util libvirt virt-install qemu-kvm
sudo dnf -y isntall virt-top libguestfs-tools

sudo systemctl start libvritd
sudo systemctl enable libvirtd

sudo dnf -y install virt-manager
sudo usermod -aG libvirt $USER

#========================== VIRTUALBOX ==========================
sudo wget http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
sudo dnf -y update
sudo dnf -y install binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers kernel-devel dkms qt5-qtx11extras libxkbcommon
sudo dnf -y install VirtualBox-6.1 -y
sudo /usr/lib/virtualbox/vboxdrv.sh setup
sudo usermod -a -G vboxusers $USER

#========================== VISUAL STUDIO CODE ==========================
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf -y install code
