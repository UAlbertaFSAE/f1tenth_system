#!/bin/bash
set -e  # Exit on any error

# Source ROS 2 Foxy environment
source /opt/ros/foxy/setup.bash

# Update system package list
apt-get update

# Update rosdep for the specified ROS distro
rosdep update --rosdistro foxy

# Install dependencies for the workspace
rosdep install --from-paths src --ignore-src -r -y
