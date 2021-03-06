 #!/bin/bash

 ## point to variable file for ipv4 and domain.com
 source <(grep '^ .*='  /opt/appdata/plexguide/var.sh)
 echo $ipv4
 echo $domain

clear

while [ 1 ]
do
CHOICE=$(
whiptail --title "Torrent Menu" --menu "Make your choice" 12 25 5 \
    "1)" "RuTorrent"  \
    "2)" "Deluge"  \
    "3)" "Jackett"  \
    "4)" "VPN Options"  \
    "5)" "Exit  "  3>&2 2>&1 1>&3
)

result=$(whoami)
case $CHOICE in

     "1)")
      ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags rutorrent
      echo "RuTorrent: http://$ipv4:8999"
      #echo "For Subdomain http://rutorrent.$domain"
      echo "For Domain http://$domain:8999"
      echo ""
      read -n 1 -s -r -p "Press any key to continue "
      ;;

     "2)")
      ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags deluge
      echo "Deluge: http://$ipv4:8112"
      #echo "For Subdomain http://deluge.$domain"
      echo "For Domain http://$domain:8112"
      echo ""
      read -n 1 -s -r -p "Press any key to continue "
      ;;

     "3)")
      ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags jackett
      echo "Jackett: http://$ipv4:9117"
      #echo "For Subdomain http://jackett.$domain"
      echo "For Domain http://$domain:9117"
      echo ""
      read -n 1 -s -r -p "Press any key to continue "
      ;;

     "4)")
     clear
     bash /opt/plexguide/scripts/menus/programs/program-vpn.sh
     ;;

     "5)")
      clear
      exit 0
      ;;
esac
done
exit
