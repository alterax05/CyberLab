#!/bin/bash
echo "Congratulazioni!\nHai completato questa challange!\nflag{docker_e'_bello}\n" > /etc/motd
useradd -m -s /bin/bash nongthe 
rm /etc/update-motd.d -r
file_path="non_guardare.txt"
if [[ -f $file_path ]]; then
    random_line=$(shuf -n 1 "$file_path")
    echo "nongthe:$random_line" | chpasswd
else
    echo "Il file non esiste o non è valido."
fi
rm non_guardare.txt
rm finish.sh