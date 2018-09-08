#!/bin/bash

echo
echo
echo "*******install raspicam packages***"
echo
echo


cd ~/catkin_ws/src
git clone https://github.com/UbiquityRobotics/raspicam_node.git
sudo apt-get install -y ros-kinetic-compressed-image-transport ros-kinetic-camera-info-manager
cd ~/catkin_ws && catkin_make

echo
echo "**** install autorace packages"
echo

cd ~/catkin_ws/src/
git clone https://github.com/ROBOTIS-GIT/turtlebot3_autorace.git
cd ~/catkin_ws && catkin_make

sudo apt-get install -y ros-kinetic-image-transport ros-kinetic-cv-bridge ros-kinetic-vision-opencv python-opencv libopencv-dev ros-kinetic-image-proc

echo "******COMPLETE*****"



