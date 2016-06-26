#!/bin/bash
# homebrew

#DEFINE URLS

#retroarch
url_retroarch=http://buildbot.libretro.com/nightly/nintendo/3ds/$(date +%Y-%m-%d)_RetroArch_3dsx.7z;

#freeshop
freeShop_version=1.2.2;
url_freeshop=https://github.com/Cruel/freeShop/releases/download/$freeShop_version/freeShop-$freeShop_version.cia;

#encTitleKeys
url_enctitlekeys=https://3ds.titlekeys.com/downloadenc;

#seeddb
url_seeddb=https://3ds.titlekeys.com/seeddb;

#nativefirm
url_n3ds_firm=http://nus.cdn.c.shop.nintendowifi.net/ccs/download/0004013820000002/00000021; #11.0.0
url_o3ds_firm=http://nus.cdn.c.shop.nintendowifi.net/ccs/download/0004013800000002/00000052; #11.0.0

#nativefirm cetk
url_n3ds_firm_cetk=http://nus.cdn.c.shop.nintendowifi.net/ccs/download/0004013820000002/cetk;
url_o3ds_firm_cetk=http://nus.cdn.c.shop.nintendowifi.net/ccs/download/0004013800000002/cetk;

#agb
url_n3ds_agb=http://nus.cdn.c.shop.nintendowifi.net/ccs/download/0004013820000202/00000000; #9.0.0
url_o3ds_agb=http://nus.cdn.c.shop.nintendowifi.net/ccs/download/0004013800000202/0000000B; #6.0.0

#agb cetk
url_n3ds_agb_cetk=http://nus.cdn.c.shop.nintendowifi.net/ccs/download/0004013820000202/cetk;
url_o3ds_agb_cetk=http://nus.cdn.c.shop.nintendowifi.net/ccs/download/0004013800000202/cetk;

#twl
url_n3ds_twl=http://nus.cdn.c.shop.nintendowifi.net/ccs/download/0004013820000102/00000000; #9.0.0
url_o3ds_twl=http://nus.cdn.c.shop.nintendowifi.net/ccs/download/0004013800000102/00000016; #6.2.0

#twl cetk
url_n3ds_twl_cetk=http://nus.cdn.c.shop.nintendowifi.net/ccs/download/0004013820000102/cetk;
url_o3ds_twl_cetk=http://nus.cdn.c.shop.nintendowifi.net/ccs/download/0004013800000102/cetk;

#DEFINE LOCAL DEPENDENCIES

#main
dep_dependencies=~/Documents/3ds/dependencies;
dep_distfiles=~/Documents/3ds/distfiles;

#cfw stuff
dep_corbenik=$dep_dependencies/corbenik;
dep_locale=$dep_dependencies/corbenik/locale;
dep_slot0x11Key96=$dep_dependencies/slotkeybin/slot0x11Key96.bin
dep_a9lh=$dep_dependencies/a9lh/delebile;
dep_decrypt9=$dep_dependencies/decrypt9;
dep_cia=$dep_dependencies/cia/apps;
dep_misc=$dep_dependencies/misc;
dep_nand=$dep_dependencies/nand;

#filer
dep_filer_archive=$dep_dependencies/filer_archive;
dep_filer=$dep_filer_archive/filer;

#retroarch
dep_retroarch_archive=$dep_dependencies/retroarch_archive;
dep_retroarch=$dep_retroarch_archive/retroarch;
dep_roms=$dep_dependencies/roms;

#funkeycia
dep_bin=~/.bin;
dep_title_id=$dep_locale/TITLE_ID.DB;
dep_funkeycia=$dep_bin/FunKeyCIA.py;
dep_make_cdn_cia=$dep_bin/make_cdn_cia;
dep_games=$dep_dependencies/cia/games;
dep_updates=$dep_dependencies/cia/updates;

#DEFINE LOCAL DIRECTORIES

#build directory
dir_tmp=~/tmp;
dir_build=$dir_tmp/build;
dir_out=$dir_tmp/out;

#3ds root
dir_3ds=$dir_out/3ds;
dir_cia=$dir_out/cia;
dir_decrypt9=$dir_out/Decrypt9;
dir_d9game=$dir_out/D9Game;
dir_emunand9=$dir_out/EmuNAND9;

#corbenik
dir_corbenik=$dir_out/corbenik;
dir_chain=$dir_corbenik/chain;
dir_locale=$dir_corbenik/locale;

#MAIN SCRIPT

#print menu
echo "";
echo "*** Homebrew";
echo "[U] : Update homebrew";
echo "[B] : Build all homebrew";
echo "";
echo "*** Post-build";
echo "[N] : Set files for N3DS";
echo "[O] : Set files for O3DS";
echo "";
echo "*** Filer/Retroarch";
echo "[F] : Backup filer";
echo "[R] : Backup retroarch";
echo "";
echo "*** Nand options";
echo "[Y] : Backup 3DS nand";
echo "[Z] : Restore 3DS nand";
echo "";
echo "*** FunKeyCIA";
echo "[G] : Download game";
echo "[D] : Download dlc";
echo "[P] : Download patch";
echo "";
echo "[E] : Exit script";
echo "";
echo -n "Select your choice: ";
read choice;
case $choice in
	U) #update homebrew submenu
	mkdir -p $dep_distfiles;
	echo "";
	echo "*** Update homebrew sub-menu";
	echo "[1] : Corbenik";
	echo "[2] : ARM9LoaderHax";
	echo "[3] : Decrypt9WIP";
	echo "[4] : EmuNAND9";
	echo "[5] : GodMode9";
	echo "[6] : Uncart";
	echo "[7] : FBI";
	echo "[8] : ftpd";
	echo "[9] : hblauncher_loader";
	echo "[10]: retroarch";
	echo "";
	echo "*** Update misc";
	echo "[Q] : encTitleKeys, and seeddb.bin";
	echo "[T] : nativefirm, agb, and twl";
	echo "";
	echo "[A] : Update all";
	echo "";
	echo "[E] : Exit script";
	echo "";
	echo -n "Select your choice: ";
	read homebrew;
	echo "";
        cd $dep_distfiles;
	case $homebrew in
		1) #corbenik
		rm -rf $dep_distfiles/corbenik;
		git clone --recursive https://github.com/chaoskagami/corbenik.git;
		;;

		2) #arm9loaderhax
		rm -rf $dep_distfiles/arm9loaderhax;
		git clone --recursive https://github.com/delebile/arm9loaderhax.git;
		;;

		3) #Decrypt9WIP
		rm -rf $dep_distfiles/Decrypt9WIP;
		git clone --recursive https://github.com/d0k3/Decrypt9WIP.git;
		;;

		4) #EmuNAND9
		rm -rf $dep_distfiles/EmuNAND9;
		git clone --recursive https://github.com/d0k3/EmuNAND9.git;
		;;

		5) #GodMode9
		rm -rf $dep_distfiles/GodMode9;
		git clone --recursive https://github.com/d0k3/GodMode9.git;
		;;

		6) #uncart
		rm -rf $dep_distfiles/uncart;
		git clone --recursive https://github.com/citra-emu/uncart;
		;;

		7) #FBI
		rm -rf $dep_distfiles/bannertool; rm -rf $dep_distfiles/FBI;
		git clone --recursive https://github.com/Steveice10/bannertool.git;
		git clone --recursive https://github.com/Steveice10/FBI.git;
		;;

		8) #ftpd
		rm -rf $dep_distfiles/ftpd;
		git clone --recursive https://github.com/mtheall/ftpd;
		;;

		9) #hblauncher_loader
		rm -rf $dep_distfiles/hblauncher_loader;
		git clone --recursive https://github.com/yellows8/hblauncher_loader.git;
		;;

		10) #retroarch
		rm -rf $dep_distfiles/Retroarch;
		mkdir -p $dep_distfiles/Retroarch; cd $dep_distfiles/Retroarch;
		wget $url_retroarch;
		;;

		Q) #freeShop and seeddb.bin
		rm -rf $dep_distfiles/seeddb; rm -rf $dep_distfiles/freeShop;
		mkdir -p $dep_distfiles/seeddb; cd $dep_distfiles/seeddb;
                wget $url_seeddb; mv $dep_distfiles/seeddb/seeddb $dep_distfiles/seeddb/seeddb.bin;
		mkdir -p $dep_distfiles/freeShop; cd $dep_distfiles/freeShop;
		wget $url_freeshop; wget $url_enctitlekeys;
		mv $dep_distfiles/freeShop/downloadenc $dep_distfiles/freeShop/encTitleKeys.bin;
		;;

		T) #misc
		rm -rf $dep_distfiles/firmware; rm -rf $dep_distfiles/keys;
		mkdir -p $dep_distfiles/firmware; mkdir -p $dep_distfiles/keys;
		cd $dep_distfiles/firmware;
		wget $url_n3ds_firm; mv $dep_distfiles/firmware/000* $dep_distfiles/firmware/native-n3ds;
		wget $url_o3ds_firm; mv $dep_distfiles/firmware/000* $dep_distfiles/firmware/native-o3ds;
		wget $url_n3ds_agb; mv $dep_distfiles/firmware/000* $dep_distfiles/firmware/agb-n3ds;
		wget $url_o3ds_agb; mv $dep_distfiles/firmware/000* $dep_distfiles/firmware/agb-o3ds;
		wget $url_n3ds_twl; mv $dep_distfiles/firmware/000* $dep_distfiles/firmware/twl-n3ds;
		wget $url_o3ds_twl; mv $dep_distfiles/firmware/000* $dep_distfiles/firmware/twl-o3ds;
		cd $dep_distfiles/keys;
		wget $url_n3ds_firm_cetk; mv $dep_distfiles/keys/cetk $dep_distfiles/keys/native.cetk-n3ds;
		wget $url_o3ds_firm_cetk; mv $dep_distfiles/keys/cetk $dep_distfiles/keys/native.cetk-o3ds;
		wget $url_n3ds_agb_cetk; mv $dep_distfiles/keys/cetk $dep_distfiles/keys/agb.cetk-n3ds;
		wget $url_o3ds_agb_cetk; mv $dep_distfiles/keys/cetk $dep_distfiles/keys/agb.cetk-o3ds;
		wget $url_n3ds_twl_cetk; mv $dep_distfiles/keys/cetk $dep_distfiles/keys/twl.cetk-n3ds;
		wget $url_o3ds_twl_cetk; mv $dep_distfiles/keys/cetk $dep_distfiles/keys/twl.cetk-o3ds;
		;;

		A) #update all homebrew
		rm -rf $dep_distfiles; mkdir -p $dep_distfiles;
		cd $dep_distfiles;

		#fetch projects
		echo "";
		echo "Fetching Homebrew...";
		git clone --recursive https://github.com/chaoskagami/corbenik.git;
		git clone --recursive https://github.com/delebile/arm9loaderhax.git;
		git clone --recursive https://github.com/d0k3/Decrypt9WIP.git;
		git clone --recursive https://github.com/d0k3/EmuNAND9.git;
		git clone --recursive https://github.com/d0k3/GodMode9.git;
		git clone --recursive https://github.com/citra-emu/uncart;
		git clone --recursive https://github.com/Steveice10/bannertool.git;
		git clone --recursive https://github.com/Steveice10/FBI.git;
		git clone --recursive https://github.com/mtheall/ftpd;
		git clone --recursive https://github.com/yellows8/hblauncher_loader.git

		#fetch firmware
		mkdir -p $dep_distfiles/firmware; mkdir -p $dep_distfiles/keys;
		cd $dep_distfiles/firmware;
		wget $url_n3ds_firm; mv $dep_distfiles/firmware/000* $dep_distfiles/firmware/native-n3ds;
		wget $url_o3ds_firm; mv $dep_distfiles/firmware/000* $dep_distfiles/firmware/native-o3ds;
		wget $url_n3ds_agb; mv $dep_distfiles/firmware/000* $dep_distfiles/firmware/agb-n3ds;
		wget $url_o3ds_agb; mv $dep_distfiles/firmware/000* $dep_distfiles/firmware/agb-o3ds;
		wget $url_n3ds_twl; mv $dep_distfiles/firmware/000* $dep_distfiles/firmware/twl-n3ds;
		wget $url_o3ds_twl; mv $dep_distfiles/firmware/000* $dep_distfiles/firmware/twl-o3ds;
		cd $dep_distfiles/keys;
		wget $url_n3ds_firm_cetk; mv $dep_distfiles/keys/cetk $dep_distfiles/keys/native.cetk-n3ds;
		wget $url_o3ds_firm_cetk; mv $dep_distfiles/keys/cetk $dep_distfiles/keys/native.cetk-o3ds;
		wget $url_n3ds_agb_cetk; mv $dep_distfiles/keys/cetk $dep_distfiles/keys/agb.cetk-n3ds;
		wget $url_o3ds_agb_cetk; mv $dep_distfiles/keys/cetk $dep_distfiles/keys/agb.cetk-o3ds;
		wget $url_n3ds_twl_cetk; mv $dep_distfiles/keys/cetk $dep_distfiles/keys/twl.cetk-n3ds;
		wget $url_o3ds_twl_cetk; mv $dep_distfiles/keys/cetk $dep_distfiles/keys/twl.cetk-o3ds;

		#fetch retroarch
		mkdir -p $dep_distfiles/Retroarch; cd $dep_distfiles/Retroarch;
		wget $url_retroarch;

		#fetch seedbin.bin
		mkdir -p $dep_distfiles/seeddb; cd $dep_distfiles/seeddb;
		wget $url_seeddb;
		mv $dep_distfiles/seeddb/seeddb $dep_distfiles/seeddb/seeddb.bin;

		#fetch freeShop
		mkdir -p $dep_distfiles/freeShop; cd $dep_distfiles/freeShop;
		wget $url_freeshop; wget $url_enctitlekeys;
		mv $dep_distfiles/freeShop/downloadenc $dep_distfiles/freeShop/encTitleKeys.bin;
		echo "";
		echo "Source files updated!";
		;;

		E) #exit
		exit 0;
		;;

		*)
		echo "";
		echo "Invalid choice!";
		exit 1;
		;;
	esac
	;;

	B) #build all homebrew
        rm -rf $dir_build $dir_out $dir_tmp/sdmc*;
        mkdir -p $dir_build $dir_out $dir_3ds $dir_cia;

	#copy dependencies
	cp -rR $dep_distfiles/* $dir_build/;
	cp -rR $dep_cia/*.cia $dir_cia/;
	cp -rR $dep_filer $dir_out/;
	cp -rR $dep_dependencies/dspdump/* $dir_3ds/;
	cp -rR $dep_retroarch $dir_out/;
	cp -rR $dep_roms $dir_out/;
	mv $dir_build/freeShop $dir_out/;
	mv $dir_out/freeShop/*.cia $dir_cia/;

	#corbenik
	cd $dir_build/corbenik;
	make clean;
	make full;
	rm -rf $dir_build/corbenik/out/corbenik/locale;
	mv $dir_build/corbenik/out/corbenik $dir_out;
	mv $dir_build/corbenik/out/arm9loaderhax.bin $dir_out;
	mv $dir_build/firmware $dir_corbenik/;
	mv $dir_build/keys $dir_corbenik/;
	cp $dep_slot0x11Key96 $dir_corbenik/keys/11.key;
	cp $dep_corbenik/keys/*.key* $dir_corbenik/keys/;
	cp $dep_corbenik/bits/top.bin $dir_corbenik/bits/;
	cp -rR $dep_locale $dir_corbenik/;
	mkdir -p $dir_chain;

	#ARM9LoaderHax-n3ds
	cd $dir_build/arm9loaderhax;
	make clean;
	sed -i -e 's|"sdmc:/arm9loaderhax.pack"|"sdmc:/3ds/arm9loaderhax-n3ds/arm9loaderhax.pack"|g' $dir_build/arm9loaderhax/payload_installer/installer/source/main.c;
	cp $dep_a9lh/* $dir_build/arm9loaderhax/data_input/;
	mv $dir_build/arm9loaderhax/data_input/otp.bin-n3ds $dir_build/arm9loaderhax/data_input/otp.bin;
	make;
	mv -v $dir_build/arm9loaderhax/data_output $dir_3ds/arm9loaderhax-n3ds;
	mv -v $dir_3ds/arm9loaderhax-n3ds/arm9loaderhax.bin $dir_chain/ARM9LoaderHax-n3ds.bin;
	rm -rf $dir_build/arm9loaderhax; cp -rR $dep_distfiles/arm9loaderhax $dir_build/;

	#ARM9LoaderHax-o3ds
	cd $dir_build/arm9loaderhax;
	make clean;
	sed -i -e 's|"sdmc:/arm9loaderhax.pack"|"sdmc:/3ds/arm9loaderhax-o3ds/arm9loaderhax.pack"|g' $dir_build/arm9loaderhax/payload_installer/installer/source/main.c;
	cp $dep_a9lh/* $dir_build/arm9loaderhax/data_input/;
	mv $dir_build/arm9loaderhax/data_input/otp.bin-o3ds $dir_build/arm9loaderhax/data_input/otp.bin;
	make;
	mv -v $dir_build/arm9loaderhax/data_output $dir_3ds/arm9loaderhax-o3ds;
	mv -v $dir_3ds/arm9loaderhax-o3ds/arm9loaderhax.bin $dir_chain/ARM9LoaderHax-o3ds.bin;

	#Decrypt9WIP
	cd $dir_build/Decrypt9WIP; mkdir -p $dir_d9game $dir_decrypt9;
	make clean;
	make;
	mv -v $dir_build/Decrypt9WIP/output/Decrypt9WIP.bin $dir_chain/Decrypt9.bin;
	mv $dir_build/Decrypt9WIP/resources/d9logo.bin $dir_decrypt9/;
	cp -rR $dep_decrypt9/* $dir_decrypt9/;
	mv $dir_build/seeddb/seeddb.bin $dir_decrypt9/;

	#EmuNAND9
	cd $dir_build/EmuNAND9; mkdir -p $dir_emunand9;
	make clean;
	make;
	mv -v $dir_build/EmuNAND9/output/EmuNAND9.bin $dir_chain/EmuNAND9.bin;

	#GodMode9
	cd $dir_build/GodMode9;
	make clean;
	make;
	mv -v $dir_build/GodMode9/output/GodMode9.bin $dir_chain/GodMode9.bin;

	#Uncart
	cd $dir_build/uncart;
	make clean;
	make a9lh;
	mv -v $dir_build/uncart/uncart_arm9loaderhax.bin $dir_chain/Uncart.bin;

	#bannertool
	cd $dir_build/bannertool;
	make clean;
	make;

	#FBI
	cd $dir_build/FBI;
	make clean;
	cp $dir_build/bannertool/output/bannertool $dir_build/FBI/buildtools/3ds/bannertool-linux64;
	rm $dir_build/FBI/buildtools/3ds/bannertool-linux32;
	make;
	mv -v $dir_build/FBI/output/FBI.cia $dir_cia/fbi-v$(date +%Y%m%d).cia;

	#ftpd
	cd $dir_build/ftpd;
	make clean;
	make;
	mkdir -p $dir_3ds/ftpd;
	mv $dir_build/ftpd/ftpd.3dsx $dir_3ds/ftpd/;
	mv $dir_build/ftpd/ftpd.smdh $dir_3ds/ftpd/;

	#hblauncher_loader
	cd $dir_build/hblauncher_loader;
	make clean;
	sed -i -e 's|"sdmc:/|"sdmc:/3ds/|g' $dir_build/hblauncher_loader/source/hblauncher_loader.c;
	make;
	mv -v $dir_build/hblauncher_loader/hblauncher_loader.cia $dir_cia/hblauncher_loader-v$(date +%Y%m%d).cia;
	cp $dep_misc/hblauncherloader* $dir_3ds/; cp $dep_misc/boot.3dsx $dir_3ds/h.bin;

	#Setup RetroArch 3dsx
	cd $dir_build/Retroarch;
	p7zip -d $dir_build/Retroarch/*;
	mv $dir_build/Retroarch/3ds/catsfc_libretro $dir_3ds/;
	mv $dir_build/Retroarch/3ds/fceumm_libretro $dir_3ds/;
	mv $dir_build/Retroarch/3ds/fb_alpha_cps2_libretro $dir_3ds/;
	mv $dir_build/Retroarch/3ds/fb_alpha_neo_libretro $dir_3ds/;
	mv $dir_build/Retroarch/3ds/pocketsnes_libretro $dir_3ds/;

	#cleanup
	cd ~/tmp;
	rm -rf $dir_build; mv -v $dir_out sdmc-v$(date +%Y%m%d);
	;;

	N) #set SD files to n3ds
	rm -rfv 3ds/arm9loaderhax-o3ds;
	rm -rfv corbenik/chain/ARM9LoaderHax-o3ds.bin;
	rm -v corbenik/firmware/native-o3ds; rm -v corbenik/firmware/agb-o3ds; rm -v corbenik/firmware/twl-o3ds;
	rm -v corbenik/keys/native.key-o3ds; rm -v corbenik/keys/agb.key-o3ds; rm -v corbenik/keys/twl.key-o3ds;
	rm -v corbenik/keys/native.cetk-o3ds; rm -v corbenik/keys/agb.cetk-o3ds; rm -v corbenik/keys/twl.cetk-o3ds;
	rm -v Decrypt9/fbi-o3ds_usa-v11.0.0.app;
	rm -v 3ds/dspfirm.cdc-o3ds;
	rm -v 3ds/*OLD*.bin;
	rm -v 3ds/*NEW*USA.bin;
	mv -v corbenik/firmware/native-n3ds corbenik/firmware/native;
	mv -v corbenik/firmware/agb-n3ds corbenik/firmware/agb;
	mv -v corbenik/firmware/twl-n3ds corbenik/firmware/twl;
	mv -v corbenik/keys/native.key-n3ds corbenik/keys/native.key;
	mv -v corbenik/keys/agb.key-n3ds corbenik/keys/agb.key;
	mv -v corbenik/keys/twl.key-n3ds corbenik/keys/twl.key;
	mv -v corbenik/keys/native.cetk-n3ds corbenik/keys/native.cetk;
	mv -v corbenik/keys/agb.cetk-n3ds corbenik/keys/agb.cetk;
	mv -v corbenik/keys/twl.cetk-n3ds corbenik/keys/twl.cetk;
	mv -v 3ds/dspfirm.cdc-n3ds 3ds/dspfirm.cdc;
	;;

	O) #set SD files to o3ds
	rm -rf 3ds/arm9loaderhax-n3ds;
	rm -rf corbenik/chain/ARM9LoaderHax-n3ds.bin;
	rm -v corbenik/firmware/native-n3ds; rm -v corbenik/firmware/agb-n3ds; rm -v corbenik/firmware/twl-n3ds;
	rm -v corbenik/keys/native.key-n3ds; rm -v corbenik/keys/agb.key-n3ds; rm -v corbenik/keys/twl.key-n3ds;
	rm -v corbenik/keys/native.cetk-n3ds; rm -v corbenik/keys/agb.cetk-n3ds; rm -v corbenik/keys/twl.cetk-n3ds;
	rm -v Decrypt9/fbi-n3ds_jpn-v11.0.0.app;
	rm -v 3ds/dspfirm.cdc-n3ds;
	rm -v 3ds/*NEW*.bin;
	mv -v corbenik/firmware/native-o3ds corbenik/firmware/native;
	mv -v corbenik/firmware/agb-o3ds corbenik/firmware/agb;
	mv -v corbenik/firmware/twl-o3ds corbenik/firmware/twl;
	mv -v corbenik/keys/native.key-o3ds corbenik/keys/native.key;
	mv -v corbenik/keys/agb.key-o3ds corbenik/keys/agb.key;
	mv -v corbenik/keys/twl.key-o3ds corbenik/keys/twl.key;
	mv -v corbenik/keys/native.cetk-o3ds corbenik/keys/native.cetk;
	mv -v corbenik/keys/agb.cetk-o3ds corbenik/keys/agb.cetk;
	mv -v corbenik/keys/twl.cetk-o3ds corbenik/keys/twl.cetk;
	mv -v 3ds/dspfirm.cdc-o3ds 3ds/dspfirm.cdc;
	;;

	F) #backup filer
	echo "";
	mv -v $dep_filer $dep_filer_archive/filer-$(date +%Y%m%d);
	cp -rRv filer $dep_filer_archive/;
	;;

	R) #backup retroarch saves
	echo "";
	mv -v $dep_retroarch $dep_retroarch_archive/retroarch-$(date +%Y%m%d);
	mkdir -vp $dep_retroarch/cores;
	cp -rRv retroarch/cores/savefiles $dep_retroarch/cores/;
	cp -rRv retroarch/cores/savestates $dep_retroarch/cores/;
    	;;

	Y) #backup 3ds nand
	mkdir -p $dep_nand;
	echo "";
	echo "Set block device";
	echo "";
	echo "	example: /dev/sdc";
	echo "";
	echo -n "block device: ";
	read block_device;
	echo "";
	echo -n "Enter nand backup name: ";
	read nand;
	echo "";
	echo Backing up 3DS nand file: $nand
	sudo dd if=$block_device of=$dep_nand/$nand bs=1M;
	echo "Backup completed!";
	;;

	Z) #restore 3ds nand
	mkdir -p $dep_nand;
	echo "";
	echo "Set block device";
	echo "";
	echo "  example: /dev/sdc";
	echo "";
	echo -n "block device: ";
	read block_device;
	echo "";
	echo "Nand list:";
	for entry in "$dep_nand"/*
	do
		echo "$entry";
	done
	echo "";
	echo -n "Enter nand backup name: ";
	read nand;
		if [ ! -f $dep_nand/$nand ]; then
			echo "";
			echo $nand does not exist!
			exit 1;
		else
			echo "";
			echo Writing $nand to 3DS nand...
			sudo dd if=$dep_nand/$nand of=$block_device bs=1M;
			echo "Write completed!";
		fi
	;;

	G) #download game
	mkdir -p $dir_tmp $dep_games $dep_locale; cd $dir_tmp;
	cp $dep_make_cdn_cia $dir_tmp/;
	echo "";
	echo -n "Enter Title ID: ";
	read title;
	echo -n "Enter encrypted title key: ";
	read key;
	echo -n "Rename game file: ";
	read title_rename;
	echo "";
	unique_id=${title:9:5};
	python $dep_funkeycia -title $title -key $key;
	echo "Moving game file...";
	mv -v $dir_tmp/cia/$title/$title.cia $dep_games/$unique_id-$title_rename.cia;
	echo "USA EN" > $dep_locale/$title;
	cd $dep_locale;
	echo $unique_id-$title_rename >> $dep_title_id;
	sort -o $dep_title_id $dep_title_id;
	for f in * ; do mv -- "$f" "$(tr [:lower:] [:upper:] <<< "$f")" ; done;
	;;

	D) #download dlc
	mkdir -p $dir_tmp $dep_updates; cd $dir_tmp;
	cp $dep_make_cdn_cia $dir_tmp/;
	echo "";
	echo -n "Enter DLC Title ID: ";
	read title;
	echo -n "Enter encrypted title key: ";
	read key;
	echo -n "Rename DLC file: ";
	read title_rename;
	echo "";
	unique_id=${title:9:5};
	python $dep_funkeycia -title $title -key $key;
	echo "Moving game file...";
	mv -v $dir_tmp/cia/$title/$title.cia $dep_updates/$unique_id-$title_rename-dlc.cia;
	;;

	P) #download patch
	mkdir -p $dir_tmp $dep_updates; cd $dir_tmp;
	cp $dep_make_cdn_cia $dir_tmp/;
	echo "";
	echo -n "Enter Title ID: ";
	read title;
	echo -n "Enter encrypted title key: ";
	read key;
	echo -n "Rename file: ";
	read title_rename;
	echo -n "Enter patch version: ";
	read version;
	echo "";
	unique_id=${title:9:5};
	python $dep_funkeycia -title $title -key $key;
	echo "Moving update file...";
	mv -v $dir_tmp/cia/$title/$title.cia $dep_updates/$unique_id-$title_rename-patch_v$version.cia;
	;;

	E) #exit
	exit 0;
	;;

	*)
	echo "";
	echo "Invalid choice!";
	exit 1;
	;;
esac
exit 0;
