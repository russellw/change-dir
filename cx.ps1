function show-help {
	"Change directory, extended"
	"https://github.com/russellw/change-dir"
	""
	"cx <where>"
	""
	"<where> can:"
	"Be a deep subdirectory, skipping intermediate levels"
	"Be a file existing in the destination subdirectory"
	"Contain wildcards"
	exit
}

function show-version {
	"cx version 1"
	exit
}

$arg = $args[0]
switch ($arg) {
	"" {
		show-help
	}
	"-?" {
		show-help
	}
	"-h" {
		show-help
	}
	"-help" {
		show-help
	}
	"-v" {
		show-version
	}
	"-ver" {
		show-version
	}
	"-version" {
		show-version
	}
}

$files = ls -r
foreach ($file in $files) {
	if ($file.name -like $arg) {
		echo $file
		if ($file.psiscontainer) {
			cd $file
		} else {
			cd $file.directoryname
		}
		exit
	}
}
"Not found"
