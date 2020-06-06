if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

################## From Github ################

env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add e:/Actionable/GitControlledPrograms/ssh_keys/vaithyanathan_ramanathan_rsa
	echo "Agent not running. Agent running and Key Added now"
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add e:/Actionable/GitControlledPrograms/ssh_keys/vaithyanathan_ramanathan_rsa
	echo "Agent running without key. Key Added now"
fi

unset env

################## Manual Adding of SSH Keys ################

#eval "$(ssh-agent)"

#ssh-add "e:/Actionable/GitControlledPrograms/ssh_keys/vaithyanathan_ramanathan_rsa"

################## Manual Adding of SSH Keys ################
