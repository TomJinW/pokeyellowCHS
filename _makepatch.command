filepath=$(cd "$(dirname "$0")"; pwd)
cd "$filepath"



echo making patch for Yellow
./tools/flips -c roms/pokeyellow.gbc roms/yellowUS/pokeyellow.1.gbc -i roms/yellowUS/pokeyellow.1.ips
./tools/flips -c roms/pokeyellow.gbc roms/yellowJP/pokeyellow.1.gbc -i roms/yellowJP/pokeyellow.1.ips

echo
echo copying patches
rm -rf roms/tmp
mkdir roms/tmp
cp roms/yellowUS/pokeyellow.1.ips roms/tmp/US.pokeyellow.ips
cp roms/yellowUS/pokeyellow.1.patch roms/tmp/US.pokeyellow.patch
cp roms/yellowJP/pokeyellow.1.ips roms/tmp/SJP.pokeyellow.ips
cp roms/yellowJP/pokeyellow.1.patch roms/tmp/SJP.pokeyellow.patch

echo
echo Testing... Applying Patch
./tools/flips -a roms/tmp/US.pokeyellow.ips roms/pokeyellow.gbc roms/tmp/US.pYellow.gbc
./tools/flips -a roms/tmp/SJP.pokeyellow.ips roms/pokeyellow.gbc roms/tmp/SJP.pYellow.gbc

cp roms/yellowUS/pokeyellow_debug.1.gbc roms/tmp/US.pYellow_debug.gbc
cp roms/yellowJP/pokeyellow_debug.1.gbc roms/tmp/SJP.pYellow_debug.gbc
./_compareVersion.command