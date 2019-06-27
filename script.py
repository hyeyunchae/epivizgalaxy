#!/usr/bin/python

import epivizfileserver.parser as parser
import os
import numpy
import pickle
import sys

ff = parser.BigWig(sys.argv[1])
res, _ = ff.getRange("chr1", 1, 100, 2)
print(res)
