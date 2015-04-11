From: Andrew <andrew@ncrmnt.org>
Subject: Re: [PATCH 2/2] ARM: mvebu: dts: Add dts file for DLink DNS-327L
Date: Sun, 12 Apr 2015 01:33:04 +0300
Message-ID: <926c05317f677c9e2562e1fe07b4a550@mail.ncrmnt.org>
References: <1428784160-19431-1-git-send-email-andrew@ncrmnt.org>
 <1428784160-19431-3-git-send-email-andrew@ncrmnt.org>
 <20150411214005.GJ5244@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150411214005.GJ5244@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Andrew Lunn =D0=BF=D0=B8=D1=81=D0=B0=D0=BB 12.04.2015 00:40:
> On Sat, Apr 11, 2015 at 11:29:20PM +0300, Andrew Andrianov wrote:
>> Signed-off-by: Andrew Andrianov <andrew@ncrmnt.org>
>> ---
>>  arch/arm/boot/dts/Makefile                     |    1 +
>>  arch/arm/boot/dts/armada-370-dlink-dns327l.dts |  309=20
>> ++++++++++++++++++++++++
>>  2 files changed, 310 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/armada-370-dlink-dns327l.dts
>>=20
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index a1c776b..8535e4e 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -612,6 +612,7 @@ dtb-$(CONFIG_ARCH_ZYNQ) +=3D \
>>  	zynq-zybo.dtb
>>  dtb-$(CONFIG_MACH_ARMADA_370) +=3D \
>>  	armada-370-db.dtb \
>> +	armada-370-dlink-dns327l.dtb \
>>  	armada-370-mirabox.dtb \
>>  	armada-370-netgear-rn102.dtb \
>>  	armada-370-netgear-rn104.dtb \
>> diff --git a/arch/arm/boot/dts/armada-370-dlink-dns327l.dts=20
>> b/arch/arm/boot/dts/armada-370-dlink-dns327l.dts
>> new file mode 100644
>> index 0000000..12bc072
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/armada-370-dlink-dns327l.dts
>> @@ -0,0 +1,309 @@
>> +/*
>> + * Device Tree file for DLINK DNS-327L
>> + *
>> + * Copyright (C) 2014, Andrew Andrianov <andrew@ncrmnt.org>
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License
>> + * as published by the Free Software Foundation; either version
>> + * 2 of the License, or (at your option) any later version.
>> + */
>=20
> Hi Andrew
>=20
> There has been a move to license all the 370 and XP DTS files under
> dual GPL and X11. Are you willing to add X11?

No problem, will fix.

>=20
>> +
>> +/* Remaining mysteries:
>> + *
>> + * There's still something unknown on i2c address 0x13
>> + * CONFIG_ARM_MVEBU_V7_CPUIDLE=3Dy causes hard freezes every 1-8 ho=
urs
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
>> +	compatible =3D "dlink,dns327l",
>> +		"marvell,armada370",
>> +		"marvell,armada-370-xp";
>> +
>> +	chosen {
>> +		bootargs =3D "console=3DttyS0,115200 earlyprintk";
>=20
> It would be nice to have
>=20
> stdout-path =3D &uart0;
>=20
> here. That will help with boot loaders, using this DT file, and it a
> step towards removing the console=3DttyS0,115200.
>=20
>> +	};
>> +
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
>> +			pcie@1,0 {
>> +				/* Port 0, Lane 0 */
>> +				status =3D "okay";
>> +			};
>> +
>> +			/* Connected to NEC USB 3.0 controller */
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
> Are both serial ports usable?
> Could you document the pinout for the console?
>=20
>       Thanks
> 	Andrew


The serial console pinout is :
[RXD|(gap)|3.3v|GND|TXD]


I've been documenting the hardware extensively in my blog here:
http://ncrmnt.org/wp/2015/02/15/debian-dlink-dns-327l-the-guide/
Pictures of the PCB are all there.

The second UART is used to interface with weltrend mcu only.

I'll resubmit the patches with fixes sometime tomorrow evening (GMT+4).
Hopefully I'll also find out is hardware freezes with cpuidle enabled=20
are
still there on 4.0-rc7.

--=20
Regards,
Andrew
