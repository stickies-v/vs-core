# VS Core

> [!WARNING]
> This project is in a very experimental stage. Please [open an Issue](https://github.com/stickies-v/vs-core/issues/new/choose) if you encounter any problems.

VS Core is a batteries-included development environment for Bitcoin Core, based on VS Code and Docker.

It allows the developer to run VS Code locally and attach it to a (local) Docker container with all the dependencies and tooling readily configured.

Besides providing an easy-to-setup environment, it also has some built-in automation to try and help avoid basic pitfalls when opening a Pull Request on the main Bitcoin Core GitHub repository, such as running the linter, unit and functional tests before pushing code.

## Who's it for
VS Core is most likely to be helpful for you if:
- you have already used and installed VS Code and Docker
- you're interested in the Bitcoin Core project and want to get more familiar with the code, tinker around, and maybe even open your first pull request
- you're an experienced developer that wants to do a one-off contribution to the project but don't want to figure out all the environment setup and just need something quickly that works well enough

VS Core is most likely *not* for you if:
- you're not a developer
- you've already been contributing to Bitcoin Core for a while and have probably figured out a setup that works well for you
- you don't like VS Code, Docker, or using an automated workflow that you didn't setup yourself

## Prerequisites
- git
- [Docker and Docker Compose](https://docs.docker.com/compose/install/)
- [VS Code](https://code.visualstudio.com/)
- [VS Code Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- System requirements: see [Dev Containers documentation](https://code.visualstudio.com/docs/devcontainers/containers#_system-requirements)

> [!WARNING] 
> A 4GB RAMdisk is automatically created (to speed up the functional tests) for the entire duration of the container lifetime. This will be parameterized in the future, in the meantime, please only run this when you have sufficient RAM available.

## How to use

### Initial setup

Only a few steps are needed to get your dev environment setup. 

> [!IMPORTANT]
> Please make sure you've checked and installed all the [prerequisites](#prerequisites). The Dev Containers documentation offers [a helpful installation guide](https://code.visualstudio.com/docs/devcontainers/containers#_installation).

First, we'll clone this repo to get the required configuration and scripts available locally.

```
git clone https://github.com/stickies-v/vs-core
```

Open VS Code in the newly created `vs-core` directory. If you have the [`code` command installed](https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line), you can do this on the terminal too:

```
cd vs-core/
code .
```

Ensure Docker is running. If the Dev Containers extension [is properly installed](#prerequisites), VS Code should automatically detect the .devcontainers folder and suggest to "Reopen in Container", which is what you want to do. If you don't see that suggestion, [open the command palette](https://code.visualstudio.com/docs/getstarted/tips-and-tricks#_command-palette), and run "Dev Containers: Reopen in Container".

At this stage, you should see a new window of VS Code pop up, with the notification `Starting Dev Container`. Click "Show log" to see the progress of the initialization process. The first run will take quite long, as we're building the Docker container (including all dependencies) and initializing the workspace by cloning the Bitcoin Core repo.

> [!NOTE]
> If the setup fails, these may be helpful steps to understand what's happening:
>
> We use docker compose to build the dev container. Running the command manually, we can surface more detailed error messages:
> ```
> cd .devcontainer
> docker compose build
> ```

### Daily usage

For subsequent runs, you can keep using the "Reopen in Container" command in VS Code, as explained in the previous step. Optionally, you can [install the `devcontainer` cli](https://code.visualstudio.com/docs/devcontainers/devcontainer-cli#_installation) to make accessing the dev environment slightly more straightforward. Once that's done, simply navigate to the `vs-core` directory and run `devcontainer open` to pick up where you left off.

*Note: `devcontainer` cli provides less useful (or no) error messages compared to the VS Code GUI. For example, it will fail silently if you try to run `devcontainer` without docker already running in the background.*

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