FLAG_FILE="../flag/flags.txt\ "

FLAG_KEY="ENABLE_C"
FLAG_VALUE="true"
NEW_DATA="$FLAG_KEY=$FLAG_VALUE"

FOUND_ROW="`grep -E ^"$FLAG_KEY\=*" ../flag/flags.txt\ `"
if [ ! -z "$FOUND_ROW" -a "$FOUND_ROW" != " " ]; 
then
        echo "matched $FOUND_ROW"
else
        echo "flag $FLAG_KEY not found"
        exit 1
fi

# grep -E ^"$FLAG_KEY\=*" ../flag/flags.txt\ 

REPLACER="s/$FOUND_ROW/$NEW_DATA/"
sed -i '' $REPLACER ../flag/flags.txt\ 
cat ../flag/flags.txt\ 
