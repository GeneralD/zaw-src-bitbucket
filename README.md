# zaw-src-bitbucket

Optional sources of [zaw](https://github.com/zsh-users/zaw) for Bitbucket:

- bitbucket

It shows list of your repositories on Bitbucket and clones repo you choose.

## Installation

If you are using zplug, just add the code below in your .zshrc.

```zsh
zplug "zsh-users/zaw"
zplug "GeneralD/zaw-src-bitbucket", on:zsh-users/zaw, defer:2
```

For oh-my-zsh, clone this repo into ~/.oh-my-zsh/custom/plugins and add plugin as below.

```zsh
plugins+=(zaw zaw-src-bitbucket)
```

## Customize

If you have a config file ~/.bitbucket as below, username and password will be loaded from it.

```
[auth]
username = GeneralD
password = xxxxxxxxxxxxx

[options]
scm = git
protocol = ssh
```

Furthermore, you can override if you want.

```zsh
ZAW_BITBUCKET_USER=GeneralD
ZAW_BITBUCKET_PASSWORD=xxxxxxxxxxxxx
```

## Dependencies

- jq

If you are using macOS, you can install with,

```sh
brew install jq
```

- any nerd-font

This zaw source shows characters of nerd-font.
You can search compatible font with,

```sh
brew cask search nerd-font
```

Then, install and set any nerd-font to your terminal application.
