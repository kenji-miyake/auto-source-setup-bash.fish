function fish_greeting
    __auto_source_setup_bash
end

function cd
    builtin cd $argv
    __auto_source_setup_bash
end
