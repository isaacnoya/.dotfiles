#!/bin/sh

WORKSPACE="${NAME#space.}"

if [ -z "$FOCUSED_WORKSPACE" ] && command -v aerospace >/dev/null 2>&1; then
  FOCUSED_WORKSPACE="$(aerospace list-workspaces --focused 2>/dev/null)"
fi

FOCUSED_WORKSPACE="${FOCUSED_WORKSPACE:-1}"

if [ "$WORKSPACE" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set "$NAME" \
    width=50 \
    background.height=28 \
    background.color=0xccffffff \
    background.drawing=on \
    icon.color=0xff111111 \
    label.drawing=off
else
  sketchybar --set "$NAME" \
    width=50 \
    background.height=28 \
    background.drawing=off \
    icon.color=0xffffffff \
    label.drawing=off
fi
