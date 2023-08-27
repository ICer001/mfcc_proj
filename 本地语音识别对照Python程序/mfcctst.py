import numpy as np
from scipy.fftpack.realtransforms import dct
from python_speech_features import mfcc
from python_speech_features import base
import scipy.io.wavfile as wav
import time
np.set_printoptions(threshold=np.inf)
np.set_printoptions(suppress=True)




##########      zero rate cal        ############
def calEnergy(wave_data,frmae_len):
    """
    :param wave_data: binary data of audio file
    :return: energy
    """
    energy = []
    sum = 0
    frmae_len=np.int32(frmae_len)
    for i in range(len(wave_data)):
        sum = sum + (int(wave_data[i]) * int(wave_data[i]))
        if (i + 1) % frmae_len == 0:
            energy.append(sum)
            sum = 0
        elif i == len(wave_data) - 1:
            energy.append(sum)
    return energy



def calZeroCrossingRate(wave_data,frmae_len):
    """
    :param wave_data: binary data of audio file
    :return: ZeroCrossingRate
    """
    zeroCrossingRate = []
    sum = 0
    frmae_len=np.int32(frmae_len)
    for i in range(len(wave_data)):
        sum = sum + np.abs(int(wave_data[i] >= 0) - int(wave_data[i - 1] >= 0))
        if (i + 1) % frmae_len == 0:
            zeroCrossingRate.append(float(sum) / (frmae_len-1))
            sum = 0
        elif i == len(wave_data) - 1:
            zeroCrossingRate.append(float(sum) / (frmae_len-1))
    return zeroCrossingRate



# 利用短时能量，短时过零率，使用双门限法进行端点检测
def endPointDetect(energy, zeroCrossingRate) :
    sum = 0
    energyAverage = 0
    for en in energy :
        sum = sum + en
    energyAverage = sum / len(energy)

    sum = 0
    for en in energy[:5] :
        sum = sum + en
    ML = sum / 5                        
    MH = energyAverage / 4              #较高的能量阈值
    ML = (ML + MH) / 4    #较低的能量阈值
    sum = 0
    for zcr in zeroCrossingRate[:5] :
        sum = float(sum) + zcr             
    Zs = sum / 5                     #过零率阈值

    A = []
    B = []
    C = []

    # 首先利用较大能量阈值 MH 进行初步检测
    flag = 0
    for i in range(len(energy)):
        if len(A) == 0 and flag == 0 and energy[i] > MH :
            A.append(i)
            flag = 1
        elif flag == 0 and energy[i] > MH and i - 21 > A[len(A) - 1]:
            A.append(i)
            flag = 1
        elif flag == 0 and energy[i] > MH and i - 21 <= A[len(A) - 1]:
            A = A[:len(A) - 1]
            flag = 1

        if flag == 1 and energy[i] < MH :
            A.append(i)
            flag = 0
    # print("较高能量阈值，计算后的浊音A:" + str(A))

    # 利用较小能量阈值 ML 进行第二步能量检测
    for j in range(len(A)) :
        i = A[j]
        if j % 2 == 1 :
            while i < len(energy) and energy[i] > ML :
                i = i + 1
            B.append(i)
        else :
            while i > 0 and energy[i] > ML :
                i = i - 1
            B.append(i)
    # print("较低能量阈值，增加一段语言B:" + str(B))

    # 利用过零率进行最后一步检测
    for j in range(len(B)) :
        i = B[j]
        if j % 2 == 1 :
            while i < len(zeroCrossingRate) and zeroCrossingRate[i] >= 3 * Zs :
                i = i + 1
            C.append(i)
        else :
            while i > 0 and zeroCrossingRate[i] >= 3 * Zs :
                i = i - 1
            C.append(i)
    # print("过零率阈值，最终语音分段C:" + str(C))
    return C

##########      for recognize        ############
def pre_operate(sig,frame_len):
    '''预处理集总'''
    # 过零率检测
    zr=calZeroCrossingRate(sig,frame_len)
    en=calEnergy(sig,frame_len)
    C=endPointDetect(en,zr)
    if((len(C)%2)==1):
            C.append(int(len(sig)/frame_len))
    D=np.array(C)*frame_len
    
    print(D)
    dif=list(D[1::2]-D[0::2])
    loc=dif.index(max(dif))*2
    sig0=sig[D[loc]:D[loc+1]]
    print("有效语音段:",C[loc],C[loc+1])
    
    sig=np.zeros(len(sig0),dtype=np.int16)
    sig1=sig0
    return sig0

path_init="C:\\Users\\Administrator\\Desktop\\voice\\voice_base\\"
path_test="C:\\Users\\Administrator\\Desktop\\voice\\voice_for_test\\"
path_model="C:\\Users\\Administrator\\Desktop\\voice\\"
speech_name="3.wav"

(rate,sig) = wav.read(path_test+speech_name)
sig=np.array(pre_operate(sig,500),dtype=np.double)
# 量化预处理
min0=np.min(sig)
max0=np.max(sig)
scale = np.double(max0 - min0)/32767.0
data_int = ((sig - min0) / scale)
data_int = np.rint(data_int)
xxxxxxx=(np.array(data_int,dtype=np.float)/32768.0)[0:3999]

start = time.time()
a=mfcc(xxxxxxx,samplerate=rate,winlen=0.02312,winstep=0.01156,numcep=12,
             nfilt=12,nfft=512,lowfreq=20,highfreq=10000,preemph=0.96875,ceplifter=12,appendEnergy=0)
end = time.time()
cost = round((end - start)*2.8*1024/667,8)
print('time cost ' + str(cost) + 's')

speed = round(4000/cost,8)
print('transfer speed: ' + str(speed) + 'sample/s')