These days, it's common for big projects to have subdirectories nested half a dozen levels deep. To do something with a file at the bottom of one of those subdirectories, you have to put together a `cd` command with half a dozen path components; even with tab completion, this is inconvenient. `cx` solves this problem.

### Skip intermediate directories

Given

```
first\second\third
```

Instead of:

```
cd first\second\third
```

Type:

```
cx third
```

### Go to the location of a file

Given

```
first\second\third\file.txt
```

Instead of:

```
cd first\second\third
```

Type:

```
cx file.txt
```

### Use wild cards

Given

```
first\second\third-subdirectory-with-long-name
```

Instead of:

```
cd first\second\third
```

Type:

```
cx third*
```

### Go back where you last came from

An unadorned

```
cx
```

goes back to the last remembered directory.

```
cx .
```

remembers the current directory.

### Eliminate hidden state between drives

Windows tracks current directory separately for each drive letter; this hidden state creates opportunities to make mistakes when performing file operations between multiple drives.

```
cx d:foo
```

changes to the root directory of the drive you are currently on, before going to the destination drive.
