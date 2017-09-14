# Seal
[![Build Status](https://travis-ci.org/binaryberry/seal.svg)](https://travis-ci.org/binaryberry/seal)

## What is it?

This is a Slack bot that publishes a team's pull requests to their Slack
Channel, once provided the organisation name and the team members' github names.

![image](https://github.com/binaryberry/seal/blob/master/images/readme/informative.png)
![image](https://github.com/binaryberry/seal/blob/master/images/readme/angry.png)

## How to use it?

### Config file
Fork the repo and add/change the config file that relates to your github
organisation. For example, the CyberArk config file is located at
[config/cyberark.yml](https://github.com/cyberark/seal/blob/master/config/cyberark.yml).

Include your team's name, the Slack channel you want to post to, and optionally
the Github names of your team members if you want to restrict the bot's report
to PRs owned by that team.

### Secrets

In order to run, the bot needs a [Slack Incoming Webhook URL][webhook] and a [GitHub OAuth
token][github-token] with "read" access to your repo. These things are secrets and should not
be put in your repo or in any local files on your machines.

Use [Summon][summon] with any [supported secret provider][provider] to securely
store these secrets and fetch them on demand for the bot like so:

```sh-session
$ docker build -t seal .
$ summon -f config/secrets.yml \
         docker run --rm \
                    -e "SEAL_ORGANIZATION=cyberark" \
                    --env-file @SUMMONENVFILE \
                    seal
```

[summon]: https://cyberark.github.io/summon/
[provider]: https://cyberark.github.io/summon/#providers
[github-token]: https://github.com/settings/tokens
[webhook]: https://slack.com/services/new/incoming-webhook

### Env variables

Another option, which is 12-factor-app ready is to use ENV variables for basically everything. 
In that case you don't need a config file at all.

Divider is ',' (comma) symbol.

In your shell profile, put in:

```sh
export SEAL_ORGANISATION="your_github_organisation"
export GITHUB_TOKEN="get_your_github_token_from_yourgithub_settings"
export SLACK_WEBHOOK="get_your_incoming_webhook_link_for_your_slack_group_channel"
export SLACK_CHANNEL="#whatever-channel-you-prefer"
export GITHUB_MEMBERS="netflash,binaryberry,otheruser"
export GITHUB_USE_LABELS=true
export GITHUB_EXCLUDE_LABELS="[DO NOT MERGE],Don't merge,DO NOT MERGE,Waiting on factcheck,wip"
export SEAL_QUOTES="Everyone should have the opportunity to learn. Don’t be afraid to pick up stories on things you don’t understand and ask for help with them.,Try to pair when possible."
```

### Local testing

To test the script locally, go to Slack and create a channel or private group called "#angry-seal-bot-test" (the Slack webhook you set up should have its channel set to "#angry-seal-bot-test" in the Integration Settings). Then run `./bin/seal.rb your_team_name` in your command line, and you should see the post in the #angry-seal-bot-test channel.

If you don't want to post github pull requests but a random quote from your team's quotes config, run `./bin/seal.rb your_team_name quotes`

### Slack configuration

You should also set up the following custom emojis in Slack:
- :informative_seal:
- :angrier_seal:
- :seal_of_approval:
- :happyseal:
- :halloween_informative_seal:
- :halloween_angrier_seal:
- :halloween_seal_of_approval:
- :festive_season_informative_seal:
- :festive_season_angrier_seal:
- :festive_season_seal_of_approval:
- :manatea:

You can use the images in images/emojis that have the corresponding names.

## License

See the [LICENSE](LICENSE) file for license rights and limitations (MIT).
