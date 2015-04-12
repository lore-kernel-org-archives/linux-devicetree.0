From: Andrew <andrew@ncrmnt.org>
Subject: Fwd: Re: [PATCH 2/2] ARM: mvebu: dts: Add dts file for DLink DNS-327L
Date: Sun, 12 Apr 2015 14:43:48 +0300
Message-ID: <b6534b962d2cf9d21cb72d43f19a6574@mail.ncrmnt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org


Sebastian Hesselbarth =D0=BF=D0=B8=D1=81=D0=B0=D0=BB 12.04.2015 14:20:
> On 11.04.2015 22:29, Andrew Andrianov wrote:
>> Signed-off-by: Andrew Andrianov <andrew@ncrmnt.org>
>=20
> Andrew,
>=20
> thanks for providing this dts, please _always_ add a commit log
> describing what the patch is about. The introduction in the cover
> letter is nice, but it will be gone once the patches are applied,
> so this patch needs some log, too.
>=20
> I also have a DNS-327L and I thought I started a dts, but either
> I misremember or I just cannot find it.
>=20
> Anyways, some comments below.
>=20
>> ---
>>   arch/arm/boot/dts/Makefile                     |    1 +
>>   arch/arm/boot/dts/armada-370-dlink-dns327l.dts |  309=20
>> ++++++++++++++++++++++++
>>   2 files changed, 310 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/armada-370-dlink-dns327l.dts
>>=20
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index a1c776b..8535e4e 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -612,6 +612,7 @@ dtb-$(CONFIG_ARCH_ZYNQ) +=3D \
>>   	zynq-zybo.dtb
>>   dtb-$(CONFIG_MACH_ARMADA_370) +=3D \
>>   	armada-370-db.dtb \
>> +	armada-370-dlink-dns327l.dtb \
>>   	armada-370-mirabox.dtb \
>>   	armada-370-netgear-rn102.dtb \
>>   	armada-370-netgear-rn104.dtb \
>> diff --git a/arch/arm/boot/dts/armada-370-dlink-dns327l.dts=20
>> b/arch/arm/boot/dts/armada-370-dlink-dns327l.dts
>> new file mode 100644
>> index 0000000..12bc072
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/armada-370-dlink-dns327l.dts
>> @@ -0,0 +1,309 @@
>> +/*
>> + * Device Tree file for DLINK DNS-327L
>=20
> Just a nit, but the company's logo uses "D-Link" so we should
> use that in here.
>=20
> I am fine with the file named "-370-dlink-dns" though.
>=20
>> + * Copyright (C) 2014, Andrew Andrianov <andrew@ncrmnt.org>
>=20
> +2015?
>=20
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License
>> + * as published by the Free Software Foundation; either version
>> + * 2 of the License, or (at your option) any later version.
>> + */
>=20
> Andrew Lunn already mentioned dual licensing here.
>=20
>> +/* Remaining mysteries:
>> + *
>> + * There's still something unknown on i2c address 0x13
>=20
> Well, I can at least tell it is a "device" instead of "something" ;)
>=20
> I am ok with the comment about an "unknown device at i2c address 0x13=
".
>=20
>> + * CONFIG_ARM_MVEBU_V7_CPUIDLE=3Dy causes hard freezes every 1-8 ho=
urs
>=20
> I don't think the dts is the right place for Linux issues.

Not sure if that's a hardware weirdness or software issue (yet).
Just checked - this goblin is there in 4.0-rc7.

>=20
>> + *
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include "armada-370.dtsi"
>> +
>> +/ {
>> +	model =3D "DLINK DNS-327L";
>=20
> "D-Link DNS-327L"
>=20
>> +	compatible =3D "dlink,dns327l",
>> +		"marvell,armada370",
>> +		"marvell,armada-370-xp";
>> +
>> +	chosen {
>> +		bootargs =3D "console=3DttyS0,115200 earlyprintk";
>> +	};
>=20
> Andrew Lunn already mentioned stdout-path property.
>=20
>> +	memory {
>> +		device_type =3D "memory";
>> +		reg =3D <0x00000000 0x20000000>; /* 512 MiB */
>> +	};
>> +
>> +	soc {
>> +		ranges =3D <MBUS_ID(0xf0, 0x01) 0 0xd0000000 0x100000
>> +			MBUS_ID(0x01, 0xe0) 0 0xfff00000 0x100000>;
>> +
>> +		pcie-controller {
>> +			status =3D "okay";
>> +
>> +			/* Connected to Marvell SATA controller */
>=20
> Really? It is actually using the two internal SATA ports.

Ouch, just a left-over from the netgear DTS file

>=20
>> +			pcie@1,0 {
>> +				/* Port 0, Lane 0 */
>> +				status =3D "okay";
>> +			};
>> +
>> +			/* Connected to NEC USB 3.0 controller */
>=20
> Please just enable the port where the USB3 controller is connected
> to. Could be the other one.
>=20
>> +			pcie@2,0 {
>> +				/* Port 1, Lane 0 */
>> +				status =3D "okay";
>> +			};
>> +		};
>> +
>> +		internal-regs {
>> +			serial@12000 {
>> +				status =3D "okay";
>> +			};
>> +
>> +			serial@12100 {
>> +				status =3D "okay";
>> +			};
>=20
> &uart0 { status =3D "okay" };
> &uart1 { status =3D "okay" };
>=20
> And move to bottom of the file. We try not to replay the bus structur=
e
> on board level all the time, if possible.
>=20
>> +			sata@a0000 {
>> +				nr-ports =3D <2>;
>> +				status =3D "okay";
>> +			};
>=20
> Ok, sata has no node label, yet. It has to stay here.
>=20
>> +			mdio {
>> +			phy0: ethernet-phy@0 { /* Marvell 88E1318 */
>> +					reg =3D <0>;
>> +				};
>> +			};
>=20
> Something is wrong with indention of the node above and we do have
> a node label for &mdio so it can also move.
>=20
>> +			ethernet@74000 {
>> +				status =3D "okay";
>> +				phy =3D <&phy0>;
>> +				phy-mode =3D "rgmii-id";
>> +			};
>=20
> ditto, &eth1.
>=20
>> +			usb@50000 {
>> +				status =3D "okay";
>> +			};
>=20
> Again, no node label, yet.
>=20
>> +			i2c@11000 {
>> +				compatible =3D "marvell,mv64xxx-i2c";
>> +				clock-frequency =3D <100000>;
>> +				status =3D "okay";
>> +			};
>=20
> &i2c0, so please move.
>=20
>> +			nand@d0000 {
>=20
> Again, no node label, yet.
>=20
> I guess there will be a cleanup patch set adding proper labels to
> armada-370-xp.dtsi some day.
>=20
>> +				status =3D "okay";
>> +				num-cs =3D <1>;
>=20
> I stumbled upon this on ix4-300d already while adding support for
> pxa3xx nfc on barebox bootloader for the armada370/xp type of nfc
> controller.
>=20
> It is most likely the flash is connected to cs0 just because it is on=
e
> selected if boot source is NAND.
>=20
> It could be that current barebox and Linux nfc driver deal with
> the property differently, I haven't really checked yet.
>=20
>> +				marvell,nand-keep-config;
>> +				marvell,nand-enable-arbiter;
>> +				nand-on-flash-bbt;
>=20
> Do you know the ECC scheme used?

Any hints on how to find it apart from dumping NAND controller register=
s
from bootloader ?

>=20
> If so, please add corresponding nand-ecc-strength and
> nand-ecc-step-size properties.
>=20
>> +				partition@0 {
>> +					label =3D "u-boot";
>> +					/* 1.0 MiB */
>> +					reg =3D <0x0000000 0x100000>;
>> +					read-only;
>> +				};
>> +
>> +				partition@100000 {
>> +					label =3D "u-boot-env";
>> +					/* 128 KiB */
>> +					reg =3D <0x100000 0x20000>;
>> +					read-only;
>> +				};
>> +
>> +				partition@120000 {
>> +					label =3D "uImage";
>> +					/* 7 MiB */
>> +					reg =3D <0x120000 0x700000>;
>> +				};
>> +
>> +				partition@820000 {
>> +					label =3D "ubifs";
>> +					/* ~ 84 MiB */
>> +					reg =3D <0x820000 0x54e0000>;
>> +				};
>> +
>> +				/* Hardwired into stock bootloader */
>=20
> I don't get the comment above.

The stock u-boot is hacked with a 'failsafe' kernel address.
If for some reason running the 'bootcmd' fails, it reads
5MiBs from partition @ (5d00000 + 0x800) and tries to boot it.
There's no way to change this via environment, only by replacing
the bootloader.
Personally I'm more happy with a simpler partition table, but I
guess upstream should be oriented towards the stock bootloader.

>=20
>> +				partition@800000 {
>=20
> partition@5d00000
>=20
>> +					label =3D "failsafe-uImage";
>> +					/* 5 MiB */
>> +					reg =3D <0x5d00000 0x500000>;
>> +				};
>> +
>> +				partition@6200000 {
>> +					label =3D "failsafe-fs";
>> +					/* 29 MiB */
>> +					reg =3D <0x6200000 0x1d00000>;
>> +				};
>> +
>> +				partition@7f00000 {
>> +					label =3D "bbt";
>> +					/* 1 MiB for BBT */
>> +					reg =3D <0x7f00000 0x100000>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	gpio-keys {
>> +		compatible =3D "gpio-keys";
>> +		pinctrl-0 =3D <
>> +			&backup_button_pin
>> +			&power_button_pin>;
>> +		pinctrl-names =3D "default";
>> +
>> +		power-button {
>> +			label =3D "Power Button";
>> +			linux,code =3D <KEY_POWER>;
>> +			gpios =3D <&gpio2 1 GPIO_ACTIVE_LOW>;
>> +		};
>> +
>> +		backup-button {
>> +			label =3D "Backup Button";
>> +			linux,code =3D <KEY_COPY>;
>=20
> Hmm, is KEY_COPY the best option?

>> +			gpios =3D <&gpio1 31 GPIO_ACTIVE_LOW>;
>> +		};
>> +
>> +		reset-button {
>> +			label =3D "Reset Button";
>> +			linux,code =3D <KEY_RESTART>;
>> +			gpios =3D <&gpio2 0 GPIO_ACTIVE_LOW>;
>> +		};
>> +
>> +
>=20
> Double empty lines above.
>=20
>> +	};
>> +
>> +	gpio-leds {
>> +		compatible =3D "gpio-leds";
>> +		pinctrl-0 =3D <
>> +			&sata_l_amber_pin
>> +			&sata_r_amber_pin
>> +			&backup_led_pin>;
>> +
>> +		pinctrl-names =3D "default";
>> +
>> +		sata-r-amber-pin {
>> +			label =3D "dns327l:amber:sata-r";
>> +			gpios =3D <&gpio1 20 GPIO_ACTIVE_HIGH>;
>> +		default-state =3D "keep";
>=20
> Wrong indention.
>=20
>> +		};
>> +
>> +		sata-l-amber-pin {
>> +			label =3D "dns327l:amber:sata-l";
>> +			gpios =3D <&gpio1 21 GPIO_ACTIVE_HIGH>;
>> +		default-state =3D "keep";
>> +		};
>> +
>> +		backup-led-pin {
>> +			label =3D "dns327l:white:usb";
>> +			gpios =3D <&gpio1 29 GPIO_ACTIVE_HIGH>;
>> +		default-state =3D "keep";
>> +		};
>> +
>=20
> ditto for all gpio nodes above, and another empty line.
>=20
>> +	};
>> +
>> +	regulators {
>> +		compatible =3D "simple-bus";
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +		pinctrl-0 =3D <&xhci_pwr_pin
>> +			&sata1_pwr_pin
>> +			&sata2_pwr_pin>;
>> +
>> +		pinctrl-names =3D "default";
>> +
>> +	usb_power: regulator@1 {
>=20
> Wrong indention.
>=20
>> +			compatible =3D "regulator-fixed";
>> +			reg =3D <1>;
>> +			regulator-name =3D "USB3.0 Port Power";
>> +			regulator-min-microvolt =3D <5000000>;
>> +			regulator-max-microvolt =3D <5000000>;
>> +			enable-active-high;
>> +			regulator-boot-on;
>> +			regulator-always-on;
>> +			gpio =3D <&gpio0 13 GPIO_ACTIVE_HIGH>;
>> +		};
>> +
>> +	sata1_power: regulator@2 {
>=20
> ditto.
>=20
>> +			compatible =3D "regulator-fixed";
>> +			reg =3D <1>;
>=20
> reg =3D <2>;
>=20
>> +			regulator-name =3D "SATA-1 Power";
>=20
> Front HDD LEDs are actually labeled "L" and "R", can you evaluate
> which 0/1 matches L/R and rename the regulator names accordingly?
>=20
>> +			regulator-min-microvolt =3D <5000000>;
>> +			regulator-max-microvolt =3D <5000000>;
>> +			enable-active-high;
>> +			regulator-always-on;
>> +			gpio =3D <&gpio1 22 GPIO_ACTIVE_HIGH>;
>> +		};
>> +
>> +	sata2_power: regulator@3 {
>=20
> Wrong indention.
>=20
>> +			compatible =3D "regulator-fixed";
>> +			reg =3D <1>;
>=20
> reg =3D <3>;
>=20
>> +			regulator-name =3D "SATA-2 Power";
>=20
> Same comment about the 0/1 vs L/R naming.
>=20
>> +			regulator-min-microvolt =3D <5000000>;
>> +			regulator-max-microvolt =3D <5000000>;
>> +			enable-active-high;
>> +			regulator-always-on;
>> +			gpio =3D <&gpio1 24 GPIO_ACTIVE_HIGH>;
>> +		};
>> +	};
>> +};
>> +
>> +&pinctrl {
>> +	sata1_white_pin: sata1-white-pin {
>> +		marvell,pins =3D "mpp55";
>> +		marvell,function =3D "sata1";
>> +	};
>> +
>> +	sata_r_amber_pin: sata-r-amber-pin {
>> +		marvell,pins =3D "mpp52";
>> +		marvell,function =3D "gpio";
>> +	};
>> +
>> +	sata2_white_pin: sata2-white-pin {
>> +		marvell,pins =3D "mpp57";
>> +		marvell,function =3D "sata0";
>> +	};
>> +
>> +	sata_l_amber_pin: sata-l-amber-pin {
>> +		marvell,pins =3D "mpp53";
>> +		marvell,function =3D "gpio";
>> +	};
>=20
> If you find the 0/1, L/R mapping you should use it all over this file=
=2E
>=20
> Sebastian
>=20
>> +
>> +	backup_led_pin: backup-led-pin {
>> +		marvell,pins =3D "mpp61";
>> +		marvell,function =3D "gpo";
>> +	};
>> +
>> +	xhci_pwr_pin: xhci-pwr-pin {
>> +		marvell,pins =3D "mpp13";
>> +		marvell,function =3D "gpio";
>> +	};
>> +
>> +	sata1_pwr_pin: sata1-pwr-pin {
>> +		marvell,pins =3D "mpp54";
>> +		marvell,function =3D "gpio";
>> +	};
>> +
>> +	sata2_pwr_pin: sata2-pwr-pin {
>> +		marvell,pins =3D "mpp56";
>> +		marvell,function =3D "gpio";
>> +	};
>> +
>> +	power_button_pin: power-button-pin {
>> +		marvell,pins =3D "mpp65";
>> +		marvell,function =3D "gpio";
>> +	};
>> +
>> +	backup_button_pin: backup-button-pin {
>> +		marvell,pins =3D "mpp63";
>> +		marvell,function =3D "gpio";
>> +	};
>> +
>> +	reset_button_pin: reset-button-pin {
>> +		marvell,pins =3D "mpp64";
>> +		marvell,function =3D "gpio";
>> +	};
>> +};
>>=20

Thanks for the review, I'll resubmit the fixed patchset shortly.
Please disregard my [PATCH v2] messages. I've send them the moment=20
before
I noticed your email and review.

--=20
Regards,
Andrew
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
