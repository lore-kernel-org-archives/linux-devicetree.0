From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [RFC PATCH] MIPS: Octeon: Add device tree source files.
Date: Thu, 23 Jun 2011 22:00:29 -0600
Message-ID: <BANLkTin7aSULt3w8_d-zaPirVsrVwgKeqQ@mail.gmail.com>
References: <1307387986-27069-4-git-send-email-ddaney@caviumnetworks.com> <1308876129-14145-1-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1308876129-14145-1-git-send-email-david.daney@cavium.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <david.daney@cavium.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, David Daney <ddaney@caviumnetworks.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 23, 2011 at 6:42 PM, David Daney <david.daney@cavium.com> w=
rote:
> From: David Daney <ddaney@caviumnetworks.com>
>
> Signed-off-by: David Daney <ddaney@caviumnetworks.com>
> ---
>
> This is a revision of my main device-tree definitions from my previou=
s
> RFC. =A0I wanted to get feedback on my changes to several bindings
> before I set them in stone.
>
> The changes are to bootbus.txt, compact-flash.txt and dma-engine.txt.
>
> Basically there are a ton of parameters needed to initialize the boot
> bus, and I just stuck them all in there. =A0Is this the best way to
> handle something like this?
>
> I look forward to hearing any feedback.

Mostly looks good.  Comments below.

g.

>
> Thanks,
> David Daney
>
> =A0.../devicetree/bindings/mips/cavium/bootbus.txt =A0 =A0| =A0114 ++=
+++
> =A0.../devicetree/bindings/mips/cavium/ciu.txt =A0 =A0 =A0 =A0| =A0 2=
6 ++
> =A0.../bindings/mips/cavium/compact-flash.txt =A0 =A0 =A0 =A0 | =A0 3=
1 ++
> =A0.../devicetree/bindings/mips/cavium/dma-engine.txt | =A0 21 +
> =A0.../devicetree/bindings/mips/cavium/gpio.txt =A0 =A0 =A0 | =A0 48 =
++

should be .../bindings/gpio/cavium.txt

> =A0.../devicetree/bindings/mips/cavium/mdio.txt =A0 =A0 =A0 | =A0 27 =
++

=2E../bindings/net/mdio.txt

and so on.

> =A0.../devicetree/bindings/mips/cavium/mix.txt =A0 =A0 =A0 =A0| =A0 4=
0 ++
> =A0.../devicetree/bindings/mips/cavium/pip.txt =A0 =A0 =A0 =A0| =A0 9=
8 +++++
> =A0.../devicetree/bindings/mips/cavium/twsi.txt =A0 =A0 =A0 | =A0 34 =
++
> =A0.../devicetree/bindings/mips/cavium/uart.txt =A0 =A0 =A0 | =A0 19 =
+
> =A0.../devicetree/bindings/mips/cavium/uctl.txt =A0 =A0 =A0 | =A0 47 =
++
> =A0arch/mips/cavium-octeon/.gitignore =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A02 +
> =A0arch/mips/cavium-octeon/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 13 +
> =A0arch/mips/cavium-octeon/octeon_3xxx.dts =A0 =A0 =A0 =A0 =A0 =A0| =A0=
452 ++++++++++++++++++++
> =A014 files changed, 972 insertions(+), 0 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/mips/cavium/b=
ootbus.txt
> =A0create mode 100644 Documentation/devicetree/bindings/mips/cavium/c=
iu.txt
> =A0create mode 100644 Documentation/devicetree/bindings/mips/cavium/c=
ompact-flash.txt
> =A0create mode 100644 Documentation/devicetree/bindings/mips/cavium/d=
ma-engine.txt
> =A0create mode 100644 Documentation/devicetree/bindings/mips/cavium/g=
pio.txt
> =A0create mode 100644 Documentation/devicetree/bindings/mips/cavium/m=
dio.txt
> =A0create mode 100644 Documentation/devicetree/bindings/mips/cavium/m=
ix.txt
> =A0create mode 100644 Documentation/devicetree/bindings/mips/cavium/p=
ip.txt
> =A0create mode 100644 Documentation/devicetree/bindings/mips/cavium/t=
wsi.txt
> =A0create mode 100644 Documentation/devicetree/bindings/mips/cavium/u=
art.txt
> =A0create mode 100644 Documentation/devicetree/bindings/mips/cavium/u=
ctl.txt
> =A0create mode 100644 arch/mips/cavium-octeon/.gitignore
> =A0create mode 100644 arch/mips/cavium-octeon/octeon_3xxx.dts
>
> diff --git a/Documentation/devicetree/bindings/mips/cavium/bootbus.tx=
t b/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
> new file mode 100644
> index 0000000..2960ba8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
> @@ -0,0 +1,114 @@
> +* Boot Bus
> +
> +The Octeon Boot Bus is a configurable parallel bus with 8 chip
> +selects. =A0Each chip select is independently configurable.
> +
> +Properties:
> +- compatible: "cavium,octeon-3860-bootbus"
> +
> + =A0Compatibility with all cn3XXX, cn5XXX and cn6XXX SOCs.
> +
> +- reg: The base address of the Boot Bus' register bank.
> +
> +- #address-cells: Must be <2>. =A0The first cell is the chip select
> + =A0 within the bootbus. =A0The second cell is the offset from the c=
hip select.
> +
> +- #size-cells: Must be <1>.
> +
> +- ranges: There must be one one triplet of (child-bus-address,
> + =A0parent-bus-address, length) for each active chip select. =A0If t=
he
> + =A0length element for any triplet is zero, the chip select is disab=
led,
> + =A0making it inactive.

You don't need to actually define standard properties like 'ranges'.
You can save some text that way.

> +
> +- t-adr: An array of 8 elements specifying the ADR timing parameter
> + =A0(in nS) for the each of the 8 chip selects.

Using arrays like this is a little awkward.  Particularly if board
code needs to modify only one CS configuration; it then needs to
replace /all/ of the configuration values because there is no way for
DTC to modify a portion of property data.  You may want to consider a
set of CS configuration child nodes with the parameters as properties.

Also, these property names are pretty terse.  They should probably
carry a "cavium," prefix, and you can use longer names.

> +
> +- t-ce: An array of 8 elements specifying the CE timing parameter
> + =A0(in nS) for the each of the 8 chip selects.
> +
> +- t-oe: An array of 8 elements specifying the OE timing parameter
> + =A0(in nS) for the each of the 8 chip selects.
> +
> +- t-we: An array of 8 elements specifying the WE timing parameter
> + =A0(in nS) for the each of the 8 chip selects.
> +
> +- t-rd-hld: An array of 8 elements specifying the RD_HLD timing para=
meter
> + =A0(in nS) for the each of the 8 chip selects.
> +
> +- t-wr-hld: An array of 8 elements specifying the WR_HLD timing para=
meter
> + =A0(in nS) for the each of the 8 chip selects.
> +
> +- t-pause: An array of 8 elements specifying the PAUSE timing parame=
ter
> + =A0(in nS) for the each of the 8 chip selects.
> +
> +- t-wait: An array of 8 elements specifying the WAIT timing paramete=
r
> + =A0(in nS) for the each of the 8 chip selects.
> +
> +- t-page: An array of 8 elements specifying the PAGE timing paramete=
r
> + =A0(in nS) for the each of the 8 chip selects.
> +
> +- t-rd-dly: An array of 8 elements specifying the RD_DLY timing para=
meter
> + =A0(in nS) for the each of the 8 chip selects.
> +
> +- pages: An array of 8 elements specifying the PAGES parameter (0 =3D=
 8
> + =A0bytes, 1 =3D 2 bytes, 2 =3D 4 bytes, 3 =3D 8 bytes) for the each=
 of the 8
> + =A0chip selects.
> +
> +- wait-mode: An array of 8 elements specifying the WAITM parameter
> + =A0(0 or 1) for the each of the 8 chip selects.
> +
> +- page-mode: An array of 8 elements specifying the PAGEM parameter
> + =A0(0 or 1) for the each of the 8 chip selects.
> +
> +- bus-width: An array of 8 elements specifying the WIDTH parameter
> + =A0(in bits) for the each of the 8 chip selects.
> +
> +- ale-mode: An array of 8 elements specifying the ALE parameter
> + =A0(0 or 1) for the each of the 8 chip selects.
> +
> +- sam-mode: An array of 8 elements specifying the SAM parameter
> + =A0(0 or 1) for the each of the 8 chip selects.
> +
> +- or-mode: An array of 8 elements specifying the OR parameter
> + =A0(0 or 1) for the each of the 8 chip selects.
> +
> +
> +Example:
> + =A0 =A0 =A0 bootbus: bootbus@1180000000000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,octeon-3860-boot=
bus";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x11800 0x00000000 0x0 0x200>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* The chip select number and offset */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <2>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* The size of the chip select region *=
/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0 0 =A00x0 0x1f400000 =A00x=
c00000>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<1 0 =A00x10000 0x30=
000000 =A00>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<2 0 =A00x10000 0x40=
000000 =A00>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<3 0 =A00x10000 0x50=
000000 =A00>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<4 0 =A00x0 0x1d0200=
00 =A00x10000>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<5 0 =A00x0 0x1d0400=
00 =A00x10000>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<6 0 =A00x0 0x1d0500=
00 =A00x10000>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<7 0 =A00x10000 0x90=
000000 =A00>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 t-adr =A0 =A0=3D <20 0 0 0 320 =A0 5 =A0=
 5 0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 t-ce =A0 =A0 =3D <60 0 0 0 320 300 300 =
0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 t-oe =A0 =A0 =3D <60 0 0 0 320 125 270 =
0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 t-we =A0 =A0 =3D <45 0 0 0 320 150 150 =
0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 t-rd-hld =3D <35 0 0 0 320 100 100 0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 t-wr-hld =3D <45 0 0 0 320 =A030 =A070 =
0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 t-pause =A0=3D < 0 0 0 0 320 =A0 0 =A0 =
0 0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 t-wait =A0 =3D < 0 0 0 0 320 =A030 =A0 =
0 0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 t-page =A0 =3D <35 0 0 0 320 320 320 0>=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 t-rd-dly =3D < 0 0 0 0 =A0 0 =A0 0 =A0 =
0 0>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pages =A0 =A0 =3D <0 0 0 0 0 =A00 =A00 =
0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 wait-mode =3D <0 0 0 0 0 =A01 =A00 0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 page-mode =3D <0 0 0 0 0 =A00 =A00 0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bus-width =3D <8 8 8 8 8 16 16 8>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ale-mode =A0=3D <0 0 0 0 0 =A00 =A00 0>=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 sam-mode =A0=3D <0 0 0 0 0 =A00 =A00 0>=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 or-mode =A0 =3D <0 0 0 0 0 =A00 =A00 0>=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .
> + =A0 =A0 =A0 };
> diff --git a/Documentation/devicetree/bindings/mips/cavium/ciu.txt b/=
Documentation/devicetree/bindings/mips/cavium/ciu.txt
> new file mode 100644
> index 0000000..c8ff212
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/cavium/ciu.txt
> @@ -0,0 +1,26 @@
> +* Central Interrupt Unit
> +
> +Properties:
> +- compatible: "cavium,octeon-3860-ciu"
> +
> + =A0Compatibility with all cn3XXX, cn5XXX and cn63XX SOCs.
> +
> +- interrupt-controller: =A0This is an interrupt controller.
> +
> +- reg: The base address of the CIU's register bank.
> +
> +- #interrupt-cells: Must be <2>. =A0The first cell is the bank withi=
n
> + =A0 the CIU and may have a value of 0 or 1. =A0The second cell is t=
he bit
> + =A0 within the bank and may have a value between 0 and 63.

Is there any edge/level high/low configuration on these interrupt
lines?  If so, then you'll want a third cell for flags.  (I may have
already asked you this question)

> +
> +Example:
> + =A0 =A0 =A0 interrupt-controller@1070000000000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,octeon-3860-ciu"=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Interrupts are specified by two part=
s:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* 1) Controller register (0 or 1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* 2) Bit within the register (0..63)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <2>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x10700 0x00000000 0x0 0x7000>=
;
> + =A0 =A0 =A0 };
> diff --git a/Documentation/devicetree/bindings/mips/cavium/compact-fl=
ash.txt b/Documentation/devicetree/bindings/mips/cavium/compact-flash.t=
xt
> new file mode 100644
> index 0000000..84972a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/cavium/compact-flash.txt
> @@ -0,0 +1,31 @@
> +* Compact Flash
> +
> +The Cavium Compact Flash device is connected to the Octeon Boot Bus,
> +and is thus a child of the Boot Bus device. =A0It can read and write
> +industry standard compact flash devices.
> +
> +Properties:
> +- compatible: "cavium,ebt3000-compact-flash";
> +
> + =A0Compatibility with many Cavium evaluation boards.
> +
> +- reg: The base address of the the CF chip select banks. =A0Dependin=
g on
> + =A0the device configuration, there may be one or two banks.
> +
> +- bus-width: The width of the connection to the CF devices. =A0Valid
> + =A0values are 8 and 16.
> +
> +- true-ide: Mode of the CF connection. =A0Valid values are 1 - True =
IDE,
> + =A00 - not True IDE.

Often, booleans like this are encoded based on whether or not the
property is present.  ie. "cavium,true-ide;" turns on true-ide mode.

> +
> +- dma-engine-handle: Optional, a phandle for the DMA Engine connecte=
d
> + =A0to this device.

In general, if you're defining new device-specific properties, it is
good practice to prefix them with "cavium,"

> +
> +Example:
> + =A0 =A0 =A0 compact-flash@5,0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,ebt3000-compact-=
flash";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <5 0 0x10000>, <6 0 0x10000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bus-width =3D <16>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 true-ide =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma-engine-handle =3D <&dma0>;
> + =A0 =A0 =A0 };
> diff --git a/Documentation/devicetree/bindings/mips/cavium/dma-engine=
=2Etxt b/Documentation/devicetree/bindings/mips/cavium/dma-engine.txt
> new file mode 100644
> index 0000000..cb4291e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/cavium/dma-engine.txt
> @@ -0,0 +1,21 @@
> +* DMA Engine.
> +
> +The Octeon DMA Engine transfers between the Boot Bus and main memory=
=2E
> +The DMA Engine will be refered to by phandle by any device that is
> +connected to it.
> +
> +Properties:
> +- compatible: "cavium,octeon-5750-bootbus-dma"
> +
> + =A0Compatibility with all cn52XX, cn56XX and cn6XXX SOCs.
> +
> +- reg: The base address of the DMA Engine's register bank.
> +
> +- interrupts: A single interrupt specifier.
> +
> +Example:
> + =A0 =A0 =A0 dma0: dma-engine@1180000000100 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,octeon-5750-boot=
bus-dma";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x11800 0x00000100 0x0 0x8>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0 63>;
> + =A0 =A0 =A0 };
> diff --git a/Documentation/devicetree/bindings/mips/cavium/gpio.txt b=
/Documentation/devicetree/bindings/mips/cavium/gpio.txt
> new file mode 100644
> index 0000000..21b989a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/cavium/gpio.txt
> @@ -0,0 +1,48 @@
> +* General Purpose Input Output (GPIO) bus.
> +
> +Properties:
> +- compatible: "cavium,octeon-3860-gpio"
> +
> + =A0Compatibility with all cn3XXX, cn5XXX and cn6XXX SOCs.
> +
> +- reg: The base address of the GPIO unit's register bank.
> +
> +- gpio-controller: This is a GPIO controller.
> +
> +- #gpio-cells: Must be <2>. =A0The first cell is the GPIO pin.

Should also state what the meaning of the 2nd cell is.

> +
> +- interrupt-controller: The GPIO controller is also an interrupt
> + =A0controller, any of its pins may be configured as an interrupt
> + =A0source.
> +
> +- #interrupt-cells: Must be <2>. =A0The first cell is the GPIO pin
> + =A0 connected to the interrupt source. =A0The second cell is the in=
terrupt
> + =A0 triggering protocol and may have one of four values:
> + =A0 1 - edge triggered on the rising edge.
> + =A0 2 - edge triggered on the falling edge
> + =A0 4 - level triggered active high.
> + =A0 8 - level triggered active low.
> +
> +- interrupts: Interrupt routing for pin 0. =A0The remaining pins are
> + =A0also routed, but in a manner that can be derived from the pin0
> + =A0routing, so they are not specified.
> +
> +Example:
> +
> + =A0 =A0 =A0 gpio-controller@1070000000800 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #gpio-cells =3D <2>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,octeon-3860-gpio=
";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x10700 0x00000800 0x0 0x100>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio-controller;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Interrupts are specified by two part=
s:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* 1) GPIO pin number (0..15)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* 2) Triggering (1 - edge rising
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A02 -=
 edge falling
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A04 -=
 level active high
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A08 -=
 level active low)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <2>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* The GPIO pin connect to 16 consecuti=
ve CUI bits */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0 16>;
> + =A0 =A0 =A0 };
> diff --git a/Documentation/devicetree/bindings/mips/cavium/mdio.txt b=
/Documentation/devicetree/bindings/mips/cavium/mdio.txt
> new file mode 100644
> index 0000000..6253c3b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/cavium/mdio.txt
> @@ -0,0 +1,27 @@
> +* System Management Interface (SMI) / MDIO
> +
> +Properties:
> +- compatible: "cavium,octeon-3860-mdio"
> +
> + =A0Compatibility with all cn3XXX, cn5XXX and cn6XXX SOCs.
> +
> +- reg: The base address of the MDIO bus controller register bank.
> +
> +- #address-cells: Must be <1>.
> +
> +- #size-cells: Must be <0>. =A0MDIO addresses have no size component=
=2E
> +
> +Typically an MDIO bus might have several children.
> +
> +Example:
> + =A0 =A0 =A0 mdio@1180000001800 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,octeon-3860-mdio=
";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x11800 0x00001800 0x0 0x40>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ethernet-phy@0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ...
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 };
> diff --git a/Documentation/devicetree/bindings/mips/cavium/mix.txt b/=
Documentation/devicetree/bindings/mips/cavium/mix.txt
> new file mode 100644
> index 0000000..2a91a33
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/cavium/mix.txt
> @@ -0,0 +1,40 @@
> +* MIX Ethernet controller.
> +
> +Properties:
> +- compatible: "cavium,octeon-5750-mix"
> +
> + =A0Compatibility with all cn5XXX and cn6XXX SOCs populated with MIX
> + =A0devices.
> +
> +- reg: The base addresses of four seperate register banks. =A0The fi=
rst

sp.  separate.

> + =A0bank contains the MIX registers. =A0The second bank the correspo=
nding
> + =A0AGL registers. =A0The third bank are the AGL registers shared by=
 all
> + =A0MIX devices present. =A0The fourth bank is the AGL_PRT_CTL share=
d by
> + =A0all MIX devices present.
> +
> +- cell-index: A single cell specifying which portion of the shared
> + =A0register banks corresponds to this MIX device.
> +
> +- interrupts: Two interrupt specifiers. =A0The first is the MIX
> + =A0interrupt routing and the second the routing for the AGL interru=
pts.
> +
> +- mac-address: Optional, the MAC address to assign to the device.
> +
> +- local-mac-address: Optional, the MAC address to assign to the devi=
ce
> + =A0if mac-address is not specified.
> +
> +- phy-handle: Optional, a phandle for the PHY device connected to th=
is device.
> +
> +Example:
> + =A0 =A0 =A0 ethernet@1070000100800 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,octeon-5750-mix"=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x10700 0x00100800 0x0 0x100>,=
 /* MIX */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <0x11800 0xE0000800 0x0 0x3=
00>, /* AGL */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <0x11800 0xE0000400 0x0 0x4=
00>, /* AGL_SHARED =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <0x11800 0xE0002008 0x0 0x8=
>; =A0 /* AGL_PRT_CTL */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cell-index =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <1 18>, < 1 46>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 local-mac-address =3D [ 00 0f b7 10 63 =
54 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 phy-handle =3D <&phy1>;
> + =A0 =A0 =A0 };
> +
> diff --git a/Documentation/devicetree/bindings/mips/cavium/pip.txt b/=
Documentation/devicetree/bindings/mips/cavium/pip.txt
> new file mode 100644
> index 0000000..d4c53ba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/cavium/pip.txt
> @@ -0,0 +1,98 @@
> +* PIP Ethernet nexus.
> +
> +The PIP Ethernet nexus can control several data packet input/output
> +devices. =A0The devices have a two level grouping scheme. =A0There m=
ay be
> +several interfaces, and each interface may have several ports. =A0Th=
ese
> +ports might be an individual Ethernet PHY.
> +
> +
> +Properties for the PIP nexus:
> +- compatible: "cavium,octeon-3860-pip"
> +
> + =A0Compatibility with all cn3XXX, cn5XXX and cn6XXX SOCs.
> +
> +- reg: The base address of the PIP's register bank.
> +
> +- #address-cells: Must be <1>.
> +
> +- #size-cells: Must be <0>.
> +
> +Properties for PIP interfaces which is a child the PIP nexus:
> +- compatible: "cavium,octeon-3860-pip-interface"
> +
> + =A0Compatibility with all cn3XXX, cn5XXX and cn6XXX SOCs.
> +
> +- reg: The interface number.
> +
> +- #address-cells: Must be <1>.
> +
> +- #size-cells: Must be <0>.
> +
> +Properties for PIP port which is a child the PIP interface:
> +- compatible: "cavium,octeon-3860-pip-port"
> +
> + =A0Compatibility with all cn3XXX, cn5XXX and cn6XXX SOCs.
> +
> +- reg: The port number within the interface group.
> +
> +- mac-address: Optional, the MAC address to assign to the device.
> +
> +- local-mac-address: Optional, the MAC address to assign to the devi=
ce
> + =A0if mac-address is not specified.
> +
> +- phy-handle: Optional, a phandle for the PHY device connected to th=
is device.
> +
> +Example:
> +
> + =A0 =A0 =A0 pip@11800a0000000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,octeon-3860-pip"=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x11800 0xa0000000 0x0 0x2000>=
;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interface@0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,=
octeon-3860-pip-interface";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0>; /* interfa=
ce */
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ethernet@0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compati=
ble =3D "cavium,octeon-3860-pip-port";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D=
 <0x0>; /* Port */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 local-m=
ac-address =3D [ 00 0f b7 10 63 60 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phy-han=
dle =3D <&phy2>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ethernet@1 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compati=
ble =3D "cavium,octeon-3860-pip-port";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D=
 <0x1>; /* Port */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 local-m=
ac-address =3D [ 00 0f b7 10 63 61 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phy-han=
dle =3D <&phy3>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ethernet@2 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compati=
ble =3D "cavium,octeon-3860-pip-port";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D=
 <0x2>; /* Port */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 local-m=
ac-address =3D [ 00 0f b7 10 63 62 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phy-han=
dle =3D <&phy4>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ethernet@3 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compati=
ble =3D "cavium,octeon-3860-pip-port";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D=
 <0x3>; /* Port */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 local-m=
ac-address =3D [ 00 0f b7 10 63 63 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phy-han=
dle =3D <&phy5>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interface@1 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,=
octeon-3860-pip-interface";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <1>; /* interfa=
ce */
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ethernet@0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compati=
ble =3D "cavium,octeon-3860-pip-port";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D=
 <0x0>; /* Port */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 local-m=
ac-address =3D [ 00 0f b7 10 63 64 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phy-han=
dle =3D <&phy6>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 };
> diff --git a/Documentation/devicetree/bindings/mips/cavium/twsi.txt b=
/Documentation/devicetree/bindings/mips/cavium/twsi.txt
> new file mode 100644
> index 0000000..6e57155
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/cavium/twsi.txt
> @@ -0,0 +1,34 @@
> +* Two Wire Serial Interface (TWSI) / I2C
> +
> +- compatible: "cavium,octeon-3860-twsi"
> +
> + =A0Compatibility with all cn3XXX, cn5XXX and cn6XXX SOCs.
> +
> +- reg: The base address of the TWSI/I2C bus controller register bank=
=2E
> +
> +- #address-cells: Must be <1>.
> +
> +- #size-cells: Must be <0>. =A0I2C addresses have no size component.
> +
> +- interrupts: A single interrupt specifier.
> +
> +- clock-rate: The I2C bus clock rate in Hz.
> +
> +Example:
> + =A0 =A0 =A0 twsi0: i2c@1180000001000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,octeon-3860-twsi=
";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x11800 0x00001000 0x0 0x200>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0 45>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-rate =3D <100000>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rtc@68 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "dallas,=
ds1337";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x68>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp@4c {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "ti,tmp4=
21";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x4c>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 };
> diff --git a/Documentation/devicetree/bindings/mips/cavium/uart.txt b=
/Documentation/devicetree/bindings/mips/cavium/uart.txt
> new file mode 100644
> index 0000000..87a6c37
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/cavium/uart.txt
> @@ -0,0 +1,19 @@
> +* Universal Asynchronous Receiver/Transmitter (UART)
> +
> +- compatible: "cavium,octeon-3860-uart"
> +
> + =A0Compatibility with all cn3XXX, cn5XXX and cn6XXX SOCs.
> +
> +- reg: The base address of the UART register bank.
> +
> +- interrupts: A single interrupt specifier.
> +
> +- current-speed: Optional, the current bit rate in bits per second.
> +
> +Example:
> + =A0 =A0 =A0 uart1: serial@1180000000c00 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,octeon-3860-uart=
","ns16550";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x11800 0x00000c00 0x0 0x400>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 current-speed =3D <115200>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0 35>;
> + =A0 =A0 =A0 };
> diff --git a/Documentation/devicetree/bindings/mips/cavium/uctl.txt b=
/Documentation/devicetree/bindings/mips/cavium/uctl.txt
> new file mode 100644
> index 0000000..5dabe02
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/cavium/uctl.txt
> @@ -0,0 +1,47 @@
> +* UCTL USB controller glue
> +
> +Properties:
> +- compatible: "cavium,octeon-6335-uctl"
> +
> + =A0Compatibility with all cn6XXX SOCs.
> +
> +- reg: The base address of the UCTL register bank.
> +
> +- #address-cells: Must be <2>.
> +
> +- #size-cells: Must be <2>.
> +
> +- ranges: Empty to signify direct mapping of the children.
> +
> +- refclk-frequency: A single cell containing the reference clock
> + =A0frequency in Hz.
> +
> +- refclk-type: A string describing the reference clock connection
> + =A0either "crystal" or "external".
> +
> +Example:
> + =A0 =A0 =A0 uctl@118006f000000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,octeon-6335-uctl=
";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x11800 0x6f000000 0x0 0x100>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges; /* Direct mapping */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <2>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <2>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 12MHz, 24MHz and 48MHz allowed */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 refclk-frequency =3D <24000000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Either "crystal" or "external" */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 refclk-type =3D "crystal";
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ehci@16f0000000000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,=
octeon-6335-ehci","usb-ehci";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x16f00 0x0000=
0000 0x0 0x100>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0 56>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 big-endian-regs;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ohci@16f0000000400 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,=
octeon-6335-ohci","usb-ohci";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x16f00 0x0000=
0400 0x0 0x100>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0 56>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 big-endian-regs;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 };
> +
> diff --git a/arch/mips/cavium-octeon/.gitignore b/arch/mips/cavium-oc=
teon/.gitignore
> new file mode 100644
> index 0000000..39c9686
> --- /dev/null
> +++ b/arch/mips/cavium-octeon/.gitignore
> @@ -0,0 +1,2 @@
> +*.dtb.S
> +*.dtb
> diff --git a/arch/mips/cavium-octeon/Makefile b/arch/mips/cavium-octe=
on/Makefile
> index 19eb043..b8d4f63 100644
> --- a/arch/mips/cavium-octeon/Makefile
> +++ b/arch/mips/cavium-octeon/Makefile
> @@ -15,3 +15,16 @@ obj-y +=3D octeon-memcpy.o
> =A0obj-y +=3D executive/
>
> =A0obj-$(CONFIG_SMP) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D smp=
=2Eo
> +
> +DTS_FILES =3D octeon_3xxx.dts
> +DTB_FILES =3D $(patsubst %.dts, %.dtb, $(DTS_FILES))
> +
> +obj-y +=3D $(patsubst %.dts, %.dtb.o, $(DTS_FILES))
> +
> +$(obj)/%.dtb: $(src)/%.dts
> + =A0 =A0 =A0 $(call cmd,dtc)
> +
> +# Let's keep the .dtb files around in case we want to look at them.
> +.SECONDARY: =A0$(addprefix $(obj)/, $(DTB_FILES))
> +
> +clean-files +=3D $(DTB_FILES) $(patsubst %.dtb, %.dtb.S, $(DTB_FILES=
))
> diff --git a/arch/mips/cavium-octeon/octeon_3xxx.dts b/arch/mips/cavi=
um-octeon/octeon_3xxx.dts
> new file mode 100644
> index 0000000..a6afd21
> --- /dev/null
> +++ b/arch/mips/cavium-octeon/octeon_3xxx.dts
> @@ -0,0 +1,452 @@
> +/dts-v1/;
> +/*
> + * OCTEON 3XXX, 5XXX, 63XX device tree skeleton.
> + *
> + * This device tree is pruned and patched by early boot code before
> + * use. =A0Because of this, it contains a super-set of the available
> + * devices and properties.
> + */
> +/ {
> + =A0 =A0 =A0 compatible =3D "cavium,octeon-3860";
> + =A0 =A0 =A0 #address-cells =3D <2>;
> + =A0 =A0 =A0 #size-cells =3D <2>;
> + =A0 =A0 =A0 interrupt-parent =3D <&ciu>;
> +
> + =A0 =A0 =A0 soc@0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <2>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <2>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges; /* Direct mapping */
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ciu: interrupt-controller@1070000000000=
 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,=
octeon-3860-ciu";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Interrupts are speci=
fied by two parts:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* 1) Controller regi=
ster (0 or 1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* 2) Bit within the =
register (0..63)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <2=
>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x10700 0x0000=
0000 0x0 0x7000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio: gpio-controller@1070000000800 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #gpio-cells =3D <2>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,=
octeon-3860-gpio";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x10700 0x0000=
0800 0x0 0x100>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio-controller;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Interrupts are speci=
fied by two parts:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* 1) GPIO pin number=
 (0..15)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* 2) Triggering (1 -=
 edge rising
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A02 - edge falling
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A04 - level active high
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A08 - level active low)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <2=
>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* The GPIO pin connect=
 to 16 consecutive CUI bits */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0 16>; =
/* <0 17> <0 18> <0 19>
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0<0 20> <0 21> <0 22> <0 23>
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0<0 24> <0 25> <0 26> <0 27>
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0<0 28> <0 29> <0 30> <0 31>; */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 smi0: mdio@1180000001800 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,=
octeon-3860-mdio";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x11800 0x0000=
1800 0x0 0x40>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phy0: ethernet-phy@0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compati=
ble =3D "broadcom,bcm5241";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D=
 <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phy1: ethernet-phy@1 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compati=
ble =3D "broadcom,bcm5241";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D=
 <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phy2: ethernet-phy@2 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D=
 <2>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compati=
ble =3D "marvell,88e1149r";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 marvell=
,reg-init =3D <3 0x10 0 0x5777>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 <3 0x11 0 0x00aa>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 <3 0x12 0 0x4105>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 <3 0x13 0 0x0a60>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phy3: ethernet-phy@3 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D=
 <3>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compati=
ble =3D "marvell,88e1149r";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 marvell=
,reg-init =3D <3 0x10 0 0x5777>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 <3 0x11 0 0x00aa>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 <3 0x12 0 0x4105>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 <3 0x13 0 0x0a60>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phy4: ethernet-phy@4 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D=
 <4>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compati=
ble =3D "marvell,88e1149r";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 marvell=
,reg-init =3D <3 0x10 0 0x5777>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 <3 0x11 0 0x00aa>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 <3 0x12 0 0x4105>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 <3 0x13 0 0x0a60>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phy5: ethernet-phy@5 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D=
 <5>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compati=
ble =3D "marvell,88e1149r";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 marvell=
,reg-init =3D <3 0x10 0 0x5777>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 <3 0x11 0 0x00aa>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 <3 0x12 0 0x4105>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 <3 0x13 0 0x0a60>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phy6: ethernet-phy@6 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D=
 <6>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compati=
ble =3D "marvell,88e1149r";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 marvell=
,reg-init =3D <3 0x10 0 0x5777>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 <3 0x11 0 0x00aa>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 <3 0x12 0 0x4105>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 <3 0x13 0 0x0a60>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phy7: ethernet-phy@7 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D=
 <7>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compati=
ble =3D "marvell,88e1149r";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 marvell=
,reg-init =3D <3 0x10 0 0x5777>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 <3 0x11 0 0x00aa>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 <3 0x12 0 0x4105>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 <3 0x13 0 0x0a60>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phy8: ethernet-phy@8 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D=
 <8>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compati=
ble =3D "marvell,88e1149r";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 marvell=
,reg-init =3D <3 0x10 0 0x5777>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 <3 0x11 0 0x00aa>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 <3 0x12 0 0x4105>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 <3 0x13 0 0x0a60>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phy9: ethernet-phy@9 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D=
 <9>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compati=
ble =3D "marvell,88e1149r";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 marvell=
,reg-init =3D <3 0x10 0 0x5777>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 <3 0x11 0 0x00aa>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 <3 0x12 0 0x4105>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 <3 0x13 0 0x0a60>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 smi1: mdio@1180000001900 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,=
octeon-3860-mdio";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x11800 0x0000=
1900 0x0 0x40>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mix0: ethernet@1070000100000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,=
octeon-5750-mix";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x10700 0x0010=
0000 0x0 0x100>, /* MIX */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <0x11800 0x=
E0000000 0x0 0x300>, /* AGL */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <0x11800 0x=
E0000400 0x0 0x400>, /* AGL_SHARED =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <0x11800 0x=
E0002000 0x0 0x8>; =A0 /* AGL_PRT_CTL */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cell-index =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0 62>, =
<1 46>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 local-mac-address =3D [=
 00 00 00 00 00 00 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phy-handle =3D <&phy0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mix1: ethernet@1070000100800 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,=
octeon-5750-mix";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x10700 0x0010=
0800 0x0 0x100>, /* MIX */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <0x11800 0x=
E0000800 0x0 0x300>, /* AGL */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <0x11800 0x=
E0000400 0x0 0x400>, /* AGL_SHARED =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <0x11800 0x=
E0002008 0x0 0x8>; =A0 /* AGL_PRT_CTL */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cell-index =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <1 18>, =
< 1 46>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 local-mac-address =3D [=
 00 00 00 00 00 00 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phy-handle =3D <&phy1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pip: pip@11800a0000000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,=
octeon-3860-pip";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x11800 0xa000=
0000 0x0 0x2000>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interface@0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compati=
ble =3D "cavium,octeon-3860-pip-interface";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #addres=
s-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-c=
ells =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D=
 <0>; /* interface */
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 etherne=
t@0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 compatible =3D "cavium,octeon-3860-pip-port";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 reg =3D <0x0>; /* Port */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 local-mac-address =3D [ 00 00 00 00 00 00 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 phy-handle =3D <&phy2>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 etherne=
t@1 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 compatible =3D "cavium,octeon-3860-pip-port";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 reg =3D <0x1>; /* Port */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 local-mac-address =3D [ 00 00 00 00 00 00 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 phy-handle =3D <&phy3>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 etherne=
t@2 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 compatible =3D "cavium,octeon-3860-pip-port";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 reg =3D <0x2>; /* Port */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 local-mac-address =3D [ 00 00 00 00 00 00 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 phy-handle =3D <&phy4>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 etherne=
t@3 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 compatible =3D "cavium,octeon-3860-pip-port";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 reg =3D <0x3>; /* Port */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 local-mac-address =3D [ 00 00 00 00 00 00 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 phy-handle =3D <&phy5>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 etherne=
t@4 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 compatible =3D "cavium,octeon-3860-pip-port";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 reg =3D <0x4>; /* Port */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 local-mac-address =3D [ 00 00 00 00 00 00 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 etherne=
t@5 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 compatible =3D "cavium,octeon-3860-pip-port";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 reg =3D <0x5>; /* Port */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 local-mac-address =3D [ 00 00 00 00 00 00 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 etherne=
t@6 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 compatible =3D "cavium,octeon-3860-pip-port";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 reg =3D <0x6>; /* Port */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 local-mac-address =3D [ 00 00 00 00 00 00 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 etherne=
t@7 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 compatible =3D "cavium,octeon-3860-pip-port";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 reg =3D <0x7>; /* Port */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 local-mac-address =3D [ 00 00 00 00 00 00 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 etherne=
t@8 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 compatible =3D "cavium,octeon-3860-pip-port";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 reg =3D <0x8>; /* Port */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 local-mac-address =3D [ 00 00 00 00 00 00 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 etherne=
t@9 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 compatible =3D "cavium,octeon-3860-pip-port";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 reg =3D <0x9>; /* Port */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 local-mac-address =3D [ 00 00 00 00 00 00 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 etherne=
t@a {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 compatible =3D "cavium,octeon-3860-pip-port";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 reg =3D <0xa>; /* Port */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 local-mac-address =3D [ 00 00 00 00 00 00 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 etherne=
t@b {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 compatible =3D "cavium,octeon-3860-pip-port";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 reg =3D <0xb>; /* Port */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 local-mac-address =3D [ 00 00 00 00 00 00 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 etherne=
t@c {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 compatible =3D "cavium,octeon-3860-pip-port";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 reg =3D <0xc>; /* Port */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 local-mac-address =3D [ 00 00 00 00 00 00 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 etherne=
t@d {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 compatible =3D "cavium,octeon-3860-pip-port";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 reg =3D <0xd>; /* Port */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 local-mac-address =3D [ 00 00 00 00 00 00 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 etherne=
t@e {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 compatible =3D "cavium,octeon-3860-pip-port";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 reg =3D <0xe>; /* Port */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 local-mac-address =3D [ 00 00 00 00 00 00 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 etherne=
t@f {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 compatible =3D "cavium,octeon-3860-pip-port";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 reg =3D <0xf>; /* Port */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 local-mac-address =3D [ 00 00 00 00 00 00 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interface@1 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compati=
ble =3D "cavium,octeon-3860-pip-interface";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #addres=
s-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-c=
ells =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D=
 <1>; /* interface */
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 etherne=
t@0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 compatible =3D "cavium,octeon-3860-pip-port";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 reg =3D <0x0>; /* Port */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 local-mac-address =3D [ 00 00 00 00 00 00 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 phy-handle =3D <&phy6>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 etherne=
t@1 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 compatible =3D "cavium,octeon-3860-pip-port";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 reg =3D <0x1>; /* Port */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 local-mac-address =3D [ 00 00 00 00 00 00 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 phy-handle =3D <&phy7>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 etherne=
t@2 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 compatible =3D "cavium,octeon-3860-pip-port";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 reg =3D <0x2>; /* Port */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 local-mac-address =3D [ 00 00 00 00 00 00 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 phy-handle =3D <&phy8>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 etherne=
t@3 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 compatible =3D "cavium,octeon-3860-pip-port";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 reg =3D <0x3>; /* Port */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 local-mac-address =3D [ 00 00 00 00 00 00 ];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 phy-handle =3D <&phy9>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 twsi0: i2c@1180000001000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,=
octeon-3860-twsi";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x11800 0x0000=
1000 0x0 0x200>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0 45>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-rate =3D <100000>=
;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rtc@68 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compati=
ble =3D "dallas,ds1337";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D=
 <0x68>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp@4c {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compati=
ble =3D "ti,tmp421";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D=
 <0x4c>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 twsi1: i2c@1180000001200 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,=
octeon-3860-twsi";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x11800 0x0000=
1200 0x0 0x200>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0 59>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-rate =3D <100000>=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart0: serial@1180000000800 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,=
octeon-3860-uart","ns16550";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x11800 0x0000=
0800 0x0 0x400>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <0>=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 current-speed =3D <1152=
00>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg-shift =3D <3>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0 34>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart1: serial@1180000000c00 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,=
octeon-3860-uart","ns16550";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x11800 0x0000=
0c00 0x0 0x400>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <0>=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 current-speed =3D <1152=
00>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg-shift =3D <3>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0 35>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart2: serial@1180000000400 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,=
octeon-3860-uart","ns16550";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x11800 0x0000=
0400 0x0 0x400>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <0>=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 current-speed =3D <1152=
00>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg-shift =3D <3>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <1 16>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bootbus: bootbus@1180000000000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,=
octeon-3860-bootbus";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x11800 0x0000=
0000 0x0 0x200>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* The chip select numb=
er and offset */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <2>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* The size of the chip=
 select region */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0 0 =A00x0 =
0x1f400000 =A00xc00000>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<1 0=
 =A00x10000 0x30000000 =A00>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<2 0=
 =A00x10000 0x40000000 =A00>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<3 0=
 =A00x10000 0x50000000 =A00>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<4 0=
 =A00x0 0x1d020000 =A00x10000>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<5 0=
 =A00x0 0x1d040000 =A00x10000>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<6 0=
 =A00x0 0x1d050000 =A00x10000>,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<7 0=
 =A00x10000 0x90000000 =A00>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 t-adr =A0 =A0=3D <20 0 =
0 0 320 =A0 5 =A0 5 0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 t-ce =A0 =A0 =3D <60 0 =
0 0 320 300 300 0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 t-oe =A0 =A0 =3D <60 0 =
0 0 320 125 270 0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 t-we =A0 =A0 =3D <45 0 =
0 0 320 150 150 0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 t-rd-hld =3D <35 0 0 0 =
320 100 100 0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 t-wr-hld =3D <45 0 0 0 =
320 =A030 =A070 0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 t-pause =A0=3D < 0 0 0 =
0 320 =A0 0 =A0 0 0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 t-wait =A0 =3D < 0 0 0 =
0 320 =A030 =A0 0 0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 t-page =A0 =3D <35 0 0 =
0 320 320 320 0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 t-rd-dly =3D < 0 0 0 0 =
=A0 0 =A0 0 =A0 0 0>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pages =A0 =A0 =3D <0 0 =
0 0 0 =A00 =A00 0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 wait-mode =3D <0 0 0 0 =
0 =A01 =A00 0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 page-mode =3D <0 0 0 0 =
0 =A00 =A00 0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bus-width =3D <8 8 8 8 =
8 16 16 8>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ale-mode =A0=3D <0 0 0 =
0 0 =A00 =A00 0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sam-mode =A0=3D <0 0 0 =
0 0 =A00 =A00 0>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 flash0: nor@0,0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compati=
ble =3D "cfi-flash";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D=
 <0 0 0x800000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #addres=
s-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-c=
ells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compact-flash@5,0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compati=
ble =3D "cavium,ebt3000-compact-flash";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D=
 <5 0 0x10000>, <6 0 0x10000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bus-wid=
th =3D <16>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 true-id=
e =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma-eng=
ine-handle =3D <&dma0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma0: dma-engine@1180000000100 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,=
octeon-5750-bootbus-dma";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x11800 0x0000=
0100 0x0 0x8>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0 63>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma1: dma-engine@1180000000108 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,=
octeon-5750-bootbus-dma";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x11800 0x0000=
0108 0x0 0x8>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0 63>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 uctl: uctl@118006f000000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "cavium,=
octeon-6335-uctl";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x11800 0x6f00=
0000 0x0 0x100>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges; /* Direct mappi=
ng */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <2>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <2>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 12MHz, 24MHz and 48M=
Hz allowed */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 refclk-frequency =3D <2=
4000000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Either "crystal" or =
"external" */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 refclk-type =3D "crysta=
l";
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ehci@16f0000000000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compati=
ble =3D "cavium,octeon-6335-ehci","usb-ehci";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D=
 <0x16f00 0x00000000 0x0 0x100>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interru=
pts =3D <0 56>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 big-end=
ian-regs;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ohci@16f0000000400 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compati=
ble =3D "cavium,octeon-6335-ohci","usb-ohci";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D=
 <0x16f00 0x00000400 0x0 0x100>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interru=
pts =3D <0 56>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 big-end=
ian-regs;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 aliases {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mix0 =3D &mix0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mix1 =3D &mix1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pip =3D &pip;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 smi0 =3D &smi0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 smi1 =3D &smi1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 twsi0 =3D &twsi0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 twsi1 =3D &twsi1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart0 =3D &uart0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart1 =3D &uart1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart2 =3D &uart2;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 flash0 =3D &flash0;
> + =A0 =A0 =A0 };
> + };
> --
> 1.7.2.3
>
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
