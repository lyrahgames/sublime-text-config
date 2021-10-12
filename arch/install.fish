function sync_repo
  set -l repo_name "sublime-text"
  if pacman -Sl $repo_name > /dev/null
    echo "INFO: Repository '$repo_name' has already been added."
  else
    echo "INFO: Repository '$repo_name' has not been added, yet."
    echo "INFO: Installing GPG key for Sublime Text pacman repository." \
      && curl -O https://download.sublimetext.com/sublimehq-pub.gpg \
      && sudo pacman-key --add sublimehq-pub.gpg \
      && sudo pacman-key --lsign-key 8A8F901A \
      && rm sublimehq-pub.gpg

    set -l channel stable
    set -l arch x86_64
    echo "INFO: Adding Sublime Text pacman repository to '/etc/pacman.conf'"
    echo -e "\n[$repo_name]\nServer = https://download.sublimetext.com/arch/$channel/$arch" \
      | sudo tee -a /etc/pacman.conf
    # Refresh repositories.
    sudo pacman -S --refresh
  end
end

function install
  sync_repo
  sudo pacman -S --needed --noconfirm sublime-text
end
