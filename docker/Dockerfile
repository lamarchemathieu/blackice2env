
FROM ubuntu:16.04
MAINTAINER mlamarche
ENV OPT /opt
ENV WORKSPACE ${OPT}/workspace

RUN apt-get update \
    && apt-get install --assume-yes --no-install-recommends \
    	apt-utils u-boot-tools sudo kmod \
	    gawk make git subversion arduino-core curl cpio rsync bc clang python\
	    python-dev python-serial python-argparse openocd flex bison libncurses5-dev \
	    lib32ncurses5 \
	    autoconf texinfo build-essential libftdi-dev libtool zlib1g-dev \
	    zip unzip genromfs python-empy libc6-i386 \
	    g++-arm-linux-gnueabihf \
	    g++ python-pip python-setuptools python-matplotlib python-serial \
	    python-scipy python-opencv python-numpy python-pyparsing ccache \
	    openssh-client realpath python-wxgtk3.0 wget \
	    libeigen3-dev libssl-dev linux-headers-4.15.0-24-generic \
	    python3 python3-argcomplete python3-ruamel.yaml python3-serial vim-common \
	    libreadline-dev tcl-dev \
	    libffi-dev graphviz xdot \
	    pkg-config libftdi-dev vim\
	    htop screen iverilog dfu-util gtkwave \
	&& rm -rf /var/lib/apt/lists/*

RUN groupadd -r builder \
	&& useradd -m -d /home/builder -g builder builder \
	&& adduser builder dialout && adduser builder sudo && echo "builder:builder" | chpasswd

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN mkdir -p /tmp/src/
RUN cd /tmp/src

RUN git clone https://github.com/cliffordwolf/icestorm.git /tmp/src/icestorm
RUN cd /tmp/src/icestorm && make -j`nproc`
RUN cd /tmp/src/icestorm && make install

RUN git clone https://github.com/cseed/arachne-pnr.git /tmp/src/arachne-pnr
RUN cd /tmp/src/arachne-pnr && make -j`nproc`
RUN cd /tmp/src/arachne-pnr && make install

RUN git clone https://github.com/cliffordwolf/yosys.git /tmp/src/yosys
RUN cd /tmp/src/yosys && make -j`nproc`
RUN cd /tmp/src/yosys && make install

RUN mkdir -p /opt/gcc-arm
RUN cd /tmp/src/ && curl https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/7-2017q4/gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2 > gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2
RUN cd /opt/gcc-arm && bunzip2 -c /tmp/src/gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2 | tar xf -

RUN rm -rf /tmp/src/*

ENV PATH /opt/gcc-arm/gcc-arm-none-eabi-7-2017-q4-major/bin:${PATH}

USER builder
# Set workdir
WORKDIR ${WORKSPACE}
