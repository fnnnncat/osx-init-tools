MSG() {
  echo "$(tput setaf 2;tput bold)Message >> $1$(tput sgr0;)"
}

ECHO() {
  echo "$(tput setaf 2;tput bold)Message >> $(tput sgr0;)$1"
}

ERR() {
  echo "$(tput setaf 1;tput bold)Error   >> $1$(tput sgr0)"

  exit 1
}

WARN() {
  echo "$(tput setaf 3;tput bold)WARN    >> $1$(tput sgr0)"
}

SUDORUN() {
  echo $ROOTPASSWORD | /usr/bin/sudo -S $*
}

EXIT() {
  WARN "Save and exit"

  exit 1
}

IS_INSTALL() {
  cmd=$1
  retval=0
  oldIFS=$IFS
  IFS=:

  for directory in $PATH
  do
    if [ -x "$directory/$cmd" ]; then
      retval=1
    fi
  done

  IFS=$oldIFS

  echo $retval
}
