# auto-source-setup-bash.fish

auto-source [ROS](https://www.ros.org/) setup.bash

This plugin is for [ROS](https://www.ros.org/), so it has no effect if you don't use ROS.

## Prerequisites

 - [Bass plugin](https://github.com/edc/bass) (for sourcing the setup.bash file)

## Installation

### Using fisher (recommended)

```sh
fisher install kenji-miyake/auto-source-setup-bash.fish
```

### Using local-install script (for development)

```sh
git clone git@github.com:kenji-miyake/auto-source-setup-bash.fish.git
cd auto-source-setup-bash.fish
./install
```

## Usage

This plugin is automatically executed when:

1. you open a new terminal and current directory is your workspace
2. you move to your workspace

In other words, this adds hooks to functions `fish_greeting` and `cd`.

If you'd like to disable auto-source, call `auto_source_disable` or set `DISABLE_AUTO_SOURCE`.

```sh
auto_source_disable

# or
set -U DISABLE_AUTO_SOURCE
```

To re-enable,

```sh
auto_source_enable

# or
set -e DISABLE_AUTO_SOURCE
```

By default, This plugin load the previous-loaded setup.bash when you are at home directory.

To disable this feature,

```sh
set -U AUTO_SOURCE_USE_PREV_SETUP_BASH false
```

To re-enable,

```sh
set -U AUTO_SOURCE_USE_PREV_SETUP_BASH true
```

To just clear cache,

```sh
auto_source_clear_cache

# or
set -e AUTO_SOURCE_PREV_SETUP_BASH
```

## Example

### Open new terminal in catkin workspace

```sh
source /path/to/setup.bash
~/path_to_your_catkin_workspace
❯
```

### Move to colcon workspace

```sh
~
❯ cd path_to_your_colcon_workspace
source /path/to/setup.bash
```

## Tips

### Customize on-source command

If you'd like to customize the command executed before/after `source setup.bash`, please set `AUTO_SOURCE_BEFORE_SOURCE_COMMAND` and `AUTO_SOURCE_AFTER_SOURCE_COMMAND`.

Default:

- `AUTO_SOURCE_BEFORE_SOURCE_COMMAND` = `'echo "source $setup_bash" && set -g AUTO_SOURCE_PREV_ROS_DISTRO $ROS_DISTRO'`
- `AUTO_SOURCE_AFTER_SOURCE_COMMAND` = `''`

```sh
source /path/to/setup.bash
~
❯ echo $AUTO_SOURCE_PREV_ROS_DISTRO
foxy
```

After `set -U AUTO_SOURCE_AFTER_SOURCE_COMMAND 'echo $ROS_DISTRO > ~/.auto-source'`:

```sh
source /path/to/setup.bash
~
❯ cat ~/.auto-source
foxy
```
