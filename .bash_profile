[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

motivate

cd() {
  if builtin cd "$@" 3>&2 2>/dev/null; then
     : 
    else
      if builtin cd "$HOME/$1" 3>&2 2>/dev/null;then
        echo -e "\e[92m$1 exists in home directory going there\e[39m"
      else
        echo -e "\e[31mbash: cd $1 No such file or directory"
      fi
  fi
	IFS="/"; declare -a Array=($PWD) 
	export PS1="\e[34m${Array[-1]} \e[39m\$ "
  unset IFS
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
if [ -e /home/deon/.nix-profile/etc/profile.d/nix.sh ]; then . /home/deon/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer


eval "$(direnv hook bash)"
