# Darknet Docker - GPU + cuDNN + OpenCV
# @author Wilbert van de Ridder

# Base image
FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04

# Author
MAINTAINER Wilbert van de Ridder wilbert.ridder@gmail.com

# Extra metadata
LABEL version="1.0"
LABEL description="Darknet Dockerfile. Darknet compiled using GPU, CuDNN, and OpenCV support."

# Install dependencies and cleanup afterwards
RUN \
	apt-get update && apt-get install -y \
	autoconf \
    automake \
	build-essential \
	cmake \
	git \
    libtool \
	wget \
	pkg-config \
	unzip \	
    # OpenCV libraries
    ffmpeg qtbase5-dev libopencv-dev libgtk-3-dev libdc1394-22 libdc1394-22-dev libjpeg-dev libpng12-dev libtiff5-dev libjasper-dev \
    libavcodec-dev libavformat-dev libswscale-dev libxine2-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev \
    libv4l-dev libtbb-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev \
    libvorbis-dev libxvidcore-dev v4l-utils vtk6 \
    liblapacke-dev libopenblas-dev libgdal-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /

# Pull, configure, compile, install, and cleanup OpenCV
ENV OPENCV_VERSION="3.3.0"
RUN \
    wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip \
    && unzip ${OPENCV_VERSION}.zip \
    && mkdir /opencv-${OPENCV_VERSION}/build \
    && cd /opencv-${OPENCV_VERSION}/build \
    # Configure
    && cmake \ 
    -D CMAKE_BUILD_TYPE=RELEASE \
    -D BUILD_SHARED_LIBS=ON \
    -D BUILD_opencv_java=OFF \
    -D BUILD_opencv_python=OFF \
    -D WITH_CUDA=OFF \
    -D BUILD_TESTS=OFF \
    -D BUILD_PERF_TESTS=OFF \ 
    -D FORCE_VTK=ON \
    -D WITH_TBB=ON \
    -D WITH_V4L=ON \
    -D WITH_QT=ON \
    -D WITH_OPENGL=OFF \
    -D WITH_CUBLAS=ON \
    -D WITH_GDAL=ON \
    -D WITH_XINE=ON \
    .. \
    # Build
    && make \
    # Install
    && make install \
    && rm /${OPENCV_VERSION}.zip \
    && rm -r /opencv-${OPENCV_VERSION}
RUN echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf && ldconfig

# Pull, configure, and compile darknet
RUN \
	git clone https://github.com/pjreddie/darknet && \
	cd darknet && \
	sed -i 's/OPENCV=.*/OPENCV=1/' Makefile && \	
	sed -i 's/CUDNN=.*/CUDNN=1/' Makefile && \
	sed -i 's/GPU=.*/GPU=1/' Makefile && \
	make

# Set data folder as volume
VOLUME /darknet/data

# Set darknet as entrypoint
WORKDIR /darknet
ENTRYPOINT ["./darknet"]

