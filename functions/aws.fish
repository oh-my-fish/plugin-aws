function aws -a cmd -d 'Universal CLI for AWS'
  switch "$cmd"
    case profile
      if set -q argv[2]
        set -gx AWS_PROFILE "$argv[2]"
      else if set -q FILTER
        aws profiles | command env $FILTER | read -gx AWS_PROFILE
        echo $AWS_PROFILE
      else
        echo $AWS_PROFILE
      end

    case profiles
      command sed -n "s/^\[\(profile[[:space:]]*\)*\(.*\)\]/\2/p" "$HOME/.aws/config" "$HOME/.aws/credentials" | sort | uniq

    case '*'
      command aws $argv
  end
end
