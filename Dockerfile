FROM ubuntu:22.04
# Building tools
RUN apt-get update && \
        apt-get install -y \
        cmake \
        build-essential \
        python3 \
        pip \
        git \
        wget

# SINCE TZDATA HAS TO ASK
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install tzdata
# LIBRARIES AND OTHER TOOLS
RUN apt-get install -y git curl \
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
        fltk1.1-dev 
# PYTHON STUFF
RUN apt-get install -y python3-empy \
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
        python3-sip-dev

WORKDIR "/home"
RUN git clone https://github.com/orocos/orocos_kinematics_dynamics.git && mkdir /home/orocos_kinematics_dynamics/build
WORKDIR "/home/orocos_kinematics_dynamics/build"
RUN cmake ../orocos_kdl && make && make install
WORKDIR "/home"
RUN git clone https://github.com/rtv/Stage.git && mkdir /home/stage4
WORKDIR "/home/stage4"
RUN cmake ../Stage && make && make install
WORKDIR "/home"
RUN apt install -y gazebo libgazebo-dev
# RUN sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
# RUN wget https://packages.osrfoundation.org/gazebo.key -O - | apt-key add -
# RUN apt-get update && apt-get install gazebo libgazebo-dev
RUN apt-get install -y librviz-dev rviz
RUN git clone https://github.com/Akvarion/ros-noetic-full-22.04.git 
WORKDIR "/home/ros-noetic-full-22.04"
RUN chmod 755 ./old\ git\ cloning\ scripts/ros_noetic_base_git_pull.sh
RUN ./old\ git\ cloning\ scripts/ros_noetic_base_git_pull.sh
WORKDIR "/home/ros-noetic-full-22.04/catikin_ws/src/pluginlib"
RUN git apply --ignore-whitespace ../../../patches/pluginlib.patch
WORKDIR "/home/ros-noetic-full-22.04/catikin_ws/src/ros_comm"
RUN git apply --ignore-whitespace ../../../patches/ros_comm.patch
WORKDIR "/home/ros-noetic-full-22.04/catikin_ws/src/ros_console"
RUN git apply --ignore-whitespace ../../../patches/rosconsole.patch
WORKDIR "/home/ros-noetic-full-22.04/"
RUN git clone https://github.com/ros-infrastructure/catkin_pkg.git -b 0.5.2
RUN git clone https://github.com/ros-infrastructure/rospkg.git -b 1.5.0
WORKDIR "/home/ros-noetic-full-22.04/catkin_pkg"
RUN python3 setup.py install
WORKDIR "/home/ros-noetic-full-22.04/rospkg"
RUN python3 setup.py install
WORKDIR "/home/ros-noetic-full-22.04/catikin_ws"
RUN ./src/catkin/bin/catkin_make install -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3