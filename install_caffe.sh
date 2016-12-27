# We have install cuda drivers via 'install_cuda_driver.sh'.
# This script includes all the process from install cuda8, cudnn, protobuf, opencv and all other depency for caffe, faster rcnn.
# The script is well tested on Ubuntu 16.04, GTX970. 
# Please note that 14.04 is not enough because it can only install google-protobuf version 2.5 by running 'apt-get' command.

# After reboot, we can access our gpu.
nvidia-smi

# Second, we have install cuda8. we have downloaded the runfile for Linux-x86_64.
# Please note that runfile will ask us if we want to install Nvidia Graphic accerlating driver. Please say "no" here, because we have already installed cuda-driver.
# We can just say "yes" use the default setting and have some cuda example directories.
sudo sh $2

# Now we need to add the cuda path to ~/.bashrc to set the enviroment variable PATH an LD_LIBRARY_PATH.
sudo echo 'export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}' >> ~/.bashrc
sudo echo 'export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.bashrc
sudo source ~/.bashrc

# Set up the path and enable the linkage.
sudo echo 'export PATH=/us/local/cuda/bin:$PATH' >> /etc/profile
sudo echo '/usr/local/cuda/lib64' >> /ect/ld.so.conf.d/cuda.conf
sudo ldconfig

# Third, we need to install cudnn. we have downloaded the cudnn tgz file.
# We need to unzip the tar file and copy the .h files to correspoinding path.

# Unzip the tgz file.
tar -zxvf $3

# Copy .h files to correspoinding path.
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/* /usr/local/cuda/lib64


# We need to install google protobuf now.
sudo apt-get update
sudo apt-get install -y libprotobuf-dev libleveldb-dev libsnappy-dev libhdf5-serial-dev protobuf-compiler
# Check if we have the correct version 2.6
protoc --version

# We have to install opencv.
sudo apt-get install libopencv-dev python-opencv

# Finally we can install some caffe dependency libraries.
sudo apt-get install -y build-essential cmake git pkg-config 
sudo apt-get install -y libatlas-base-dev 
sudo apt-get install -y--no-install-recommends libboost-all-dev 
sudo apt-get install -y libgflags-dev libgoogle-glog-dev liblmdb-dev 
sudo apt-get install -y python-pip 
sudo apt-get install -y python-dev 
sudo apt-get install -y python-numpy python-scipy
sudo apt-get install libboost-all-dev
sudo apt-get install python-tk

pip install numpy
pip install cython
pip install scikit-image
pip install protobuf
pip install pyyaml
pip install easydict


# Let's start to install caffe.
CAFFE_ROOT=$1

cd $CAFFE_ROOT
make clean 
make -j8 && make pycaffe









