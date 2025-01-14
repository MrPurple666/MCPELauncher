#!/bin/bash
set -e
rootdir="$PWD"
cd ..
mkdir -p mcpe
cd mcpe
wget -O mcpe11740.7z "https://twolipx-cloud.wayneegds.workers.dev/0:/mcpe11740.7z"
wget -O mcpe190b3_x86.7z "https://cdn.glitch.com/a9068bb8-2329-44b4-8406-ddefb02d1719%2Fmcpe190b3_x86.7z?v=1579376252305"
wget -O mcpe180.7z "https://cdn.glitch.com/a9068bb8-2329-44b4-8406-ddefb02d1719%2Fmcpe180.7z?v=1579376255027"
#sha256sum -c "$rootdir/tools/ci/mc_archives_sha256sum.txt"

7z -p$ASSETS_PASSWORD -aoa x mcpe190b3_x86.7z
7z -p$ASSETS_PASSWORD -aoa x mcpe180.7z
#sha256sum -c "$rootdir/tools/ci/mc_sha256sum.txt"

rm -r 11740 190b3_x86 || true
7z -o11740 x mcpe11740.apk
# 180b3_x86: only used for linking against its libs
7z -o190b3_x86 x mcpe190b3_x86.apk lib
# 180: only used for xbox interop
