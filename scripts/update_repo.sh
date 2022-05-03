#!/bin/bash
# shellcheck disable=SC1091

source ./branch_protection.sh
source ./create_branch_commit_signature_protection.sh
source ./create_dev_branch.sh
source ./delete_cloned_repo.sh

update_repo() {
	local NAME=$1
	export REPO=$NAME

	branch_protection "$NAME" "main"
	create_branch_commit_signature_protection "$NAME" "main"
	create_dev_branch "$NAME"
	branch_protection "$NAME" "dev"
	create_branch_commit_signature_protection "$NAME" "dev"
	delete_cloned_repo "$NAME"
}

"$@"
