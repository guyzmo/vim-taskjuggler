vim-taskjuggler -- syntax highlighting for task-juggler (neobundle/vundle ready)
================================================================================

## DESCRIPTION

This repository contains all files need to automatically highlight
TaskJuggler-files. The detection is based on the file-suffix: .tjp,
.taskjuggler, .tj3.

This repository comes with a script which fetches the syntax file from
the taskjuggler-repository (https://github.com/taskjuggler/TaskJuggler). It's
not included in this git-repo, it's installed from the installed gem.

The `install.sh` script installs the syntax file from the gem bundle.

## USAGE

```bash
git clone <repo>
cd <repo>
./install.sh
```

Within `Neobundle` just use the following:

```vim
NeoBundleLazy 'guyzmo/vim-taskjuggler' {
    \  'build' : {
    \    'unix': 'sh install.sh'
    \  },
    \  'autoload': {
    \    'filetypes': ['tjp', 'taskjuggler', 'tj3']
    \  }
    \ }
```

## Files
  * `ftdetect/tjp.vim`: Detect the filetype
  * `ftplugin/tjp.vim`: Setting options for the taskjuggler-language
  * `syntax/tjp.vim`: Syntax file 
  * `install.sh`: Installer-script

## Support

Please drop me a message via github if you experience any problems.

## Attributions

This is a fork of @maxmeyer's work to adapt the script to pathogen.

(c)2011 Max Meyer, @maxmeyer
(c)2015 Bernard `Guyzmo` Pratz, @guyzmo
