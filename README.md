### Goal
To get a simple apk app that will read from /dev/input
events to simulate a mouse. This will be designed to work for
wayland so I have no clue if it will work elsewhere (maybe tod?)

### How
You can use android tools (adb) to reboot into a recovery shell.
In that shell, you can actually read events from input.
Current this will only work within a recovery shell but I am hoping
to get this into an android app you can easily sideload.
For more info this repo is a good reference: <https://github.com/TA1312/supernote-a5x>

### More Info
- Testing with a Supernote A5X on NixOS on Niri WM
- Defaults to read from /dev/input/event5
- Dependancies managed with flake.nix, check that if you want to
  install those packages on a device without nix

### TODO
- [ ] Get some code in the repo
- [ ] Get python evdev to work with adb recovery shell
- [ ] After adb recov. shell works, try with android apis
      via android stuido
