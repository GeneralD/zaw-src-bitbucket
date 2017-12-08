#!/usr/bin/env zsh

function zaw-src-bitbucket() {
    if which jq 1>/dev/null || brew install jq
    local space=$'\uf116'
    local bitbucket=$'\uf171'
    local index
    [[ $BITBUCKET_SCM == 'git' ]] && index=1 || index=0
    local l=`\curl -s "https://api.bitbucket.org/2.0/repositories/${ZAW_BITBUCKET_USER}?role=owner&pagelen=100" -u "${ZAW_BITBUCKET_USER}:${ZAW_BITBUCKET_PASSWORD}"`
    candidates=(`echo $l | \jq --raw-output ".values[].links.clone[$index].href"`)
    cand_descriptions=(`echo $l | \jq --raw-output '.values[].full_name' | sed "s/^/${bitbucket}${space}/g"`)

    if which ghq 1>/dev/null; then
        actions=('zaw-src-bitbucket-ghq')
        act_descriptions=('ghq get')
    fi

    actions+=('zaw-src-bitbucket-clone' 'zaw-src-bitbucket-browse' 'zaw-callback-append-to-buffer' 'zaw-callback-replace-buffer')
    act_descriptions+=('git clone' 'browse' 'append to edit buffer' 'replace edit buffer')
}

function zaw-src-bitbucket-ghq() {
    BUFFER="ghq get ${(j:; :)@}"
    zle accept-line
}

function zaw-src-bitbucket-clone() {
    BUFFER="git clone ${(j:; :)@}"
    zle accept-line
}

function zaw-src-bitbucket-browse() {
    local repo=`echo ${(j:; :)@} | egrep -o "[/:][^/]+/[^/.]+.git$" | cut -f 1 -d '.' | sed 's/^[:\/]//g'`
    BUFFER="open https://bitbucket.org/$repo"
    zle accept-line
}

zaw-register-src -n bitbucket zaw-src-bitbucket
