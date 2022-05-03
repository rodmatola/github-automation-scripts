#!/bin/bash
# shellcheck disable=SC1091

create_branch_commit_signature_protection() {
	local NAME=$1
	local branch=$2
	echo '#'
	echo "# ${branch}: create-commit-signature-protection"
	echo '#'
	# https://docs.github.com/pt/rest/reference/repos#create-commit-signature-protection
	curl \
		-X POST \
		-H "Authorization: token $GITHUB_TOKEN" \
		-H "Accept: application/vnd.github.v3+json" \
		https://api.github.com/repos/"${ORG}"/"${NAME}"/branches/"${branch}"/protection/required_signatures
}

"$@"
