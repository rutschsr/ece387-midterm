# ece387-midterm
ece 387 midterm project

The Texas Instruments INA 219 Chip is a DC voltage /  current / power measurement IC that utilizes the I2C communication protocol. The INA meausres DC current by measuring the current drop over a shunt resistor. This shunt resistor has a value of 0.1 Ohm on the breakout board used here. From 

The I2C protocol allows multiple devices to be connected to it at once by having a 7 bit address for each of the devices. The 8th bit of the address signal sent is the R/W bit, which tells the I2C slave device whether data is going to be sent or recieved. There is also a 9th bit, an aknowledge bit. This bit is 0 in the write mode and 1 in the read mode. INA219 Chip only operates as an I2C slave device. Most significant byte first. Data for the bus and shunt voltages, as well as the current and power is stored in 16 bit registers. Accessing a particular register on the INA219 is accomplished by writing the appropriate address value for the requested data register to a register pointer located at addresss 0x00. This updates the register pointer so when the I2C read bit is sent the chip knows what data to send. (datasheet pg 14) The value for the register pointer is the first byte transferred after the slave address byte with R/W bit LOW.

The I2C protocol uses two pins, SCL (clock) and SDA (data) and requires pull up resistor on both the SCL and SDA lines, the Adafruit clone breakout board with the INA219 I am using has a built in 10k ohm resistor on each. The Texas Instruments INA 219 IC also can function on both 3.3V and 5V logic systems. 0.1 Ohm shunt resistor is included on the breakout board. On the Arduino the INA 219 IC is running in high speed I2C mode (1000khz).

INA 219 Register List (Datasheet page 18):

| Address      | Hex | Register Name |
| ----------- | ----------- | -----|
| 00     | 0x00       | Configuration |
| 01   | 0x01        | Shunt Voltage |
| 02   | 0x02        | Bus Voltage |
| 03   | 0x03        | Power |
| 04   | 0x04        | Current |
| 05   | 0x05        | Calibration |

The ATMEGA A328P Microcontroller has a built in I2C-compatible 2-wire serial interface called TWI. This bus is hardware based and allows for up to 128 devices to be connected to the same two pins. The hardware based application with the TWI/ I2C library produced by Peter Fluery (Link) used for this project ensures that other system timers/counters are not tied up by the I2C operation. The only other dependency for the project other than the afformentioned Fleury I2C (twinmaster.c/twinmaster.h) library is the USART serial library. The USART library is used to print the voltage, current, and power data to the serial monitor where it can be read from a PC.

In order to print the float values calculated from the current they need to first be converted to a string because the USART library does not provide for sending float values to the Serial Monitor. Due to this issue, while compiling using avr-gcc the -lm flag needs to be set in order to use the math function that converts this.

avr-gcc and avrdude are used from command line on a linux (Ubuntu 20.04 Virtual Machine, Windows 10 Host) to compile and program the project. The arduino IDEs Serial monitor (or a homegrown python script from my senior design project) will be used to view the serial output.

A python compile script is used to compile all three C documents, the i2cmaster code, the usart code, and the chipinterface for C. This then uses AVRdude to program the arduino.

i2cmaster.h, twimaster.c, usart.h, usart.c are dependencies




Youtube Demonstration: https://youtu.be/ROWTx2wqb9A

AVRFREEKS help: https://www.avrfreaks.net/forum/i2c-stopping-project-functionality-atmega328p

i2cmaster documentation: https://damadmai.github.io/pfleury/group__pfleury__ic2master.html 



Calibration Register: 

cal=0.04096/(Rshunt*Current LSB)

CurrentLCB=MaxiumumExpectedCurrent/2^15


Shunt voltage register voltage:

Because resistance = 0.1Ohm, current(mA) = ShuntV/10;


Bus Voltage Register:
Max 4000/16000 = 16/32V
