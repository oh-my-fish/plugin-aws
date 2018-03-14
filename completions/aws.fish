function __aws_complete
  if set -q aws_completer_path
    set -lx COMP_SHELL fish
    set -lx COMP_LINE (commandline -opc)

    if string match -q -- "-*" (commandline -opt)
      set COMP_LINE $COMP_LINE -
    end

    eval $aws_completer_path | command sed 's/ $//'
  end
end

function __aws_complete_profile
  command sed -n "s/^\[\(profile[[:space:]]*\)*\(.*\)\]/\2/p" "$HOME/.aws/config" "$HOME/.aws/credentials" | sort | uniq
end

complete --command aws --no-files --arguments '(__aws_complete)'
complete --command aws --no-files --condition 'test (count (commandline -opc)) -lt 2' --arguments profile -d 'Get or set current profile'
complete --command aws --no-files --condition '__fish_seen_subcommand_from profile' --arguments '(__aws_complete_profile)'
