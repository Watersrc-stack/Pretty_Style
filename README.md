# Pretty_Style
This script enhances the output of Epitech's coding style's checker, adding colors and summary.<br>
Also auto-remove the file coding-style-reports.log if there is no style errors.

![image](https://github.com/Watersrc-stack/Pretty_Style/assets/76213286/40be9f1c-5362-4f07-b39c-2c7c9c3c7d98)
![image](https://github.com/Watersrc-stack/Pretty_Style/assets/76213286/6e06adc9-1d2c-4b8c-9a1c-ffecf6a28fe2)
![image](https://github.com/Watersrc-stack/Pretty_Style/assets/76213286/48bcda2b-5cf5-4efc-af56-e120a1848cb0)

# Usage

Run the binded alias ('cs' by default) instead of running codin-style script.

# Installation

To install pretty-style script, just run `chmod +x install.sh && ./install.sh` <br>
By default, it will install for bash, under `cs` alias, in `$HOME/pretty-style/` directory. <br><br>
You can customize your installation.<br>
To do so, you can edit the following parameters in the first few lines of file ``install.sh``: <br><br>
<t> ALIAS: the name of the alias to run pretty style <br>
<t> INSTALL_DIR: the directory pretty style will be installed. ! If you change this setting, make sure to edit ``pretty-style.sh`` and put the same value ! <br>
<t> SHELL: the shell you use <br>

Modify these value is not recommanded, unless you have many aliases || use another shell than bash. <br>

# Updating

The coding style script will always be up-to-date by himself. <br>
If pretty style do not longer work after you changed someting with your shell, run `./install update` <br>
If the project is updated, update all by running `git pull && ./install update` <br><br>

If you want to remove pretty style (it's sad but it's ok), type `./install remove` in your terminal.<br>

# Notes

Please note that for security reasons, it is not possible to auto-remove pretty style's alias.<br>
You have to do it manually. <br><br>

File ``coding-style.sh`` ___is not___ my property. All rights reserved to Epitech.
