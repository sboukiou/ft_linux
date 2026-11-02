# This is the script to automate the creation of the 
# Virtual machine: 
# Name: ft_linux
# Type: Linux_64


#!/bin/bash

# Configuration Variables
VM_NAME="LFS"
WORKDIR="/home/sboukiou/repos/ft_linux"
OS_TYPE="Linux_64"     # Generic 64-bit Linux
RAM_SIZE=8192          # 8 GB RAM for faster compilation
CPU_COUNT=4            # 4 CPU Cores
DISK_SIZE=25000        # 25 GB disk space (in MB)
DISK_FILE="${VM_NAME}_disk.vdi"
ISO_PATH="/home/sboukiou/repos/ft_linux/gentoo.iso" # UPDATE THIS LINE

echo "Creating VM: $VM_NAME..."

# 1. Create and register the VM
VBoxManage createvm --name "$VM_NAME" --ostype "$OS_TYPE" --basefolder "$WORKDIR" --register

# 2. Modify VM system settings (RAM, CPUs, boot order, network)
VBoxManage modifyvm "$VM_NAME" \
    --memory $RAM_SIZE \
    --cpus $CPU_COUNT \
    --vram 128 \
    --boot1 dvd \
    --boot2 disk \
    --boot3 none \
    --boot4 none \
    --nic1 nat

# 3. Create the Virtual Hard Disk (VDI)
echo "Creating Virtual Hard Disk ($DISK_SIZE MB)..."
VBoxManage createmedium disk --filename "$DISK_FILE" --size $DISK_SIZE --format VDI

# 4. Add SATA Controller and attach the Hard Disk
VBoxManage storagectl "$VM_NAME" --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach "$VM_NAME" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "$DISK_FILE"

# 5. Add IDE Controller and attach the Live CD ISO
echo "Attaching Live CD ISO..."
VBoxManage storagectl "$VM_NAME" --name "IDE Controller" --add ide
VBoxManage storageattach "$VM_NAME" --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium "$ISO_PATH"

echo "VM '$VM_NAME' created successfully!"
echo "Run the VM using: VBoxManage startvm \"$VM_NAME\" --type gui"
