#!/bin/bash
echo "Congratulazioni!\nHai completato questa challange!\nflag{docker_e'_bello}\n" > /etc/motd
useradd -m -s /bin/bash nongthe 
rm /etc/update-motd.d -r
file_path="non_guardare.txt"  # Sostituisci con il percorso effettivo del tuo file
if [[ -f $file_path ]]; then
    random_line=$(shuf -n 1 "$file_path")
    echo "Riga a caso: $random_line"
    echo "nongthe:$random_line" | chpasswd
else
    echo "Il file non esiste o non è valido."
fi
rm non_guardare.txt
rm finish.sh