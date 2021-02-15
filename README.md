# todoq - a todo queue

A lightweight todo queue manager.

> First in, first out

## Examples

### Add new tasks

```
$ todoq -a install todoq today
```

```
$ todoq -a '
multiple
lines
are
converted
to
one
line'
```

### Show the current task

```
$ todoq
install todoq today
```

### List all tasks

```
$ todoq -l
install todoq today
multiple lines are converted to one line
```

### Remove a task (mark as done)

```
$ todoq -d
```

```
$ todoq
multiple lines are converted to one line
```

### Clear all tasks

```
$ todoq -c
```

## Install

```
# make install
```

## Uninstall

```
# make uninstall
```

The tasks are stored in `$HOME/.todo_queue` file.
