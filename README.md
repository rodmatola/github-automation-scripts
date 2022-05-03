# GitHub Automation Scripts

This  repository contains scripts to do automatically some GitHub configurations.

## Requirements

You have two ways to running the scripts from this repo:
1. with VSCode Dev Container (recommended)
1. directly on your machine

### Running with VSCode Dev Container

- [Visual Studio Code](https://code.visualstudio.com/download) with [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) plugin
- [Docker](https://www.docker.com/products/docker-desktop)

### Running directly on your machine

- [Ruby](https://www.ruby-lang.org/en/downloads/) (Already installed in most *nix systems, like Linux and macOs)

### GitHub PAT (Personal Access Token)
To run the script, you **MUST** have a [GitHub PAT (Personal Access Token)](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token). Access the link to a tutorial.

The safest way to use your `PAT` is putting it in your `.bash_profile`, `.zshrc` or another `$PATH` variable. Open one of these files and write

```sh
export GITHUB_TOKEN=your_token
```

To check if `PAT` is in your `$PATH`, type

```sh
echo $GITHUB_TOKEN
```

If the terminal displays your `PAT`, you're ready to go.

## Installation

No need any installation if you fit the above requirements.

## Usage

### Running with VSCode Dev Container

Press `cmd+shift+p` and type `reopen in container`. Press `enter` and wait until the container is ready

### Running directly on your machine

You just need to download the scripts folder.

## Creating a new repository (create_repo.rb)

**You must be inside the `scripts` folder.**

Type
```sh
ruby create_repo.rb
```

It will ask for the name of the repository you want to create.

This script creates automatically a repository on GitHub with the following configuration:

- private repository
- with a initial readme (GitHub default)
- `main` and `dev` branches, protected with the following rules:
  - require pull request reviews with at least 1 approver to merge
  - enforce admins
  - allow force pushes
  - require signed commits to merge

## Updating settings of an existing repository (update_repo.rb)

**You must be inside the `scripts` folder.**

Type
```sh
ruby update_repo.rb
```

It will ask for the name of the repository you want to update. If the repository not exists, it will ask you again until you give an existing name or cancel the process (`ctrl+c`).

## API reference link

<https://docs.GitHub.com/en/rest/reference/repos>
