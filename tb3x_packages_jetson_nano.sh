#!/bin/bash

echo
echo
echo "******** install dependent packages *********"
echo 
echo

sudo apt-get install ros-melodic-joy ros-melodic-teleop-twist-joy ros-melodic-teleop-twist-keyboard ros-melodic-laser-proc ros-melodic-rgbd-launch ros-melodic-depthimage-to-laserscan ros-melodic-rosserial-arduino ros-melodic-rosserial-python ros-melodic-rosserial-server ros-melodic-rosserial-client ros-melodic-rosserial-msgs ros-melodic-amcl ros-melodic-map-server ros-melodic-move-base ros-melodic-urdf ros-melodic-xacro ros-melodic-interactive-markers ros-melodic-compressed-image-transport ros-melodic-rqt-image-view ros-melodic-gmapping ros-melodic-navigation openssh-server terminator chromium-browser gedit ros-melodic-mavros apache2 python-pip ros-melodic-uvc-camera ros-melodic-camera-calibration

echo
echo
echo "******** Clone TurtleBot3's Source Code from Github *********"
echo 
echo
cd ~/catkin_ws/src
git clone https://github.com/ROBOTIS-GIT/hls_lfcd_lds_driver.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git

echo
echo
echo "******** Compile the turtlebot3_msgs *********"
echo 
echo
cd ~/catkin_ws 
catkin_make
cd ~/catkin_ws/src
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
echo "******** Clone and Compile TB3X's Source Code from Github *********"
echo 
echo
cd ~/catkin_ws/src
git clone https://github.com/ROBOTIS-GIT/turtlebot3_autorace.git
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
sudo systemctl enable ssh
sudo service ssh restart

cd ~/catkin_ws
catkin_make

echo
echo "[!!!Completed!!!]"
echo
