

FLAG_FILE="../flag/flags.txt\ "

FLAG_KEY=$1
FLAG_VALUE=$2
#FLAG_KEY="ENABLE_C"
#FLAG_VALUE="false"

# git preparation
git checkout master
git pull origin master
git checkout -b $FLAG_KEY
# ===========================

NEW_DATA="$FLAG_KEY=$FLAG_VALUE"

FOUND_ROW="`grep -E ^"$FLAG_KEY\=*" ../flag/flags.txt`"
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
#cat ../flag/flags.txt\

git add "../flag/flags.txt\ "
git commit -m "$FLAG_KEY"
git push -f origin $FLAG_KEY

# requirment: gh
which -a gh || abort "Install gh https://cli.github.com/manual/"
gh pr create --title "$FLAG_KEY guys"
