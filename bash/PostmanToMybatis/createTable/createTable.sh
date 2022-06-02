#maria Db

result="==============[createTable]==============\n"

result+="--------------------start-----------------------\n"
# readline txt

result+="CREATE TABLE [table_name] (\n"
while read CURRENT; do
	if [ -z "$CURRENT" ]; then continue; fi
	ColumnName=$(echo $CURRENT | awk '{print $2}')
	Count=$(echo $CURRENT | awk '{print $3}')
	isNull=$(echo $CURRENT | awk '{print $4}')
	
	result+="\t$ColumnName"
	if [ $Count -gt 255 ]; then 
		result+="\ttext("$Count")"
	else
		result+="\tchar("$Count")"
	fi
	
	if [ $isNull = "필" ]; then 
		result+="\tnot null,\n"
	else 
		result+="\tdefault null,\n"
	fi
done < text.txt
result+="\tprimary key([keyColumn])	\n)\n";
result+="--------------------done.-----------------------"
echo $result >> result.txt