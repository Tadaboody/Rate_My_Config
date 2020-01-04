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

git_delete_gone_branches()
{
    git branch -v|grep gone|awk '{print $1}'|xargs git branch -d
}

# Registers your identity at an ssh server so you never need to write your password again
ssh_register_key(){
    # Creates a .ssh folder if it doesn't exist (Can it not exist on an ssh server?)
    mkdir -p ~/ssh 2>/dev/null
    # Adds my public ssh key to the given ssh server
    cat ~/.ssh/id_rsa.pub | ssh $1 'cat >> ~/.ssh/authorized_keys'
}

# Wrapper to allow base awk usage with leaner syntax
awker() {
    awk "{print \$$1}"
}

add_to_path() {
    if [ ! -d "$1" ]; then
        echo "Argument isn't a directory, not adding"
        ret 1
    fi
    echo "export PATH=$1;$PATH" >>.path
}
