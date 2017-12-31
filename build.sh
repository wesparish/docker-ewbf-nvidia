#!/bin/bash

docker build -t wesparish/ewbf:nvidia-0.3.4b . && \
  docker push wesparish/ewbf:nvidia-0.3.4b
