### Goal
To get a simple apk app that will read from /dev/input
events to simulate a mouse. This will be designed to work for
wayland so I have no clue if it will work elsewhere (maybe tod?)

For more info, this repo is a good reference: <https://github.com/TA1312/supernote-a5x>

### Info
- target device: SuperNote A5X with Arm64 V8 CPU
- host machine: x86_64 running NixOS with Niri WM (Wayland w/ Smithay Compositor)
- dependancies managed with nix flake
- if you don't have nix on your machine, you will need (as of now)
  the following packages/programs on your Operating System:
  `Python3, Python evdev, uinput (+kernel module), android-tools (for adb)`
- For now android studio is not needed since I haven't made the actual app yet

### TODO
- [ ] Get some code in the repo
- [ ] Get python evdev to work with adb recovery shell
- [ ] After adb recov. shell works, try with android apis
      via android stuido

### Observations
#### EV_KEY
- upon touch, input event sends BTN\_TOUCH to show
  that the pen has come in contact with the tablet
- it will also give after, to show what kind of button is it.
  with my specific pen, it will send BTN\_TOOL\_PEN, with the fake
  eraser, it sends BTN\_TOOL\_RUBBER
- Upon release of the tablet/contact, those BTN values will revert back
  to 0
