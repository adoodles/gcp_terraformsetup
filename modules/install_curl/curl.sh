curl --version
if [ $? != 0 ]
then
    sudo apt curl install
fi
