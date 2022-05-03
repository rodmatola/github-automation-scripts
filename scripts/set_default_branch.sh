#!/bin/bash
# shellcheck disable=SC1091

set_default_branch() {
	local NAME=$1
	local branch=$2
	echo '#'
	echo "# Setting $branch as default branch"
	echo '#'
	# https://docs.github.com/pt/rest/reference/repos#update-a-repository
	curl \
		-X PATCH \
		-H "Authorization: token $GITHUB_TOKEN" \
		-H "Accept: application/vnd.github.v3+json" \
		https://api.github.com/repos/"${ORG}"/"${NAME}" \
		-d "{\"default_branch\":\"${branch}\"}"
}

"$@"
