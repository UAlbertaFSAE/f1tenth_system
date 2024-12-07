#!/usr/bin/env bash

export HOME_DIR=/f1tenth_system
alias go_home="cd $HOME"

# unlimited bash history size
export HISTFILESIZE=
export HISTSIZE=

export AMENT_PREFIX_PATH=""
export CMAKE_PREFIX_PATH=""

export CMAKE_BUILD_TYPE=RelWithDebInfo
build_all() {
	local args=(
		--executor parallel
		--parallel-workers $(python3 -c "import math; print(math.ceil($(nproc) ** 0.5) + 1)")
		--continue-on-error
		--symlink-install
		--cmake-args "-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}" "-DCMAKE_EXPORT_COMPILE_COMMANDS=On"
		-Wall -Wextra -Wpedantic
	)

	cd $HOME && colcon build "${args[@]}" "$@"
}

source /opt/ros/foxy/setup.bash
