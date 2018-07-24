#!/bin/sh


## Install Radare
git clone https://github.com/radare/radare2.git
cd radare2
sys/install.sh
cd ..


## Build WebUI
git clone https://github.com/radare/radare2-webui.git
cd radare2-webui
make root

make material
sudo -EH npm install -g bower
cd www/m
bower update --force-latest --allow-root
cd ../../

make material
make panel
make enyo
make tiles

sudo -EH npm uninstall -g bower


## Patch WebUI
mv dist/enyo/r2core.js        ../radare2/shlr/www/enyo/r2core.js
mv dist/r2.js                 ../radare2/shlr/www/f/r2.js
mv dev/m/disasmNavProvider.js ../radare2/shlr/www/m/disasmNavProvider.js
mv dev/m/disasmProvider.js    ../radare2/shlr/www/m/disasmProvider.js
mv dev/m/hexchunkProvider.js  ../radare2/shlr/www/m/hexchunkProvider.js
mv dev/m/r2.js                ../radare2/shlr/www/m/r2.js
mv dev/p/r2core.js            ../radare2/shlr/www/p/r2core.js
mv dist/t/app.js              ../radare2/shlr/www/t/app.js

cd ..

## Install Server
https://github.com/fkie-cad/fact_radare_viewer.git
cd fact_radare_viewer
sudo -EH pip3 install -r requirements.txt
cd ..


exit 0
