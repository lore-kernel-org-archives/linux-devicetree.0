From: =?ISO-8859-1?Q?Noralf_Tr=F8nnes?= <notro-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: Initial register settings in Device Tree?
Date: Sun, 22 Jun 2014 19:37:56 +0200
Message-ID: <53A71474.7030704@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

I have some framebuffer drivers [1] for LCD controllers with onboard 
RAM, targeted at small displays (<10").
I'm now going to rewrite these drivers from scratch and add DT support.

The controllers have many registers that controls various parameters to 
match the attached panel.
Since a controller can be used with a whole lot of panels, I wonder if I 
can put the register initialization sequence in the Device Tree?

Currently I have a module parameter: init=, which can override the 
default init sequence in the driver if needed.
A challenge is that the register depth often varies among the registers 
(the number of values a register holds). Some also doesn't have a value, 
they're called commands.
This has led me to add markers in my module parameter:
Sainsmart 1.8" (ST7735R)
init=-1,0x01,-2,150,-1,0x11,-2,500,-1,0xB1,0x01,0x2C,0x2D,-1,0xB2,0x01,0x2C,0x2D,-1,0xB3,0x01,0x2C,0x2D,0x01,0x2C,0x2D,-1,0xB4,0x07,-1,0xC0,0xA2,0x02,0x84,-1,0xC1,0xC5,-1,0xC2,0x0A,0x00,-1,0xC3,0x8A,0x2A,-1,0xC4,0x8A,0xEE,-1,0xC5,0x0E,-1,0x20,-1,0x36,0xC0,-1,0x3A,0x05,-1,0xE0,0x0f,0x1a,0x0f,0x18,0x2f,0x28,0x20,0x22,0x1f,0x1b,0x23,0x37,0x00,0x07,0x02,0x10,-1,0xE1,0x0f,0x1b,0x0f,0x17,0x33,0x2c,0x29,0x2e,0x30,0x30,0x39,0x3f,0x00,0x07,0x03,0x10,-1,0x29,-2,100,-1,0x13,-2,10,-3

Markers:
-1: next value is a register, followed by zero or more values
-2: next value is a delay in milliseconds
-3: end marker

 From reading a post by Grant Likely, I understand that 
write-delay-write in the DT is out of the question.
I believe delays mostly have to do with power state transitions and 
display on/off anyway, so I assume it can be handle by the driver for 
all panels.

I see two possibilities:
* add a special marker value to separate the registers, as I do now
* add a flag to indicate a register number. So far I've only seen 8 and 
16-bit register number widths: register 20h could thus be written as 
10000020, 1000020, 100020 or 10020

Example (skipped state changes from previous example):
<100B1 01 2C 2D
  100B2 01 2C 2D
  100B3 01 2C 2D 01 2C 2D
  100B4 07 C0 A2 02 84
  100C1 C5 C2 0A 00
  100C3 8A 2A
  100C4 8A EE
  100C5 0E
  10020
  10036 C0
  1003A 05
  100E0 0f 1a 0f 18 2f 28 20 22 1f 1b 23 37 00 07 02 10
  100E1 0f 1b 0f 17 33 2c 29 2e 30 30 39 3f 00 07 03 10>

Is this a viable solution?



Noralf Tronnes


[1] https://github.com/notro/fbtft

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
