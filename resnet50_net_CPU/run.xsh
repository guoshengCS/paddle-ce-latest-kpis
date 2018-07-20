#!/bin/bash

export MKL_NUM_THREADS=1
export OMP_NUM_THREADS=1

# CPU Test
# cifar10 16
export CPU_NUM=4
python train.py --use_gpu=false --reduce_strategy="AllReduce" --batch_size=8 --model=resnet_cifar10  --pass_num=5 
python train.py --use_gpu=false --reduce_strategy="Reduce" --batch_size=8 --model=resnet_cifar10  --pass_num=5 
#flowers 16
python train.py --use_gpu=false --reduce_strategy="AllReduce" --batch_size=8 --model=resnet_imagenet --pass_num=5 
python train.py --use_gpu=false --reduce_strategy="Reduce" --batch_size=8 --model=resnet_imagenet --pass_num=5 

# CPU Test
# cifar10 16
export CPU_NUM=1
python train.py --use_gpu=false --batch_size=8 --model=resnet_cifar10  --pass_num=5 
python train.py --use_gpu=false --batch_size=8 --model=resnet_imagenet --pass_num=5