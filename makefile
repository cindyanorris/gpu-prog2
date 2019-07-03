NVCC = /usr/local/cuda-8.0/bin/nvcc
CC = g++
GENCODE_FLAGS = -arch=sm_30

#No optmization flags and no debugging.
NVCCFLAGS = -c -m64 -Xptxas -v 

#Optimization flags. No debugging.
#NVCCFLAGS = -c -m64 -O2 -Xptxas -O2,-v

#No optimization and debugging flags. Use this for debugging.
#NVCCFLAGS = -g -G -m64 --compiler-options -Wall

OBJS = wrappers.o vecAdd.o h_vecAdd.o d_vecAdd.o
.SUFFIXES: .cu .o .h 
.cu.o:
	$(NVCC) $(NVCCFLAGS) $(GENCODE_FLAGS) $< -o $@

vecAdd: $(OBJS)
	$(CC) $(OBJS) -L/usr/local/cuda/lib64 -lcuda -lcudart -o vecAdd

vecAdd.o: vecAdd.cu

h_vecAdd.o: h_vecAdd.cu h_vecAdd.h CHECK.h

d_vecAdd.o: d_vecAdd.cu d_vecAdd.h CHECK.h

wrappers.o: wrappers.cu wrappers.h

clean:
	rm vecAdd *.o
