#include <stdio.h>
#include <stdlib.h>
#include <cuda_runtime.h>
#include "CHECK.h"
#include "d_vecAdd.h"

//use this as the size of your blocks (number of threads per block)
#define BLOCKDIM 512 

__global__ void d_vecAddKernel(float * d_A, float * d_B, float * d_C, int n);

/*  d_vecAdd
    Performs the vector add on the GPU (the device).
    A and B are pointers to two vectors to add together.
    The result is stored in the vector pointed to by C.
    n is the length of the vectors.

    returns the amount of time it takes to perform the
    vector add 
*/
float d_vecAdd(float* A, float* B, float* C, int n)
{
    float gpuMsecTime;
    cudaEvent_t start_gpu, stop_gpu;

    //time the sum of the two vectors
    CHECK(cudaEventCreate(&start_gpu));
    CHECK(cudaEventCreate(&stop_gpu));
    CHECK(cudaEventRecord(start_gpu));

    //missing code goes here
    //1) create vectors on the device
    //2) copy A and B vectors into device vectors
    //3) launch the kernel
    //4) wait for the kernel threads to complete
    //5) copy the result vector into the C vector
    //6) free space allocated for vectors on the device
    //Don't forget to use the CHECK macro on your cuda calls

    CHECK(cudaEventRecord(stop_gpu));
    CHECK(cudaEventSynchronize(stop_gpu));
    CHECK(cudaEventElapsedTime(&gpuMsecTime, start_gpu, stop_gpu));
    return gpuMsecTime;
}

/*  
    d_vecAddKernel
    This function contains the kernel code. This code will be
    executed by every thread created by the kernel launch.
    d_A and d_B are pointers to two vectors on the device to add together.
    The result is stored in the vector pointed to by d_C.
    n is the length of the vectors.
*/
__global__ void d_vecAddKernel(float * d_A, float * d_B, float * d_C, int n)
{
    //add the missing body
}      

