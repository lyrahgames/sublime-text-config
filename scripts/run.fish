# Start Sublime Text and wait a little bit.
# Otherwise, following Sublime Text commands will not be executed.
subl && sleep 1s

# Install Package Control.
subl --command install_package_control

set -l sublime_text_config_dir $HOME/.config/sublime-text
set -l sublime_text_user_dir $sublime_text_config_dir/Packages/User
mkdir -p $sublime_text_user_dir
cp config/* $sublime_text_user_dir/.
