markdown_preview(){
	markdown_py $1 | lynx -dump -stdin
}

git_feature_branch() {
    # Adds a new git branch named [name_with_underscores_$1]. name is either in clipboard or given as a second argument
    (( [ "$2" ] && echo $2 ) || clippaste )|python3 -c "print('_'.join(input().split()) + '_$1')"|xargs git checkout -b
}

current_dir(){
    # Prints the dirname (final part) of the cwd
    echo ${PWD##*/}
}

init_venv(){
    # Creates a py3 venv in a directory called venv with the cli prompt of the cwd's dirname
    python3 -m venv venv --prompt $(current_dir)
    echo "source venv/bin/activate" >>.env
    source .env
}
