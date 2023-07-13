filepath=$(cd "$(dirname "$0")"; pwd)
cd "$filepath"
option=$1
if [[ $option -eq 1 ]]
then
make --always-make CHAR_FLAGS=
else
make --always-make RGBDS=rgbds-cn/ CHAR_FLAGS="-D RGBDS_WCHAR"
fi