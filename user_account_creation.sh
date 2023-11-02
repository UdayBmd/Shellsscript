#!/bin/bash
# Create a users and assign random password.
# 1. Take username as arg.
# 2. Check if user already exists.
# 3. Create if user not exist.
# 4. Assign random password with nums, char, spec char India@1234.
# 5. Force user to change password.
# 6. sed -i "s/.*PasswordAuthentication no.*/PasswordAuthentication yes/g" /etc/ssh/sshd_config
# 7. sed -i '60i #Password Authentication Enabled By Sreeharsha' /tmp/sshd_config
# 8. Username must be alphabets only & lowercase only.
# 9. USERNAMES=$(cat /etc/passwd | cut -d ':' -f 1 | egrep '[0-9]' | tail -24)
# 10. for USER in $USERNAMES; do userdel -r $USER; done
#------------------------------------------------------------
if [ $# -gt 0 ]; then
    for RAWUSER in $@; do
        #if [[ $RAWUSER =~ ^[a-zA-Z]+$ ]]; then
        if [[ $RAWUSER =~ ^[a-zA-Z][a-zA-Z][a-zA-Z][0-9][0-9][0-9]+$ ]]; then
            USER=$(echo $RAWUSER | tr '[:upper:]' '[:lower:]')
            EXISTING_USER=$(cat /etc/passwd | grep -i -w $USER | cut -d ":" -f 1)
            #echo $USER
            #echo $EXISTING_USER
            if [ "${USER}" = "${EXISTING_USER}" ]; then
                echo "!!!ERROR!!!---The user $USER Already Exists. Please try a diffrent username."
            else
                echo "Lets create user $USER ."
                useradd -m $USER --shell /bin/bash
                SPEC=$(echo '!@#$%^&*()_' | fold -1 | shuf | head -1)
                PASSWORD="India@${RANDOM}${SPEC}"
                echo "$USER:$PASSWORD" | sudo chpasswd
                echo "Username is $USER and Temporary Password is ${PASSWORD}."
                passwd -e $USER
            fi
        else
            echo "INVALID USERNAME ${RAWUSER}. Username must contain alphabets only."
        fi
    done
else
    echo "The Number Of Parameters Given Are 0 which is invalid. Please provide a username."
fi
