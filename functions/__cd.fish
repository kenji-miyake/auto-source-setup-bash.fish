# Copy from https://github.com/fish-shell/fish-shell/blob/master/share/functions/cd.fish and rename to __cd

# Fish is a smart and user-friendly command line shell.
#
# Copyright (C) 2005-2009 Axel Liljencrantz
# Copyright (C) 2009-2020 fish-shell contributors
#
# fish is free software.
#
# Most of fish is licensed under the GNU General Public License version 2, and
# you can redistribute it and/or modify it under the terms of the GNU GPL as
# published by the Free Software Foundation.
#
# fish also includes software licensed under the GNU Lesser General Public
# License version 2, the OpenBSD license, the ISC license, and the NetBSD license.
#
# Full licensing information is contained in doc_src/license.hdr.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
# more details.

#
# Wrap the builtin cd command to maintain directory history.
#
function __cd --description "Change directory"
    set -l MAX_DIR_HIST 25

    if test (count $argv) -gt (test "$argv[1]" = "--" && echo 2 || echo 1)
        printf "%s\n" (_ "Too many args for cd command")
        return 1
    end

    # Skip history in subshells.
    if status --is-command-substitution
        builtin cd $argv
        return $status
    end

    # Avoid set completions.
    set -l previous $PWD

    if test "$argv" = -
        if test "$__fish_cd_direction" = next
            nextd
        else
            prevd
        end
        return $status
    end

    # allow explicit "cd ." if the mount-point became stale in the meantime
    if test "$argv" = "."
        cd "$PWD"
        return $status
    end

    builtin cd $argv
    set -l cd_status $status

    if test $cd_status -eq 0 -a "$PWD" != "$previous"
        set -q dirprev
        or set -l dirprev
        set -q dirprev[$MAX_DIR_HIST]
        and set -e dirprev[1]

        # If dirprev, dirnext, __fish_cd_direction
        # are set as universal variables, honor their scope.

        set -U -q dirprev
        and set -U -a dirprev $previous
        or set -g -a dirprev $previous

        set -U -q dirnext
        and set -U -e dirnext
        or set -e dirnext

        set -U -q __fish_cd_direction
        and set -U __fish_cd_direction prev
        or set -g __fish_cd_direction prev
    end

    return $cd_status
end
