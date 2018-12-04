#!/bin/bash
# Usage: $ ./detect <cfg> <weights> <input-image> <output filename>
# Example: $ ./detect.sh cfg/yolov3-tiny.cfg data/yolov3-tiny.weights data/dog2.jpg data/predictions.jpg predictions

# Check input parameters
if [ "$#" -ne 4 ]; then
    echo "Invalid number of parameters. Usage: $ ./detect.sh <cfg> <weights> <input-image> <output file>"
    exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Mount the data folder in the parent directory by default
# If you want to enable X-server display forwarding, add: -v $HOME/.Xauthority:/home/developer/.Xauthority --net=host 
# - This window only shows if you omit the -out parameter.
docker run --runtime=nvidia --rm -e DISPLAY=$DISPLAY -v $DIR/../data:/darknet/data --name docker-darknet-gpu wridder/docker-darknet:gpu detect $1 $2 $3 -out /darknet/data/$4
