function __auto_source_setup_bash
    set -q DISABLE_AUTO_SOURCE && return
    set -q AUTO_SOURCE_EXECUTED && return

    set -l setup_bash (__auto_source_find_setup_bash) || return

    echo "source $setup_bash"
    bass source $setup_bash
    set -g AUTO_SOURCE_EXECUTED
end
