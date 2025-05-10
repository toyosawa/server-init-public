cd ~/server-init-public

# docker
bash "scripts/docker/install-docker.sh" 
bash "scripts/tools/install-jq.sh" 
bash "scripts/tools/install-yq.sh" 

# node
bash "scripts/tools/install-anyenv.sh"
bash "scripts/node/install-nodenv.sh" 
bash "scripts/node/install-node.sh" "22.12.0" 
bash "scripts/node/install-npm-global.sh" "yarn" 
bash "scripts/node/set-yarn-version.sh" "4.6.0" "$HOME" 

# python
bash "scripts/python/install-uv.sh"
