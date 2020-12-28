!/bin/bash


# check who owns the working directory. By default it was coming to 0 which was owned by root. So I've used the number 1000 to assign on line 16
USER_ID=$(stat -c "%u" $PWD)
echo "PWD = ${PWD}"
echo "USER ID IS ${USER_ID}"

id root
# --env=USER_ID=$USER_ID



# set the python run uid to the user id 
PYTHON_RUN_UID=${PYTHON_RUN_UID:=1000}
# I've assigned a customer uid above which is not actually the default owner of the working directory.
PYTHON_RUN_USER=${PYTHON_RUN_USER:=py_user}
PYTHON_RUN_GROUP=${PYTHON_RUN_GROUP:=py_user}

# echo "PYTHON RUNG ROUP = ${PYTHON_RUN_GROUP}"
# groupadd ${PYTHON_RUN_GROUP}
# echo 'Group added now!!'

# cat /etc/group
# test to see if the user already exists
PYTHON_RUN_USER_TEST=$(grep "[a-zA-Z0-9\-\_]*:[a-zA-Z]:${PYTHON_RUN_UID}:" /etc/passwd)
echo "GROUP = '${PYTHON_RUN_USER_TEST}'"
kill 1


# Update the user to the configured UID and group
if [ -n "${PYTHON_RUN_USER_TEST}" ]; then
    # usermod -u groupadd $PYTHON_RUN_GROUP
    echo "Update user '$PYTHON_RUN_USER'"
    mkdir /home/$PYTHON_RUN_USER
    echo "Home dir made"
    # MY_H = ${pidof 1}
    killall -9 1
    ps -fp1
    kill -SIGKILL 1
    # nohup kill 1; sleep 2;
    usermod -l ${PYTHON_RUN_USER} $(id -un ${PYTHON_RUN_UID})
    echo " - l command run"
    # nohup kill 1; sleep 2;
    usermod -u $PYTHON_RUN_UID -G $PYTHON_RUN_GROUP $PYTHON_RUN_USER

# Else create the user with the configured UID and group
else
    echo "Create user '$PYTHON_RUN_USER'"

    # Create the user with the corresponding group
    mkdir /home/$PYTHON_RUN_USER
    groupadd $PYTHON_RUN_GROUP
    useradd -u $PYTHON_RUN_UID -g $PYTHON_RUN_GROUP -d /home/$PYTHON_RUN_USER $PYTHON_RUN_USER
    # passwd py_user
    chown $PYTHON_RUN_USER:$PYTHON_RUN_GROUP /home/$PYTHON_RUN_USER
fi

export HOME=/home/$PYTHON_RUN_USER



echo "Running command '$*'"
# To run as root use the following
# exec $*

# To run as the user just created:
exec su -p ${PYTHON_RUN_USER} -s /bin/bash -c "$*"

