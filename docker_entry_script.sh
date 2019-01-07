#!/bin/bash
set -e

# setup ros environment
source "/opt/ros/kinetic/setup.bash"

# setup catkin workspace packages
source "/catkin_ws/devel/setup.sh"

exec "$@"