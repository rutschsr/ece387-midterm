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

//Define Registers:
#define CONFIG_REG 0x00
#define SHUNTV_REG 0x01
#define BUSV_REG 0x02
#define POWER_REG 0x03
#define CURRENT_REG 0x04
#define CALB_REG 0x05


//May need to define data for configuration and calibration registers
        //(If so, define data here and create function to setup)



//Any Function Forward Declerations:

/**
 * @brief 
 * 
 * @param adr 
 * @return unsigned char 
 */
unsigned char read_INA_Data(unsigned char adr);

/**
 * @brief 
 * 
 * @return int 
 */
int main(void)
{
uint8_t x=1;
uint8_t y=1;
uint8_t z=1;
uint8_t ret;
uint8_t ret1;

//initialize the i2c buss
i2c_init();
//Initialize USART:
initUSART();

while(1){
printString("SerialWorking");
transmitByte('\n');

//Start i2c Communications:



//Read first register contents

//(write in address of register)
x=i2c_start((INA219<<1)+I2C_WRITE);
y=i2c_write(0x02);
i2c_stop();
_delay_ms(15);
z=i2c_start((INA219<<1)+I2C_READ);

ret=i2c_read(1);
ret1=i2c_read(0);
i2c_stop();
_delay_ms(15);
//Transmit to Serial monitor (Debug)
printString("Supposed to Print I2C data next");
transmitByte('\n');
printByte(x);
transmitByte('\n');
printByte(y);
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

