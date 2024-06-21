#!/bin/bash
# This script will update the ROS Noetic from base to desktop full.
# Run this sript after ROS 1 Base has been installed.
# rviz build was avoided by installing it directly through apt-get along with librviz-dev
# a visualization tutorial for rviz has been omitted from build, as it was using namespaces no longer supported

cd catkin_ws/src
# Downloading source && patching..
git clone https://github.com/ros/angles -b 1.9.13
git clone https://github.com/ros/ros_tutorials.git -b 0.10.2
git clone https://github.com/ros/common_tutorials -b 0.2.0
git clone https://github.com/ros-controls/control_msgs.git -b 1.5.2
git clone https://github.com/ros-controls/realtime_tools.git -b 1.16.1
git clone https://github.com/ros-controls/control_toolbox.git -b 1.19.0
git clone https://github.com/ros/diagnostics.git -b 1.11.0
git clone https://github.com/ros/executive_smach.git -b 2.5.2
git clone https://github.com/ros/filters.git -b 1.9.2
git clone https://github.com/ros-controls/ros_control.git -b 0.20.0
git clone https://github.com/ros/urdf.git -b 1.13.2
git clone https://github.com/ros/resource_retriever.git -b 1.12.7
git clone https://github.com/ros-controls/ros_controllers.git -b 0.21.2
git clone https://github.com/ros/geometry_experimental.git -b 0.7.7
git clone https://github.com/ros/geometry.git -b 1.13.2
git clone https://github.com/ros-perception/vision_opencv.git -b 1.16.2
git clone https://github.com/ros-perception/image_common.git -b 1.12.0
git clone https://github.com/ros-perception/image_pipeline.git -b 1.17.0
git clone https://github.com/ros-perception/image_transport_plugins.git -b 1.14.0
git clone https://github.com/ros-simulation/gazebo_ros_pkgs.git -b 2.9.2
git clone https://github.com/ros/geometry_tutorials -b 0.2.3
git clone https://github.com/ros-visualization/gl_dependency.git -b 1.1.2
git clone https://github.com/ros-visualization/interactive_markers.git -b 1.12.0
git clone https://github.com/ros/joint_state_publisher.git -b 1.15.1
git clone https://github.com/ros/kdl_parser.git -b 1.14.2
git clone https://github.com/ros-perception/laser_geometry.git -b 1.6.7
git clone https://github.com/ros-perception/laser_assembler.git -b 1.7.8
git clone https://github.com/ros-perception/laser_filters.git -b 1.9.0
git clone https://github.com/ros-perception/laser_pipeline.git -b 1.6.4
git clone https://github.com/ros/media_export.git -b 0.3.0
git clone https://github.com/ros/metapackages.git -b 1.5.0
git clone https://github.com/ros-planning/navigation_msgs.git -b 1.14.1
git clone https://github.com/ros-perception/pcl_msgs.git -b 0.3.0
git clone https://github.com/ros-perception/perception_pcl.git -b 1.7.4
git clone https://github.com/ros-visualization/python_qt_binding.git -b 0.4.4
git clone https://github.com/ros-visualization/qt_gui_core.git -b 0.4.2
git clone https://github.com/ros-visualization/qwt_dependency.git -b 1.1.1
git clone https://github.com/ros/robot_state_publisher.git -b 1.15.2
git clone https://github.com/ros/roslint.git -b 0.12.0
git clone https://github.com/ros-visualization/rqt.git -b 0.5.3
git clone https://github.com/ros-visualization/rqt_action.git -b 0.4.9
git clone https://github.com/ros-visualization/rqt_bag.git -b 0.5.1
git clone https://github.com/ros-visualization/rqt_common_plugins.git -b 0.4.9
git clone https://github.com/ros-visualization/rqt_console.git -b 0.4.12
git clone https://github.com/ros-visualization/rqt_dep.git -b 0.4.12
git clone https://github.com/ros-visualization/rqt_graph.git -b 0.4.14
git clone https://github.com/ros-visualization/rqt_image_view.git -b 0.4.17
git clone https://github.com/ros-visualization/rqt_launch.git -b 0.4.9
git clone https://github.com/ros-visualization/rqt_logger_level.git -b 0.4.12
git clone https://github.com/ros-visualization/rqt_moveit.git -b 0.5.11
git clone https://github.com/ros-visualization/rqt_msg.git -b 0.4.10
git clone https://github.com/ros-visualization/rqt_nav_view.git -b 0.5.7
git clone https://github.com/ros-visualization/rqt_plot.git -b 0.4.13
git clone https://github.com/ros-visualization/rqt_pose_view.git -b 0.5.11
git clone https://github.com/ros-visualization/rqt_publisher.git -b 0.4.10
git clone https://github.com/ros-visualization/rqt_py_console.git -b 0.4.10
git clone https://github.com/ros-visualization/rqt_reconfigure.git -b 0.5.5
git clone https://github.com/ros-visualization/rqt_robot_dashboard.git -b 0.5.8
git clone https://github.com/ros-visualization/rqt_robot_monitor.git -b 0.5.15
git clone https://github.com/ros-visualization/rqt_robot_plugins.git -b 0.5.8
git clone https://github.com/ros-visualization/rqt_robot_steering.git -b 0.5.12
git clone https://github.com/ros-visualization/rqt_runtime_monitor.git -b 0.5.10
git clone https://github.com/ros-visualization/rqt_rviz.git -b 0.7.0
git clone https://github.com/ros-visualization/rqt_service_caller.git -b 0.4.10
git clone https://github.com/ros-visualization/rqt_shell.git -b 0.4.11
git clone https://github.com/ros-visualization/rqt_srv.git -b 0.4.9
git clone https://github.com/ros-visualization/rqt_tf_tree.git -b 0.6.4
git clone https://github.com/ros-visualization/rqt_top.git -b 0.4.10
git clone https://github.com/ros-visualization/rqt_topic.git -b 0.4.13
git clone https://github.com/ros-visualization/rqt_web.git -b 0.4.10
git clone https://github.com/ros-simulation/stage_ros.git -b 1.8.0
git clone https://github.com/ros/urdf_sim_tutorial.git -b 0.5.1
git clone https://github.com/ros/urdf_tutorial.git -b 0.5.0
git clone https://github.com/ros-visualization/webkit_dependency.git -b 1.1.2
git clone https://github.com/ros/xacro.git -b 1.14.17

# PATCHES   
cd urdf && git apply --ignore-whitespace ../../../patches/urdf_c++17.patch
cd ../resource_retriever && git apply --ignore-whitespace ../../../patches/resource_retriever_c++17.patch
cd ../geometry && git apply --ignore-whitespace ../../../patches/tf_c++17.patch
cd ../rqt_image_view && git apply --ignore-whitespace ../../../patches/rqt_image_view_c++17.patch
cd ../robot_state_publisher && git apply --ignore-whitespace ../../../patches/robot_state_publisher_c++17.patch
cd ../laser_filters && git apply --ignore-whitespace ../../../patches/laser_filters_c++17.patch
cd ../laser_geometry && git apply --ignore-whitespace ../../../patches/laser_geometry_c++17.patch
cd ../kdl_parser && git apply --ignore-whitespace ../../../patches/kdl_parser_c++17.patch


## Install, rospkg e catkin_pkg should have been already installed
## Some of these could be compacted, honestly not willing to try with all the linking issues I've had so far.
cd ../..
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="angles" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="roscpp_tutorials;rospy_tutorials;ros_tutorials;turtlesim" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="actionlib_tutorials;common_tutorials;nodelet_tutorial_math;pluginlib_tutorials;turtle_actionlib" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="control_msgs" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="realtime_tools" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="control_toolbox" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="diagnostic_aggregator;diagnostic_common_diagnostics;diagnostic_updater;self_test;diagnostic_analysis;diagnostics;rosdiagnostic;test_diagnostic_aggregator" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="executive_smach;smach;smach_msgs;smach_ros" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="filters" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="urdf;urdf_parser_plugin" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="resource_retriever" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="combined_robot_hw;controller_manager;combined_robot_hw_tests;controller_manager_msgs;hardware_interface;rqt_controller_manager;controller_interface;controller_manager_tests;joint_limits_interface;ros_control;transmission_interface" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="geometry2;tf2;tf2_eigen;tf2_kdl;tf2_py;tf2_sensor_msgs;test_tf2;tf2_bullet;tf2_geometry_msgs;tf2_msgs;tf2_ros;tf2_tools" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="eigen_conversions;geometry;kdl_conversions;tf;tf_conversions" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="cv_bridge;image_geometry;opencv_tests;vision_opencv" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="camera_calibration_parsers;camera_info_manager;image_common;image_transport;polled_camera" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="compressed_depth_image_transport;compressed_image_transport;image_transport_plugins;theora_image_transport" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="camera_calibration;image_pipeline;image_publisher;image_view;stereo_image_proc;depth_image_proc;image_proc;image_rotate" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="gazebo_msgs;gazebo_ros;gazebo_ros_pkgs;gazebo_dev;gazebo_plugins;gazebo_ros_control" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="geometry_tutorials;turtle_tf;turtle_tf2" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="gl_dependency" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="interactive_markers" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="joint_state_publisher;joint_state_publisher_gui" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="kdl_parser;kdl_parser_py" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="laser_geometry" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="laser_assembler" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="laser_filters" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="laser_pipeline" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="media_export" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="desktop;desktop_full;perception;robot;ros_base;ros_core;simulators;viz" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="map_msgs;move_base_msgs" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="pcl_msgs" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="pcl_conversions;pcl_ros;perception_pcl" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="python_qt_binding" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="qt_dotgraph;qt_gui;qt_gui_app;qt_gui_core;qt_gui_cpp;qt_gui_py_common" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="qwt_dependency" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="robot_state_publisher" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="roslint" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="rqt;rqt_gui;rqt_gui_cpp;rqt_gui_py;rqt_py_common" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="rqt_action" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="rqt_bag;rqt_bag_plugins" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="rqt_common_plugins" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="rqt_console" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="rqt_dep" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="rqt_graph" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="rqt_image_view" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="rqt_launch" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="rqt_logger_level" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="rqt_moveit" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="rqt_msg" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="rqt_nav_view" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="rqt_plot;rqt_pose_view;rqt_publisher;rqt_py_console;rqt_reconfigure;rqt_robot_dashboard;rqt_robot_monitor;rqt_robot_plugins;rqt_robot_steering;rqt_runtime_monitor;" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="rqt_rviz" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="rqt_service_caller;rqt_shell;rqt_srv;rqt_tf_tree;rqt_top;rqt_topic;rqt_web" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="stage_ros" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="urdf_sim_tutorial;urdf_tutorial" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="webkit_dependency" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
./src/catkin/bin/catkin_make install -DCATKIN_WHITELIST_PACKAGES="xacro" -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
