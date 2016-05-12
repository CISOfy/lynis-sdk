# Unit Tests

It is common to change main components in a program. Such changes are needed to improve the functionality, or simplify things.
The downside is that sometimes things might break. To detect them as early as possible, we use unit tests.

## Focus Areas

Each unit test has a particular target area to check. Such area could be a function.

## New Tests

When major features are added, or new functions are introduced, they should be tested properly. The Lynis project prefers to have a unit test in such case as well.

## Automation

Unit tests can be performed with the `lynis-devkit` tool. It will automatically be triggered when a new push is done to the GitHub repository.
