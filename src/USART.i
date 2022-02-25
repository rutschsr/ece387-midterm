# 1 "USART.c"
# 1 "/home/sam/Documents/GitHub/ece387-midterm/src//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "USART.c"
# 15 "USART.c"
# 1 "/usr/lib/avr/include/avr/io.h" 1 3
# 99 "/usr/lib/avr/include/avr/io.h" 3
# 1 "/usr/lib/avr/include/avr/sfr_defs.h" 1 3
# 126 "/usr/lib/avr/include/avr/sfr_defs.h" 3
# 1 "/usr/lib/avr/include/inttypes.h" 1 3
# 37 "/usr/lib/avr/include/inttypes.h" 3
# 1 "/usr/lib/gcc/avr/5.4.0/include/stdint.h" 1 3 4
# 9 "/usr/lib/gcc/avr/5.4.0/include/stdint.h" 3 4
# 1 "/usr/lib/avr/include/stdint.h" 1 3 4
# 125 "/usr/lib/avr/include/stdint.h" 3 4

# 125 "/usr/lib/avr/include/stdint.h" 3 4
typedef signed int int8_t __attribute__((__mode__(__QI__)));
typedef unsigned int uint8_t __attribute__((__mode__(__QI__)));
typedef signed int int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int uint16_t __attribute__ ((__mode__ (__HI__)));
typedef signed int int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int uint32_t __attribute__ ((__mode__ (__SI__)));

typedef signed int int64_t __attribute__((__mode__(__DI__)));
typedef unsigned int uint64_t __attribute__((__mode__(__DI__)));
# 146 "/usr/lib/avr/include/stdint.h" 3 4
typedef int16_t intptr_t;




typedef uint16_t uintptr_t;
# 163 "/usr/lib/avr/include/stdint.h" 3 4
typedef int8_t int_least8_t;




typedef uint8_t uint_least8_t;




typedef int16_t int_least16_t;




typedef uint16_t uint_least16_t;




typedef int32_t int_least32_t;




typedef uint32_t uint_least32_t;







typedef int64_t int_least64_t;






typedef uint64_t uint_least64_t;
# 217 "/usr/lib/avr/include/stdint.h" 3 4
typedef int8_t int_fast8_t;




typedef uint8_t uint_fast8_t;




typedef int16_t int_fast16_t;




typedef uint16_t uint_fast16_t;




typedef int32_t int_fast32_t;




typedef uint32_t uint_fast32_t;







typedef int64_t int_fast64_t;






typedef uint64_t uint_fast64_t;
# 277 "/usr/lib/avr/include/stdint.h" 3 4
typedef int64_t intmax_t;




typedef uint64_t uintmax_t;
# 10 "/usr/lib/gcc/avr/5.4.0/include/stdint.h" 2 3 4
# 38 "/usr/lib/avr/include/inttypes.h" 2 3
# 77 "/usr/lib/avr/include/inttypes.h" 3
typedef int32_t int_farptr_t;



typedef uint32_t uint_farptr_t;
# 127 "/usr/lib/avr/include/avr/sfr_defs.h" 2 3
# 100 "/usr/lib/avr/include/avr/io.h" 2 3
# 272 "/usr/lib/avr/include/avr/io.h" 3
# 1 "/usr/lib/avr/include/avr/iom328p.h" 1 3
# 273 "/usr/lib/avr/include/avr/io.h" 2 3
# 627 "/usr/lib/avr/include/avr/io.h" 3
# 1 "/usr/lib/avr/include/avr/portpins.h" 1 3
# 628 "/usr/lib/avr/include/avr/io.h" 2 3

# 1 "/usr/lib/avr/include/avr/common.h" 1 3
# 630 "/usr/lib/avr/include/avr/io.h" 2 3

# 1 "/usr/lib/avr/include/avr/version.h" 1 3
# 632 "/usr/lib/avr/include/avr/io.h" 2 3






# 1 "/usr/lib/avr/include/avr/fuse.h" 1 3
# 239 "/usr/lib/avr/include/avr/fuse.h" 3
typedef struct
{
    unsigned char low;
    unsigned char high;
    unsigned char extended;
} __fuse_t;
# 639 "/usr/lib/avr/include/avr/io.h" 2 3


# 1 "/usr/lib/avr/include/avr/lock.h" 1 3
# 642 "/usr/lib/avr/include/avr/io.h" 2 3
# 16 "USART.c" 2
# 1 "USART.h" 1
# 17 "USART.h"

# 17 "USART.h"
void initUSART(void);




void transmitByte(uint8_t data);
uint8_t receiveByte(void);

void printString(const char myString[]);

void readString(char myString[], uint8_t maxLength);



void printByte(uint8_t byte);

void printWord(uint16_t word);


void printBinaryByte(uint8_t byte);

char nibbleToHex(uint8_t nibble);
char nibbleToHexCharacter(uint8_t nibble);
void printHexByte(uint8_t byte);

uint8_t getNumber(void);
# 17 "USART.c" 2
# 1 "/usr/lib/avr/include/util/setbaud.h" 1 3
# 18 "USART.c" 2

void initUSART(void) {
  
# 20 "USART.c" 3
 (*(volatile uint8_t *)(0xC5)) 
# 20 "USART.c"
        = 
# 20 "USART.c" 3
          ((((
# 20 "USART.c"
          16000000UL
# 20 "USART.c" 3
          ) + 8UL * (
# 20 "USART.c"
          9600
# 20 "USART.c" 3
          )) / (16UL * (
# 20 "USART.c"
          9600
# 20 "USART.c" 3
          )) -1UL) >> 8)
# 20 "USART.c"
                     ;
  
# 21 "USART.c" 3
 (*(volatile uint8_t *)(0xC4)) 
# 21 "USART.c"
        = 
# 21 "USART.c" 3
          ((((
# 21 "USART.c"
          16000000UL
# 21 "USART.c" 3
          ) + 8UL * (
# 21 "USART.c"
          9600
# 21 "USART.c" 3
          )) / (16UL * (
# 21 "USART.c"
          9600
# 21 "USART.c" 3
          )) -1UL) & 0xff)
# 21 "USART.c"
                     ;



  
# 25 "USART.c" 3
 (*(volatile uint8_t *)(0xC0)) 
# 25 "USART.c"
        &= ~(1 << 
# 25 "USART.c" 3
                  1
# 25 "USART.c"
                      );


  
# 28 "USART.c" 3
 (*(volatile uint8_t *)(0xC1)) 
# 28 "USART.c"
        = (1 << 
# 28 "USART.c" 3
                3
# 28 "USART.c"
                     ) | (1 << 
# 28 "USART.c" 3
                               4
# 28 "USART.c"
                                    );
  
# 29 "USART.c" 3
 (*(volatile uint8_t *)(0xC2)) 
# 29 "USART.c"
        = (1 << 
# 29 "USART.c" 3
                2
# 29 "USART.c"
                      ) | (1 << 
# 29 "USART.c" 3
                                1
# 29 "USART.c"
                                      );
}


void transmitByte(uint8_t data) {

  
# 35 "USART.c" 3
 do { } while ((!((*(volatile uint8_t *)(((uint16_t) &((*(volatile uint8_t *)(0xC0)))))) & (1 << (5)))))
# 35 "USART.c"
                                     ;
  
# 36 "USART.c" 3
 (*(volatile uint8_t *)(0xC6)) 
# 36 "USART.c"
      = data;
}

uint8_t receiveByte(void) {
  
# 40 "USART.c" 3
 do { } while ((!((*(volatile uint8_t *)(((uint16_t) &((*(volatile uint8_t *)(0xC0)))))) & (1 << (7)))))
# 40 "USART.c"
                                    ;
  return 
# 41 "USART.c" 3
        (*(volatile uint8_t *)(0xC6))
# 41 "USART.c"
            ;
}




void printString(const char myString[]) {
  uint8_t i = 0;
  while (myString[i]) {
    transmitByte(myString[i]);
    i++;
  }
}

void readString(char myString[], uint8_t maxLength) {
  char response;
  uint8_t i;
  i = 0;
  while (i < (maxLength - 1)) {
    response = receiveByte();
    transmitByte(response);
    if (response == '\r') {
      break;
    }
    else {
      myString[i] = response;
      i++;
    }
  }
  myString[i] = 0;
}

void printByte(uint8_t byte) {

  transmitByte('0' + (byte / 100));
  transmitByte('0' + ((byte / 10) % 10));
  transmitByte('0' + (byte % 10));
}

void printWord(uint16_t word) {
  transmitByte('0' + (word / 10000));
  transmitByte('0' + ((word / 1000) % 10));
  transmitByte('0' + ((word / 100) % 10));
  transmitByte('0' + ((word / 10) % 10));
  transmitByte('0' + (word % 10));
}

void printBinaryByte(uint8_t byte) {

  uint8_t bit;
  for (bit = 7; bit < 255; bit--) {
    if (
# 92 "USART.c" 3
       ((*(volatile uint8_t *)(((uint16_t) &(
# 92 "USART.c"
       byte
# 92 "USART.c" 3
       )))) & (1 << (
# 92 "USART.c"
       bit
# 92 "USART.c" 3
       )))
# 92 "USART.c"
                            )
      transmitByte('1');
    else
      transmitByte('0');
  }
}

char nibbleToHexCharacter(uint8_t nibble) {

  if (nibble < 10) {
    return ('0' + nibble);
  }
  else {
    return ('A' + nibble - 10);
  }
}

void printHexByte(uint8_t byte) {

  uint8_t nibble;
  nibble = (byte & 0b11110000) >> 4;
  transmitByte(nibbleToHexCharacter(nibble));
  nibble = byte & 0b00001111;
  transmitByte(nibbleToHexCharacter(nibble));
}

uint8_t getNumber(void) {


  char hundreds = '0';
  char tens = '0';
  char ones = '0';
  char thisChar = '0';
  do {
    hundreds = tens;
    tens = ones;
    ones = thisChar;
    thisChar = receiveByte();
    transmitByte(thisChar);
  } while (thisChar != '\r');
  return (100 * (hundreds - '0') + 10 * (tens - '0') + ones - '0');
}
