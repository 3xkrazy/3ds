#!/bin/bash
# funkeycia

# Define dependencies
dep_locale=~/Documents/3ds/dependencies/corbenik/locale
dep_title_id=$dep_locale/TITLE_ID.DB

# Define directories
dir_bin=~/.bin
dir_tmp=~/src/tmp
dir_games=~/Documents/3ds/dependencies/cia/games
dir_updates=~/Documents/3ds/dependencies/cia/updates


# Define binaries
bin_funkeycia=$dir_bin/FunKeyCIA.py
bin_make_cdn_cia=$dir_bin/make_cdn_cia

mkdir -p $dir_tmp; cd $dir_tmp;
cp $bin_make_cdn_cia $dir_tmp/;

echo "";
echo "https://3ds.titlekeys.com/";
echo "";
echo "*** FunkeyCIA Menu ***";
echo "[1] Download game";
echo "[2] Download dlc";
echo "[3] Download patch";
echo -n "Select your choice: ";
read choice;

case $choice in
  1)
  echo "";
  echo -n "Enter Title ID: ";
  read title;
  echo -n "Enter encrypted title key: ";
  read key;
  echo -n "Rename game file: ";
  read title_rename;
  echo "";
  unique_id=${title:9:5};
  python $bin_funkeycia -title $title -key $key;
  echo "Moving game file...";
  mv -v $dir_tmp/cia/$title/$title.cia $dir_games/$unique_id-$title_rename.cia;
  echo "USA EN" > $dep_locale/$title;
  cd $dep_locale;
  echo $unique_id-$title_rename >> $dep_title_id;
  sort -o $dep_title_id $dep_title_id;
  for f in * ; do mv -- "$f" "$(tr [:lower:] [:upper:] <<< "$f")" ; done;
  ;;

  2)
  echo "";
  echo -n "Enter DLC Title ID: ";
  read title;
  echo -n "Enter encrypted title key: ";
  read key;
  echo -n "Rename DLC file: ";
  read title_rename;
  echo "";
  unique_id=${title:9:5};
  python $bin_funkeycia -title $title -key $key;
  echo "Moving game file...";
  mv -v $dir_tmp/cia/$title/$title.cia $dir_updates/$unique_id-$title_rename-dlc.cia;
  ;;

  3)
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
  python $bin_funkeycia -title $title -key $key;
  echo "Moving update file...";
  mv -v $dir_tmp/cia/$title/$title.cia $dir_updates/$unique_id-$title_rename-patch_v$version.cia;
  ;;

  *)
  echo "";
  echo "Invalid choice!";
  exit 1;
  ;;
esac

echo "";
echo "Finished! <(' '  )> <( ' ' )> <(  ' ')>";
exit 0;