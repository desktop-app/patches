set -e
FullExecPath=$PWD
pushd `dirname $0` > /dev/null
FullScriptPath=`pwd`
popd > /dev/null

skip_patching=""
object_path=""
next_object_path=""
for arg in "$@"
do
  if [ "$next_object_path" == "1" ]; then
    object_path="$arg"
    next_object_path=""
  elif [ "$arg" == "-o" ]; then
    next_object_path="1"
  elif [ "$arg" == "-M" ] || [ "$arg" == "-v" ] || [ "$arg" == "--version" ] || [ "$arg" == "-Werror" ]; then
    skip_patching="1"
  fi
done

$FullScriptPath/../../../ThirdParty/yasm/yasm ${@}

if [ "$skip_patching" == "" ] && [ "$object_path" != "" ]; then
  $FullScriptPath/../../../ThirdParty/macho_edit/build/Release/macho_edit --patch-object $object_path macos 10.12 10.15.6
fi
