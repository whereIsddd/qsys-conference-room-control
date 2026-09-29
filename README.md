# Q-SYS Conference Room Control

A small conference room control prototype built in Q-SYS Designer 10.4.1. The project combines a user control interface (UCI) with Lua event handlers to demonstrate how display, source, and audio controls can share a live status display.

## What it does

- Turns the simulated display state on or off.
- Selects Laptop, Room PC, or Wireless as the active source.
- Toggles audio mute and adjusts a volume fader.
- Updates the pink status panel with the current display, source, audio, and volume values.

The Lua script handles UCI control events and calls one `updateStatus()` function to keep the status panel in sync. It converts the volume fader's normalized position to a percentage for display.

## Try it

1. Open [`QSYS_Conference_Room_v2.qsys`](QSYS_Conference_Room_v2.qsys) in Q-SYS Designer 10.4.1.
2. Open the **Conference Room** UCI.
3. Choose **File → Emulate** (F6).
4. Use the display, source, mute, and volume controls and watch the status panel update.

During testing in Emulate mode, the UCI script reported **OK** and **0 errors**.

## Files

- [`QSYS_Conference_Room_v2.qsys`](QSYS_Conference_Room_v2.qsys) — Q-SYS design and UCI.
- [`lua/conference_room_uci.lua`](lua/conference_room_uci.lua) — readable copy of the Lua logic embedded in the design.

## Scope

This is an MVP for practicing Q-SYS UCI programming. The display and source states are simulated within the UCI; the design does not yet send commands to physical AV devices or a TCP device simulator.
