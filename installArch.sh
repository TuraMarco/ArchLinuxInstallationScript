#!/bin/bash
#Script ideato per l'installazione automatica di ArchLinux
###############################
# Variabili di configurazione #
###############################
TIMEZONE=Europe/Rome
KEYBOARD=it

##################
# Funzioni Varie #
##################
function manageNetwork()
{
    #TODO
    exit
}

#####################
# Pre-Installazione #
#####################
### 1.1 Imposto la tastiera ###
echo "Carico la tastiera $KEYBOARD\n"
loadkeys $KEYBOARD

### 1.2 Verifico la modalità di boot ###
if [ -e /sys/firmware/efi/efivars ]
then
    echo 'L'installazione procederà con sistema EFI\n'
    INSTAL_METHOD=EFI
 else
    echo 'L'installazione procederà con sistema BIOS Legacy\n' 
    INSTAL_METHOD=BIOS
 fi

### 1.3 Connetto ad internet ###
if ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` > /dev/null
then
    echo 'Il network Funziona\n'
else
    echo 'Il network non Funziona\n'
    manageNetwork()
fi

### 1.4 Imposto l'orario di sistema e lo sincronizzo ###
echo "Imposto il fuso orario su $TIMEZONE e sincronizzo l'orologio di sistema\n"
timedatectl set-timezone $TIMEZONE
timedatectl set-ntp true

### 1.5 Partiziono i dischi ###
#usa parted
### 1.6 Formatto le partizioni ###

### 1.7 Monto il fileSistem ###

#####################
# Pre-Installazione #
#####################
 
 
