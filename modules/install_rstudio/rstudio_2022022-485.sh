curl --version
if [ $? != 0 ]
then echo "curl not installed"
else 
    curl https://download1.rstudio.org/desktop/bionic/amd64/rstudio-2022.02.2-485-amd64.deb
    sudo dpkg -i rstudio-2022.02.2-485-amd64.deb
fi
