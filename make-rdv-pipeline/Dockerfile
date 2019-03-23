# Use the ros-kinetic-base image as a base image. This image already contains all nessecary dependencies for running ros
FROM haraldlons/r18dv_catkin_simple_gtsam_catkin

RUN apt-get update && \
    apt-get install --no-install-recommends -y ros-kinetic-tf2-sensor-msgs && \
    apt-get install --no-install-recommends -y ros-kinetic-geometry2 && \
    apt-get install --no-install-recommends -y ros-kinetic-tf && \
    apt-get install --no-install-recommends -y ros-kinetic-dynamic-reconfigure && \
    apt-get install --no-install-recommends -y ros-kinetic-rqt-multiplot && \
    apt-get install --no-install-recommends -y liblapack-dev && \
    apt-get install --no-install-recommends -y libblas-dev && \
    apt-get install --no-install-recommends -y libqwt-dev && \
    apt-get install --no-install-recommends -y libboost-dev && \
    apt-get install --no-install-recommends -y libarmadillo-dev && \
    apt-get install --no-install-recommends -y ros-kinetic-robot-localization && \
    apt-get install --no-install-recommends -y massif-visualizer && \
    apt-get install --no-install-recommends -y kcachegrind && \
    apt-get install --no-install-recommends -y ros-kinetic-velodyne && \
    apt-get install --no-install-recommends -y ros-kinetic-can-msgs && \
    apt-get install --no-install-recommends -y python-pip && \
    apt-get install --no-install-recommends -y ros-kinetic-jsk-rviz-plugins && \
    pip2 install scipy && \
    pip2 install wheel && \
    pip2 install prettytable && \
    pip2 install tensorflow && \
    rm -rf /var/lib/apt/lists/*

COPY . src/

RUN source /opt/ros/kinetic/setup.bash && catkin_make -DCATKIN_WHITELIST_PACKAGES=""
# RUN source /opt/ros/kinetic/setup.bash
COPY docker_entry_script.sh /
# Move the entry script to root
# RUN mv src/rosaria/docker_entry_script.sh /
# Make the entry script executable
RUN chmod +x /docker_entry_script.sh

# Create an entrypoint, the entryscript will source all neded setup files for ros to work properly.
ENTRYPOINT [ "/docker_entry_script.sh" ]
