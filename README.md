# ece387-midterm
ece 387 midterm project

I intend to present on connecting the Texas Instruments INA219 sensor to the Arduino for my midterm project.


Intended operation:
1. Utilize i2cmaster, de-arduinoed Adafruit ref library and USART libraries
2. Read in current/voltage/power from sensor
3. Print to serial monitor using USART.



avr-gcc and avrdude are used from command line on a linux (Ubuntu 20.04 Virtual Machine, Windows 10 Host) to compile and program the project. The arduino IDEs Serial monitor (or a homegrown python script from my senior design project) will be used to view the serial output.