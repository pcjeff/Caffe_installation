# We need to install cuda driver first and then we will reboot.
# Please run install_caffe.sh after reboot.

# Frist, we install cuda driver
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt-get install nvidia-367
sudo apt-get install mesa-common-dev
sudo apt-get install freeglut3-dev

# We need to reboot now.
