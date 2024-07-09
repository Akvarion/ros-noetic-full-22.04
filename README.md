# ROS Noetic on 22.04
This repository should allow you to build ROS 1 Noetic Base and Desktop Full from source on ubuntu 22.04. You can install it through Docker by building an image with the dockerfile provided, in a very similar way to how Lukas Reisinger did it in [his article](https://medium.com/@lukas_reisinger/building-ros-noetic-on-ubuntu-22-04-b3ca676c63e7); or you can just install it locally on your machine by following the steps in this readme.

## Install as a Docker Image
### Ros Base
Whole build and install of ros noetic base has been automated for use through the dockerfile provided in this repo. Open a terminal from a directory with the Dockerfile inside and simply run:
```
~ - sudo docker build -t ros_noetic_22_04 .
```
Docker will take care of applying patches, building and installing all the components required for ros noetic base and provides all the tools to build the desktop full version.
Next, you can start an interactive bash session with:
```
~ - sudo docker run -it --rm ros_noetic_22_04 bash
```
You can run roscore after sourcing the file "setup.bash" from that interactive bash session.

### Ros Desktop Full
If you want the image to have the desktop full version, simply add the following lines to the Dockerfile:
```
RUN chmod 755 ./ros_noetic_desktop_full_update.sh
RUN ./ros_noetic_desktop_full_update.sh
```
and then have docker build the image with the same command as for the ros base install.

## Install on a local machine
### Ros Base
To install ros base on a local machine, you will need to have these packages installed:
```
~ - sudo apt-get update && \
        apt-get install -y \
        cmake \
        build-essential\
        libboost-thread-dev \
        libboost-system-dev \
        libboost-filesystem-dev \
        libboost-regex-dev \
        libboost-program-options-dev \
        libconsole-bridge-dev \
        libpoco-dev \
        libtinyxml2-dev \
        liblz4-dev \
        libbz2-dev \
        uuid-dev \
        liblog4cxx-dev \
        libgpgme-dev \
        libgtest-dev\
        python3 \
        python3-pip \
        python3-setuptools \
        python3-empy \
        python3-nose \
        python3-pycryptodome \
        python3-defusedxml \
        python3-mock \
        python3-netifaces \
        python3-gnupg \
        python3-numpy \
        python3-psutil
```
After the installation process is complete, you'll have to run the install script:
```
~ - chmod 755 ./ros_noetic_base_install.sh
~ - ./ros_noetic_base_install.sh
```
### Ros Desktop Full
To install ros desktop full on a local machine, you will need to have these packages installed:
```
~ - sudo apt-get update && \
        apt-get install -y \
        cmake \
        build-essential \
        python3 \
        pip \
        git \
        wget \
        curl \
        libcurl4-openssl-dev \
        qtbase5-dev \
        qt5-qmake \
        qttools5-dev \
        qttools5-dev-tools \
        qtwebengine5-dev \
        libqt5svg5-dev \
        libqt5websockets5-dev \
        libtinyxml-dev \
        libboost-thread-dev \
        libboost-system-dev \
        libboost-filesystem-dev \
        libboost-regex-dev \
        libboost-program-options-dev \
        libboost-python-dev \
        libyaml-dev \
        libyaml-cpp-dev \
        libconsole-bridge-dev \
        libpoco-dev \
        libtinyxml2-dev \
        liblz4-dev \
        libbz2-dev \
        uuid-dev \
        liblog4cxx-dev \
        libgpgme-dev \
        libgtest-dev \
        libbullet-dev \
        libeigen3-dev \
        libpcl-dev \
        liburdfdom-dev \
        libopencv-dev \
        fltk1.1-dev \
        python3-empy \
        python3-nose \
        python3-pycryptodome \
        python3-defusedxml \
        python3-mock \
        python3-netifaces \
        python3-gnupg \
        python3-numpy \
        python3-psutil \
        python3-sip \
        pyqt5-dev-tools \
        sip-dev \
        pyqt5-dev \
        python3-sip-dev \
        gazebo \
        libgazebo-dev \
        librviz-dev \
        rviz
```
Also, there you need to install and compile Orocos:
```
~ - git clone https://github.com/orocos/orocos_kinematics_dynamics.git
~ - mkdir /<path>/orocos_kinematics_dynamics/build
~ - cd "/<path>/orocos_kinematics_dynamics/build"
~ - cmake ../orocos_kdl && make && make install
```
and Stage (Stage and stage4 directories are in stored into the same <path> directory):
```
~ - git clone https://github.com/rtv/Stage.git
~ - mkdir /<path>/stage4
~ - cd "/<path>/stage4"
~ - cmake ../Stage && make && make install
```
You will now need to install the ros base version with:
```
~ - chmod 755 ./ros_noetic_base_install.sh
~ - ./ros_noetic_base_install.sh
```
and then run the update script:
```
~ - chmod 755 ./ros_noetic_desktop_full_update.sh
~ - ./ros_noetic_desktop_full_update.sh
```
## Building a package
When catkin tries to build a package, it will parse the whole src directory and see all the packages that can be built. While it shouldn't really matter, I advise not to and to tell it which package you want to build. This is to avoid things such as the requirement of other packages and linking issues I have experienced during build, as per changelog entry #1. This can be done easily by using the command written below while inside the catkin_ws directory:
```
catkin_ws - ./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="<your_package_name_here>" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
```

## Changelog
* 21/06/2024 - Developed install scripts to install ros base locally and update to desktop full. Dockerfile now relies on the ros base install script. Rviz moved toward a apt-get install instead of compiling by source as it is more reliable. Removed a tutorial package.
* 03/06/2024 - Developed Dockerfile to automate ros-noetic base install; added patching scripts. Edited Readme.
* 13/02/2024 - Finished building all packages required by `rosinstall`. Ros-noetic base is built and roscore runs without issues. Still, running `catkin_make install` of all the packages inside `catkin_ws/src` throws the same cmake error as of Feb 7th, although all packages have been successfully built one-by-one. I suspect some linking libraries errors due to the amount of packages to be installed, but it's just a hunch. Theoretically, ros noetic full should have been built since all packages have been installed one-by-one; emphasis on the theoretical aspect.
* 12/02/2024 - Added patches to build:
  ```
  kdl_parser              laser_filters
  laser_geometry          perception_pcl
  resource_retriever      robot_state_publisher
  rqt_image_view
  ```
  Achieved success in building the following packages (and their subpackages):
  ```
  joint_state_publisher   kdl_parser
  laser_proc              laser_assembler
  laser_filters           laser_geometry
  laser_pipeline          media_export
  metapackages            navigation_msgs
  pcl_msgs                perception_pcl
  python_qt_binding       qt_gui_core
  qwt_dependency          resource_retriever
  robot_state_publisher   roslint
  rqt                     rqt_action
  rqt_bag                 rqt_common_plugins
  rqt_console             rqt_dep
  rqt_graph               rqt_image_view
  rqt_launch              rqt_logger_level
  rqt_moveit              rqt_msg
  rqt_nav_view            rqt_plot
  rqt_pose_view           rqt_publisher
  rqt_py_console          rqt_reconfigure
  rqt_robot_dashboard     rqt_robot_monitor
  rqt_robot_plugins       rqt_robot_steering
  rqt_runtime_monitor
  ```
* 09/02/2024 - Added patches to build `tf` and `urdf` packages with c++17. Achieved success in building the following packages (and their sub-packages):
  ```
  angles                  common_tutorials
  control_msgs            realtime_tools
  control_toolbox         geometry
  geometry_experimental   ros_tutorials
  geometry_tutorials      diagnostics
  executive_smach         filters
  urdf                    urdf_sim_tutorial
  urdf_tutorial           vision_opencv
  image_common            image_transport_plugins
  gazebo_ros_pkgs         gl_dependency
  image_pipeline          interactive_markers
  ```

* 08/02/2024  - Changing approach: building base version first and build subsequent packages later. Added script to clone base version and patch them. Base version seems to build fine.

* 07/02/2024  - Currently, packages are configured by catkin_make but an issue with the math.h library not being properly linked in a package halts the build, and is curretly being investigated.

