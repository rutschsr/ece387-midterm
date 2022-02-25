	.file	"chipInterface.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"0x80"
.LC1:
	.string	"0x81"
.LC2:
	.string	"SerialWorking"
.LC3:
	.string	"Supposed to Print I2C data next"
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB6:
	.file 1 "chipInterface.c"
	.loc 1 24 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LVL0:
	.loc 1 29 0
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	mov r29,r24
.LVL1:
	.loc 1 30 0
	ldi r24,lo8(.LC1)
	ldi r25,hi8(.LC1)
	mov r28,r24
.LVL2:
	.loc 1 32 0
	call i2c_init
.LVL3:
	.loc 1 34 0
	call initUSART
.LVL4:
.L2:
	.loc 1 37 0 discriminator 1
	ldi r24,lo8(.LC2)
	ldi r25,hi8(.LC2)
	call printString
.LVL5:
	.loc 1 38 0 discriminator 1
	ldi r24,lo8(10)
	call transmitByte
.LVL6:
	.loc 1 54 0 discriminator 1
	mov r24,r29
	call i2c_start
.LVL7:
	mov r15,r24
.LVL8:
	.loc 1 56 0 discriminator 1
	ldi r24,lo8(4)
	call i2c_write
.LVL9:
	.loc 1 57 0 discriminator 1
	call i2c_stop
.LVL10:
.LBB8:
.LBB9:
	.file 2 "/usr/lib/avr/include/util/delay.h"
	.loc 2 187 0 discriminator 1
	ldi r24,lo8(-5537)
	ldi r25,hi8(-5537)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
.LVL11:
.LBE9:
.LBE8:
	.loc 1 59 0 discriminator 1
	mov r24,r28
	call i2c_rep_start
.LVL12:
	mov r14,r24
.LVL13:
	.loc 1 60 0 discriminator 1
	call i2c_readAck
.LVL14:
	mov r16,r24
.LVL15:
	.loc 1 61 0 discriminator 1
	call i2c_readNak
.LVL16:
	mov r17,r24
.LVL17:
	.loc 1 62 0 discriminator 1
	call i2c_stop
.LVL18:
.LBB10:
.LBB11:
	.loc 2 187 0 discriminator 1
	ldi r24,lo8(-5537)
	ldi r25,hi8(-5537)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
.LVL19:
.LBE11:
.LBE10:
	.loc 1 65 0 discriminator 1
	ldi r24,lo8(.LC3)
	ldi r25,hi8(.LC3)
	call printString
.LVL20:
	.loc 1 66 0 discriminator 1
	ldi r24,lo8(10)
	call transmitByte
.LVL21:
	.loc 1 67 0 discriminator 1
	mov r24,r14
	call printByte
.LVL22:
	.loc 1 68 0 discriminator 1
	ldi r24,lo8(10)
	call transmitByte
.LVL23:
	.loc 1 69 0 discriminator 1
	mov r24,r15
	call printByte
.LVL24:
	.loc 1 70 0 discriminator 1
	ldi r24,lo8(10)
	call transmitByte
.LVL25:
	.loc 1 71 0 discriminator 1
	mov r24,r16
	call printByte
.LVL26:
	.loc 1 72 0 discriminator 1
	mov r24,r17
	call printByte
.LVL27:
	.loc 1 73 0 discriminator 1
	ldi r24,lo8(10)
	call transmitByte
.LVL28:
.LBB12:
.LBB13:
	.loc 2 187 0 discriminator 1
	ldi r24,lo8(-5537)
	ldi r25,hi8(-5537)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
	rjmp .L2
.LBE13:
.LBE12:
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.text
.Letext0:
	.file 3 "/usr/lib/avr/include/stdint.h"
	.file 4 "i2cmaster.h"
	.file 5 "USART.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x3bc
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF26
	.byte	0xc
	.long	.LASF27
	.long	.LASF28
	.long	.Ldebug_ranges0+0
	.long	0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF4
	.byte	0x3
	.byte	0x7e
	.long	0x3b
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF3
	.uleb128 0x3
	.long	.LASF5
	.byte	0x3
	.byte	0x82
	.long	0x62
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF8
	.uleb128 0x5
	.long	.LASF29
	.byte	0x2
	.byte	0xa6
	.byte	0x1
	.byte	0x3
	.long	0xb0
	.uleb128 0x6
	.long	.LASF30
	.byte	0x2
	.byte	0xa6
	.long	0xb0
	.uleb128 0x7
	.long	.LASF9
	.byte	0x2
	.byte	0xa8
	.long	0xb0
	.uleb128 0x7
	.long	.LASF10
	.byte	0x2
	.byte	0xac
	.long	0x57
	.uleb128 0x8
	.byte	0x1
	.long	.LASF31
	.byte	0x2
	.byte	0xad
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF11
	.uleb128 0x9
	.byte	0x1
	.long	.LASF32
	.byte	0x1
	.byte	0x17
	.byte	0x1
	.long	0x42
	.byte	0x1
	.long	.LFB6
	.long	.LFE6
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x330
	.uleb128 0xa
	.string	"x"
	.byte	0x1
	.byte	0x19
	.long	0x30
	.long	.LLST0
	.uleb128 0xa
	.string	"z"
	.byte	0x1
	.byte	0x1a
	.long	0x30
	.long	.LLST1
	.uleb128 0xb
	.string	"ret"
	.byte	0x1
	.byte	0x1b
	.long	0x30
	.byte	0x1
	.byte	0x60
	.uleb128 0xc
	.long	.LASF12
	.byte	0x1
	.byte	0x1c
	.long	0x30
	.byte	0x1
	.byte	0x61
	.uleb128 0xc
	.long	.LASF13
	.byte	0x1
	.byte	0x1d
	.long	0x3b
	.byte	0x6
	.byte	0x3
	.long	.LC0
	.byte	0x9f
	.uleb128 0xc
	.long	.LASF14
	.byte	0x1
	.byte	0x1e
	.long	0x3b
	.byte	0x6
	.byte	0x3
	.long	.LC1
	.byte	0x9f
	.uleb128 0xd
	.long	0x77
	.long	.LBB8
	.long	.LBE8
	.byte	0x1
	.byte	0x3a
	.long	0x167
	.uleb128 0xe
	.long	0x84
	.long	.LLST2
	.uleb128 0xf
	.long	.LBB9
	.long	.LBE9
	.uleb128 0x10
	.long	0x8f
	.long	.LLST3
	.uleb128 0x10
	.long	0x9a
	.long	.LLST4
	.byte	0
	.byte	0
	.uleb128 0xd
	.long	0x77
	.long	.LBB10
	.long	.LBE10
	.byte	0x1
	.byte	0x3f
	.long	0x1a0
	.uleb128 0xe
	.long	0x84
	.long	.LLST5
	.uleb128 0xf
	.long	.LBB11
	.long	.LBE11
	.uleb128 0x10
	.long	0x8f
	.long	.LLST6
	.uleb128 0x10
	.long	0x9a
	.long	.LLST7
	.byte	0
	.byte	0
	.uleb128 0xd
	.long	0x77
	.long	.LBB12
	.long	.LBE12
	.byte	0x1
	.byte	0x4a
	.long	0x1db
	.uleb128 0x11
	.long	0x84
	.byte	0x4
	.long	0x41700000
	.uleb128 0xf
	.long	.LBB13
	.long	.LBE13
	.uleb128 0x12
	.long	0x8f
	.byte	0x4
	.long	0x486a6000
	.uleb128 0x13
	.long	0x9a
	.long	0x3a980
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	.LVL3
	.long	0x330
	.uleb128 0x14
	.long	.LVL4
	.long	0x33d
	.uleb128 0x15
	.long	.LVL5
	.long	0x34a
	.long	0x209
	.uleb128 0x16
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	.LC2
	.byte	0
	.uleb128 0x15
	.long	.LVL6
	.long	0x357
	.long	0x21c
	.uleb128 0x16
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x3a
	.byte	0
	.uleb128 0x15
	.long	.LVL7
	.long	0x364
	.long	0x230
	.uleb128 0x16
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x8d
	.sleb128 0
	.byte	0
	.uleb128 0x15
	.long	.LVL9
	.long	0x371
	.long	0x243
	.uleb128 0x16
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x34
	.byte	0
	.uleb128 0x14
	.long	.LVL10
	.long	0x37e
	.uleb128 0x15
	.long	.LVL12
	.long	0x38b
	.long	0x260
	.uleb128 0x16
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x8c
	.sleb128 0
	.byte	0
	.uleb128 0x14
	.long	.LVL14
	.long	0x398
	.uleb128 0x14
	.long	.LVL16
	.long	0x3a5
	.uleb128 0x14
	.long	.LVL18
	.long	0x37e
	.uleb128 0x15
	.long	.LVL20
	.long	0x34a
	.long	0x297
	.uleb128 0x16
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	.LC3
	.byte	0
	.uleb128 0x15
	.long	.LVL21
	.long	0x357
	.long	0x2aa
	.uleb128 0x16
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x3a
	.byte	0
	.uleb128 0x15
	.long	.LVL22
	.long	0x3b2
	.long	0x2be
	.uleb128 0x16
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x15
	.long	.LVL23
	.long	0x357
	.long	0x2d1
	.uleb128 0x16
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x3a
	.byte	0
	.uleb128 0x15
	.long	.LVL24
	.long	0x3b2
	.long	0x2e5
	.uleb128 0x16
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0x15
	.long	.LVL25
	.long	0x357
	.long	0x2f8
	.uleb128 0x16
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x3a
	.byte	0
	.uleb128 0x15
	.long	.LVL26
	.long	0x3b2
	.long	0x30c
	.uleb128 0x16
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.uleb128 0x15
	.long	.LVL27
	.long	0x3b2
	.long	0x320
	.uleb128 0x16
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x81
	.sleb128 0
	.byte	0
	.uleb128 0x17
	.long	.LVL28
	.long	0x357
	.uleb128 0x16
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x3a
	.byte	0
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.byte	0x1
	.long	.LASF15
	.long	.LASF15
	.byte	0x4
	.byte	0x66
	.uleb128 0x18
	.byte	0x1
	.byte	0x1
	.long	.LASF16
	.long	.LASF16
	.byte	0x5
	.byte	0x11
	.uleb128 0x18
	.byte	0x1
	.byte	0x1
	.long	.LASF17
	.long	.LASF17
	.byte	0x5
	.byte	0x19
	.uleb128 0x18
	.byte	0x1
	.byte	0x1
	.long	.LASF18
	.long	.LASF18
	.byte	0x5
	.byte	0x16
	.uleb128 0x18
	.byte	0x1
	.byte	0x1
	.long	.LASF19
	.long	.LASF19
	.byte	0x4
	.byte	0x77
	.uleb128 0x18
	.byte	0x1
	.byte	0x1
	.long	.LASF20
	.long	.LASF20
	.byte	0x4
	.byte	0x94
	.uleb128 0x18
	.byte	0x1
	.byte	0x1
	.long	.LASF21
	.long	.LASF21
	.byte	0x4
	.byte	0x6d
	.uleb128 0x18
	.byte	0x1
	.byte	0x1
	.long	.LASF22
	.long	.LASF22
	.byte	0x4
	.byte	0x81
	.uleb128 0x18
	.byte	0x1
	.byte	0x1
	.long	.LASF23
	.long	.LASF23
	.byte	0x4
	.byte	0x9b
	.uleb128 0x18
	.byte	0x1
	.byte	0x1
	.long	.LASF24
	.long	.LASF24
	.byte	0x4
	.byte	0xa1
	.uleb128 0x18
	.byte	0x1
	.byte	0x1
	.long	.LASF25
	.long	.LASF25
	.byte	0x5
	.byte	0x1f
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x87
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LVL0
	.long	.LVL4
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL13
	.long	.LFE6
	.word	0x1
	.byte	0x5e
	.long	0
	.long	0
.LLST1:
	.long	.LVL0
	.long	.LVL4
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL8
	.long	.LFE6
	.word	0x1
	.byte	0x5f
	.long	0
	.long	0
.LLST2:
	.long	.LVL10
	.long	.LVL11
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x41700000
	.long	0
	.long	0
.LLST3:
	.long	.LVL10
	.long	.LVL11
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x486a6000
	.long	0
	.long	0
.LLST4:
	.long	.LVL10
	.long	.LVL11
	.word	0x6
	.byte	0xc
	.long	0x3a980
	.byte	0x9f
	.long	0
	.long	0
.LLST5:
	.long	.LVL18
	.long	.LVL19
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x41700000
	.long	0
	.long	0
.LLST6:
	.long	.LVL18
	.long	.LVL19
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x486a6000
	.long	0
	.long	0
.LLST7:
	.long	.LVL18
	.long	.LVL19
	.word	0x6
	.byte	0xc
	.long	0x3a980
	.byte	0x9f
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.LFB6
	.long	.LFE6-.LFB6
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LFB6
	.long	.LFE6
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF26:
	.string	"GNU C99 5.4.0 -mn-flash=1 -mno-skip-bug -mmcu=avr5 -gdwarf-2 -Os -std=gnu99 -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums"
.LASF12:
	.string	"ret1"
.LASF19:
	.string	"i2c_start"
.LASF28:
	.string	"/home/sam/Documents/GitHub/ece387-midterm/src"
.LASF31:
	.string	"__builtin_avr_delay_cycles"
.LASF13:
	.string	"writeadr"
.LASF14:
	.string	"readadr"
.LASF1:
	.string	"unsigned char"
.LASF24:
	.string	"i2c_readNak"
.LASF6:
	.string	"long unsigned int"
.LASF29:
	.string	"_delay_ms"
.LASF15:
	.string	"i2c_init"
.LASF20:
	.string	"i2c_write"
.LASF16:
	.string	"initUSART"
.LASF11:
	.string	"double"
.LASF22:
	.string	"i2c_rep_start"
.LASF32:
	.string	"main"
.LASF27:
	.string	"chipInterface.c"
.LASF2:
	.string	"unsigned int"
.LASF8:
	.string	"long long unsigned int"
.LASF4:
	.string	"uint8_t"
.LASF25:
	.string	"printByte"
.LASF7:
	.string	"long long int"
.LASF21:
	.string	"i2c_stop"
.LASF10:
	.string	"__ticks_dc"
.LASF9:
	.string	"__tmp"
.LASF5:
	.string	"uint32_t"
.LASF3:
	.string	"long int"
.LASF23:
	.string	"i2c_readAck"
.LASF0:
	.string	"signed char"
.LASF18:
	.string	"transmitByte"
.LASF30:
	.string	"__ms"
.LASF17:
	.string	"printString"
	.ident	"GCC: (GNU) 5.4.0"
.global __do_copy_data
