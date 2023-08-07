filepath=$(cd "$(dirname "$0")"; pwd)
cd "$filepath"
echo 

md5 roms/yellowUS/pokeyellow.1.gbc
md5 roms/yellowUS/pokeyellow.2.gbc
md5 roms/tmp/US.pYellow.gbc
echo 

md5 roms/yellowUS/pokeyellow_vc.1.gbc
md5 roms/yellowUS/pokeyellow_vc.2.gbc
echo

md5 roms/yellowJP/pokeyellow.1.gbc
md5 roms/yellowJP/pokeyellow.2.gbc
md5 roms/tmp/SJP.pYellow.gbc
echo 

md5 roms/yellowJP/pokeyellow_vc.1.gbc
md5 roms/yellowJP/pokeyellow_vc.2.gbc
echo


md5 roms/tmp/US.pYellow.gbc > hash.Y.txt
md5 roms/tmp/SJP.pYellow.gbc >> hash.Y.txt