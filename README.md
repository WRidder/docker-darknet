# docker-darknet
Darknet images with cpu and gpu support.

## Usage
Pull this repository
```bash
$ git clone git@github.com:WRidder/docker-darknet.git 
$ cd docker-darknet
```
From the root folder of the repository, execute:
```bash
# Usage: $ ./detect.sh <cfg> <weights> <input-image> <output filename> [<use-gpu>=0/1]
```
So, for example:
```bash
$ ./detect.sh cfg/yolov3-tiny.cfg data/yolov3-tiny.weights data/dog2.jpg predictions
```

The image mounts the *data* folder by default. Any weights, configuration, input images, etc can be located. By default, a nVidia CUDA compataible GPU is assumed to be available. 


## Building
```bash
$ cd gpu OR cpu
$ ./build.sh
