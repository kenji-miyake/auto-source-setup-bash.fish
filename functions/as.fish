function as
    set setup_bash (__auto_source_find_setup_bash)

    if $AUTO_SOURCE_USE_PREV_SETUP_BASH && test (pwd) = "$HOME" && not test -e "$setup_bash"
        set setup_bash $AUTO_SOURCE_PREV_SETUP_BASH
    end

    test -e "$setup_bash" || return

    set -U AUTO_SOURCE_PREV_SETUP_BASH $setup_bash

    eval $AUTO_SOURCE_BEFORE_SOURCE_COMMAND
    bass source $setup_bash
    eval $AUTO_SOURCE_AFTER_SOURCE_COMMAND

    set -g AUTO_SOURCE_EXECUTED
end
