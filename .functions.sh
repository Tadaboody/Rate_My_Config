markdown_preview(){
	markdown_py $1 | lynx -dump -stdin
}

git_feature_branch() {
    # Adds a new git branch named [name_with_underscores_$1]. name is either in clipboard or given as a second argument
    (( [ "$2" ] && echo $2 ) || clippaste )|python3 -c "print('_'.join(input().split()) + '_$1')"|xargs git checkout -b
}
