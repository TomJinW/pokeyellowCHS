filepath=$(cd "$(dirname "$0")"; pwd)
cd "$filepath"
mkdir tmp


python3 tools/_backup.py xlsx/xlsxList.txt xlsx/ 0
clear

echo Which rgbds? Enter number and hit return.
echo 1. Original RGBDS installed with the system
echo 2. Modded RGBDS for CHINESE Characters in rgbds-cn/
read option
if [ -z "${option}" ]
then
    echo The Option is not set, using the default one.
    option=1
fi
# python3 tools/_importText.py xlsx/outdoor.xlsx 5 RB $option
# python3 tools/_importText.py xlsx/dex.xlsx 5 RB $option
# python3 tools/_importText.py xlsx/buildingsA.xlsx 5 RB $option
# python3 tools/_importText.py xlsx/buildingsB.xlsx 5 RB $option
# python3 tools/_importText.py xlsx/indoor.xlsx 5 RB $option
# python3 tools/_importText.py xlsx/routes.xlsx 5 RB $option
# python3 tools/_importText.py xlsx/core.xlsx 5 RB $option

python3 tools/_importDexEntry.py xlsx/dexEntry.xlsx 13 1 $option YE
python3 tools/_importTextData.py xlsx/data.xlsx 1 YE $option


./_build.command $option

echo Restore Backup?
echo 1.Yes
echo 2.No
read restoreOption
if [ -z "${restoreOption}" ]
then
    echo The Option is not set, using the default one.
    restoreOption=1
fi

if [[ $restoreOption -eq 2 ]]
then
echo done!
else
python3 tools/_backup.py xlsx/xlsxList.txt xlsx/ 1
echo done!
fi

