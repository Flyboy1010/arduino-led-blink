CFLAGS ?= -Os -DF_APU=16000000UL -mmcu=atmega328p
LDFLAGS ?= -mmcu=atmega328p
# Path where your Arduino Uno is connected to
ARDUINO_USB ?= /dev/ttyUSB0

# baudios del aurdino uno son 115200 mientras que el bootloader viejo(el del nano) son 57600
BAUDIOS ?= 57600 

all: led.hex

led.hex: led
	avr-objcopy -O ihex -R .eeprom led led.hex

led: led.o
	avr-gcc $(LDFLAGS) -o $@ $^

led.o: led.c
	avr-gcc $(CFLAGS) -c -o $@ $<

deploy: led.hex
	avrdude -F -V -c arduino -p ATMEGA328p -P ${ARDUINO_USB} -b ${BAUDIOS} -U flash:w:led.hex  

clean: FRC
	rm -f led.elf led.hex led.o led

FRC: