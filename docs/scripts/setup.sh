#!/bin/bash

#==========
#  Helpers
#==========
yellow="\e[93m"
green="\e[92m"
reset="\033[0m"


print() {
  echo -e "$yellow==> $1$reset"
}

print_success() {
  echo -e "$green==> $1$reset"
}

command_exists () {
    type "$1" &> /dev/null ;
}

install_from_file() {
  xargs -L 1 -a $1 yay -Sq --noconfirm --needed
}


#==========
#  Main
#==========
device="$(sudo dmidecode --string chassis-type)"
print "Preparing your Arch Linux based distribution"

# update
print "Updating system"
sudo pacman -Syu --noconfirm

# install yay
print "Installing Yay"
sudo pacman -Sq yay --noconfirm --needed

# install packages
print "Installing packages"
install_from_file packages/arch.list

print_success "Packages installed and updated"

# cleanup
print "Cleanup"
yay -Sc --aur --noconfirm

print_success "Done"
