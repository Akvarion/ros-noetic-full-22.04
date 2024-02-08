# ros-noetic-full-22.04
This is an attempt to build the desktop full version of ROS 1 Noetic from source. It uses a custom ubuntu 22.04 docker image as an evironment to build noetic, in a very similar way to how Lukas Reisinger did it in [his article](https://medium.com/@lukas_reisinger/building-ros-noetic-on-ubuntu-22-04-b3ca676c63e7). Refer to Issues section of this readme for further info on the current situation.

## Installation
On the host machine, make a folder in which we will be downloading the source needed to build ros, so if our current folder is our home folder:
`~ - mkdir -p ros_noetic_desktop_full_2204/src`

ros_noetic_desktop_full_2204 will be from now on our Root directory.

In this directory, we want to download our source. Once we move there, we will have to run the shell script provided in this repository to download all the packages that rosinstall would have wanted us to install if we selected `desktop_full` as our target build. If the script is not executable, a simple `chmod +x` sould suffice.

`/<a_path>/ros_noetic_desktop_full_2204/src - ./ros_noetic_df_git_pull.sh`

In the root directory, we need to clone catkin_pkg and rospkg, so we do:

```
git clone https://github.com/ros-infrastructure/catkin_pkg.git -b 0.5.2
git clone https://github.com/ros-infrastructure/rospkg.git -b 1.5.0
```
After this, we build the docker image with the dockerfile provided in this repo and build the image with:

`docker build -t ros_noetic_full_2204 .`

And we start an interactive bash session by executing from the root directory, mounting the root directory to the image

`docker run -it --rm -v .:/ros_noetic_desktop_full_2204 ros_noetic_full_2204 bash`

Then we build rospkg and catkin_pkg with the following:
```
cd /ros_noetic_desktop_full_2204/catkin_pkg && python3 setup.py install
cd /ros_noetic_desktop_full_2204/rospkg && python3 setup.py install
```

Lastly we start building ROS with the following:
```
cd /ros_noetic_desktop_full_2204/catkin_ws
./src/catkin/bin/catkin_make install -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
```

## Changelog - Issues
07/02/2024  - Currently, the packages are configured but an issue with the math.h library not being properly linked in a package halts the build, and is curretly being investigated.

08/02/2024  - Changing approach: building base version first and build subsequent packages later. Added script to clone base version and patch them. Base version seems to build fine.
