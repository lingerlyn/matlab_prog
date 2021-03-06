#save mat file 
import os
import pickle
import sys

train_dir = sys.argv[1]
with open(train_dir + '/data_full.pkl', 'rb') as f:
    data_full = pickle.load(f)

import numpy, scipy.io
save_filename = os.path.expanduser('~/code/matlab_prog/mydata.mat')
scipy.io.savemat(save_filename, mdict={'data': data_full})
