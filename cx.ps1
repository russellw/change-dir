$files = ls -r
foreach ($file in $files) {
	if ($file.name -like $args[0]) {
		echo $file
		if ($file.psiscontainer) {
			cd $file
		} else {
			cd $file.directoryname
		}
		exit
	}
}
