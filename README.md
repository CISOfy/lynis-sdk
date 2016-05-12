# Lynis Software Development Kit

This project has three main goals:
* Provide tips to contributing the Lynis project
* Test the quality of the software
* Get you started with custom tests and plugins


## Getting Started

Development for Lynis is easy, as the tool is written in shell script. Although we use a few external tools, usually you don't need them.

Lynis uses the Bourne shell, usually /bin/sh on your system. Not to be confused with BASH (Bourne Again SHell). By adhering to the Bourne shell, the tool remains portable, and allows it to run on Linux, *BSD, Mac OSX, and others.

*Lesson: portability is important for the project. Every test should be running on different UNIX-derivatives as well.*

### Install Lynis SDK

Go to the directory where you want to develop

cd my/dev/directory

Clone both projects:

```
git clone https://github.com/CISOfy/lynis
git clone https://github.com/CISOfy/lynis-sdk
```

Go to the SDK directory and run the development kit:

```
cd lynis-sdk
./lynis-devkit
```

This will check for the presence of the Lynis tree and show basic details and help.

With this kit you can perform quality checks, and test if everything works as expected. We encourage all developers and contributors to use this kit, especially before creating a pull request.


# Structure

Understanding the structure of the project is an important starting point

## Directory Structure

**lynis-devkit**
Tool to perform a wide range of tests on the Lynis source.

**LICENSE.MD**
The GPLv3 license

**README.MD**
This file

**documentation/**
This directory will host the most important pieces of documentation for development.

**includes/ and unit-tests/**
Components related to lynis-devkit


# Style

Like any programming language, there are different ways to keep a project structured. It ranges from variable names, up to spacing. So we provide some guidelines to keep the structure and flexible enough for further expansion.

See the documentation folder for all details.


# Contribute

We really appreciate contributions.

First fork the project. See [GitHub documentation](https://help.github.com/articles/fork-a-repo/) for the details on how to do this.

* Fork Lynis ( https://github.com/CISOfy/lynis/fork )
* Create your feature branch (git checkout -b adding-my-new-feature)
* Make changes in local tree (change, git add <file>, git commit -m 'Adding some feature or improvement')
* Test changes
* Push to the branch (git push origin adding-my-new-feature)
* Create a pull request

## Tips

Many small pull requests is usually better than one big one. This helps us quicker review the code and assess the possible impact of the change.

To simplify testing, you don't have Lynis to perform all tests. Use --tests-category or --tests to specifically decide what tests to run.

Check your changes, and how it impacts screen output, or execution. Ensure that no "bashism" is used, to prevent it from working on other systems.

During the pull request creation, please please provide a clear description on what the pull request is about (and why). If you have multiple changes to different tests, split them into multiple pull requests. This way it is easier to check and implement them in the master branch.
