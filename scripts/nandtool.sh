#!/bin/bash
# nandtool

dir_nand=~/Documents/3ds/dependencies/nand

echo "Which block device is your 3DS connected to?";
echo [1] /dev/sdb
echo [2] /dev/sdc
echo [3] /dev/sdd
echo -n "Select your choice: ";
read x
case $x in
        1)
                block_device=/dev/sdb
                ;;
        2)
                block_device=/dev/sdc
                ;;
        3)
                block_device=/dev/sdd
                ;;
        *)
		echo "";
                echo "Invalid choice!";
                exit 1;
		;;
esac

<< COMMENT1
if [ ! -f $block_device ]; then
	echo "";
	echo Block device $block_device does not exist!;
	exit 1;
fi
COMMENT1

echo "";
echo Your 3DS is connected at $block_device
echo ""
echo "[1] Backup 3DS nand";
echo "[2] Write to 3DS nand";
echo -n "Select your choice: ";
read y
case $y in
	1)	echo "";
		echo -n "Enter nand backup name: ";
		read nand
		echo Backing up 3DS nand file: $nand;
		sudo dd if=$block_device of=$dir_nand/$nand bs=1M;
		echo Backup completed! Calculating MD5 hash...;
		md5sum $dir_nand/$nand;
		;;
	2)	echo "";
		echo "Nand list:"
		for entry in "$dir_nand"/*
		do
			echo "$entry";
		done
		echo "";
		echo -n "Enter nand backup name: ";
		read nand
                if [ ! -f $dir_nand/$nand ]; then
			echo "";
			echo $nand does not exist!
			exit 1;
		else
			echo "";
			echo Writing $nand to 3DS nand...
			sudo dd if=$dir_nand/$nand of=$block_device bs=1M;
			echo "Write completed!";
		fi
		;;
	*)
		echo "";
		echo Invalid choice!;
		exit 1;
		;;
esac
exit 0;