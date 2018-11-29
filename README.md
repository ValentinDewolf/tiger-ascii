# Tiger Ascii

## Summary

*Tiger Ascii* is a program that displays a running tiger in ascii art on your terminal behind the output of a given command.

## How to use ?

In order to use *Tiger Ascii*, simply redirect any command to the `tiger-ascii.sh` script.
You *will* need to have `bash` installed on your system.

For example:

```
> tree / | ./tiger-ascii.sh
```

Making an alias for the script can be a good idea.

## Known issues

The terminal can stay hidden when the script is killed before the end. In order to make it visible again, type `tput cnorm`.


## Author

Valentin Dewolf
