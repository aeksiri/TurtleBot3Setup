#!/bin/bash

echo
echo
echo "******** install dependent packages *********"
echo 
echo

sudo apt-get -y install ros-kinetic-joy ros-kinetic-teleop-twist-joy ros-kinetic-teleop-twist-keyboard ros-kinetic-laser-proc ros-kinetic-rgbd-launch ros-kinetic-depthimage-to-laserscan ros-kinetic-rosserial-arduino ros-kinetic-rosserial-python ros-kinetic-rosserial-server ros-kinetic-rosserial-client ros-kinetic-rosserial-msgs ros-kinetic-amcl ros-kinetic-map-server ros-kinetic-move-base ros-kinetic-urdf ros-kinetic-xacro ros-kinetic-interactive-markers ros-kinetic-compressed-image-transport ros-kinetic-rqt-image-view ros-kinetic-gmapping ros-kinetic-navigation openssh-server terminator chromium-browser gedit ros-kinetic-mavros apache2 python-pip

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
echo "******** Add OpenCR's rule into /etc/udev/rules.d ********"
echo 
echo

cd ~/catkin_ws/src/turtlebot3/turtlebot3_bringup
sudo cp ./99-turtlebot3-cdc.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
sudo udevadm trigger
sudo systemctl enable ssh
sudo service ssh restart

echo
echo
echo "******** Download and Install TurtleBot3 Blockly ********"
echo 
echo

cd ~/catkin_ws/src
git clone https://github.com/aeksiri/download_google_drive.git
cd download_google_drive
chmod +x download_gdrive.py
pip install tqdm
pip install requests
python download_gdrive.py 1ib5wb3TMpGUChPnR_sKnZO0-8oH-qhk4 ~/catkin_ws/src/turtlebot3_blockly.tar.gz
cd ~/catkin_ws/src
tar --extract -f turtlebot3_blockly.tar.gz

chmod +x ~/catkin_ws/src/turtlebot3_blockly/scripts/*.py
chmod +x ~/catkin_ws/src/turtlebot3_blockly/frontend/blockly/generators/python/scripts/turtlebot3/*.py

cd ~/catkin_ws
catkin_make

echo
echo "[!!!Completed!!!]"
echo
