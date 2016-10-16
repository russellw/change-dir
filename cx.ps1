function show-help {
	'Change directory, extended'
	'https://github.com/russellw/change-dir'
	''
	'cx <where>'
	''
	'<where> can:'
	'Be a deep subdirectory, skipping intermediate levels'
	'Be a file existing in the destination subdirectory'
	'Contain wildcards'
	''
	'cx'
	'Go back where you last came from'
	''
	'cx .'
	'Remember the current directory'
	exit
}

function show-version {
	'cx version 1'
	exit
}

$arg = $args[0]

if (!$arg) {
	try {
		$d = cat($env:temp + '\cx-last.txt') -erroraction stop
		cd $d
	} catch {}
	exit
}

if ($arg.startswith('/')) {
	$arg = '-' + $arg.substring(1)
}
if ($arg.startswith('--')) {
	$arg = $arg.substring(1)
}
switch ($arg) {
	'-?' {
		show-help
	}
	'-h' {
		show-help
	}
	'-help' {
		show-help
	}
	'-v' {
		show-version
	}
	'-ver' {
		show-version
	}
	'-version' {
		show-version
	}
}

if ($arg.contains(':')) {
	cd '\'
	cd $arg
	exit
}
if ($arg.contains('\')) {
	cd $arg
	exit
}

new-item -type file -path $env:temp -name 'cx-last.txt' -force -value $(pwd) | out-null
if ($arg -eq ".") {
	exit
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
'Not found'
