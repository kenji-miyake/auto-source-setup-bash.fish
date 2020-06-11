function __auto_source_setup_bash
    set -q DISABLE_AUTO_SOURCE && return
    set -q AUTO_SOURCE_EXECUTED && return

    set -l directories "devel" "install"

    for directory in $directories
        if test -e $directory/setup.bash
            echo "source $directory/setup.bash"
            bass source $directory/setup.bash
            set -g AUTO_SOURCE_EXECUTED
            return
        end
    end
end
