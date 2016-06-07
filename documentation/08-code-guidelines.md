# Code Guidelines

Like any programming language, there are different ways to keep a project structured. It ranges from variable names, up to spacing. So we provide some guidelines to keep the structure and flexible enough for further expansion.

The Lynis project uses the following guidelines:

## Comments

Every routine or file should have a fair number of comments. It is a fine balance between providing clarity to the reader, without overdoing it. Within the Lynis project we added a header to specify the main purpose of each file. Where applicable, functions are documented when they are not very short, or have a very specific way of testing things. This helps the reader to understand why things are done in a particular way. This includes exceptions and edge cases of some operating systems. Functions can also include details with the expected arguments, usage of variables, or the output returned. Mark any temporary solutions with "TODO", to clearly show it is functional code which can be further improved, or a container for future additions.

## Formatting

### Identation
Indentation is 4 spaces to achieve maximum readability. Do not use tabs, as they are interpreted differently in editors. 

### Long lines
For good readability we try to keep line length at a maximum of 80 characters. Long strings and lines should therefore be trimmed down, or split over multiple lines.

### Pipelines
Command chains (using "pipes", or |) should be done on a single line, unless the line gets too long (80+ characters). In such case split the command chain per command.

```# Normal
command1 | command2

# Long command
command1 \
  | command2 \
  | command3
```

## Naming Conventions

### Variables

All variables are in capital letters, with an underscore as word separator.

Examples:
*FOUND*
*SEARCH_DIRECTORY*



### Functions

Functions use CamelCase with each word having its first letter uppercased. This way no external commands or built-ins of the shell will be used.

Functions should be stored in include/functions as much as possible

# Style

* Indentation is done with 4 spaces (no tabs)
* Variables are capitalized, optional with an underscore to "split" words


