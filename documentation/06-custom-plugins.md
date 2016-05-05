# Structure

Understanding the structure of the project is an important starting point.

## Directories
In the tarball and on GitHub, you will see just a few directories.

### Root directory
The most important files, like the Lynis script itself, can be found in the root of the directory. It will include other things like the man page, documentation and changelog.

### Include directory
The directory is named "include", as more intelligence is included (or sourced) by the main script. This way it can import functions, initialize variables, and show the report. Also the individual tests are stored in this directory. They are grouped by category. This directory is definitely where most of the magic happens.

### Extra directory
Supporting documents and scripts are stored here.

# Style

Like any programming language, there are different ways to keep a project structured. It ranges from variable names, up to spacing. So we provide some guidelines to keep the structure and flexible enough for further expansion.

* Indentation is done with 4 spaces (no tabs)
* Variables are capitalized, optional with an underscore to "split" words


# Contribute

First step to contributing via GitHub, is by [forking](https://help.github.com/articles/fork-a-repo/) the project. This creates a local version for you to experiment.

* Fork it ( https://github.com/CISOfy/lynis/fork )
* Create your feature branch (git checkout -b adding-my-new-feature)

##  Making changes

Next step is making your local changes and test them.

**Tip:** To simplify testing, you don't have Lynis to perform all tests. Use --tests-category or --tests to specifically decide what tests to run.

After you are done, commit the changes: (git commit -am 'Adding some feature or improvement')

##  Testing

To improve the quality of your changes, tests should limit the amount of screen output. Important details should be logged to the log file, using the `logtext` function.

##  Send in your changes

Last step is creating a pull request. Provide a clear description on what the pull request is about (and why). If you have multiple changes to different tests, split them into multiple pull requests. This way it is easier to check and implement them in the master branch.

* Push to the branch (git push origin adding-my-new-feature)
* Create a new Pull Request

We perform regular linting on the code to keep.




## Directory Structure

lynis-devkit
Tool to perform a wide range of tests on the Lynis source.

LICENSE.MD
The GPLv3 license

README.MD
This file

docs/
This directory will host the most important pieces of documentation.

includes/  
unit-tests/
Components related to lynis-devkit
