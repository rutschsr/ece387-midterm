#include <stdint.h>
#include "i2cmaster.h"
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
unsigned char ret;
//initialize the i2c buss
i2c_init();
//Initialize USART:
initUSART();
printString("SerialWorking");
transmitByte('\n');

//Start i2c Communications:

//May need to write configuration in first.
//Write Address of first data register.
i2c_start_wait(INA219+I2C_WRITE);
//i2c_write(INA219); //may be neccessary
int z = 0;
z=i2c_write(02h);
i2c_stop();
printString("Location A");
transmitByte('\n');


//Read first register contents
i2c_rep_start(INA219+I2C_READ);
ret=i2c_readNak();
i2c_stop();

//Transmit to Serial monitor (Debug)
printString("Supposed to Print I2C data next");
transmitByte('\n');
transmitByte(ret);
transmitByte('\n');




//initialize USART
initUSART();


//Will read from specific registers here, need voltage before and after shunt resistor
//See Datasheet and adafruit library for specifics.


//Complete Math here to calculate current and power.


//Use USART to print Data to Serial Monitor.



}

