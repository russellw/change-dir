These days, it's common for big projects to have subdirectories nested half a dozen levels deep. To do something with a file at the bottom of one of those subdirectories, you have to put together a `cd` command with half a dozen path components; even with tab completion, this is inconvenient. `cx` solves this problem.

### Skip intermediate directories

Given

```
first\second\third
```

Instead of

```
cd first\second\third
```

Type

```
cx third
```

### Go to the location of a file

Given

```
first\second\third\file.txt
```

Instead of

```
cd first\second\third
```

Type

```
cx file.txt
```

### Use wild cards

Given

```
first\second\third-subdirectory-with-long-name
```

Instead of

```
cd first\second\third
```

Type

```
cx third*
```
