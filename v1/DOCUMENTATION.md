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

## Proxmox iGPU Passthrough for Jellyfin

Documented from [here](https://forum.proxmox.com/threads/task-error-cannot-prepare-pci-pass-through-iommu-not-present-gpu-passthrough.107102/page-2#post-582422)

This asumes you have a VT-x (Intel virtualization) compatible CPU, that it is enabled in the BIOS and you are using grub as your boot loader.

1. The kernel commandline needs to be placed in the variable `GRUB_CMDLINE_LINUX_DEFAULT` in the file `/etc/default/grub`. 

    ```grub
    GRUB_DEFAULT=0
    GRUB_TIMEOUT=5
    GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
    GRUB_CMDLINE_LINUS_DEFAULT="quiet intel_iommu=on iommu=pt"
    GRUB_CMDLINE_LINUX=""
    ```

2. Running`update-gru` appends its content to all linux entries in `/boot/grub/grub.cf`.

3. The kernel commandline needs to be placed as one line in`/etc/kernel/cmdline`. 

    ```
    intel_iommu=on iommu=pt
    ```
    
4. To apply your changes, run `proxmox-boot-tool refres`, which sets it as the option line for all config files in `loader/entries/proxmox-*.conf`

5. To check if it worked run:

    ```sh
    foo@bar:~$ cat /proc/cmdline
    BOOT_IMAGE=/boot/vmlinuz-6.2.16-15-pve root=/dev/mapper/pve-root ro quiet intel_iommu=on iommu=pt
    ```

    and/or 

    ```sh
    dmesg | grep -e DMAR -e IOMMU
    ```




