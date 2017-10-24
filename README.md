# ubuntu-system-configs
A set of system configurations for my ubuntu development environment

### Simple adds
  * Expect: `sudo apt install expect` 
  * lolcat: `sudo apt install lolcat`
  * tree:   `sudo apt install tree`
  * curl:   `sudo apt install curl`
  * fortune:`sudo apt install fortune` 
  * go:     `sudo apt install golang-go`


### Install things
  *  **Chrome:** https://askubuntu.com/questions/79280/how-to-install-chrome-browser-properly-via-command-line
      * `sudo apt-get install libxss1 libappindicator1 libindicator7`
      * `wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb`
      * `sudo dpkg -i google-chrome*.deb`
      *  Then download postman app
  *  **Docker:** https://docs.docker.com/engine/installation/linux/linux-postinstall/#manage-docker-as-a-non-root-user
      * `sudo apt-get install docker`
      * `sudo apt-get install docker.io`
      * `sudo usermod -aG docker $USER`
    
  *  **Node:**  http://www.hostingadvice.com/how-to/install-nodejs-ubuntu-14-04/#node-version-manager  Use the nvm version
      * `sudo apt-get install build-essential checkinstall`
      * `curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash`
      * `nvm install 8.7.0`  (Or whatever versions you need)
  
  *  **Yarn:** 
      * `sudo apt-key adv --fetch-keys http://dl.yarnpkg.com/debian/pubkey.gpg`
      * `echo "deb http://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list`
      * `sudo apt-get update -qq`
      * `sudo apt-get install -y -qq yarn`
  
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
    
  
  
### Add New Github Private Key
  * https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
    * First-  `ssh-keygen -t rsa -b 4096 -C "RGokea@gmail.com"`
    * Then-  `ssh-add ~/.ssh/id_rsa`
    * Finally- Go to github settings and add it after copying from id_rsa_pub file in .ssh


### Code Usage Instructions
  * **kafka-console-consumer**
```
# Minimum invocation
kafka-console-consumer -topic=test -brokers=kafka1:9092

# It will pick up a KAFKA_PEERS environment variable
export KAFKA_PEERS=kafka1:9092,kafka2:9092,kafka3:9092
kafka-console-consumer -topic=test

# You can specify the offset you want to start at. It can be either
# `oldest`, `newest`. The default is `newest`.
kafka-console-consumer -topic=test -offset=oldest
kafka-console-consumer -topic=test -offset=newest

# You can specify the partition(s) you want to consume as a comma-separated
# list. The default is `all`.
kafka-console-consumer -topic=test -partitions=1,2,3

# Display all command line options
kafka-console-consumer -help
```

  * **kafka-console-producer** 
```
# Minimum invocation
kafka-console-producer -topic=test -value=value -brokers=kafka1:9092

# It will pick up a KAFKA_PEERS environment variable
export KAFKA_PEERS=kafka1:9092,kafka2:9092,kafka3:9092
kafka-console-producer -topic=test -value=value

# It will read the value from stdin by using pipes
echo "hello world" | kafka-console-producer -topic=test

# Specify a key:
echo "hello world" | kafka-console-producer -topic=test -key=key

# Partitioning: by default, kafka-console-producer will partition as follows:
# - manual partitioning if a -partition is provided
# - hash partitioning by key if a -key is provided
# - random partioning otherwise.
#
# You can override this using the -partitioner argument:
echo "hello world" | kafka-console-producer -topic=test -key=key -partitioner=random

# Display all command line options
kafka-console-producer -help
```
