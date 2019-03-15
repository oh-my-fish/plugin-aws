function __aws_complete_root
  test (count (commandline -o)) = 1
end

function __aws_complete
  if set -q aws_completer_path
    set -lx COMP_SHELL fish
    set -lx COMP_LINE (commandline)

    eval $aws_completer_path | command sed 's/ $//'
  end
end

complete --command aws --no-files --arguments '(__aws_complete)'
complete --command aws --no-files --condition '__aws_complete_root' --arguments profile -d 'Get or set current profile'
complete --command aws --no-files --condition '__fish_seen_subcommand_from profile' --arguments '(aws profiles)'
