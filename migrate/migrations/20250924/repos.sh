#!/bin/bash
gh repo list cloudposse-github-actions --limit 500 --json name,owner \
    --jq '.[] | select(.name | test("^.github") | not) | select(.name | test("^security") | not) | select(.name | test("^test") | not) | .owner.login + "/" + .name' > repos.txt

split -d -l 16 repos.txt repos-
