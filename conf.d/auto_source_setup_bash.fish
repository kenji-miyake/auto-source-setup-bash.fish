set -q AUTO_SOURCE_USE_PREV_SETUP_BASH || set -U AUTO_SOURCE_USE_PREV_SETUP_BASH true

function fish_greeting
    __auto_source_setup_bash
end

function cd
    __cd $argv
    __auto_source_setup_bash
end
