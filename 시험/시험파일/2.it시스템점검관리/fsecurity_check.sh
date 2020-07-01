echo "점검자 이름을 입력하세요"
read name
servername=`hostname | cut -f1 -d.`
date1=`date +%Y`
date2=`date +%m`
date3=`date +%d`
date4=`date +%H`
date5=`date +%M`


cpuname=`cat /proc/cpuinfo |grep name | head -n 1 | awk '{print $4,$5,$6,$7,$8,$9,$10}'`
a1=$?
cpucore=`cat /proc/cpuinfo |grep cores | head -n 1`
a2=$?
ram=`free -h |head -n 1 | awk '{print $1,$2,$3}'`
a3=$?
raminfo=`free -h |head -2 |tail -n 1 | awk '{print $2,$3,$4}'`
a4=$?
swapinfo=`free -h |tail -n 1 | awk '{print $2,$3,$4}'`
a5=$?
ax=`expr $a1 + $a2 + $a3 + $a4 + $a5`
echo -n "running hardware check."
for i in {1..15}
do
	usleep 200000
	echo -n  "."
done
if [ $ax -eq 0 ]
then
	echo "hardware check OK!!"
else
	echo "hardware check error!!"
fi

diskname=`fdisk -l |head -n 2 |tail -n 1 | awk '{print $2}'`
b1=$?
diskinfo=`fdisk -l /dev/vda`
b2=$?
disktotal=`df -h |grep /dev/mapper`
b3=$?
quota=`quotacheck -a`
b4=$?
bx=`expr $b1 + $b2 + $b3 + $b4`
echo -n "running disk check."
for i in {1..15}
do
	usleep 200000
	echo -n  "."
done
if [ $bx -eq 0 ]
then
	echo "disk check OK!!"
else
	echo "disk check error!!"
fi

sshlog=`cat /var/log/secure |grep ssh |tail -n 5`
c1=$?
messages=`tail -n 5 /var/log/messages`
c2=$?
crontab=`tail -n 5 /var/log/cron`
c3=$?
cx=`expr $c1 + $c2 + $c3`
echo -n "running log check."
for i in {1..15}
do
	usleep 200000
	echo -n  "."
done
if [ $cx -eq 0 ]
then
	echo "log check OK!!"
else
	echo "log check error!!"
fi

user=`users`
d1=$?
tot=`du -sh /home/chulsoo /home/haha /home/jdp /home/younghee`
d2=$?
dx=`expr $d1 + $d2`
echo -n "running user check."
for i in {1..15}
do
	usleep 200000
	echo -n  "."
done
if [ $dx -eq 0 ]
then
	echo "user check OK!!"
else
	echo "user check error!!"
fi

osname=`cat /etc/*release |head -n 1`
e1=$?
sshversion=`rpm -q openssh`
e2=$?
bashversion=`rpm -q bash`
e3=$?
ex=`expr $e1 + $e2 + $e3`
echo -n "running software check."
for i in {1..15}
do
	usleep 200000
	echo -n  "."
done
if [ $ex -eq 0 ]
then
	echo "software check OK!!"
else
	echo "software check error!!"
fi
fwactive=`systemctl is-active firewalld`
f1=$?
fwstat=`firewall-cmd --list-all |egrep -w '(interfaces|services|ports|rich)'`
f2=$?
fx=`expr $f1 + $f2`
echo -n "running firewall check."
for i in {1..15}
do
        usleep 200000
        echo -n  "."
done
if [ $fx -eq 0 ]
then
        echo "firewall check OK!!"
else
        echo "firewall check error!!"
fi

sestat=`head -n 7 /etc/selinux/config | tail -n 1 | cut -f2 -d=`
g1=$?
sepasswd=`ls -Z /etc/passwd | cut -f3 -d:`
g2=$?
seshadow=`ls -Z /etc/shadow | cut -f3 -d:`
g3=$?
segroup=`ls -Z /etc/group | cut -f3 -d:`
g4=$?
gx=`expr $g1 + $g2 + $g3 + $g4`
echo -n "running selinux check."
for i in {1..15}
do
        usleep 200000
        echo -n  "."
done
if [ $gx -eq 0 ]
then
        echo "selinux check OK!!"
else
        echo "selinux check error!!"
fi

mount=`mount -a`
h=$?
msts=`grep -v '#' /etc/fstab`
echo -n "running fstab check."
for i in {1..15}
do
        usleep 200000
        echo -n  "."
done
if [ $h -eq 0 ]
then
        echo "fstab check OK!!"
else
        echo "fstab check error!!"
fi

echo "*************** system check report *******************"
echo "* 점검자: $name                                      *"
echo "* 점검일시 및 시간: ${date1}년 ${date2}월 ${date3}일 ${date4}시 ${date5}분        *"
echo "* 점검 서버 이름: $servername                             *"
echo "*******************************************************"
echo ""

	echo "--------------- Hardware check --------------"
        echo "cpu : $cpuname"
        echo "      ${cpucore}개"
        echo ""
        echo "      $a"
        echo "ram : $raminfo"
        echo "swap: $swapinfo"
	echo "---------------------------------------------"
echo ""
        echo "--------------- Disk check --------------"
        echo "사용중인 디스크 장치이름"
        echo "$diskname"
        echo "사용중인 디스크 파티션 정보"
        echo "$diskinfo"
        echo "사용중인 디스크의 정보"
        echo "$disktotal"
        echo -n "Disk quota 사용유뮤 : "
        if [ $quota ]
        then
                echo " 유"
        else
                echo " 무"
        fi
        echo "-----------------------------------------"
echo ""
        echo "------------------- Log check --------------"
        echo "가장 최근의 ssh   기록"
        echo "$sshlog"
	echo ""
        echo "가장 최근의 messages 기록"
        echo "$messages"
	echo ""
        echo "가장 최근의 crontab기록"
        echo "$crontab"
        echo "---------------------------------------------"
echo ""
        echo "---------------- User check --------------"
        echo "현재 접속중인 사용자"
        echo "$user"
        echo "일반 사용자의 홈디렉토리 사용량"
        echo "$tot"
        echo "------------------------------------------"
echo ""
        echo "---------------- Software check --------------"
        echo " 현재 사용중인 Operating System version"
        echo "   $osname"
        echo " 현재 사용중인 bash버젼"
        echo "   $bashversion"
        echo " 현재 사용중인 ssh 버젼"
        echo "   $sshversion"
        echo "----------------------------------------------"
echo ""
	echo "------------- Firewall check ------------"
        echo "$fwstat"
        echo "-----------------------------------------"

        if [ "$fwactive" != "active" ]
        then
                echo "위험!!! 방화벽이 꺼져있습니다."
        fi
echo ""
	echo "------------- SElinux check ----------------"
        echo "현재 SElinux 상태 : $sestat "
        echo "passwd 파일 context : $sepasswd "
        echo "shadow 파일 context : $seshadow "
        echo "group  파일 context : $segroup "
        echo "--------------------------------------------"

        if [ "$sestat" != "enforcing" ]
        then
                echo "위험 Selinux가 위험요소를 차단하지 않음"
        fi
        if [ "$sepasswd" != "passwd_file_t" ]
        then
                echo "위험 passwd파일 restorecon 부탁!!"
        fi
        if [ "$seshadow" != "shadow_t" ]
        then
                echo "위험 shadow파일 restorecon 부탁!!"
        fi
        if [ "$segroup" != "passwd_file_t" ]
        then
                echo "위험 group파일 restorecon 부탁!!"
        fi
echo ""
	echo "--------------- Fstab check -----------"
        echo "$msts"
        echo "---------------------------------------"

        if [ $h -ne 0 ]
        then
                echo -n "fstab에 문제가 있습니다."
                echo "부팅이 안될 수도있으니 주의하세요."
        fi
echo ""
hwecho () {
echo "--------------- Hardware check --------------"
        echo "cpu : $cpuname"
        echo "      ${cpucore}개"
        echo ""
        echo "      $a"
        echo "ram : $raminfo"
        echo "swap: $swapinfo"
        echo "---------------------------------------------"
}
diskecho () {
echo "--------------- Disk check --------------"
        echo "사용중인 디스크 장치이름"
        echo "$diskname"
        echo "사용중인 디스크 파티션 정보"
        echo "$diskinfo"
        echo "사용중인 디스크의 정보"
        echo "$disktotal"
        echo -n "Disk quota 사용유뮤 : "
        if [ $quota ]
        then
                echo " 유"
        else
                echo " 무"
        fi
        echo "-----------------------------------------"
}
logecho () {
echo "------------------- log check --------------"
        echo "가장 최근의 ssh   기록"
        echo "$sshlog"
        echo "가장 최근의 messages 기록"
        echo "$messages"
        echo "가장 최근의 crontab기록"
        echo "$crontab"
        echo "---------------------------------------------"
}
userecho () {
echo "---------------- user check --------------"
        echo "현재 접속중인 사용자"
        echo "$user"
        echo "일반 사용자의 홈디렉토리 사용량"
        echo "$tot"
        echo "------------------------------------------"
}
swecho () {
echo "---------------- Software check --------------"
        echo " 현재 사용중인 Operating System version"
        echo "$a"
        echo " 현재 사용중인 bash버젼"
        echo "$b"
        echo " 현재 사용중인 ssh 버젼"
        echo "$c"
        echo "----------------------------------------------"
}
fwecho() {
echo "------------- Firewall check ------------"
        echo "$fwstat"
        echo "-----------------------------------------"

        if [ "$fwactive" != "active" ]
        then
                echo "위험!!! 방화벽이 꺼져있습니다."
        fi
}
selecho() {
echo "------------- SElinux check ----------------"
        echo "현재 SElinux 상태 : $sestat "
        echo "passwd 파일 context : $sepasswd "
        echo "shadow 파일 context : $seshadow "
        echo "group  파일 context : $segroup "
        echo "--------------------------------------------"

        if [ "$sestat" != "enforcing" ]
        then
                echo "위험 Selinux가 위험요소를 차단하지 않음"
        fi
        if [ "$sepasswd" != "passwd_file_t" ]
        then
                echo "위험 passwd파일 restorecon 부탁!!"
        fi
        if [ "$seshadow" != "shadow_t" ]
        then
                echo "위험 shadow파일 restorecon 부탁!!"
        fi
        if [ "$segroup" != "passwd_file_t" ]
        then
                echo "위험 group파일 restorecon 부탁!!"
        fi
}
fsecho () {
echo "--------------- Fstab check -----------"
        echo "$msts"
        echo "---------------------------------------"

        if [ $h -ne 0 ]
        then
                echo -n "fstab에 문제가 있습니다."
                echo "부팅이 안될 수도있으니 주의하세요."
        fi
}
	
echo "다시보고싶은 점검 결과를 입력하시오 (없으면 엔터)"
echo "(hard,disk,log,user,soft,fw,se,fs)"
read def
#i=0
#while [ 1 ]
#do
#	read -a again
#	echo ${again[$i]}
#	if [ "${again[$i]}" == ""  ]
#	then
#		break
#	fi
#	i=`expr $i + 1`
#done
#echo "helod"
#echo "^^^^"
#for def in ${again[i]}
#do
#	echo "heelo"
echo $def
	case "$def" in
		"hard"|"hardware")
			hwecho;;
		"disk")
			diskecho;;
		"log")
			logecho;;
		"user")
			userecho;;
		"soft"|"software")
			swecho;;
		"fw"|"firewall")
			fwecho;;
		"se"|"selinux")
			selecho;;
		"fs"|"fstab")
			fsecho;;
		*) ;;
	esac
#done

#echo "???"


