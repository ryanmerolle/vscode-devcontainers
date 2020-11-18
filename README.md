# vscode-devcontainers

## Intro

Devcontainers is a feature of VS Code and the Remote Container extension for VS Code that allows develop within a container.  The reason to develop in a container is mostly to better standardize the overall workflow of development among your various devices and with other collaborating developers.

If a project standardizes around development containers, we minimize the need to troubleshoot every individual's unique system issues.  IE no more troubleshooting python package versions, OS config issues, OS package issues, or etc.

There are obviously trade offs here, but I rather troubleshoot standard docker or VS Code issues.

Resources:

- [Josh V - Docker for Automation Envrionment Ansible 2.10](https://josh-v.com/blog/2020/06/27/docker_for_automation_environment_ansible_210.html)
- [YouTube - VS Code tips: Dev containers and the remote containers extension](https://www.youtube.com/watch?v=M94xLiyKCyg)
- [VS Code - Remote development in Containers](https://code.visualstudio.com/docs/remote/containers-tutorial)
- [Packet Flow - A Beginners Guide to Docker and VS Code (Part 1)](https://www.packetflow.co.uk/a-beginners-guide-to-docker-and-vs-code-part-1/)
- [Packet Flow - A Beginners Guide to Docker and VS Code (Part 2))](https://www.packetflow.co.uk/a-beginners-guide-to-docker-and-vs-code-part-2/)
- [Arista - How to use AVD image with VSCODE](https://github.com/arista-netdevops-community/docker-avd-base/blob/master/docs/avd-vscode-docker.md)

A collection of VS Code devcontainer examples for:

- Local image builds using Dockerfile for single containers
- Pre-built docker images (locally or via a repo like dockerhub) for single containers
- Multi-container topologies using pre-built docker images via docker-compose

## Using this Repo

1.) Install VS Code

2.) Install VS Code Extension Pack: `ms-vscode-remote.vscode-remote-extensionpack`

3.) Copy relevant example directory to your development directory in a new directory named `.devcontainer`

Example:

```bash
# Clone the Repo
cd ~
git clone git@github.com:ryanmerolle/vscode-devcontainers.git

# Create your workspace if not already existing
mkdir projects
cd projects

# Copy desired devcontainters example into the worksplace directory under .devcontainer
mkdir .devcontainer
cp -a ~/vscode-devcontainers/Dockerfile/netdev/. .devcontainer/

# Start VS Code
code .

```

4.) Once VS Code is open, it should recognize the .devcontainer directory and required files.  You should be prompted to reopen in container.  Click that button.  If you are not prompted, hit the F1 key and type `Remote-Containers: Rebuild and Reopen in Container` in the quick command window.

__Final Result__: VS Code will then load, with your full terminal presenting in the container (file browser, terminal, etc)

## Next Steps

- Automate & publish the build of my custom netdev container (my own custom container).
- Add instructions for building a virtual lab using and interacting with containerized IOS, EOS, NXOS, JUNOS, etc.
- Investigate re-using or building new containers for CI/CD of python and ansible.
