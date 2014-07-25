From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v2 05/11] ARM: dts: zynq: Add QSPI for Parallella
Date: Fri, 25 Jul 2014 11:38:19 +0200
Message-ID: <1cf9126b-c5e4-4ae7-a294-071584857d6c@BN1AFFO11FD052.protection.gbl>
References: <1406242820-20140-1-git-send-email-afaerber@suse.de>
 <1406242820-20140-6-git-send-email-afaerber@suse.de>
 <ddb38ce5-9e31-4c94-967c-7784c7fba75c@BN1BFFO11FD028.protection.gbl>
 <53D20E5B.9070501@monstr.eu> <53D21887.2020305@suse.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0815254082321563887=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <53D21887.2020305@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, monstr@monstr.eu, =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann@xilinx.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Harini Katakam <harinik@xilinx.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, devicetree@vger.kernel.org, Andreas Olofsson <andreas@adapteva.com>, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Matteo Vit <matteo.vit@starwaredesign.com>, Sean Rickerd <srickerd@suse.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============0815254082321563887==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="P3EDFoVLsodiaKB4S45t2vbFuD8Oj7mDl"

--P3EDFoVLsodiaKB4S45t2vbFuD8Oj7mDl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 07/25/2014 10:42 AM, Andreas F=C3=A4rber wrote:
> Am 25.07.2014 09:59, schrieb Michal Simek:
>> On 07/25/2014 01:18 AM, S=C3=B6ren Brinkmann wrote:
>>> On Fri, 2014-07-25 at 01:00AM +0200, Andreas F=C3=A4rber wrote:
>>>> Prepare SPI0 and SPI1 while at it.
>=20
>> Patch subject is incorrect. You are adding SPI and QSPI.
>=20
> Yes, it originally added only QSPI, but I considered it a good deed to
> add SPI as well while already reading that part of the TRM. :)
>=20
>>>>
>>>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de> --- v2: New
>>>>
>>>> arch/arm/boot/dts/zynq-7000.dtsi      | 37
>>>> +++++++++++++++++++++++++++++++++++=20
>>>> arch/arm/boot/dts/zynq-parallella.dts |  4 ++++ 2 files
>>>> changed, 41 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi
>>>> b/arch/arm/boot/dts/zynq-7000.dtsi index 8fd826a..eed3df0
>>>> 100644 --- a/arch/arm/boot/dts/zynq-7000.dtsi +++
>>>> b/arch/arm/boot/dts/zynq-7000.dtsi @@ -122,6 +122,30 @@=20
>>>> interrupts =3D <0 50 4>; };
>>>>
>>>> +		spi0: spi@e0006000 { +			compatible =3D "xlnx,zynq-spi-r1p6";=20
>>>> +			reg =3D <0xe0006000 0x1000>; +			status =3D "disabled"; +
>>>> interrupt-parent =3D <&intc>; +			interrupts =3D <0 26 4>; +
>>>> clocks =3D <&clkc 25>, <&clkc 34>; +			clock-names =3D "ref_clk",
>>>> "pclk"; +			#address-cells =3D <1>; +			#size-cells =3D <0>; +		};=20
>>>> + +		spi1: spi@e0007000 { +			compatible =3D
>>>> "xlnx,zynq-spi-r1p6"; +			reg =3D <0xe0007000 0x1000>; +			status
>>>> =3D "disabled"; +			interrupt-parent =3D <&intc>; +			interrupts =3D=

>>>> <0 49 4>; +			clocks =3D <&clkc 26>, <&clkc 35>; +			clock-names
>>>> =3D "ref_clk", "pclk"; +			#address-cells =3D <1>; +			#size-cells
>>>> =3D <0>; +		}; +
>>> Until here things look good.
>>>
>>>> gem0: ethernet@e000b000 { compatible =3D "cdns,gem"; reg =3D
>>>> <0xe000b000 0x4000>; @@ -140,6 +164,19 @@ clock-names =3D "pclk",
>>>> "hclk", "tx_clk"; };
>>>>
>>>> +		qspi: qspi@e000d000 { +			compatible =3D
>>>> "xlnx,zynq-spi-r1p6"; +			reg =3D <0xe000d000 0x1000>; +			status
>>>> =3D "disabled"; +			interrupt-parent =3D <&intc>; +			interrupts =3D=

>>>> <0 19 4>; +			clocks =3D <&clkc 10>, <&clkc 43>; +			clock-names
>>>> =3D "ref_clk", "pclk"; +			num-cs =3D <1>; +			#address-cells =3D
>>>> <1>; +			#size-cells =3D <0>; +		}; +
>>> I'm not sure what the status of this driver is. I think QSPI is
>>> still under review on the mailing lists and I don't think we
>>> should add this yet.
>=20
>> Driver for qspi is not in the mainline yet but it doesn't mean that
>> this fragment won't work. Harini: Can you please correct me if I am
>> wrong?
>=20
> It did seem to find the flash chip (cf. parallella-next branch), but I
> didn't find a driver capable of handling its ID. The downstream tree
> was using m25p80; I tried both micron,n25q128a11 and ...a13 based on
> U-Boot output.
>=20
>> I would prefer to send two separate patches.
>=20
> Will do.
>=20
>> 1. just add SPI to zynq
>=20
> As I don't have any of the other Zynq boards, can you please advise
> whether either of them should be enabled for some board?

we don't have them enabled for any board in default configuration
that's why just adding nodes with status =3D "disabled" is fine.

Thanks,
Michal


--P3EDFoVLsodiaKB4S45t2vbFuD8Oj7mDl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlPSJYsACgkQykllyylKDCET8QCgmv7LcnzTey3z3oBd9klwizIx
vZQAnRnpQDPJEZEM10QUYZeaDt3U17F8
=0FNN
-----END PGP SIGNATURE-----

--P3EDFoVLsodiaKB4S45t2vbFuD8Oj7mDl--


--===============0815254082321563887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0815254082321563887==--
