#!/bin/bash
# PATCHES FOR DESKTOP FULL
cd kdl_parser && git apply --ignore-whitespace ../../../ros-noetic-full-22.04/catkin_ws/patches/kdl_parser_c++17.patch
cd ../laser_filters && git apply --ignore-whitespace ../../../ros-noetic-full-22.04/catkin_ws/patches/laser_filters_c++17.patch
cd ../laser_geometry && git apply --ignore-whitespace ../../../ros-noetic-full-22.04/catkin_ws/patches/laser_geometry_c++17.patch
cd ../perception_pcl && git apply --ignore-whitespace ../../../ros-noetic-full-22.04/catkin_ws/patches/perception_pcl_c++17.patch
cd ../rqt_image_view && git apply --ignore-whitespace ../../../ros-noetic-full-22.04/catkin_ws/patches/rqt_image_view_c++17.patch
cd ../tf && git apply --ignore-whitespace ../../../ros-noetic-full-22.04/catkin_ws/patches/tf_c++17.patch
cd ../urdf && git apply --ignore-whitespace ../../../ros-noetic-full-22.04/catkin_ws/patches/urdf_c++17.patch
cd ../resource_retriever && git apply --ignore-whitespace ../../../ros-noetic-full-22.04/catkin_ws/patches/resource_retriever_c++17.patch
cd ../robot_state_publisher && git apply --ignore-whitespace ../../../ros-noetic-full-22.04/catkin_ws/patches/robot_state_publisher_c++17.patch