#!/usr/bin/env zsh

ZAW_BITBUCKET_USER=${ZAW_BITBUCKET_USER:-`\cat .bitbucket 2>/dev/null | \grep username | \awk '{ print $NF }'`}
ZAW_BITBUCKET_PASSWORD=${ZAW_BITBUCKET_PASSWORD:-`\cat .bitbucket 2>/dev/null | \grep password | \awk '{ print $NF }'`}
