FROM ubuntu:22.04
#Building tools
RUN apt-get update && \
        apt-get install -y \
        cmake \
        build-essential \
        python3 \
        pip \
        git

#SINCE TZDATA HAS TO ASK
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install tzdata
#Libraries and other tools
RUN apt-get install -y git \ 
        curl \ 
        libcurl4-openssl-dev \
        qtbase5-dev \
        qt5-qmake qttools5-dev \
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
#Python Stuff
RUN apt-get install -y python3-empy \
        python3-nose \
        python3-pycryptodome \
        python3-defusedxml \
        python3-mock \
        python3-netifaces \
        python3-gnupg \
        python3-numpy \
        python3-psutil \
        python3-sip

WORKDIR "/home"
RUN git clone https://github.com/orocos/orocos_kinematics_dynamics.git && mkdir /home/orocos_kinematics_dynamics/build
WORKDIR "/home/orocos_kinematics_dynamics/build"
RUN cmake ../orocos_kdl && make && make install
WORKDIR "/home"
RUN git clone https://github.com/rtv/Stage.git && mkdir /home/stage4
WORKDIR "/home/stage4"
RUN cmake ../Stage && make && make install
WORKDIR "/"
RUN curl -sSL http://get.gazebosim.org | sh

