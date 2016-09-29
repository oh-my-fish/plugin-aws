function aws -a cmd -d 'Universal CLI for AWS'
  switch "$cmd"
    case profile
      if set -q argv[2]
        set -U aws_profile "$argv[2]"
      else
        echo $aws_profile
      end

    case '*'
      if set -q aws_profile
        command aws --profile $aws_profile $argv
      else
        command aws $argv
      end
  end
end
