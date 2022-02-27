# ece387-midterm
ece 387 midterm project

I intend to present on connecting the Texas Instruments INA219 sensor to the Arduino for my midterm project.


Intended operation:
1. Utilize i2cmaster, de-arduinoed Adafruit ref library and USART libraries
2. Read in current/voltage/power from sensor
3. Print to serial monitor using USART.


INA219 Chip only operates as a slave device. Most significant byte first. Accessing a particular register on the INA219 is accomplished by writing the appropriate value to the register pointer. (pg 14) The value for the register pointer is the first byte transferred after the slave address byte with R/W bit LOW. 

Slave Address is followed by the address of the data address to be read. This updates the register pointer to point towards the address we want to read.

avr-gcc and avrdude are used from command line on a linux (Ubuntu 20.04 Virtual Machine, Windows 10 Host) to compile and program the project. The arduino IDEs Serial monitor (or a homegrown python script from my senior design project) will be used to view the serial output.

Use python compile script not makefile, may need to write data into configuration and calibration registers, will be reviewing data on Adafruit library for this.

i2cmaster.h, twimaster.c, usart.h, usart.c are dependencies

INA 219 Register List (Datasheet page 18):

| Address      | Hex | Register Name |
| ----------- | ----------- | -----|
| 00     | 0x00       | Configuration |
| 01   | 0x01        | Shunt Voltage |
| 02   | 0x02        | Bus Voltage |
| 03   | 0x03        | Power |
| 04   | 0x04        | Current |
| 05   | 0x05        | Calibration |



AVRFREEKS help: https://www.avrfreaks.net/forum/i2c-stopping-project-functionality-atmega328p

i2cmaster documentation: https://damadmai.github.io/pfleury/group__pfleury__ic2master.html 



Calibration Register 

cal=0.04096/(Rshunt*Current LSB)

CurrentLCB=MaxiumumExpectedCurrent/2^15