#!/usr/bin/python

from parser import BigWig
import os
import numpy
import pickle
import sys

ff = BigWig(sys.argv[1])
res, _ = ff.getRange("chr1", 1, 100, 2)
print(res)
