# auto-source-setup-bash.fish

auto-source ROS setup.bash

## Prerequisites

This plugin is for [ROS](https://www.ros.org/), so it has no effect if you don't use ROS.

## Installation

### Using fisher (recommended)

```sh
fisher add kenji-miyake/auto-source-setup-bash.fish
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

set -U DISABLE_AUTO_SOURCE
```

To re-enable,

```sh
auto_source_enable

set -e DISABLE_AUTO_SOURCE
```

## Example

### Open new terminal in catkin workspace

```sh
source devel/setup.bash
~/path_to_your_catkin_workspace
❯
```

### Move to colcon workspace

```sh
~
❯ cd path_to_your_colcon_workspace
source install/setup.bash
```
