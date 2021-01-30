#!/bin/sh 

# Original Creation: 2020-10-31

  
# Global Regular Expression Print
# grep [-OPTION] pattern [FILE]
# -i ignore case
# -o only matching, one line per match
# -v invert match
# -n print line number
# -c line count
# -A print # of lines after
# -B print # of lines before

# Examples:
# grep one *
# grep -i 'one.*ten' cust*
# grep -i 'two' cust*
# grep -i $'\x65' *.txt # search for hex value
# grep '[a-zA-Z0-9 ]' *
# grep '[^a-zA-Z0-9 ]' *
# grep -B 2 -A 2 '5' *.dat # print lines before and after
# grep -c z * # line count
# grep -o x * | wc -l # total matches count


# Word Count
# wc [-OPTION] [FILE]
# -c byte count
# -m character count
# -l line count
# -w word count

# Examples:
# grep -o x * | wc -l # total matches count
# wc customer.txt # count lines, words, and characters


# File hex values
# xxd [-OPTION] [INFILE] [OUTFILE]
# -p hex data only
# -r reverse (from hex to character)

# Examples:
# xxd customers.txt
# xxd customers.txt hexdump.txt


# List
# ls [-OPTION] [FILE]

# Examples:
# ls 
# ls c*
# ls *txt


# Find
# find [-OPTION] [FILE]
# -maxdepth
# -exec
# -newermt # modified after timestamp
# -mmin # modified +/- n minutes
# -mtime # modified +/- n days
# -iname # ignore case
# -size 

# Examples:
# find *
# find * -maxdepth 1
# find c*
# find *.txt
# find *.txt -newermt '01/20/2020 15:12:00' 
# find * -mtime -7
# find * -mmin -15
# find * -exec grep 'on' {} \;
# find * -size -100b
# find * -size +100b


# Array Variable - No space around =
# myvar=(one two three four five)
# myvar=$(ls)
# echo ${myvar[*]}


# Copy Files
# cp [-OPTION] [FILE] [DESTINATION]
# -P preserve attributes
# -r copy sub-directories

# Examples
# cp customers.txt customers2.txt
# cp customers.txt ~/docs/customers2.txt
# cp customers.txt ~/docs/
# cp customers.txt items.txt ~/docs/
# cp * backup/
# myfiles=$(find *)
# cp ${myfiles[*]} backup/
# find * -exec cp {} backup/ \;


# Remove File
# rm [-OPTION] [FILE]
# -r remove sub-directories

# Examples
# rm customers.txt
# rm docs/*
# rm -r docs/*


# Using vi as a hex editor
# 1. open the file using the -b option. This turns off any automatic formatting. For example: vi -b data
# 2. convert the binary data into hex format by entering :%!xxd
# 3. do the required edits (move around using the cursor keys, start inserting characters with the i key, leave inserting with the ESC key, delete characters with the x key)
# 4. convert the hex data back to binary by entering :%!xxd -r
# 5. write back your data by entering :w followed by :q or leave without writing the data by entering :q!


# Stream Editor
# sed [-OPTION] [EXPRESSION] [FILE]

# Examples
# sed 's/a/e/g' customers.txt # substitute a with e
# sed 's/a/e/g' customers.txt > customers2.txt
# sed 's/\x00/n/g' customers.txt # substitute hex null with n. Encoding CCSID matters
# sed 's/[^a-zA-Z0-9]/ /g' customers.txt # substitute values that are not in set, with a space
# sed 's/ñ/n/' test.txt
# sed 's/[àâãäå]/a/g' test.txt | sed 's/ñ/n/g' | sed 's/ç/c/g' | sed 's/[èéêë]/e/g' | sed 's/ìíîï/i/g' | sed 's/[òóôõö]/o/g' | sed 's/[ùúûü]/u/g' | sed 's/[ýÿ]/y/g'
# sed -e 's/[àâãäå]/a/g' -e sed 's/ñ/n/g' -e sed 's/ç/c/g' -e sed 's/[èéêë]/e/g' -e sed 's/ìíîï/i/g' -e sed 's/[òóôõö]/o/g' -e sed 's/[ùúûü]/u/g' -e sed 's/[ýÿ]/y/g' test.txt
# xxd -p test4.txt | sed 's/d090d0bdd0/41/' | xxd -p -r


# Internationalization Conversion
# iconv [-OPTIONS] -f [CCSID] -t [CCSID] [FILE]
# -c discard unconvertible characters
# --unicode-subst substitute unconvertible characters with given value

# Examples
# iconv --unicode-subst=NULL -f UTF-8 -t cp1252 test4.txt 
# iconv --unicode-subst=NULL -f UTF-8 -t cp1252 test4.txt | tr -d "NULL"
# iconv --unicode-subst=NULL -f UTF-8 -t cp1252//TRANSLIT test4.txt 
# iconv -c -f UTF-8 -t cp1252 test4.txt 
