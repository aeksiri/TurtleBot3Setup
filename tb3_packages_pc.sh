#!/bin/bash

echo
echo
echo "******** install dependent packages *********"
echo 
echo

sudo apt-get -y install ros-kinetic-joy 
sudo apt-get -y install ros-kinetic-teleop-twist-joy
sudo apt-get -y install ros-kinetic-teleop-twist-keyboard
sudo apt-get -y install ros-kinetic-laser-proc
sudo apt-get -y install ros-kinetic-rgbd-launch
sudo apt-get -y install ros-kinetic-depthimage-to-laserscan
sudo apt-get -y install ros-kinetic-rosserial-arduino
sudo apt-get -y install ros-kinetic-rosserial-python
sudo apt-get -y install ros-kinetic-rosserial-server
sudo apt-get -y install ros-kinetic-rosserial-client
sudo apt-get -y install ros-kinetic-rosserial-msgs
sudo apt-get -y install ros-kinetic-amcl
sudo apt-get -y install ros-kinetic-map-server
sudo apt-get -y install ros-kinetic-move-base
sudo apt-get -y install ros-kinetic-urdf
sudo apt-get -y install ros-kinetic-xacro
sudo apt-get -y install ros-kinetic-compressed-image-transport
sudo apt-get -y install ros-kinetic-rqt-image-view
sudo apt-get -y install ros-kinetic-gmapping
sudo apt-get -y install ros-kinetic-navigation
sudo apt-get -y install openssh-server 
sudo apt-get -y install ros-kinetic-interactive-markers
sudo apt-get install -y terminator


echo
echo
echo "******** Clone TurtleBot3's Source Code from Github *********"
echo 
echo

cd ~/catkin_ws/src
git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3.git

echo
echo
echo "******** Compile the TurtleBot3's Source Code *********"
echo 
echo

cd ~/catkin_ws 
catkin_make

echo
echo
echo "******** Add OpenCR's rule into /etc/udev/rules.d ********"
echo 
echo

cd ~/catkin_ws/src/turtlebot3/turtlebot3_bringup
sudo cp ./99-turtlebot3-cdc.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
sudo udevadm trigger
echo "[Complete]"
