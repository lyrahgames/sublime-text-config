set -l sublime_text_config_dir $HOME/.config/sublime-text
set -l sublime_text_packages_dir $sublime_text_config_dir/Packages
set -l sublime_text_user_dir $sublime_text_packages_dir/User

# Start Sublime Text and wait a little bit.
# Otherwise, following Sublime Text commands will not be executed.
subl && sleep 5s

# Install Package Control.
subl --command install_package_control && sleep 15s

subl --command exit && sleep 5s

# Copy configurations.
mkdir -p $sublime_text_user_dir
cp config/* $sublime_text_user_dir/.

# Dictionaries
git clone --depth 1 https://github.com/titoBouzout/Dictionaries.git $sublime_text_packages_dir/Dictionaries

subl .
