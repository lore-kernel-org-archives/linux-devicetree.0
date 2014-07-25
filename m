From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH v2 05/11] ARM: dts: zynq: Add QSPI for Parallella
Date: Fri, 25 Jul 2014 10:42:47 +0200
Message-ID: <53D21887.2020305@suse.de>
References: <1406242820-20140-1-git-send-email-afaerber@suse.de> <1406242820-20140-6-git-send-email-afaerber@suse.de> <ddb38ce5-9e31-4c94-967c-7784c7fba75c@BN1BFFO11FD028.protection.gbl> <53D20E5B.9070501@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53D20E5B.9070501@monstr.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: monstr@monstr.eu, =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann@xilinx.com>
Cc: Harini Katakam <harinik@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, Andreas Olofsson <andreas@adapteva.com>, Matteo Vit <matteo.vit@starwaredesign.com>, Sean Rickerd <srickerd@suse.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Am 25.07.2014 09:59, schrieb Michal Simek:
> On 07/25/2014 01:18 AM, S=C3=B6ren Brinkmann wrote:
>> On Fri, 2014-07-25 at 01:00AM +0200, Andreas F=C3=A4rber wrote:
>>> Prepare SPI0 and SPI1 while at it.
>=20
> Patch subject is incorrect. You are adding SPI and QSPI.

Yes, it originally added only QSPI, but I considered it a good deed to
add SPI as well while already reading that part of the TRM. :)

>>>=20
>>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de> --- v2: New
>>>=20
>>> arch/arm/boot/dts/zynq-7000.dtsi      | 37
>>> +++++++++++++++++++++++++++++++++++=20
>>> arch/arm/boot/dts/zynq-parallella.dts |  4 ++++ 2 files
>>> changed, 41 insertions(+)
>>>=20
>>> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi
>>> b/arch/arm/boot/dts/zynq-7000.dtsi index 8fd826a..eed3df0
>>> 100644 --- a/arch/arm/boot/dts/zynq-7000.dtsi +++
>>> b/arch/arm/boot/dts/zynq-7000.dtsi @@ -122,6 +122,30 @@=20
>>> interrupts =3D <0 50 4>; };
>>>=20
>>> +		spi0: spi@e0006000 { +			compatible =3D "xlnx,zynq-spi-r1p6";=20
>>> +			reg =3D <0xe0006000 0x1000>; +			status =3D "disabled"; +
>>> interrupt-parent =3D <&intc>; +			interrupts =3D <0 26 4>; +
>>> clocks =3D <&clkc 25>, <&clkc 34>; +			clock-names =3D "ref_clk",
>>> "pclk"; +			#address-cells =3D <1>; +			#size-cells =3D <0>; +		};=20
>>> + +		spi1: spi@e0007000 { +			compatible =3D
>>> "xlnx,zynq-spi-r1p6"; +			reg =3D <0xe0007000 0x1000>; +			status
>>> =3D "disabled"; +			interrupt-parent =3D <&intc>; +			interrupts =3D
>>> <0 49 4>; +			clocks =3D <&clkc 26>, <&clkc 35>; +			clock-names
>>> =3D "ref_clk", "pclk"; +			#address-cells =3D <1>; +			#size-cells
>>> =3D <0>; +		}; +
>> Until here things look good.
>>=20
>>> gem0: ethernet@e000b000 { compatible =3D "cdns,gem"; reg =3D
>>> <0xe000b000 0x4000>; @@ -140,6 +164,19 @@ clock-names =3D "pclk",
>>> "hclk", "tx_clk"; };
>>>=20
>>> +		qspi: qspi@e000d000 { +			compatible =3D
>>> "xlnx,zynq-spi-r1p6"; +			reg =3D <0xe000d000 0x1000>; +			status
>>> =3D "disabled"; +			interrupt-parent =3D <&intc>; +			interrupts =3D
>>> <0 19 4>; +			clocks =3D <&clkc 10>, <&clkc 43>; +			clock-names
>>> =3D "ref_clk", "pclk"; +			num-cs =3D <1>; +			#address-cells =3D
>>> <1>; +			#size-cells =3D <0>; +		}; +
>> I'm not sure what the status of this driver is. I think QSPI is
>> still under review on the mailing lists and I don't think we
>> should add this yet.
>=20
> Driver for qspi is not in the mainline yet but it doesn't mean that
> this fragment won't work. Harini: Can you please correct me if I am
> wrong?

It did seem to find the flash chip (cf. parallella-next branch), but I
didn't find a driver capable of handling its ID. The downstream tree
was using m25p80; I tried both micron,n25q128a11 and ...a13 based on
U-Boot output.

> I would prefer to send two separate patches.

Will do.

> 1. just add SPI to zynq

As I don't have any of the other Zynq boards, can you please advise
whether either of them should be enabled for some board?

> 2. if Harini confirms that it is working I think that make sense to
> enable at least simple mode for qspi. That's why not a problem to
> add it too. It means qspi patch with enabling for your board as
> second patch.

Thanks,
Andreas

- --=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJT0hiHAAoJEPou0S0+fgE/DQwP/1zkv0tkOemDedPDa9dVu/77
0Qc9LTsbBsbn6STakd2z1+Iz2qoy4dePjsGd3hYVgHV6S6MnEiSDTqKjGXmX4Dqu
ALxksCLi0wezlQuEN2H110eivMGJ8DBz0qCq0t1acN5Y4YhF9tiCNQARF6XoAwcK
6FtGic/qVC92byGosbD4Y/SvZpJPuk+gACyIhUYEJTS/jKwB68jm5pZZbdGrVsB+
H4B9tGc+qs4bumdmbzxPXp66HyOqKsfRT0P/S6N0nvkqvNaWyM+MAmB4VDW3dnJJ
2ApbNJaPCoKtMHTQ2vnWstOVM4smsYJsszBF1zBIwUYgwW4q2Nv3vvjI23746m+x
gq7Tlqa5yIuPe/9+f6ek4dbZWQ7Zj+xw68taLvFkw9+4HvFd9qul/BxryFGTkErH
mZkEuQqTq1oppLGS+2ld+/VXt452UKF80Potra/Qt6D/LUA2UBcEIjoLpYxndjqz
3QrVNsw625LCyvJdYovO3FLHJ69U9VyZ4/8edDQzVvhD6/pcQp75W6mchWkxGnyS
jZVwKsIKVAWC9k6N6ZOLC5A8KOHRGGY5SOOpOLUQkfTviI5r2eAY5CvX8HOqx9s9
+tVphTMSLc5rC26ePdMwqAWbax4xt1kmWSiSUZ8cOnKvaUpWEPsAfQNMDsBfWiLN
aMQyrzdYs+nuCoIksVfN
=3Dh5eC
-----END PGP SIGNATURE-----
