import grass.script as grass
from grass.script import raster as grassR
import os
import string
import glob
import re
import fnmatch

list_tot=grass.mlist_grouped ('rast', pattern='**') ['PERMANENT']

for i in list_tot:
    print i