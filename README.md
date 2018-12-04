# docker-darknet
Darknet images with cpu and gpu support.

## Usage
Pull this repository
```bash
$ git clone git@github.com:WRidder/docker-darknet.git 
```
From the root folder of the repository, execute:
```bash
# Usage: $ ./detect.sh <cfg> <weights> <input-image> <output filename>
```
So, for example:
```bash
$ ./gpu/detect.sh cfg/yolov3-tiny.cfg data/yolov3-tiny.weights data/dog2.jpg predictions
```

## Building
```bash
$ cd gpu OR cpu
$ ./build.sh
