#include <avr/io.h>

#define F_CPU 16000000 // 16 Mhz
#define BLINK_DELAY_MS 500

#include <util/delay.h>

int main(void)
{
	// Arduino digital pin 13 (pin 5 of PORTB) for output
	DDRB |= (1 << 5); // PORTB

	while (1)
	{
		// turn LED on
		PORTB |= (1 << 5); // PORTB5
		_delay_ms(BLINK_DELAY_MS);

		// turn LED off
		PORTB &= ~(1 << 5); // PORTB5
		_delay_ms(BLINK_DELAY_MS);
	}
}