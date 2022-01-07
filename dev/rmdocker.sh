#! /bin/bash

nethack="jnethack"

cd $(dirname $0)
for patchfile in ../patches/*.patch ../dev/patches/*.patch
do
    patchname=$(basename $patchfile .patch)
    docker rmi $nethack-$patchname
done

docker rmi $nethack-pure

