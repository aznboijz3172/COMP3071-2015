#!/bin/bash

sed -r "s/([A-Z])([A-Za-z-]*),?/('\1',\"\1\2\"),/g" phonetic.txt