# Visual Studio Code Extensions

## Introduction

The main goal of this project is to share the [extensions](./src/assets/doc/extensions.md "Click here to open the file.") installed in VSCode for the development of web applications.

### Before You Begin

The development of this project was done in environment [Linux](https://en.wikipedia.org/wiki/Linux "Press Ctrl and click this link to open the page in a new tab."), using the Operating System [Fedora 29](https://getfedora.org/en/ "Press Ctrl and click this link to open the page in a new tab."). I used [Terminal](https://en.wikipedia.org/wiki/Linux_console "Press Ctrl and click this link to open the page in a new tab.") to run the [commands](https://en.wikipedia.org/wiki/Command_(computing) "Press Ctrl and click this link to open the page in a new tab.") described in this tutorial.

```sh
lsb_release -a  # to check system details
```

When it is necessary to execute a command as [root](https://en.wikipedia.org/wiki/Sudo "Press Ctrl and click this link to open the page in a new tab."), I'll describe the content as follows. Example:

```sh
sudo dnf install xyz  # command example
```

I recommend that you use the Operating System of your choice, adapting the project according to system standards.

> Additional | Editor:
>
> [VSCode](https://code.visualstudio.com/ "Press Ctrl and click this link to open the page in a new tab."): Visual Studio Code is a lightweight but powerful source code editor. \o/

### About Visual Studio Code

> Version: 1.30.1 \
Commit: dea8705087adb1b5e5ae1d9123278e178656186a \
Date: 2018-12-18T18:07:32.870Z \
Electron: 2.0.12 \
Chrome: 61.0.3163.100 \
Node.js: 8.9.3 \
V8: 6.1.534.41 \
OS: Linux x64 4.19.10-300.fc29.x86_64

## Getting Started

### Installation

1 - To execute this project, I recommend that you have some tools installed on your machine. Are they:

- [VSCode](https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions "Press Ctrl and click this link to open the page in a new tab."): Visual Studio Code on Linux - RHEL, Fedora and CentOS based distributions

  ```sh
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

  sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
  ```

  Then update the package cache and install the package using dnf (Fedora 22 and above):

  ```sh
  dnf check-update
  sudo dnf install code
  ```

  _For details on installing extension in VSCode, visit the following website: <https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions>_

---

- [Git](https://git-scm.com/ "Press Ctrl and click this link to open the page in a new tab."): Git is a free and open source distributed version control system.

  ```sh
  git --version  # to print Git version
  ```

  If you need to install Git, use the command:

  ```sh
  sudo dnf install -y git  # to install Git on your operating system
  ```

2 - Clone the project:

```sh
cd ~  # open folder for project creation

git clone git@github.com:apsantos-dev/vscode-extensions.git <NAME-PROJECT>  # SSH

or

git clone https://github.com/apsantos-dev/vscode-extensions.git <NAME-PROJECT> # HTTPS
```

3 - Attributes and permissions:

Change the attributes and permissions of the file: [system.sh](./system.sh "Click to open the project.")

> Be sure to check in which folder this project was cloned.

```sh
sudo chown $USER:$USER ~/<NAME-PROJECT>/system.sh
sudo chmod +x ~/<NAME-PROJECT>/system.sh
```

4 - Finally, running the system:

If all the steps have been performed correctly, just execute the command below to start the system:

```sh
sh ~/<NAME-PROJECT>/system.sh
```

### The file

[Click here](./src/assets/doc/extensions.md "Click here to open the file.") to open the file with the extensions used.

### Structure

See the file and folder [structure](./structure.md "Click and see the project!") for this project.

### Change Log

All notable changes to this project will be documented in the file [CHANGELOG.md](./CHANGELOG.md "Click here to open the file.").

### Contributing

See details on contributing to this project at [CONTRIBUTING.md](./CONTRIBUTING.md "Click here to open the file.").

By contributing to this repository, please first discuss the change you wish to make via email or any other method with the owners of this repository before making a change.

### License

This project is licensed under "[The MIT License (MIT)](https://opensource.org/licenses/MIT "Click and see the project!")" - see the [LICENSE](./LICENSE) file for details.