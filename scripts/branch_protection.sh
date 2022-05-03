#!/bin/bash
# shellcheck disable=SC1091

branch_protection() {
	local NAME=$1
	local branch=$2
	echo '#'
	echo "# ${branch}: update-branch-protection"
	echo '#'
	# https://docs.github.com/pt/rest/reference/repos#update-branch-protection
	curl \
		-X PUT \
		-H "Authorization: token $GITHUB_TOKEN" \
		-H "Accept: application/vnd.github.v3+json" \
		https://api.github.com/repos/"${ORG}"/"${NAME}"/branches/"${branch}"/protection \
		-d '{
			"required_status_checks": null,
			"enforce_admins": true,
			"required_pull_request_reviews": {
				"required_approving_review_count": 1
			},
			"restrictions": null,
			"allow_force_pushes": true
		}'
}

"$@"
