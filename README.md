# ros-noetic-full-22.04
This is an attempt to build the desktop full version of ROS 1 Noetic from source. It uses a custom ubuntu 22.04 docker image as an evironment to build noetic, in a very similar way to how Lukas Reisinger did it in [his article](https://medium.com/@lukas_reisinger/building-ros-noetic-on-ubuntu-22-04-b3ca676c63e7). Refer to the Changelog-Issues section of this readme for further info on the current situation.

## Install
Whole build and install of ros noetic base has been automated for use through the dockerfile provided in this repo. Open a terminal from a directory with the Dockerfile inside and simply run:
```
~ - sudo docker build -t ros_noetic_22_04 .
```
Docker will take care of applying patches, building and installing all the components required for ros noetic base and desktop full.
Next, you can start an interactive bash session with:
```
~ - sudo docker run -it --rm ros_noetic_22_04 bash
```
You can run roscore by sourcing the file "setup.bash" from that interactive bash session.

While the Desktop Full version has been built, further time is needed. To install the desktop full packages, you need run each "git clone" package inside the script `ros_noetic_df_update_git_pull.sh`: one by one, git clone, check if they appear in the script `patcher_df_update.sh`, apply the relative patch if needed and build with the following command:
```
~ - cd /ros_noetic_desktop_full_2204/catkin_ws
~ - ./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="package1;package2;package3" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
```
where package1,package2,package3 are the names of the single packages to install (these MUST be specified, since a single package may be composed of more sub-packages: in this case, use the name of those sub-packages). Also, some packages may be required to be installed before others, but the compiler should tell you which package it is.

The re-build of `catkin_pkg` and `rospkg` may be required every single time. To do so, launch this:
```
~ - cd /ros_noetic_desktop_full_2204/catkin_pkg && python3 setup.py install
~ - cd /ros_noetic_desktop_full_2204/rospkg && python3 setup.py install
```


## Changelog - Issues
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

