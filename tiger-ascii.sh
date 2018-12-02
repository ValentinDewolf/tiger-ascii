#!/bin/bash

tigerdir=${0%/*}
trap 'tput sgr0; tput cnorm;' INT
$@ | $tigerdir/animation.sh
