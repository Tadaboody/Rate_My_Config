function _path_append(){
    export PATH="$PATH:$1"
}
 
# export PATH=$HOME/bin:/usr/local/bin:$PATH
_path_append "/usr/local/opt/mysql-client/bin"
_path_append "/Users/tomer/Library/Python/3.6/bin"
_path_append "$ANDROID_HOME/emulator"
_path_append "$ANDROID_HOME/tools"
_path_append "$ANDROID_HOME/tools/bin"
_path_append "$ANDROID_HOME/platform-tools"
_path_append "/Users/tomer/.local/bin"
