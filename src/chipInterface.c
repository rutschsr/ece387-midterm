#include <stdint.h>
#include <stdlib.h>
#include <util/delay.h>
#include "i2cmaster.h"
#include <avr/io.h>
#include "USART.h"

#define __DELAY_BACKWARD_COMPATIBLE__

// I2C Location as defined in Raspberry Pi test
#define INA219 0x40

// SCL is on pin D19 (PC5)
// SDA is on pin D18 (PC4)

// Define Register Addresses:
#define CONFIG_REG 0x00
#define SHUNTV_REG 0x01
#define BUSV_REG 0x02
#define POWER_REG 0x03
#define CURRENT_REG 0x04
#define CALB_REG 0x05

// May need to define data for configuration and calibration registers
//(If so, define data here and create function to setup)

// Function Forward Declerations:
uint16_t read_INA_BusV(unsigned char adr);
uint16_t read_INA_ShuntV(unsigned char adr);

// Variable definitions
uint16_t rawbusvoltage;
uint16_t rawshuntvoltage;
double busV;
double current_mA;
double power_W;
char buffer[20]; // Printout String buffer for double values.

/**
 * @brief
 *
 * @return int
 */
int main(void)
{

    // initialize the i2c buss
    i2c_init();
    // Initialize USART Serial communication:
    initUSART();

    while (1)
    {

        rawbusvoltage = read_INA_BusV(BUSV_REG);

        busV = (double)rawbusvoltage / 1000;

        rawshuntvoltage = read_INA_ShuntV(SHUNTV_REG);
        // Shunt voltage is in mA, dividing by 10 since 0.1 ohm resistor (V=IR)
        current_mA = (double)rawshuntvoltage / 10;

        // Calc for power: (P=IV)
        power_W = (current_mA / 1000) * busV;

        // Transmit to Serial monitor
        printString("Raw Bus Voltage:");
        transmitByte('\n');
        printWord(rawbusvoltage);
        transmitByte('\n');
        dtostrf(busV, 4, 2, buffer);
        printString("Raw Bus Voltage:");
        transmitByte('\n');
        printString(buffer);
        transmitByte('\n');

        printString("Raw Shunt Voltage:");
        transmitByte('\n');
        printWord(rawshuntvoltage);
        transmitByte('\n');

        printString("Current mA:");
        transmitByte('\n');
        dtostrf(current_mA, 6, 2, buffer);
        printString(buffer);
        transmitByte('\n');

        printString("Power:");
        transmitByte('\n');
        dtostrf(power_W, 6, 2, buffer);
        printString(buffer);
        transmitByte('\n');
        transmitByte('\n');
        transmitByte('\n');

        _delay_ms(500);
    }
}

/**
 * @brief Reads data from register on INA 219, concocts data into single int16
 * returns raw data.
 *
 * @param adr Address of register to read.
 * @return uint16_t -1 if error, return uint16_t value of raw bus voltage if no I2C error.
 */
uint16_t read_INA_BusV(unsigned char adr)
{
    uint8_t x = 1;
    uint8_t y = 1;
    uint8_t z = 1;
    unsigned char ret;
    unsigned char ret1;
    uint16_t ret2;

    x = i2c_start((INA219 << 1) + I2C_WRITE);
    y = i2c_write(adr); // Write address to read from in the pointer register.
    i2c_stop();
    _delay_ms(15);

    z = i2c_start((INA219 << 1) + I2C_READ); // read data out.
    ret = i2c_read(1);
    ret1 = i2c_read(0);
    i2c_stop();
    // First shifts 8 bit to the left and combines to make a single 16 bit.
    // Second a similar operation to the adafruit library shifts left 3 bits to remove the CNVR and OVF bits and multiplys by the LSB (4).
    ret2 = (ret1 | ((uint16_t)ret << 8) >> 3) * 4;
    // return statement:

    if (x == 0 && y == 0 && z == 0)
    {
        return ret2;
    };
    // If an error occurs.
    return -1;
}
/**
 * @brief Returns the concocted value of the shunt voltage register. (Most significant byte is read first,
 * than least significant byte). Two bytes are combined to create uint_16 and value is returned.
 *
 * @param adr Address of register to read from.
 * @return uint16_t -1 if i2c error, raw data value read from register if no errors.
 */
uint16_t read_INA_ShuntV(unsigned char adr)
{
    uint8_t x = 1;
    uint8_t y = 1;
    uint8_t z = 1;
    unsigned char ret;
    unsigned char ret1;
    uint16_t ret2;

    x = i2c_start((INA219 << 1) + I2C_WRITE);
    y = i2c_write(adr);
    i2c_stop();
    _delay_ms(15);
    z = i2c_start((INA219 << 1) + I2C_READ);
    ret = i2c_read(1);
    ret1 = i2c_read(0);
    i2c_stop();
    // First shifts 8 bit to the left and combines to make a single 16 bit.
    // Second a similar operation to the adafruit library shifts left 3 bits to remove the CNVR and OVF bits and multiplys by the LSB (4).
    ret2 = (ret1 | ((uint16_t)ret << 8));
    // return statement:
    //  printByte(ret);
    //  printByte(ret1);
    //  transmitByte('\n');
    //  printWord(ret2);
    //  transmitByte('\n');
    if (x == 0 && y == 0 && z == 0)
    {
        return ret2;
    };

    return -1;
}


