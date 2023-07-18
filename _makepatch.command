filepath=$(cd "$(dirname "$0")"; pwd)
cd "$filepath"



echo making patch for Yellow
./tools/flips -c roms/pokeyellow.gbc roms/yellow/pokeyellow.1.gbc -i roms/yellow/pokeyellow.1.ips

echo
echo copying patches
rm -rf roms/tmp
mkdir roms/tmp
cp roms/yellow/pokeyellow.1.ips roms/tmp/pokeyellow.ips
cp roms/yellow/pokeyellow.1.patch roms/tmp/pokeyellow.patch


echo
echo Testing... Applying Patch
./tools/flips -a roms/tmp/pokeyellow.ips roms/pokeyellow.gbc roms/tmp/US.pYellow.gbc
cp roms/yellow/pokeyellow_debug.1.gbc roms/tmp/US.pYellow_debug.gbc
./_compareVersion.command