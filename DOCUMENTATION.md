# Homelab Documentation



## Install BTOP

1. Check if make is installed

    ```console
    ls /usr/bin/make
    ```


    or

    ```console
    /usr/bin/make --version
    ```


1. Update

    ```console
    sudo apt update && sudo apt upgrade -y
    ```


1. Install

    ```console
    sudo apt install -y make
    ```
    
    
    If this fails, install:

    ```console
    sudo apt install build-essential
    ```



1. Download the latest build from [here](https://github.com/aristocratos/btop/releases/latest)

    ```console
    wget https://github.com/aristocratos/btop/releases/download/v1.2.13/btop-x86_64-linux-musl.tbz
    ```


1. Unzip

    ```console
    tar -xjf btop-x86_64-linux-musl.tbz
    ```


1. Make

    ```console
    sudo make install
    ```






