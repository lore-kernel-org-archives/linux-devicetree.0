From: =?UTF-8?B?Tm9yYWxmIFRyw7hubmVz?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: Can I do register initialization from Device Tree?
Date: Wed, 04 Feb 2015 14:53:39 +0100
Message-ID: <54D22463.7090602@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Recently several framebuffer drivers for small TFT and OLED LCD control=
lers
entered drivers/staging/fbtft (linux-next). For future work on these
drivers, I need to find out how/if DT properties can be used to set
the initial state of the controller.

The controller needs a register setup to match panel characteristics
and driving voltage as the most important things. Because of the large
number of different displays using the same controller, and to avoid
having one driver per display, the initialization sequence was set to b=
e
passed in through platform data. Each controller also has a default ini=
t
sequence. Later Device Tree support was added.

The registers on the MIPI DCS compatible controllers among these, have
varying depth or number of values they contain. For instance register
'Positive Gamma Correction' has 15 values, whereas 'Display ON' has no
values. Additionally, setting some registers requires a certain delay
before proceeding to the next register (voltage/frequency setup).

The non MIPI DSC compatible controllers have one value per register.

Currently the register setup for the controller is specified with an
init property like this in the Device Tree (snippet):
         init =3D <0x10000b0 0x00
         0x1000011
         0x20000FF
         0x100003A 0x55
         0x1000036 0x28
             [...] >;

Meaning of masks:
0x1000000: This is a register number, and the following if any are valu=
es.
0x2000000: This is a delay in milliseconds.


The first thing I considered was making a node for the display panel
charateristics like 'display-timings' does. But I haven't seen any work
that has hinted at such an abstraction, and with my lacking knowledge o=
f
panel design, this is currently impossible. There are also so many poss=
ible
register setting combinations among these controllers. Of course there
are similarities, but with undocumented registers added in the mix,
this becomes very difficult.

This is a similar case that was discussed and approved in 2010:
[v2] of/phylib: Use device tree properties to initialize Marvell PHYs.
http://patchwork.ozlabs.org/patch/72322/


In the following I have listed 4 options that I see as possible solutio=
ns:


OPTION 1
--------

One driver per controller type.
The driver knows almost nothing about the register map.
The majority of current displays targeted by these drivers, use
MIPI DCS compatible controllers. This option would cover them with one
driver (10 of the 23 current drivers is MIPI DCS compatible).

mipi,reg-init =3D < [register] [number of values] [values..] >;
mipi,reg-init =3D < [delay in ms] LCDCTRL_DELAY_MS >;

#define LCDCTRL_DELAY_MS 0xFFFF

     mipi,reg-init =3D
         <0x01 0>,
         <150 LCDCTRL_DELAY_MS>,
         <0x11 0>,
         <500 LCDCTRL_DELAY_MS>,
         <0xB1 3 0x01 0x2C 0x2D>,
         <0xB2 3 0x01 0x2C 0x2D>,
         <0xB3 6 0x01 0x2C 0x2D 0x01 0x2C 0x2D>,
         <0xB4 1 0x07>,
         <0xC0 3 0xA2 0x02 0x84>,
         <0xC1 1 0xC5>,
         <0xC2 2 0x0A 0x00>,
         <0xC3 2 0x8A 0x2A>,
         <0xC4 2 0x8A 0xEE>,
         <0xC5 1 0x0E>,
         <0x20 0>,
         <0x3A 1 0x05>,
         <0x29 0>,
         <100 LCDCTRL_DELAY_MS>,
         <0x13 0>;


OPTION 2
--------

One driver per controller (currently 23).
Each driver has knowledge of the 2-3 registers that need a delay.

st7735,reg-init =3D < [register] [number of values] [values..] >;

     st7735,reg-init =3D
         <0x01 0>,
         <0x11 0>,
         <0xB1 3 0x01 0x2C 0x2D>,
         <0xB2 3 0x01 0x2C 0x2D>,
         <0xB3 6 0x01 0x2C 0x2D 0x01 0x2C 0x2D>,
         <0xB4 1 0x07>,
         <0xC0 3 0xA2 0x02 0x84>,
         <0xC1 1 0xC5>,
         <0xC2 2 0x0A 0x00>,
         <0xC3 2 0x8A 0x2A>,
         <0xC4 2 0x8A 0xEE>,
         <0xC5 1 0x0E>,
         <0x20 0>,
         <0x3A 1 0x05>,
         <0x29 0>,
         <0x13 0>;


OPTION 3
--------

One driver per controller.
Each driver also has a map of the number of values for each register
(max width 8-bit sparsely populated). Some display init sequences use
undocumented registers making this difficult.

st7735,reg-init =3D < [register] [values..] >;

     st7735,reg-init =3D
         <0x01>,
         <0x11>,
         <0xB1 0x01 0x2C 0x2D>,
         <0xB2 0x01 0x2C 0x2D>,
         <0xB3 0x01 0x2C 0x2D 0x01 0x2C 0x2D>,
         <0xB4 0x07>,
         <0xC0 0xA2 0x02 0x84>,
         <0xC1 0xC5>,
         <0xC2 0x0A 0x00>,
         <0xC3 0x8A 0x2A>,
         <0xC4 0x8A 0xEE>,
         <0xC5 0x0E>,
         <0x20>,
         <0x3A 0x05>,
         <0x29>,
         <0x13>;


OPTION 4
--------

One driver per display.
The driver has the init sequence hardcoded, except for gamma.

I started writing these driver 2 years ago, and in the last 6 months th=
e
number of displays targeting these drivers have increased tremendously.
So this option will probably generate a lot of drivers.

Gamma curve
Many controllers have adjustable gamma curves. These usually come in on=
e
positive and one negative curve. The number of values differ between=20
controllers.
These settings would be part of reg-init in the previous options.

     rpi-display,gamma-pos =3D
         <0x1F 0x1A 0x18 0x0A 0x0F 0x06 0x45 0x87
          0x32 0x0A 0x07 0x02 0x07 0x05 0x00>;
     rpi-display,gamma-neg =3D
         <0x00 0x25 0x27 0x05 0x10 0x09 0x3A 0x78
          0x4D 0x05 0x18 0x0D 0x38 0x3A 0x1F>;


I would be grateful for any help in deciding how to do this.


Regards,
Noralf Tr=C3=B8nnes

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
