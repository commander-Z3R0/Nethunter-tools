#!/bin/bash
echo "                                                                                             "
echo "                                                                                             "
echo "      _/|   Z   |\_    (~~~~~~~~~~~~~~~~~(                                                   "
echo "     /  |   3   |  \    ) Commander.Z3R0  )                                                  "
echo "    |    \  R  /    |  (-----------------(                                                   "
echo "    |  \ /  0  \ /  |   ) Version  1.0    )                                                  "
echo "    | \  |     |  / |  (~~~~~~~~~~~~~~~~~(                                                   "
echo "    | \ _\_/^\_/_ / |  |                    >>~~~>Installing Packages<~~~<<                  "
echo "    |    --\//--    |  |-------------------------------------------------------------------- "
echo "     \_  \     /  _/   |  > Blackbird-venv   (Osint)         |  > Ettercap    (MITM)        |"
echo "       \__  |  __/     |  > Netdiscover      (Scanner)       |  > Autopsy     (Forensic)    |"
echo "          \ _ /        |  > Kodiac           (C2)            |                              |"
echo "         _/   \_       |  > Fluxion          (WiFi)          |                              |"             
echo "        / _/|\_ \      |  > EvilTrust        (WiFi)          |                              |"
echo "         /  |  \       |  > ExploitDB        (Exploit)       |                              |"
echo "          / v \        |  > Kali Whoami      (Privacy)       |                              |" 
echo "                       --------------------------------------------------------------------- " 

echo "Checking and Installing Tools!"

function display_menu() {
    echo "==============================="
    echo "           Menu"
    echo "==============================="
    echo "1. Install Blackbird-venv"
    echo "2. Install Netdiscover"
    echo "3. Install Fluxion"
    echo "4. Install Eviltrust"
    echo "5. Install ExploitDB"
    echo "6. Install Kali Whoami"
    echo "7. Install Ettercap"
    echo "8. Install Autopsy"
    echo "0. Exit"
    echo "==============================="
}

function install_tool() {
    case $1 in
        1) check_and_install_Blackbird_venv ;;
        2) check_and_install_Netdiscover ;;
        3) check_and_install_Fluxion ;;
        4) check_and_install_Eviltrust ;;
        5) check_and_install_ExploitDB ;;
        6) check_and_install_Kali_Whoami ;;
        7) check_and_install_ettercap ;;
        8) check_and_install_autopsy ;;
        0) echo "Exiting..." && exit ;;
        *) echo "Invalid option" ;;
    esac
}

echo "Checking and Installing Tools!"

function check_and_install_Blackbird_venv() {
    local tool_name="Blackbird-venv"

    if command -v "$tool_name" &>/dev/null; then
        echo "The Tool $tool_name is already installed."
    else
        echo "Installing $tool_name..."
        git clone https://github.com/command-Z3R0/Blackbird-venv.git &>/dev/null
        cd Blackbird-venv &>/dev/null
        chmod +x Blackbird-venv.sh &>/dev/null
        sudo rm -f /usr/local/bin/"$tool_name"
        sudo ln -s "$PWD/Blackbird-venv.sh" /usr/local/bin/"$tool_name" &>/dev/null
        echo " ------> $tool_name is available, run it by typing: sudo $tool_name "
    fi
}

# Uso de la función
check_and_install_Blackbird_venv

#---------------------------------Next---Tool-------------------------------------------------

function check_and_install_Netdiscover() {
    local tool_name="netdiscover"
        if [ "$EUID" -ne 0 ]; then
        echo "Please run this script with sudo: sudo $0"
        exit 1
    fi


    if command -v "$tool_name" &>/dev/null; then
        echo "The Tool $tool_name is already installed."
    else
        echo "Installing $tool_name..."
        sudo apt update &>/dev/null
        sudo apt-get install netdiscover -y  &>/dev/null
        echo " ------> $tool_name is available, run it by typing: $tool_name "
    fi
}

# Uso de la función
check_and_install_Netdiscover


#---------------------------------Next---Tool-------------------------------------------------


function check_and_install_Fluxion() {
    local tool_name="fluxion"
    local script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"  # Ruta del directorio donde se encuentra este scr>

    if [ "$EUID" -ne 0 ]; then
        echo "Please run this script with sudo: sudo $0"
        exit 1
    fi

    if command -v "$tool_name" &>/dev/null; then
        echo "The Tool $tool_name is already installed."
    else
        echo "Installing $tool_name..."
        git clone https://www.github.com/FluxionNetwork/fluxion.git "$script_dir/fluxion" &>/dev/null
        #sudo apt-get update &>/dev/null
        sudo apt-get install -y isc-dhcp-server hostapd lighttpd php-cgi &>/dev/null
        cd "$script_dir/fluxion/"
        sudo chmod +x fluxion.sh
        alias fluxion='sudo fluxion'
        sudo ln -sf "$script_dir/fluxion/fluxion.sh" /usr/local/bin/fluxion 
        echo " ------> $tool_name is available, run it by typing: sudo $tool_name "
        cd "$script_dir"   # Vuelve al directorio original después de la instalación
    fi
}

# Uso de la función
check_and_install_Fluxion

#---------------------------------Next---Tool-------------------------------------------------


function check_and_install_Eviltrust() {
    local tool_name="eviltrust"
    local script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"  # Ruta del script actual

        if [ "$EUID" -ne 0 ]; then
        echo "Please run this script with sudo: sudo $0"
        exit 1
    fi


    if command -v "$tool_name" &>/dev/null; then
        echo "The Tool $tool_name is already installed."
    else
        echo "Installing $tool_name..."
        git clone https://github.com/s4vitar/evilTrust.git &>/dev/null
        cd "$script_dir/evilTrust/"
        chmod +x evilTrust.sh
        sudo ln -s "$script_dir/evilTrust/evilTrust.sh" /usr/local/bin/eviltrust 
        echo " ------> $tool_name is available, run it by typing: sudo $tool_name "
        cd "$script_dir"  # Vuelve al directorio original después de la instalación
    fi
}

# Uso de la función
check_and_install_Eviltrust
 
#---------------------------------Next---Tool-------------------------------------------------

function check_and_install_ExploitDB() {
    local tool_name="exploitDB"

    if [ "$EUID" -ne 0 ]; then
        echo "Please run this script with sudo: sudo $0"
        exit 1
    fi

    if command -v "$tool_name" &>/dev/null; then
        echo "The Tool $tool_name is already installed."
    else
        echo "Installing $tool_name..."
        #sudo apt update &>/dev/null
        sudo apt-get install exploitdb -y  &>/dev/null
        echo " ------> $tool_name is available, run it by typing: sudo $tool_name "
    fi
}

# Uso de la función
check_and_install_ExploitDB

#---------------------------------Next---Tool-------------------------------------------------

function check_and_install_Kali_Whoami() {
    local tool_name="kali-whoami"
    
        if [ "$EUID" -ne 0 ]; then
        echo "Please run this script with sudo: sudo $0"
        exit 1
    fi
   
   
   if command -v "$tool_name" &>/dev/null; then
        echo "The Tool $tool_name is already installed."
    else
        echo "Installing $tool_name..."
        sudo apt install tar tor curl python3 python3-scapy network-manager -y &>/dev/null
        git clone https://github.com/omer-dogan/kali-whoami &>/dev/null
        cd kali-whoami/
        sudo make install &>/dev/null
        echo " ------> $tool_name is available, run it by typing: sudo $tool_name "
    fi
}

# Uso de la función
check_and_install_Kali_Whoami

#---------------------------------Next---Tool-------------------------------------------------


function check_and_install_ettercap() {
    local tool_name="ettercap"

    if [ "$EUID" -ne 0 ]; then
        echo "Please run this script with sudo: sudo $0"
        exit 1
    fi

    if command -v "$tool_name" &>/dev/null; then
        echo "The Tool $tool_name is already installed."
    else
        echo "Installing $tool_name..."
        #sudo apt update &>/dev/null
        sudo apt-get install ettercap ettercap-graphical -y  &>/dev/null
        echo " ------> $tool_name is available, run it by typing:sudo $tool_name "
    fi
}

# Uso de la función
check_and_install_ettercap

#---------------------------------Next---Tool-------------------------------------------------


function check_and_install_autopsy() {
    local tool_name="autopsy"

    if [ "$EUID" -ne 0 ]; then
        echo "Please run this script with sudo: sudo $0"
        exit 1
    fi

    if command -v "$tool_name" &>/dev/null; then
        echo "The Tool $tool_name is already installed."
    else
        echo "Installing $tool_name..."
        #sudo apt update &>/dev/null
        sudo apt-get install autopsy -y  &>/dev/null
        echo " ------> $tool_name is available, run it by typing:sudo $tool_name "
    fi
}
 
# Uso de la función   
check_and_install_autopsy

#---------------------------------Next---Tool-------------------------------------------------

while true; do
    display_menu
    echo -n "Enter the number of the tool you want to install (0 to exit): "
    read choice
    install_tool "$choice"
    echo "Press Enter to continue..."
    read
done
