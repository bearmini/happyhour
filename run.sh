#!/bin/bash
d=$( cd $( dirname "$0" ); pwd )

$d/node_modules/.bin/electron $d
