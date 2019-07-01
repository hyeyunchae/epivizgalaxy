#!/usr/bin/python

from parser import create_parser_object
import os
import numpy
import pickle
import sys

ff = create_parser_object(sys.argv[2], sys.argv[1])
res, _ = ff.getRange(sys.argv[3],int(sys.argv[4]),int(sys.argv[5]))
print(res)
