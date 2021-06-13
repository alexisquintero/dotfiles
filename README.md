# dotfiles

## Images

### Vertical split with 2 terminals on the left
![main](https://gist.githubusercontent.com/alexisquintero/a246066a7fdc3f938f5b72fd6653ebe4/raw/55d8d9ad8912e082e4fb63b59c9fcb3566a95a2d/desktop.png)

### GTK
![thunar](https://gist.githubusercontent.com/alexisquintero/a246066a7fdc3f938f5b72fd6653ebe4/raw/5b09839358433b6a1950c2e70fec84f1e614e476/gtk.png)

### i3status
![i3status](https://gist.githubusercontent.com/alexisquintero/a246066a7fdc3f938f5b72fd6653ebe4/raw/5b09839358433b6a1950c2e70fec84f1e614e476/i3bar.png)

## How to use

1. Clone the repository
2. CD into
3. Run `./write-files`
4. Answer the prompts

### Parameters

* No parameters: Tries to create the necessary folders and symlinks files if it doesn't overwrite anything, asks what to do otherwise.
* `-i` or `--install`: All previous actions AND also installs apps and clones and updates [repo][1][sito][2][ries][3].
* `-r` or `--repository`: All the previous actions AND adds the required repositories. 
* `-y` or `--yes`: Yes to all.
* `-h` or `--help`: Something like this.
* `/.+/`: Help as well.

## Backup

Every existing file that the user chooses to symlink will be copied to a backup folder where the write-files scripts is run

[1]: https://github.com/alexisquintero/utils
[2]: https://github.com/alexisquintero/.vim
[3]: https://github.com/justbuchanan/i3scripts
