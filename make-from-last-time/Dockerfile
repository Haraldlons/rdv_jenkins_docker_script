# Use the ros-kinetic-base image as a base image. This image already contains all nessecary dependencies for running ros
FROM haraldlons/submodules

# The default shell is sh, switching to bash makes it easier to work with ros
SHELL ["/bin/bash", "-c"]
RUN rm -rf devel build src/r18dv_pipeline

RUN source /opt/ros/kinetic/setup.bash && catkin_make -DCATKIN_WHITELIST_PACKAGES="catkin_simple"
RUN source /opt/ros/kinetic/setup.bash && catkin_make -DCATKIN_WHITELIST_PACKAGES="gtsam_catkin"


# Remove SSH keys
RUN rm -rf /root/.ssh/

# # Copy the cide of the beginner tutorials folder into the catkin workspace
# # COPY has the syntax COPY path/on/host/machine /path/inside/docker/image
# # COPY . src/rosaria
# # RUN mkdir src
# # COPY ../geometry src/geometry
# # Build our package using catkin_make
# # RUN curl http://robots.mobilerobots.com/ARIA/download/current/libaria_2.9.4+ubuntu16_amd64.deb
# # RUN apt-get update && apt-get install --no-install-recommends -y \
#     # ros-kinetic-tf2-sensor-msgs \
#   # && apt-get install --no-install-recommends -y \
#     # ros-kinetic-geometry2 && apt-get install --no-install-recommends -y \
#     # ros-kinetic-tf && apt-get install --no-install-recommends -y \
#     # ros-kinetic-dynamic-reconfigure && rm -rf /var/lib/apt/lists/*
# RUN echo "Making src folder"
# RUN mkdir src
# RUN ls
# RUN pwd
# # RUN cd src && git clone https://github.com/ethz-asl/gtsam_catkin.git
# RUN cd src && \
#     git clone https://github.com/catkin/catkin_simple.git
# RUN apt-get update && \
#     apt-get install --no-install-recommends -y libboost-all-dev && \
#     apt-get install --no-install-recommends -y cmake && \
#     apt-get install --no-install-recommends -y libtbb-dev
# # RUN cd src && \
#     # git clone https://github.com/ethz-asl/gtsam_catkin.git
# RUN cd src && \
#     git clone https://github.com/ethz-asl/gtsam_catkin.git && \
#     cd gtsam_catkin && \
#     git checkout 4b61d6862b2319367e25f85d1149271063fc2bcd
# RUN cd src/gtsam_catkin && ls -la
# RUN echo "Compiling ONLY catkin_simple"
# RUN date
# # RUN apt-get update && apt-get install --no-install-recommends -y yum && yum install tbb tbb-devel
# # RUN yum install tbb tbb-devel
# RUN echo "Compiling ONLY gtsam_catkin. Expecting long time"
# RUN date
# RUN date

# RUN apt-get update && \
#     apt-get install --no-install-recommends -y ros-kinetic-tf2-sensor-msgs && \
#     apt-get install --no-install-recommends -y ros-kinetic-geometry2 && \
#     apt-get install --no-install-recommends -y ros-kinetic-tf && \
#     apt-get install --no-install-recommends -y ros-kinetic-dynamic-reconfigure && \
#     apt-get install --no-install-recommends -y liblapack-dev && \
#     apt-get install --no-install-recommends -y libblas-dev && \
#     apt-get install --no-install-recommends -y libboost-dev && \
#     apt-get install --no-install-recommends -y libarmadillo-dev && \
#     apt-get install --no-install-recommends -y ros-kinetic-robot-localization && \
#     apt-get install --no-install-recommends -y massif-visualizer && \
#     apt-get install --no-install-recommends -y kcachegrind && \
#     apt-get install --no-install-recommends -y ros-kinetic-velodyne && \
#     apt-get install --no-install-recommends -y ros-kinetic-can-msgs && \
#     apt-get install --no-install-recommends -y python-pip && \
#     pip2 install scipy && \
#     pip2 install prettytable && \
#     pip2 install tensorflow && \
#     rm -rf /var/lib/apt/lists/*

# RUN source /opt/ros/kinetic/setup.bash && catkin_make
# RUN source /opt/ros/kinetic/setup.bash
COPY docker_entry_script.sh /
# Move the entry script to root
# RUN mv src/rosaria/docker_entry_script.sh /
# Make the entry script executable
RUN chmod +x /docker_entry_script.sh

# Create an entrypoint, the entryscript will source all neded setup files for ros to work properly.
ENTRYPOINT [ "/docker_entry_script.sh" ]