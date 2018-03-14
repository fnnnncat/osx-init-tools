#/bin/bash
source ./config.sh
source ./func.sh

MSG "set proxy"
export http_proxy=http://fq.mioffice.cn:3128
export https_proxy=http://fq.mioffice.cn:3128

MSG "install xcode command line tools"
xcode-select --install
wait

MSG "install brew"
if [ ! -x "/usr/local/bin/brew" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  wait
else
  MSG "brew has been installed"
fi

MSG "install node && npm"
if [ $(IS_INSTALL node) -eq 0 ];then
  curl -L https://git.io/n-install | bash -s -- -y lts
  wget http://npmjs.org/install.sh -O - | sh

  echo "registry = https://registry.npm.taobao.org" >> $HOME/.npmrc
  echo "electron_mirror=https://npm.taobao.org/mirrors/electron/" >> $HOME/.npmrc
  echo "sass_binary_site=https://npm.taobao.org/mirrors/node-sass/" >> $HOME/.npmrc
  wait
else
  MSG "node has been installed"
fi

MSG "install nginx"
if [ $(IS_INSTALL $1) -eq 0 ]; then
  MSG "installing $1"
  brew install $1
  wait
else
  MSG "$1 has been installed"
fi

# MSG "init .gitignore_global"

# m=""
# for fileName in ${GITIGNORE_GLOBAL[@]}
# do
#   m+=$fileName+"\n"
# done
# echo $m
# echo $m >> ./a.txt
# echo '-----'
# cat ./a.txt

# echo '===='
# cat $HOME/.gitignore_global
# echo '+++++'
# cat $HOME/.gitignore_global ./a.txt | sort | uniq
# cat $HOME/.gitignore_global ./a.txt | sort | uniq > ./a.txt
