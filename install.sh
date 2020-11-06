#!/bin/bash
sudo apt -y update
sudo apt -y upgrade


sudo add-apt-repository universe

sudo apt update

sudo apt install -y libcurl4-openssl-dev
sudo apt install -y libssl-dev
sudo apt install -y jq
sudo apt install -y ruby-full
sudo apt install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt install -y build-essential libssl-dev libffi-dev python-dev
sudo apt install -y python-setuptools
sudo apt install -y libldns-dev
sudo apt install -y python3-pip
sudo apt install -y python-pip
sudo apt install -y python-dnspython
sudo apt install -y git
sudo apt install -y rename
sudo apt install -y xargs
sudo apt install -y gcc make libpcap-dev
sudo apt install -y chromium-browser

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt -y install ./google-chrome-stable_current_amd64.deb

rm https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py
sudo python2 get-pip.py

export VT_API_KEY=fa8d690606768aeddef7c0c363507fc7ccbc7947f3e38a82df79e6ba77c9f60d


echo "installing bash_profile aliases from recon_profile"
git clone https://github.com/SoufianeAbbad/recon_profile.git
cd recon_profile
cat .bash_profile >> ~/.bash_profile
source ~/.bash_profile
echo "done"



#install go
if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					echo "Installing Golang"
					wget https://dl.google.com/go/go1.15.4.linux-amd64.tar.gz
					sudo tar -xvf go1.15.4.linux-amd64.tar.gz
					sudo mv go /usr/local
					export GOROOT=/usr/local/go
					export GOPATH=$HOME/go
					export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
					echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
					echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
					echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
					source ~/.bash_profile
					sleep 1
					break
					;;
				no)
					echo "Please install go and rerun this script"
					echo "Aborting installation..."
					exit 1
					;;
	esac	
done
fi


#create a tools folder in ~/
mkdir ~/tools
cd ~/tools/


echo "installing dirsearch"
git clone https://github.com/maurosoria/dirsearch.git
cd ~/tools/
echo "done"

echo "installing virtual host discovery"
git clone https://github.com/jobertabma/virtual-host-discovery.git
cd ~/tools/
echo "done"

echo "installing nmap"
sudo apt install -y nmap
echo "done"

echo "installing massdns"
git clone https://github.com/blechschmidt/massdns.git
cd ~/tools/massdns
make
cd /bin 
mv massdns /usr/bin
cd ~/tools/
echo "done"

echo "installing asnlookup"
git clone https://github.com/yassineaboukir/asnlookup.git
cd ~/tools/asnlookup
pip install -r requirements.txt
cd ~/tools/
echo "done"

echo "installing Arjun"
git clone https://github.com/s0md3v/Arjun.git
cd ~/tools/
echo "done"

echo "installing meg"
go get -u github.com/tomnomnom/meg
echo "done"

echo "installing assetfinder"
go get -u github.com/tomnomnom/assetfinder
echo "done"

echo "installing gau"
GO111MODULE=on go get -u -v github.com/lc/gau
echo "done"

echo "installing httprobe"
go get -u github.com/tomnomnom/httprobe
echo "done"

echo "installing qsreplace"
go get -u github.com/tomnomnom/qsreplace
echo "done"

echo "installing unfurl"
go get -u github.com/tomnomnom/unfurl
echo "done"

echo "installing waybackurls"
go get github.com/tomnomnom/waybackurls
echo "done"

echo "installing urinteresting"
go get github.com/tomnomnom/hacks/urinteresting
echo "done"

echo "installing html-comments"
go get -u github.com/tomnomnom/hacks/html-comments
echo "done"

echo "installing geteventlisteners"
go get -u github.com/tomnomnom/hacks/geteventlisteners
echo "done"

echo "installing get-title"
go get -u github.com/tomnomnom/hacks/get-title
echo "done"

echo "installing HTML-tool"
go get -u github.com/tomnomnom/hacks/html-tool
echo "done"

echo "installing gowitness"
go get -u github.com/sensepost/gowitness
echo "done"

echo "installing ffuf"
go get -u github.com/ffuf/ffuf
echo "done"

echo "installing gau"
GO111MODULE=on go get -u -v github.com/lc/gau
echo "done"



echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up in ~/tools"
ls -la
