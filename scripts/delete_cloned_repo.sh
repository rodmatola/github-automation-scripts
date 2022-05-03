#!/bin/bash
# shellcheck disable=SC1091

delete_cloned_repo() {
	local NAME=$1

	rm -rf "$NAME"
}

"$@"
