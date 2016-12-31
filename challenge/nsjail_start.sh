#!/bin/bash

p="$1"
u="$2"
g="$3"

if [ -z ${p} ] && [ ! -d "$p" ]; then
  p=$(pwd)
fi
if [ -z ${u} ]; then
    u="1000"
fi
if [ -z ${g} ]; then
    g="1000"
fi

if [ -z $RLIMIT_AS ]; then
  RLIMIT_AS=max
fi
if [ -z $RLIMIT_CORE ]; then
  RLIMIT_CORE=max
fi
if [ -z $RLIMIT_CPU ]; then
  RLIMIT_CPU=max
fi
if [ -z $RLIMIT_FSIZE ]; then
  RLIMIT_FSIZE=max
fi
if [ -z $RLIMIT_NOFILE ]; then
  RLIMIT_NOFILE=max
fi
if [ -z $RLIMIT_NPROC ]; then
  RLIMIT_NPROC=max
fi
if [ -z $RLIMIT_STACK ]; then
  RLIMIT_STACK=max
fi

nsjail -Ml -p 24242 \
  -u $u -g $g \
  --rw \
  -e \
  -l $p/.nsjail_log \
  --rlimit_as $RLIMIT_AS \
  --rlimit_core $RLIMIT_CORE \
  --rlimit_cpu $RLIMIT_CPU \
  --rlimit_fsize $RLIMIT_FSIZE \
  --rlimit_nofile $RLIMIT_NOFILE \
  --rlimit_nproc $RLIMIT_NPROC \
  --rlimit_stack $RLIMIT_STACK \
  --time_limit 240 \
  -R /bin \
  -R /dev/null \
  -R /var \
  -R /etc \
  -R /home \
  -R /lib \
  -R /lib64 \
  -R /usr \
  --chroot $p -- /usr/bin/python -u pdfmaker_noserver.py
