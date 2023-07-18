filepath=$(cd "$(dirname "$0")"; pwd)
cd "$filepath"
option=$1
if [[ $option -eq 1 ]]
then
make --always-make CHAR_FLAGS=
else
echo 使用中文字符
make --always-make RGBDS=rgbds-cn/ CHAR_FLAGS="-D RGBDS_WCHAR"
fi

mkdir roms
mkdir roms/yellow

cp pokeyellow.gbc roms/yellow/pokeyellow."$option".gbc
cp pokeyellow_vc.gbc roms/yellow/pokeyellow_vc."$option".gbc
cp pokeyellow_debug.gbc roms/yellow/pokeyellow_debug."$option".gbc
cp pokeyellow.patch roms/yellow/pokeyellow."$option".patch