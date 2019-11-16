#

: ${JX:="jx"}
export JX

authfile=${JX_HOME:-"$HOME/.jx"}/gitAuth.yaml
if test -r ${authfile}; then
: ${JX_GIT_APITOKEN:=`yq r - servers[0].users[0].apitoken < ${authfile}`}
: ${JX_GIT_USER:=`yq r - servers[0].users[0].username < ${authfile}`}
else
: ${JX_GIT_APITOKEN:=""}
: ${JX_GIT_USER:="${USER}"}
fi

: ${JX_GITHUB_ORG:="${JX_GIT_USER}"}

if test "${JX_GIT_APITOKEN}" != ""; then
  export JX_GIT_APITOKEN
fi

export JX_GIT_USER JX_GITHUB_ORG
