function aws -a cmd -d 'Universal CLI for AWS'
  switch "$cmd"
    case profile
      if set -q argv[2]
        set -gx AWS_DEFAULT_PROFILE "$argv[2]"
      else if set -q FILTER
        aws profiles | command env $FILTER | read -gx AWS_DEFAULT_PROFILE
        echo $AWS_DEFAULT_PROFILE
      else
        echo $AWS_DEFAULT_PROFILE
      end

    case profiles
      command sed -n -e 's/^\[\(.*\)\]/\1/p' "$HOME/.aws/credentials"

    case '*'
      command aws $argv
  end
end
