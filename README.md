# Autopush

## Requirements

### 1. systemd (Arch)

## OR

### 1. anacron

```sh
# Arch Linux
sudo pacman -S cronie
```

## Usage

### 1. Clone this repo to get autopush.sh

```sh
rm -rf ~/.local/bin/autopush.bak
mv ~/.local/bin/autopush{,.bak}
git clone https://github.com/bharathulaganathan/git_autopush.git ~/.local/bin/autopush
```

### 2. Add necessary projects to autopush.sh

```sh
nvim ~/.local/bin/autopush/autopush.sh
# Add the following in it:
# - Username
# - Git Email
# - Git Name
# - Folders to autopush
```

### 3. Add Deploy key to .git/config and repo for each project

- Generate new SSH key without passphrase

```sh
ssh-keygen -t ed25519 -f $path_to_key -N ""
```

- Add key to the project

```sh
cd $path_to_project
git config core.sshCommand "ssh -i $absolute_path_to_key -F $absolute_path_to_ssh_config -o StrictHostKeyChecking=no"
# can skip -F if url doesnt need config
```

- Add public key to repo

```
Repo > Settings > Deploy keys > Add deploy key (WITH "ALLOW WRITE ACCESS" ENABLED)
```

### 5. Add autopush.sh to serives

Add necessary services and timers

```sh
rm -rf ~/.config/systemd/user/autopush.service.bak
rm -rf ~/.config/systemd/user/autopush.timer.bak
mv ~/.config/systemd/user/autopush.service{,.bak}
mv ~/.config/systemd/user/autopush.timer{,.bak}
mv ~/.local/bin/autopush/autopush.service ~/.config/systemd/user/autopush.service
mv ~/.local/bin/autopush/autopush.timer ~/.config/systemd/user/autopush.timer
```

Enable the services and timers

```sh
systemctl --user daemon-reload
systemctl --user enable --now autopush.timer
```

Enable user lingering

```sh
sudo loginctl enable-linger $USER
```

## OR

### 5. Add autopush.sh to anacorn

```sh
sudo nvim /etc/anacrontab
```

Add the following

```
1	5	autopush.job	/bin/bash /usr/local/bin/autopush/autopush.sh >> /usr/local/bin/autopush/autopush.log 2>&1
```

## Testing

```sh
sudo a
```
