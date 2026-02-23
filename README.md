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
sudo mv /usr/local/bin/autopush{,.bak}
sudo git clone https://github.com/bharathulaganathan/git_autopush.git /usr/local/bin/autopush
```

### 2. Add necessary projects to autopush.sh

- Open /usr/local/bin/autopush/autopush.sh
- Add projects to FOLDERS variable

### 3. Add Deploy key to .git/config and repo for each project

- Generate new SSH key without passphrase

```sh
ssh-keygen -t ed25519 -f "/path/to/sshkey" -N ""
```

- Add key to the project

```
cd /path/to/project
# Open .git/config
# Add following line under [core]
[core]
	sshCommand = ssh -i /path/to/sshkey
```
or
```sh
cd /path/to/project
git config core.sshCommand "ssh -i /path/to/sshkey -F /dev/null"
```

- Add public key to repo

```
Repo > Settings > Deploy keys > Add deploy key
```

### 5. Add autopush.sh to anacorn

Add to /etc/anacrontab

```
1   5   autopush.job    /bin/bash /usr/local/bin/autopush/autopush.sh
```
