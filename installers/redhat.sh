source <(wget -qO- https://raw.github.com/marcuswhybrow/minecraft-server-manager/master/installers/common.sh)

function update_system_packages() {
    install_log "Updating sources"
    sudo yum update || install_error "Couldn't update packages"
}

function install_dependencies() {
    install_log "Installing required packages"
    sudo yum install screen rsync zip || install_error "Couldn't install dependencies"
}

function reload_cron() {
    install_log "Reloading cron service"
    sudo service crond reload
}

function enable_init() {
    install_log "Enabling automatic startup and shutdown"
    sudo chkconfig --add msm
}

install_msm
