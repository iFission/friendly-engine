from scipy.io import wavfile
import pandas as pd 
import numpy as np
#import struct


fs, data = wavfile.read('C:/Users/nmbin/Desktop/ComStruc1DSound/8bitUnsignedSound/win1.wav')     #read wav file to give no of frames and array of 8-bit unsigned int 0-255
data_dec = [format(data[x],'d') for x in data]                                                                 #convert to hex

print(fs)
print(data_dec[:50])
print(len(data))
print(data.dtype)

with open('C:/Users/nmbin/Desktop/ComStruc1DSound/win1_dec.txt', 'w') as outfile:
    for i in range(len(data)):
        outfile.write("8d{}, ".format(data_dec[i]))
        
#pd.DataFrame(data_hex).to_csv("C:/Users/nmbin/Desktop/ComStruc1DSound/data/block1.csv")

