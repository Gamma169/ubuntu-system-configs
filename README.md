# ubuntu-system-configs
A set of system configurations for my ubuntu development environment

### Simple adds
  * Expect: `sudo apt install expect` 
  * lolcat: `sudo apt install lolcat`
  * tree:   `sudo apt install tree`
  * curl:   `sudo apt install curl`
  * fortune:`sudo apt install fortune` 

### Install things
  *  **Chrome:** https://askubuntu.com/questions/79280/how-to-install-chrome-browser-properly-via-command-line
      * `sudo apt-get install libxss1 libappindicator1 libindicator7`
      * `wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb`
      * `sudo dpkg -i google-chrome*.deb`

  *  **Docker:** https://docs.docker.com/engine/installation/linux/linux-postinstall/#manage-docker-as-a-non-root-user
      * `sudo apt-get install docker`
      * `sudo apt-get install docker.io`
      * `sudo usermod -aG docker $USER`
      * Restart the computer so you don't have to use sudo
    
  *  **Node:**  To Get it properly on the system-- Not use nvm https://www.geeksforgeeks.org/installation-of-node-js-on-linux/
      * `sudo apt-get update`
      * `sudo apt-get upgrade`
      * `sudo apt-get install software-properties-common`
      * `curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -`
      * **NOTE** I got an error saying one of the packages was forbidden and this wouldn't let the above command run to completion.  So I had to comment out that package and try it again: https://dev.to/deepika_banoth/how-i-solved-failed-to-fetch-http-ppa-launchpad-net-403-forbidden-2544
      * `sudo apt-get install nodejs`
  
  *  **Yarn:** 
      * `curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null`
      * `echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list`
      * `sudo apt-get update && sudo apt-get install yarn`
  
  *  **Sublime Text**  http://tipsonubuntu.com/2017/05/30/install-sublime-text-3-ubuntu-16-04-official-way/
      * `wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -`
      * `echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list`
      * `sudo apt-get update`
      * `sudo apt-get install sublime-text`
  
  *  **SBT**  http://www.scala-sbt.org/0.13/docs/Installing-sbt-on-Linux.html
      * `echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list`
      * `sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823`
      * `sudo apt-get update`
      * `sudo apt-get install sbt`
      * Also Need Java
      * `sudo apt-get install default-jdk`

  *  **Postman**  https://blog.bluematador.com/posts/postman-how-to-install-on-ubuntu-1604/
      * `wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz`
      * `sudo tar -xzf postman.tar.gz -C /opt`
      * `rm postman.tar.gz`
      * `sudo ln -s /opt/Postman/Postman /usr/bin/postman`
      * Then run `postman` in command line and lock to launcher

  *  **Ember**  https://guides.emberjs.com/v3.0.0/getting-started/
      * First install watchman:  https://facebook.github.io/watchman/docs/install.html
      * `git clone https://github.com/facebook/watchman.git -b v4.9.0 --depth 1`
      * `cd watchman`
      * `./autogen.sh`
        * If libtool error: `sudo apt-get install libtool m4 make automake`
        * Also possible g++ error: `sudo apt install g++`
      * `./configure --enable-lenient`
        * enable-lenient is from issue with make: https://github.com/facebook/watchman/issues/638#issuecomment-415583449
      * `make`
        * If ssl error: https://github.com/facebook/watchman/issues/529#issuecomment-329991884
        * `sudo apt install libssl-dev`
        * Manually changing the Makefile to have LIBS = `-lpthread -lssl -lcrypto`
      * `sudo make install`
      * Then yarn-install ember: `npm install -g ember-cli@3`
  
  * **Golang**  https://golang.org/doc/install
      * Download .tar.gz somewhere - https://golang.org/dl/
      * `tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz`
      * `export PATH=$PATH:/usr/local/go/bin`


  * **Google Cloud SDK + kubectl**  https://cloud.google.com/sdk/docs/downloads-apt-get
      * `export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"`
      * `echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list`
      * `curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -`
      * `sudo apt-get update && sudo apt-get install google-cloud-sdk`
      * `gcloud components install kubectl` or `sudo apt-get install kubectl`

  
### Add New Github Private Key
  * https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
    * First-  `ssh-keygen -t rsa -b 4096 -C "RGokea@gmail.com"`
    * Then-  `ssh-add ~/.ssh/id_rsa`
    * Finally- Go to github settings and add it after copying from id_rsa_pub file in .ssh
