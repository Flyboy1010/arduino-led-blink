# Arduino led blink in pure C.

Arch Linux install compiler, libs etc:

```bash
sudo pacman -S avr-gcc avr-binutils avr-libc avrdude
```

## Compiling

To compile the program

```bash
make
```

## Upload to Arduino

Check port and bps in the makefile

```bash
make deploy
