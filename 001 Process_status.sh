###### _Main_Process_Stat.sh
###### System Main Process Status 확인
######

_Ntp_1=$(ps -ef | grep ntp | grep -v grep | wc -l)
_Syslog_1=$(ps -ef | grep syslog | grep -v grep | wc -l)
_inetd_1=$(ps -ef | grep NetworkManager | grep -v grep | wc -l)
_daemon_1=$(ps -ef | grep daemon | grep -v grep | wc -l)

 if [ $_Ntp_1 -gt 0 ] ; then

        echo "NTP Process    >>>> OK"
        _Ntp="Y"

        else
        echo "NTP Process    >>>> NOT OK"
        echo "                    NOT Process [NTP]"
        _Ntp="N"


 fi


 if [ $_Syslog_1 -gt 0 ] ; then

        echo "Syslog Process >>>> OK"
        _Syslog="Y"

        else
        echo "Syslog Process >>>> NOT OK"
        echo "                    NOT Process [SYSLOG]"
        _Syslog="N"

 fi

  if [ $_inetd_1 -gt 0 ] ; then

        echo "inetd Process  >>>> OK"
        _inetd="Y"

        else
        echo "inetd Process  >>>> NOT OK"
        echo "                    NOT Process [INETD]"
        _inetd="N"

 fi

  if [ $_daemon_1 -gt 0 ] ; then

        echo "daemon Process >>>> OK"
        _daemon="Y"

        else
        echo "daemon Process >>>> NOT OK"
        echo "                    NOT Process [DAEMON]"
        _daemon="N"

 fi
