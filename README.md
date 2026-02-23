# Autopush

## Requirements

### 1. anacron

```sh
# Arch Linux
sudo pacman -S cronie
```

## Usage

### 1. Clone this repo to get autopush.sh

```sh
sudo rm -rf /usr/local/bin/autopush.bak
sudo mv /usr/local/bin/autopush{,.bak}
sudo git clone https://github.com/bharathulaganathan/git_autopush.git /usr/local/bin/autopush
```

### 2. Add necessary projects to autopush.sh

```sh
sudo nvim /usr/local/bin/autopush/autopush.sh
# Add the following in it:
# - Username
# - Git Email
# - Git Name
# - Folders to autopush
```

### 3. Add Deploy key to .git/config and repo for each project

- Generate new SSH key without passphrase

```sh
ssh-keygen -t ed25519 -f $absolute_path_to_key -N ""
```

- Add key to the project

```sh
cd $path_to_project
git config core.sshCommand "ssh -i $absolute_path_to_key -F $absolute_path_to_ssh_config -o StrictHostKeyChecking=no"
# can skip -F if url doesnt need config
```

- Add public key to repo

```
Repo > Settings > Deploy keys > Add deploy key
```

### 5. Add autopush.sh to anacorn

```sh
sudo nvim /etc/anacrontab
```

Add the following

```
1   5   autopush.job    /bin/bash /usr/local/bin/autopush/autopush.sh >> /usr/local/bin/autopush/autopush.log 2>&1
```
