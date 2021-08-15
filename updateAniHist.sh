#!/bin/bash
read -p "enter semester: " semester;
read -p "enter anime 1: " anime1;
read -p "enter anime 2: " anime2;
read -p "enter anime 3: " anime3;
read -p "enter anime 4: " anime4;
#clear
echo '';
anime1="$(echo $anime1 | sed 's/  //g' | sed 's/^ *//' | sed 's/ $//' | sed 's/ /+/g')";echo -n '.';
anime2="$(echo $anime2 | sed 's/  //g' | sed 's/^ *//' | sed 's/ $//' | sed 's/ /+/g')";echo -n '.';
anime3="$(echo $anime3 | sed 's/  //g' | sed 's/^ *//' | sed 's/ $//' | sed 's/ /+/g')";echo -n '.';
anime4="$(echo $anime4 | sed 's/  //g' | sed 's/^ *//' | sed 's/ $//' | sed 's/ /+/g')";echo '.';
echo "Reformatted Input";
out1="$(wget -q -O- 'www.animenewsnetwork.com/encyclopedia/search/name?q='+$anime1 | grep 'anime <' | grep '(TV)' | head -n 1 | sed 's`anime <a href=\"/encyclopedia/anime.php?id=``')";echo -n '.';
out2="$(wget -q -O- 'www.animenewsnetwork.com/encyclopedia/search/name?q='+$anime2 | grep 'anime <' | grep '(TV)' | head -n 1 | sed 's`anime <a href=\"/encyclopedia/anime.php?id=``')";echo -n '.';
out3="$(wget -q -O- 'www.animenewsnetwork.com/encyclopedia/search/name?q='+$anime3 | grep 'anime <' | grep '(TV)' | head -n 1 | sed 's`anime <a href=\"/encyclopedia/anime.php?id=``')";echo -n '.';
out4="$(wget -q -O- 'www.animenewsnetwork.com/encyclopedia/search/name?q='+$anime4 | grep 'anime <' | grep '(TV)' | head -n 1 | sed 's`anime <a href=\"/encyclopedia/anime.php?id=``')";echo '.';
echo "Received Results";
id1="$(echo $out1 | sed 's/\".*//')";
id2="$(echo $out2 | sed 's/\".*//')";
id3="$(echo $out3 | sed 's/\".*//')";
id4="$(echo $out4 | sed 's/\".*//')";
echo "Filtered IDs";
name1="$(echo $out1 | sed 's/[0-9]*\">//' | sed 's/<\/*b>//g' | sed 's/<.*//')";echo -n '.';
name2="$(echo $out2 | sed 's/[0-9]*\">//' | sed 's/<\/*b>//g' | sed 's/<.*//')";echo -n '.';
name3="$(echo $out3 | sed 's/[0-9]*\">//' | sed 's/<\/*b>//g' | sed 's/<.*//')";echo -n '.';
name4="$(echo $out4 | sed 's/[0-9]*\">//' | sed 's/<\/*b>//g' | sed 's/<.*//')";echo '.';

if [ "$semester" != "Fall" ] || [ "$semester" != "Spring" ];
then
  if [ "$(date +%M)" -gt "7" ];
    then semester="Fall";
    else semester="Spring";
  fi;
fi;
#clear
echo '';
echo "$(date +%Y),$semester,$id1,$name1,$id2,$name2,$id3,$name3,$id4,$name4";
