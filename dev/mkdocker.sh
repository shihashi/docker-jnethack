#! /bin/bash

nethack="jnethack"

cd $(dirname $0)
cd ../docker
for patchfile in ../patches/*.patch ../dev/patches/*.patch
do
    patchname=$(basename $patchfile .patch)
    cp $patchfile NetHack.patch
    docker rmi $nethack-$patchname
    docker build --force-rm -t $nethack-$patchname .
    if [[ $? -ne 0 ]]; then
        eixt 1
    fi
done

rm NetHack.patch
touch NetHack.patch
docker rmi $nethack-pure
docker build --force-rm -t $nethack-pure .

