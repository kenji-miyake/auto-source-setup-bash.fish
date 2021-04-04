set -q AUTO_SOURCE_USE_PREV_SETUP_BASH || set -U AUTO_SOURCE_USE_PREV_SETUP_BASH true
set -q AUTO_SOURCE_BEFORE_SOURCE_COMMAND || set -U AUTO_SOURCE_BEFORE_SOURCE_COMMAND 'echo "source $setup_bash" && set -g AUTO_SOURCE_PREV_ROS_DISTRO $ROS_DISTRO'
set -q AUTO_SOURCE_AFTER_SOURCE_COMMAND || set -U AUTO_SOURCE_AFTER_SOURCE_COMMAND ''

function fish_greeting
    __auto_source_setup_bash
end

function cd
    __cd $argv || return 1
    __auto_source_setup_bash
    return 0
end
