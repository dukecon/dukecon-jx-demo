#

: ${JX_NAME:="gke-`date +%y%m%d-%H%M`"}
: ${JX_HOME:="$HOME/.jx_${JX_NAME}"}
: ${JX_GKE_PROJECT:="dukecon-demo"}
: ${KUBECONFIG:="${JX_HOME}/kubeconfig"}

export JX_NAME JX_HOME JX_GKE_PROJECT KUBECONFIG


#: ${JX_DOCKER_REGISTRY_ORG:="${JX_GKE_PROJECT}"}
#: ${JX_BASE_DOMAIN="gke.dukecon.org"}
#: ${JX_DOMAIN:="${JX_NAME}-${JX_BASE_DOMAIN}"}

#export JX_DOCKER_REGISTRY_ORG # JX_BASE_DOMAIN JX_DOMAIN
