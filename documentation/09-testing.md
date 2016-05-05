# Testing

Lynis has a developer mode to test your changes. The easiest way to activate is by including the developer profile (developer.prf), included in the Lynis tree.

```
./lynis audit system --profile developer.prf
```

The developer profile will activate developer mode, enable debugging and perform a non-interrupted run.


## Custom Tests

If you only want to test your custom additions, leverage the include/tests_custom file. By default this file is not available, and should be created. There is a template available and you could copy or rename that into *tests_custom*.

## Testing Categories

Lynis allows you to run only a particular category. If you just want to run the tests in your custom file, use the --tests-category option.

```
./lynis audit system --profile developer.prf --tests-category "custom"
```



Got tips how debugging can be done even easier? Let us know in the issue tracker.