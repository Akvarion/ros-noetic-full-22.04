#!/bin/bash
# PATCHES FOR BASE
cd pluginlib && git apply --ignore-whitespace ../../../ros-noetic-full-22.04/catkin_ws/patches/pluginlib.patch
cd ../ros_comm && git apply --ignore-whitespace ../../../ros-noetic-full-22.04/catkin_ws/patches/ros_comm.patch
cd ../rosconsole && git apply --ignore-whitespace ../../../ros-noetic-full-22.04/catkin_ws/patches/rosconsole.patch

