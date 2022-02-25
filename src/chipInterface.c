#include <stdint.h>
#include <util/delay.h>
#include "i2cmaster.h"
#include <avr/io.h>
#include "USART.h"


#define __DELAY_BACKWARD_COMPATIBLE__

//I2C Location as defined in Raspberry Pi test
#define INA219 0x40

//SCL is on pin D19 (PC5)
//SDA is on pin D18 (PC4)

//Any Function Forward Declerations:

/**
 * @brief 
 * 
 * @return int 
 */
int main(void)
{
uint8_t x=1;
uint8_t z=1;
uint8_t ret;
uint8_t ret1;
unsigned char writeadr="0x80";
unsigned char readadr="0x81";
//initialize the i2c buss
i2c_init();
//Initialize USART:
initUSART();

while(1){
printString("SerialWorking");
transmitByte('\n');

//Start i2c Communications:

//May need to write configuration in first.
//Write Address of first data register.
// i2c_start_wait(INA219+I2C_WRITE);
// //i2c_write(INA219); //may be neccessary
// int z = 0;
// z=i2c_write(0x01);
// i2c_stop();
// printString("Location A");
// transmitByte('\n');


//Read first register contents
z=i2c_start(writeadr);

i2c_write(0x04);
i2c_stop();
_delay_ms(15);
x=i2c_rep_start(readadr);
ret=i2c_read(1);
ret1=i2c_read(0);
i2c_stop();
_delay_ms(15);
//Transmit to Serial monitor (Debug)
printString("Supposed to Print I2C data next");
transmitByte('\n');
printByte(x);
transmitByte('\n');
printByte(z);
transmitByte('\n');
printByte(ret);
printByte(ret1);
transmitByte('\n');
_delay_ms(15);

}










//Will read from specific registers here, need voltage before and after shunt resistor
//See Datasheet and adafruit library for specifics.


//Complete Math here to calculate current and power.


//Use USART to print Data to Serial Monitor.



}

