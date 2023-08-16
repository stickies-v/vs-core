# VS Core

VS Core is a batteries-included development environment for Bitcoin Core, based on VS Code and Docker.

It allows the developer to run VS Code locally and attach it to a (local) Docker container with all the dependencies and tooling readily configured.

Besides providing an easy-to-setup environment, it also has some built-in automation to try and help avoid basic pitfalls when opening a Pull Request on the main Bitcoin Core GitHub repository, such as running the linter, unit and functional tests before pushing code.

## Who's it for
VS Core is most likely to be helpful for you if:
- you're at least somewhat familiar with an IDE in general
- you're interested in the Bitcoin Core project and want to get more familiar with the code, tinker around, and maybe even open your first pull request
- you're an experienced developer that wants to do a one-off contribution to the project but don't want to figure out all the environment setup and just need something quickly that works well enough

VS Core is most likely *not* for you if:
- you're not a developer
- you've already been contributing to Bitcoin Core for a while and have probably figured out a setup that works well for you
- you don't like VS Code, Docker, or using an automated workflow that you didn't setup yourself

## Prerequisites
- git
- Docker
- [VS Code](https://code.visualstudio.com/)
- [VS Code Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- System requirements: see [Dev Containers documentation](https://code.visualstudio.com/docs/devcontainers/containers#_system-requirements)

> [!WARNING] 
> A 4GB RAMdisk is automatically created (to speed up the functional tests) for the entire duration of the container lifetime. This will be parameterized in the future, in the meantime, please only run this when you have sufficient RAM available.

## How to use

### Initial setup


> [!IMPORTANT]
> Please make sure you've checked and installed all the [prerequisites](#prerequisites).

Only a few steps are needed to get your dev environment setup. 

First, we're going to install the `devcontainer` cli to make accessing the dev environment slightly more straightforward. See the [official instructions](https://code.visualstudio.com/docs/devcontainers/devcontainer-cli#_installation) on how to do that.

Next, we'll clone this repo to get the required configuration and scripts available locally, so we can use the `devcontainer` magic to run all subsequent steps automatically.

```
git clone https://github.com/stickies-v/vs-core
cd vs-core/local/
devcontainer open
```

At this stage, you should see a new window of VS Code pop up, with the notification `Starting Dev Container`. Click "show log" to see the progress of the initialization process. The first run will take quite long, as we're building the Docker container (including all dependencies) and initializing the workspace by cloning the Bitcoin Core repo.

### Daily usage

For subsequent runs, simply navigate to the `vs-core` directory and run `devcontainer open` to pick up where you left off.

You can use the VS Code environment in exactly the same ways that you're used to, and all the data in the `workspace\` directory (as well as some other system volumes, e.g. for `ccache`) will be persisted across re-builds and re-runs. 

All data is stored inside Docker (named) volumes. This means you cannot trivially access data inside the container without attaching to it. For that reason, it is recommended that everything you want to do in your dev environment, you do through VS Code, which has a terminal built-in.


# To Do
- [ ] configurable RAMdisk
- [ ] useful git aliases:
  - [ ] `git pr <pr_number>`>
- [ ] volume size management
- [ ] instructions/script for cleaning up
- [ ] visual debugger
- [ ] reconsider using (optional) bind mount instead of named volume for workspace
- [ ] integrate with build/debug system, default compiler
- [ ] add default extensions for C++ and python
- [ ] consider adding yapf linter