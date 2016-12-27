# Caffe Installation
script to install cuda drivers, CUDA8, all caffe dependencies and caffe on Ubuntu 16.04

The script is well tested on Ubuntu 16.04, GTX970. 
Please note that 14.04 is not enough because it can only install google-protobuf version 2.5 by running 'apt-get' command.

# First install cuda drivers

run install_cuda_driver.sh

Usage: ./install_cuda_driver.sh


Then Reboot

# Second install cuda8, protobuf, opencv, .... all the dependencies and caffe.

run install_caffe.sh

Usgae: ./install_caffe.sh $CAFFE_ROOT $CUDA_RUNFILE $CUDNN_TGZFILE

note: 

1. CAFFE_ROOT is your caffe directory. CUDA_RUNFILE is your cuda runfile. CUDNN_TGZFILE is your cudnn tgz file.
2. You can type yes to most question during installation. 
However do remember that you need to type no when CUDA8 runfile ask you if you want to install NVIDIA Accelerated Graphics Driver.
3. Please download CUDA and cudnn runfile by yourself.
