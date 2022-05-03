#!/bin/bash
# shellcheck disable=SC1091

source ./branch_protection.sh
source ./create_branch_commit_signature_protection.sh
source ./create_dev_branch.sh
source ./delete_cloned_repo.sh

read -r -p "what is your organization name? " ORG
read -r -p "what is the repository name? " NAME
export ORG=$ORG
export REPO=$NAME

echo '#'
echo "# Creating ${NAME} repository..."
echo '#'
# https://docs.github.com/pt/rest/reference/repos#create-an-organization-repository
curl \
	-X POST \
	-H "Authorization: token $GITHUB_TOKEN" \
	-H "Accept: application/vnd.github.v3+json" \
	https://api.github.com/orgs/"${ORG}"/repos \
	-d '{
		"name": "'"${NAME}"'",
		"private": true,
		"auto_init": true
		}'

branch_protection "$NAME" "main"
# create_branch_commit_signature_protection "$NAME" "main"
create_dev_branch "$NAME"
branch_protection "$NAME" "dev"
# create_branch_commit_signature_protection "$NAME" "dev"
delete_cloned_repo "$NAME"
