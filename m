From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 04/11] usb: usb: dsps: update device tree bindings
Date: Fri, 6 Sep 2013 15:56:21 +0100
Message-ID: <20130906145621.GX18206@e106331-lin.cambridge.arm.com>
References: <1377016553-26478-1-git-send-email-bigeasy@linutronix.de>
 <1377016553-26478-5-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1377016553-26478-5-git-send-email-bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 20, 2013 at 05:35:46PM +0100, Sebastian Andrzej Siewior wro=
te:
> The support for both am335x-USB instances required changes to the dev=
ice
> tree bindings. This patch reflects these changes in the bindings
> document.
>=20
> v3=E2=80=A6v4:
> - remove the child node for USB. This is driver specific on won't be
>   reflected in the device tree
> - use the "mentor" prefix instead of "mg".
> - use "dr_mode" istead of "mg,port-mode" for the port mode. The forme=
r
>   is used by a few other drivers.
>=20
> v2=E2=80=A6v3:
> - use proper usb-phy nodes in evm, bone and evmsk device tree.
>=20
> v1=E2=80=A6v2:
> - use mg prefix for the Metor Graphics specific attributes
> - use power in mA not in mA/2 as specifed in the USB2.0 specification
> - use usbX-phy instead of usbX_phy
> - use dma-controller instead of dma
>=20
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Cc: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/am33xx-usb.txt         | 222 +++++++++++=
+++++++---
>  1 file changed, 192 insertions(+), 30 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/am33xx-usb.txt b/D=
ocumentation/devicetree/bindings/usb/am33xx-usb.txt
> index dc9dc8c..20c2ff2 100644
> --- a/Documentation/devicetree/bindings/usb/am33xx-usb.txt
> +++ b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
> @@ -1,35 +1,197 @@
> -AM33XX MUSB GLUE
> - - compatible : Should be "ti,musb-am33xx"
> - - reg : offset and length of register sets, first usbss, then for m=
usb instances
> - - interrupts : usbss, musb instance interrupts in order
> - - ti,hwmods : must be "usb_otg_hs"
> - - multipoint : Should be "1" indicating the musb controller support=
s
> -   multipoint. This is a MUSB configuration-specific setting.
> - - num-eps : Specifies the number of endpoints. This is also a
> -   MUSB configuration-specific setting. Should be set to "16"
> - - ram-bits : Specifies the ram address size. Should be set to "12"
> - - port0-mode : Should be "3" to represent OTG. "1" signifies HOST a=
nd "2"
> -   represents PERIPHERAL.
> - - port1-mode : Should be "1" to represent HOST. "3" signifies OTG a=
nd "2"
> -   represents PERIPHERAL.
> - - power : Should be "250". This signifies the controller can supply=
 up to
> -   500mA when operating in host mode.
> +  AM33xx MUSB
> +~~~~~~~~~~~~~~~
> +- compatible: ti,am33xx-usb
> +- reg: offset and length of the usbss register sets
> +- ti,hwmods : must be "usb_otg_hs"
> +
> +The glue layer contains multiple child nodes. It is required the hav=
e
> +at least a control module node, USB node and a PHY node. The second =
USB
> +node and its PHY node is optional. The DMA node is also optional.
> +
> +Reset module
> +~~~~~~~~~~~~
> +- compatible: ti,am335x-usb-ctrl-module
> +- reg: offset and length of the "USB control registers" in the "Cont=
rol
> +  Module" block. A second offset and length for the USB wake up cont=
rol
> +  in the same memory block.
> +- reg-names: "phy_ctrl" for the "USB control registers" and "wakeup"=
 for
> +  the USB wake up control register.
> +
> +USB PHY
> +~~~~~~~
> +compatible: ti,am335x-usb-phy
> +reg: offset and length of the "USB PHY" register space
> +ti,ctrl_mod: reference to the "reset module" node
> +reg-names: phy

=46or consistency, these should be bullet bpoints (as with the Reset
module properties above).

Also, preferably:

- reg-names: should contain "phy".

> +The PHY should have a "phy" alias numbered properly in the alias
> +node.

Why?

> +
> +USB
> +~~~
> +- compatible: ti,musb-am33xx
> +- reg: offset and length of "USB Controller Registers", and offset a=
nd
> +  length of "USB Core" register space.
> +- reg-names: control for the ""USB Controller Registers" and "mc" fo=
r
> +  "USB Core" register space

Consistent quoting please.

> +- interrupts: USB interrupt number

- interrupts: should contain an interrupt-specifier for the USB
              interrupt.

Is this the only interrupt? Is there a particular name for it in any
data sheet?

> +- interrupt-names: mc

String property values quoted please:

- interrupt-names: should contain "mc" for the USB interrupt.

Is "mc" the name of the interrupt on the data sheet?

> +- dr_mode: Should be one of "host", "peripheral" or "otg".
> +- mentor,multipoint: Should be "1" indicating the musb controller su=
pports
> +  multipoint. This is a MUSB configuration-specific setting.

Is this a boolean value?

Why is this not an empty property?

> +- mentor,num-eps: Specifies the number of endpoints. This is also a
> +  MUSB configuration-specific setting. Should be set to "16"
> +- mentor,ram-bits: Specifies the ram address size. Should be set to =
"12"

Is this to define the address space the controller can see? What if it'=
s
offset from the CPU's view? This sounds like something better described
via another means (like dma-ranges).

> +- mentor,power: Should be "500". This signifies the controller can s=
upply up to
> +  500mA when operating in host mode.

Why do we nee a particular value in a binding-specific property?

> +- phys: reference to the USB phy
> +- dmas: specifies the dma channels

Please refer to the bindings for these.

> +- dma-names: specifies the names of the channels. Use "rxN" for rece=
ive
> +  and "txN" for transmit endpoints. N specifies the endpoint number.
> +
> +The controller should have an "usb" alias numbered properly in the a=
lias
> +node.

Why?

> +
> +DMA
> +~~~
> +- compatible: ti,am3359-cppi41
> +- reg: offset and length of the following register spaces: USBSS, US=
B
> +  CPPI DMA Controller, USB CPPI DMA Scheduler, USB Queue Manager
> +- reg-names: glue, controller, scheduler, queuemgr

Are these expected to be in the order described in reg, or in any order
and should be looked up via reg-names?

> +- #dma-cells: should be set to 2. The first number represents the
> +  endpoint number (0 =E2=80=A6 14 for endpoints 1 =E2=80=A6 15 on in=
stance 0 and 15 =E2=80=A6 29
> +  for endpoints 1 =E2=80=A6 15 on instance 1). The second number is =
0 for RX and
> +  1 for TX transfers.

Any reason for describing that one-off?

> +- #dma-channels: should be set to 30 representing the 15 endpoints f=
or
> +  each USB instance.
> =20
>  Example:
> +~~~~~~~~
> +The following example contains all the nodes as used on am335x-evm:
> +
> +aliases {
> +	usb0 =3D &usb0;
> +	usb1 =3D &usb1;
> +	phy0 =3D &usb0_phy;
> +	phy1 =3D &usb1_phy;
> +};
> =20
> -usb@47400000  {
> -	compatible =3D "ti,musb-am33xx";
> -	reg =3D <0x47400000 0x1000	/* usbss */
> -	       0x47401000 0x800		/* musb instance 0 */
> -	       0x47401800 0x800>;	/* musb instance 1 */
> -	interrupts =3D <17		/* usbss */
> -		      18		/* musb instance 0 */
> -		      19>;		/* musb instance 1 */
> -	multipoint =3D <1>;
> -	num-eps =3D <16>;
> -	ram-bits =3D <12>;
> -	port0-mode =3D <3>;
> -	port1-mode =3D <3>;
> -	power =3D <250>;
> +usb: usb@47400000 {
> +	compatible =3D "ti,am33xx-usb";
> +	reg =3D <0x47400000 0x1000>;
> +	ranges;
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
>  	ti,hwmods =3D "usb_otg_hs";
> +
> +	ctrl_mod: control@44e10000 {
> +		compatible =3D "ti,am335x-usb-ctrl-module";
> +		reg =3D <0x44e10620 0x10
> +			0x44e10648 0x4>;

Nit: could you bracket these independently please? Like this:

		reg =3D <0x44e10620 0x10>,
		      <0x44e10648 0x4>;

Similarly for other composite values in lists.

Cheers,
Mark.

> +		reg-names =3D "phy_ctrl", "wakeup";
> +	};
> +
> +	usb0_phy: usb-phy@47401300 {
> +		compatible =3D "ti,am335x-usb-phy";
> +		reg =3D <0x47401300 0x100>;
> +		reg-names =3D "phy";
> +		ti,ctrl_mod =3D <&ctrl_mod>;
> +	};
> +
> +	usb0: usb@47401000 {
> +		compatible =3D "ti,musb-am33xx";
> +		reg =3D <0x47401400 0x400
> +			0x47401000 0x200>;
> +		reg-names =3D "mc", "control";
> +
> +		interrupts =3D <18>;
> +		interrupt-names =3D "mc";
> +		dr_mode =3D "otg"
> +		mentor,multipoint =3D <1>;
> +		mentor,num-eps =3D <16>;
> +		mentor,ram-bits =3D <12>;
> +		mentor,power =3D <500>;
> +		phys =3D <&usb0_phy>;
> +
> +		dmas =3D <&cppi41dma  0 0 &cppi41dma  1 0
> +			&cppi41dma  2 0 &cppi41dma  3 0
> +			&cppi41dma  4 0 &cppi41dma  5 0
> +			&cppi41dma  6 0 &cppi41dma  7 0
> +			&cppi41dma  8 0 &cppi41dma  9 0
> +			&cppi41dma 10 0 &cppi41dma 11 0
> +			&cppi41dma 12 0 &cppi41dma 13 0
> +			&cppi41dma 14 0 &cppi41dma  0 1
> +			&cppi41dma  1 1 &cppi41dma  2 1
> +			&cppi41dma  3 1 &cppi41dma  4 1
> +			&cppi41dma  5 1 &cppi41dma  6 1
> +			&cppi41dma  7 1 &cppi41dma  8 1
> +			&cppi41dma  9 1 &cppi41dma 10 1
> +			&cppi41dma 11 1 &cppi41dma 12 1
> +			&cppi41dma 13 1 &cppi41dma 14 1>;
> +		dma-names =3D
> +			"rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7",
> +			"rx8", "rx9", "rx10", "rx11", "rx12", "rx13",
> +			"rx14", "rx15",
> +			"tx1", "tx2", "tx3", "tx4", "tx5", "tx6", "tx7",
> +			"tx8", "tx9", "tx10", "tx11", "tx12", "tx13",
> +			"tx14", "tx15";
> +	};
> +
> +	usb1_phy: usb-phy@47401b00 {
> +		compatible =3D "ti,am335x-usb-phy";
> +		reg =3D <0x47401b00 0x100>;
> +		reg-names =3D "phy";
> +		ti,ctrl_mod =3D <&ctrl_mod>;
> +	};
> +
> +	usb1: usb@47401800 {
> +		compatible =3D "ti,musb-am33xx";
> +		reg =3D <0x47401c00 0x400
> +			0x47401800 0x200>;
> +		reg-names =3D "mc", "control";
> +		interrupts =3D <19>;
> +		interrupt-names =3D "mc";
> +		dr_mode =3D "host"
> +		mentor,multipoint =3D <1>;
> +		mentor,num-eps =3D <16>;
> +		mentor,ram-bits =3D <12>;
> +		mentor,power =3D <500>;
> +		phys =3D <&usb1_phy>;
> +
> +		dmas =3D <&cppi41dma 15 0 &cppi41dma 16 0
> +			&cppi41dma 17 0 &cppi41dma 18 0
> +			&cppi41dma 19 0 &cppi41dma 20 0
> +			&cppi41dma 21 0 &cppi41dma 22 0
> +			&cppi41dma 23 0 &cppi41dma 24 0
> +			&cppi41dma 25 0 &cppi41dma 26 0
> +			&cppi41dma 27 0 &cppi41dma 28 0
> +			&cppi41dma 29 0 &cppi41dma 15 1
> +			&cppi41dma 16 1 &cppi41dma 17 1
> +			&cppi41dma 18 1 &cppi41dma 19 1
> +			&cppi41dma 20 1 &cppi41dma 21 1
> +			&cppi41dma 22 1 &cppi41dma 23 1
> +			&cppi41dma 24 1 &cppi41dma 25 1
> +			&cppi41dma 26 1 &cppi41dma 27 1
> +			&cppi41dma 28 1 &cppi41dma 29 1>;
> +		dma-names =3D
> +			"rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7",
> +			"rx8", "rx9", "rx10", "rx11", "rx12", "rx13",
> +			"rx14", "rx15",
> +			"tx1", "tx2", "tx3", "tx4", "tx5", "tx6", "tx7",
> +			"tx8", "tx9", "tx10", "tx11", "tx12", "tx13",
> +			"tx14", "tx15";
> +	};
> +
> +	cppi41dma: dma-controller@07402000 {
> +		compatible =3D "ti,am3359-cppi41";
> +		reg =3D  <0x47400000 0x1000
> +			0x47402000 0x1000
> +			0x47403000 0x1000
> +			0x47404000 0x4000>;
> +		reg-names =3D "glue", "controller", "scheduler", "queuemgr";
> +		interrupts =3D <17>;
> +		interrupt-names =3D "glue";
> +		#dma-cells =3D <2>;
> +		#dma-channels =3D <30>;
> +		#dma-requests =3D <256>;
> +	};
>  };
> --=20
> 1.8.4.rc2
>=20
>=20
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
