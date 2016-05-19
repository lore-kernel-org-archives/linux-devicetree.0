From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: at91: Add DT support for Olimex SAM9-L9260 board.
Date: Thu, 19 May 2016 14:28:48 +0200
Message-ID: <573DB180.9030200@atmel.com>
References: <1463574766-15568-1-git-send-email-raashidmuhammed@zilogic.com>
 <20160518232925.GA6545@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160518232925.GA6545@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Raashid Muhammed <raashidmuhammed-1MQmoylvZ5VBDgjK7y7TUQ@public.gmane.org>
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, vijaykumar-NDm7FNP0skFg9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 19/05/2016 01:29, Rob Herring a =E9crit :
> On Wed, May 18, 2016 at 06:02:46PM +0530, Raashid Muhammed wrote:
>> From: Raashid Muhammed <raashidmuhammed-1MQmoylvZ5VBDgjK7y7TUQ@public.gmane.org>
>>
>> sam9-l9260 is a low cost board designed by Olimex.
>>
>> More infomation is available at:
>> https://www.olimex.com/Products/ARM/Atmel/SAM9-L9260/
>>
>> Signed-off-by: Raashid Muhammed <raashidmuhammed-1MQmoylvZ5VBDgjK7y7TUQ@public.gmane.org>
>> Reviewed-by: Vijay Kumar B. <vijaykumar-NDm7FNP0skFg9hUCZPvPmw@public.gmane.org>
>> ---
>>  .../devicetree/bindings/arm/olimex-at91.txt        |   6 ++
>>  arch/arm/boot/dts/Makefile                         |   1 +
>>  arch/arm/boot/dts/sam9-l9260.dts                   | 108 ++++++++++=
+++++++++++

=46or AT91-based boards, please use this prefix: "at91-" as stated in t=
he
Atmel README file:
http://lxr.free-electrons.com/source/Documentation/arm/Atmel/README#L12=
7

So I would recommend this name instead:
at91-sam9-l9260.dts


>>  3 files changed, 115 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/olimex-at9=
1.txt
>>  create mode 100644 arch/arm/boot/dts/sam9-l9260.dts
>>
>> diff --git a/Documentation/devicetree/bindings/arm/olimex-at91.txt b=
/Documentation/devicetree/bindings/arm/olimex-at91.txt
>> new file mode 100644
>> index 0000000..0587d63
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/olimex-at91.txt
>> @@ -0,0 +1,6 @@
>> +Olimex AT91 Device Tree Bindings
>> +--------------------------------
>=20
> There's not an existing at91 or olimex file this would fit into? We=20
> don't need 1 file per board.
>=20
>> +
>> +SAM9-L9260 Board
>> +Required root node properties:
>> +    - compatible =3D "olimex,sam9-l9260", "atmel,at91sam9260";

I don't think this file is needed at all actually. We have a lot of
board files and none of them have a dedicated or particular entry for t=
hem.


>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 95c1923..ae3b50f 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -19,6 +19,7 @@ dtb-$(CONFIG_SOC_SAM_V4_V5) +=3D \
>> 	usb_a9260.dtb \
>> 	at91sam9261ek.dtb \
>> 	at91sam9263ek.dtb \
>> +	sam9-l9260.dtb \

Ditto about the file name.

>> 	tny_a9263.dtb \
>> 	usb_a9263.dtb \
>> 	at91-foxg20.dtb \
>> diff --git a/arch/arm/boot/dts/sam9-l9260.dts b/arch/arm/boot/dts/sa=
m9-l9260.dts
>> new file mode 100644
>> index 0000000..3ddf7af
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/sam9-l9260.dts
>> @@ -0,0 +1,108 @@
>> +/*
>> + * sam9-l9260.dts - Device Tree file for Olimex SAM9-L9260 board
>> + *
>> + *  Copyright (C) 2016 Raashid Muhammed <raashidmuhammed-1MQmoylvZ5WIwRZHo2/mJg@public.gmane.org=
m>
>> + *
>> + * Licensed under GPLv2 or later.
>> + */
>> +/dts-v1/;
>> +#include "at91sam9260.dtsi"
>> +
>> +/ {
>> +	model =3D "Olimex sam9-l9260";
>> +	compatible =3D "olimex,sam9-l9260", "atmel,at91sam9260", "atmel,at=
91sam9";
>> +
>> +	chosen {
>> +		bootargs =3D "mem=3D64M console=3DttyS0,115200 root=3D/dev/mtdblo=
ck5 rw rootfstype=3Dubifs";
>=20
> use stdout-path instead of console on the command line. Actually, you=
=20
> should then drop the rest of the bootargs. They are all user specific=
=2E

example of stdout-path:
http://lxr.free-electrons.com/source/arch/arm/boot/dts/at91-sama5d2_xpl=
ained.dts#L55

>> +	 };
>> +
>> +	 memory {
>> +		reg =3D <0x20000000 0x4000000>;
>> +	 };
>> +
>> +	 clocks {
>> +		slow_xtal {
>> +			clock-frequency =3D <32768>;
>> +		};
>> +
>> +		main_xtal {
>> +			clock-frequency =3D <18432000>;
>> +		};
>> +	 };
>> +
>> +	 ahb {
>> +		apb {
>> +			dbgu: serial@fffff200 {

We like to sort node by their address: can you rearrange them like this=
?

>> +				status =3D "okay";
>> +			 };
>> +
>> +			macb0: ethernet@fffc4000 {
>> +				phy-mode =3D "mii";
>> +				status =3D "okay";

I advice you to add the phy address for any Ethernet interface like:

  phy0: ethernet-phy@1 {
        reg =3D <1>;
  };

for a phy address configured as 0x1.


>> +			 };
>> +
>> +			spi0: spi@fffc8000 {
>> +				status =3D "okay";

Nitpicking: "status" property is usually the last one of the node
(before the child nodes if they exist)

>> +				cs-gpios =3D <&pioC 11 0>, <0>, <0>, <0>;
>> +				mtd_dataflash@0 {
>> +					compatible =3D "atmel,at45", "atmel,dataflash";
>> +					spi-max-frequency =3D <15000000>;
>> +					reg =3D <0>;
>> +				};
>> +			};
>> +
>> +			mmc0: mmc@fffa8000 {
>> +				pinctrl-0 =3D <
>> +					&pinctrl_board_mmc0
>> +					&pinctrl_mmc0_clk
>> +					&pinctrl_mmc0_slot1_cmd_dat0
>> +					&pinctrl_mmc0_slot1_dat1_3>;
>> +				status =3D "okay";
>> +				slot@1 {
>> +					reg =3D <1>;
>> +					bus-width =3D <4>;
>> +					cd-gpios =3D <&pioC 8 GPIO_ACTIVE_HIGH>;
>> +					wp-gpios =3D <&pioC 4 GPIO_ACTIVE_HIGH>;
>> +				};
>> +			};
>> +
>> +			pinctrl@fffff400 {
>> +				mmc0 {
>> +					pinctrl_board_mmc0: mmc0-board {
>> +						atmel,pins =3D
>> +							<AT91_PIOC 8 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP_DEGLITCH	=
/* PC08 gpio CD pin pull up and deglitch */

Here, you can remove the duplicate information in the comments: just
keep useful "CD" or "WP" information.

>> +							 AT91_PIOC 4 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP>;	/* PC04=
 gpio WP pin pull up */
>> +					};
>> +				};
>> +			};
>> +
>> +
>> +		 };
>> +
>> +		 usb0: ohci@00500000 {
>=20
> Drop the leading 0. You'll need to fixup the base dts.
>=20
>> +		       status =3D "okay";
>> +		 };
>> +
>> +		 nand0: nand@40000000 {
>> +		       nand-bus-width =3D <8>;
>> +		       nand-ecc-mode =3D "soft";
>> +		       nand-on-flash-bbt =3D <1>;
>> +		       status =3D "okay";
>> +		 };
>> +	 };
>> +
>> +	 i2c@0 {
>> +		status =3D "okay";
>> +	 };
>> +
>> +	 leds {
>> +		compatible =3D "gpio-leds";
>> +
>> +		b0 {
>> +			label =3D "b0";
>> +			gpios =3D <&pioA 6 GPIO_ACTIVE_HIGH>;
>> +			linux,default-trigger =3D "heartbeat";
>> +		};
>> +
>> +	};
>> +};
>> --
>> 2.1.4

Thanks a lot for this board .dts file. I'll be happy to add the support
for this Olimex board!

Bye,
--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
