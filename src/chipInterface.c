#include <stdint.h>
#include <stdlib.h>
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
uint16_t read_INA_BusV(unsigned char adr);
uint16_t read_INA_ShuntV(unsigned char adr);

char buffer[20];
/**
 * @brief 
 * 
 * @return int 
 */
int main(void)
{
//uint8_t x=1;
//uint8_t y=1;
//uint8_t z=1;
uint16_t rawbusvoltage;
uint16_t rawshuntvoltage;
double busV;
double current_mA;
double power_W;
//uint8_t ret1;

//initialize the i2c buss
i2c_init();
//Initialize USART:
initUSART();

while(1){
// printString("SerialWorking");
// transmitByte('\n');
rawbusvoltage=read_INA_BusV(BUSV_REG);
//Start i2c Communications:
busV=(double)rawbusvoltage/1000;

rawshuntvoltage=read_INA_ShuntV(SHUNTV_REG);
//Shunt voltage is in mA, dividing by 10 since 0.1 ohm resistor
current_mA=(double)rawshuntvoltage/10;


//Calc for power: (P=IV)
power_W=current_mA*0.001*busV;




//Read first register contents

//(write in address of register)
// x=i2c_start((INA219<<1)+I2C_WRITE);
// y=i2c_write(0x02);
// i2c_stop();
// _delay_ms(15);
// z=i2c_start((INA219<<1)+I2C_READ);

// ret=i2c_read(1);
// ret1=i2c_read(0);
// i2c_stop();
//_delay_ms(15);
//Transmit to Serial monitor (Debug)
printString("Raw Bus Voltage:");
transmitByte('\n');
// printByte(x);
// transmitByte('\n');
// printByte(y);
// transmitByte('\n');
// printByte(z);
// transmitByte('\n');
// printByte(ret);
printWord(rawbusvoltage);
transmitByte('\n');
dtostrf(busV,4,2,buffer);
printString(buffer);
transmitByte('\n');

printString("Raw Shunt Voltage:");
transmitByte('\n');
printWord(rawshuntvoltage);
transmitByte('\n');


printString("Current mA:");
transmitByte('\n');
dtostrf(current_mA,6,2,buffer);
printString(buffer);
transmitByte('\n');


printString("Power:");
transmitByte('\n');
dtostrf(power_W,6,2,buffer);
printString(buffer);
transmitByte('\n');
_delay_ms(15);
}
}

/**
 * @brief 
 * 
 * @param adr 
 * @return unsigned char -1 if error
 */
uint16_t read_INA_BusV(unsigned char adr){
uint8_t x=1;
uint8_t y=1;
uint8_t z=1;
unsigned char ret;
unsigned char ret1;
uint16_t ret2;

x=i2c_start((INA219<<1)+I2C_WRITE);
y=i2c_write(adr);
i2c_stop();
_delay_ms(15);
z=i2c_start((INA219<<1)+I2C_READ);
ret=i2c_read(1);
ret1=i2c_read(0);
i2c_stop();
//First shifts 8 bit to the left and combines to make a single 16 bit.
//Second a similar operation to the adafruit library shifts left 3 bits to remove the CNVR and OVF bits and multiplys by the LSB (4).
ret2= (ret1 | ((uint16_t)ret<<8)>>3)*4;
//return statement:
// printByte(ret);
// printByte(ret1);
// transmitByte('\n');
// printWord(ret2);
// transmitByte('\n');
if(x==0&&y==0&&z==0){
    return ret2;
};

return -1;




}

uint16_t read_INA_ShuntV(unsigned char adr){
uint8_t x=1;
uint8_t y=1;
uint8_t z=1;
unsigned char ret;
unsigned char ret1;
uint16_t ret2;

x=i2c_start((INA219<<1)+I2C_WRITE);
y=i2c_write(adr);
i2c_stop();
_delay_ms(15);
z=i2c_start((INA219<<1)+I2C_READ);
ret=i2c_read(1);
ret1=i2c_read(0);
i2c_stop();
//First shifts 8 bit to the left and combines to make a single 16 bit.
//Second a similar operation to the adafruit library shifts left 3 bits to remove the CNVR and OVF bits and multiplys by the LSB (4).
ret2= (ret1 | ((uint16_t)ret<<8));
//return statement:
// printByte(ret);
// printByte(ret1);
// transmitByte('\n');
// printWord(ret2);
// transmitByte('\n');
if(x==0&&y==0&&z==0){
    return ret2;
};

return -1;




}







//Will read from specific registers here, need voltage before and after shunt resistor
//See Datasheet and adafruit library for specifics.


//Complete Math here to calculate current and power.


//Use USART to print Data to Serial Monitor.





