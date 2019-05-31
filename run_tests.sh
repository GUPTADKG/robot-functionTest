#!/usr/bin/env bash

docker run -e USERNAME="guptadkg" \
           --name robot-docker \
           --net=host \
           -v "$PWD/output":/output \
           -v "$PWD/suites":/suites \
           -v "$PWD/scripts":/scripts \
           -v "$PWD/reports":/reports \
           --security-opt seccomp:unconfined \
           --shm-size "256M" \
           guptadkg/robot-docker 
