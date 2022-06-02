


echo "--------------------start-----------------------" >> result.txt
# readline txt
while read CURRENT_LINE; do
	if [ -z "$CURRENT_LINE" ]; then continue; fi
	# echo $CURRENT_LINE
	word=$(echo $CURRENT_LINE | awk '{print $1}'| tr -d "\":{}")
	#convertString
	echo $word "= #{"$word"}", >> result.txt
done < text.txt
echo "--------------------done.-----------------------" >> result.txt