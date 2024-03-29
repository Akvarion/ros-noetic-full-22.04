# ros-noetic-full-22.04
This is an attempt to build the desktop full version of ROS 1 Noetic from source. It uses a custom ubuntu 22.04 docker image as an evironment to build noetic, in a very similar way to how Lukas Reisinger did it in [his article](https://medium.com/@lukas_reisinger/building-ros-noetic-on-ubuntu-22-04-b3ca676c63e7). Refer to the Changelog-Issues section of this readme for further info on the current situation.

## Install
On the host machine, make a folder in which we will be downloading the source needed to build ros, so if our current folder is our home folder:
```
~ - mkdir -p ros_noetic_desktop_full_2204/src
```

ros_noetic_desktop_full_2204 will be from now on our Root directory.

In this directory, we want to download our source. Once we move there, we will have to run the shell script provided in this repository to download all the packages that rosinstall would have wanted us to install if we selected `desktop_full` as our target build. If the script is not executable, a simple `chmod +x` sould suffice.

```
/<a_path>/ros_noetic_desktop_full_2204/catkin_ws/src - ./ros_noetic_df_git_pull.sh
```
For the base version:
```
/<a_path>/ros_noetic_desktop_full_2204/catkin_ws/src - ./ros_noetic_base_git_pull.sh
```
In the root directory, we need to clone catkin_pkg and rospkg, so we do:

```
cd /<a_path>/ros_noetic_desktop_full_2204/
git clone https://github.com/ros-infrastructure/catkin_pkg.git -b 0.5.2
git clone https://github.com/ros-infrastructure/rospkg.git -b 1.5.0
```
After this, we build the docker image with the dockerfile provided in this repo with:
```
docker build -t ros_noetic_full_2204 .
```
Then we start an interactive bash session by executing from the root directory, mounting the root directory to the image
```
docker run -it --rm -v .:/ros_noetic_desktop_full_2204 ros_noetic_full_2204 bash
```

Then we build rospkg and catkin_pkg with the following (1):
```
cd /ros_noetic_desktop_full_2204/catkin_pkg && python3 setup.py install
cd /ros_noetic_desktop_full_2204/rospkg && python3 setup.py install
```

Lastly we start building ROS with the following:
```
cd /ros_noetic_desktop_full_2204/catkin_ws
./src/catkin/bin/catkin_make install -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
```

If you want to build a finite set of packages, just add the option `-DCATKIN_WHITELIST_PACKAGES` like this:
```
cd /ros_noetic_desktop_full_2204/catkin_ws
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="package1;package2;package3" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
```

(1): This has to be run everytime you load into the image shell. After the first successfull build, you can source the setup.bash file in the devel directory and run, for example, roscore.

## Changelog - Issues
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

