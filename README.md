# Utils

Set of scripts.

Copy all scripts in your path.

## icalview.sh

Script to parse calendar invitation from google calendar or outlook in **mutt**.

You must add to your *.muttrc* file:

    auto_view test/calendar

And the following line to your *.mailcap* file:

    text/calendar; icalview.sh %s; copiousoutput


## i3Utils

Script to simplify i3 configuration switch.

### Usage:

    i3Utils <command> <file>"

#### Commands:

* --move : move i3 workspace on the good monitor following config file give in parameter. File must contains a workspace_mapping table which contains informations to move workspace to the choosen monitor.
* --write : write variable config concerning screen and workspace. File must contains a config_files table which contains path until i3 config files.
* --dock : make write step, restart i3 and move step.

#### File :

Path until i3Utils config file.

#### i3Utils config file sample :

    config_files='["/home/kewin/configFiles/i3/config.base","/home/kewin/configFiles/i3/config.fix"]'
    workspace_mapping='{"1: irssi":"VGA1","2: dev":"HDMI3","6: music":"HDMI3","7: mail":"HDMI3","9":"VGA1","10: web":"VGA1"}'
    variables='[{"name":"$monitor1", "value":"VGA1"}, {"name":"$monitor2","value":"HDMI3"}]'


## docker

Script to simplify laptop docking step.

It will call *externMonitor* to stop useless screen and power up and place some monitor automatically.
It will call *i3Utils* to move i3 workspaces, create specific i3 config file in the good configuration.

### Requires:

* externMonitor
* i3Utils

### Usage:

    docker <command>

#### Command:

* --auto will try to detect if we have dock or undock laptop.
* --dock will call externMonitor with --dock option, will call i3Utils with --dock option, will put audio master to 25%, and rerun fehbg.
* --undock will cool externMonitor with --off option, will call i3Utils with --dock option, will put audio master to mute, and rerun fehbg.


### Limitation:

Fail to dock automatically at booting time. For the moment we must call docker --dock manually.


## externMonitor

Script to simplify and automatize xrandr usage.

### Usage:

    externMonitor <command>

#### command values:

* --left external monitor is left of laptop.
* --right external monitor is rght of laptop.
* --off unplug external monitor.
* --toggle switch between three commands.
* --dock switch off laptop monitor, and use 2 external monitor.
* --docked switch to dock mode with 2 externs monitor.
* --list list available extern monitor.

#### You must have a config file ~/.externMonitor.rc with:

* LAPTOP_MONITOR => xrandr name of laptop monitor.
* DOCK_LEFT_MONITOR => xrandr name of left monitor.
* DOCK_RIGHT_MONITOR => xrandr name of right monitor.

### Sample:

    LAPTOP_MONITOR="eDP1"
    DOCK_LEFT_MONITOR="VGA1"
    DOCK_RIGHT_MONITOR="HDMI3"

 
### Configuration with i3

    bindsym XF86Display exec `$HOME/bin/externMonitor --toggle`

A link to the script must be made in $HOME/bin or you must change previous path.
