#!/bin/bash
# shellcheck disable=SC1091

create_dev_branch() {
	local NAME=$1

	git clone https://github.com/"${ORG}"/"${NAME}".git
	cd "$NAME" || exit

	echo '#'
	echo "# Creating dev branch..."
	echo '#'
	git checkout -b dev
	git push origin dev

	sleep 2
	cd ..
}

"$@"
