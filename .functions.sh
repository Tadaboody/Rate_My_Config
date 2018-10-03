markdown_preview(){
	markdown_py $1 | lynx -dump -stdin
}

git_feature_branch() {
    ( [ -z "$2" ] && echo $2 ) || clippaste|python3 -c "print('_'.join(input().split()) + '$1')"|xargs git checkout -b
}
