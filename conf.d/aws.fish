set -e aws_profile

if not set -q aws_completer_path
  command -q aws_completer
  and set set -g aws_completer_path (command -s aws_completer)
end
