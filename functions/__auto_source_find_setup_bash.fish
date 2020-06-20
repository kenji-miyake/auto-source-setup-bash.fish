function __auto_source_find_setup_bash
    set -l base_dir (pwd)
    set -l directories "devel" "install"

    while true
        # Find setup_bash
        for directory in $directories
            set setup_bash $base_dir/$directory/setup.bash
            test -e "$setup_bash" && break
        end

        # Check found
        test -e "$setup_bash" && break

        # Check end condition
        set -l parent_dir (dirname $base_dir)
        if [ "$base_dir" = "$parent_dir" ]
            break
        end

        # Process parent directory
        set base_dir $parent_dir
    end

    # Validate
    test -e "$setup_bash" || return 1

    # Output
    printf "%s\n" $setup_bash

    return 0
end
