#!/bin/bash

FILE="$1"

if [ "$FILE" != *.txt ]; then
  echo "This file is not a text file, and cannot be encrypted" 
  exit 1
fi

read -p "Encrypt or decrypt $FILE? (type 'e' or 'd'): " MODE 

case $MODE in
e)
  openssl enc -aes-256-cbc -md sha256 -pbkdf2 -a -salt -in "$FILE" -out "encrypted_$FILE"  
  ;;
d)
  openssl enc -d -aes-256-cbc -md sha256 -pbkdf2 -a -in "$FILE" -out "decrypted_$FILE"
  ;;
*)
  echo "Invalid option, please enter 'e' to encrypt or 'd' to decrypt."
  exit 1

esac

echo "Process completed"
