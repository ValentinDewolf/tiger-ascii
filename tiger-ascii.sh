#!/bin/bash

trap 'tput sgr0; tput cnorm;' INT
$@ | ./animation.sh
