#

: ${JX_NAME:="aws-`date +%y%m%d-%H%M`"}
: ${JX_HOME:="$HOME/.jx_${JX_NAME}"}
: ${KUBECONFIG:="${JX_HOME}/kubeconfig"}

export JX_NAME JX_HOME KUBECONFIG
