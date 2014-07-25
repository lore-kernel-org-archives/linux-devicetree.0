From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v2 05/11] ARM: dts: zynq: Add QSPI for Parallella
Date: Fri, 25 Jul 2014 09:59:23 +0200
Message-ID: <53D20E5B.9070501@monstr.eu>
References: <1406242820-20140-1-git-send-email-afaerber@suse.de> <1406242820-20140-6-git-send-email-afaerber@suse.de> <ddb38ce5-9e31-4c94-967c-7784c7fba75c@BN1BFFO11FD028.protection.gbl>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="62IjmugcpLSFa0WUUCoDlp5ueHdjeO3qO"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ddb38ce5-9e31-4c94-967c-7784c7fba75c-fm2tX0oQAVwpSWDJVTaHWOhlVc3/7hDbVaz/vdPVXQ4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Harini Katakam <harinik-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Andreas Olofsson <andreas-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>, Matteo Vit <matteo.vit-WGsyu9ztxDWovDFt+AQlJdBPR1lH4CV8@public.gmane.org>, Sean Rickerd <srickerd-IBi9RG/b67k@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--62IjmugcpLSFa0WUUCoDlp5ueHdjeO3qO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 07/25/2014 01:18 AM, S=C3=B6ren Brinkmann wrote:
> On Fri, 2014-07-25 at 01:00AM +0200, Andreas F=C3=A4rber wrote:
>> Prepare SPI0 and SPI1 while at it.

Patch subject is incorrect. You are adding SPI and QSPI.

>>
>> Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
>> ---
>>  v2: New
>> =20
>>  arch/arm/boot/dts/zynq-7000.dtsi      | 37 ++++++++++++++++++++++++++=
+++++++++
>>  arch/arm/boot/dts/zynq-parallella.dts |  4 ++++
>>  2 files changed, 41 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq=
-7000.dtsi
>> index 8fd826a..eed3df0 100644
>> --- a/arch/arm/boot/dts/zynq-7000.dtsi
>> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
>> @@ -122,6 +122,30 @@
>>  			interrupts =3D <0 50 4>;
>>  		};
>> =20
>> +		spi0: spi@e0006000 {
>> +			compatible =3D "xlnx,zynq-spi-r1p6";
>> +			reg =3D <0xe0006000 0x1000>;
>> +			status =3D "disabled";
>> +			interrupt-parent =3D <&intc>;
>> +			interrupts =3D <0 26 4>;
>> +			clocks =3D <&clkc 25>, <&clkc 34>;
>> +			clock-names =3D "ref_clk", "pclk";
>> +			#address-cells =3D <1>;
>> +			#size-cells =3D <0>;
>> +		};
>> +
>> +		spi1: spi@e0007000 {
>> +			compatible =3D "xlnx,zynq-spi-r1p6";
>> +			reg =3D <0xe0007000 0x1000>;
>> +			status =3D "disabled";
>> +			interrupt-parent =3D <&intc>;
>> +			interrupts =3D <0 49 4>;
>> +			clocks =3D <&clkc 26>, <&clkc 35>;
>> +			clock-names =3D "ref_clk", "pclk";
>> +			#address-cells =3D <1>;
>> +			#size-cells =3D <0>;
>> +		};
>> +
> Until here things look good.
>=20
>>  		gem0: ethernet@e000b000 {
>>  			compatible =3D "cdns,gem";
>>  			reg =3D <0xe000b000 0x4000>;
>> @@ -140,6 +164,19 @@
>>  			clock-names =3D "pclk", "hclk", "tx_clk";
>>  		};
>> =20
>> +		qspi: qspi@e000d000 {
>> +			compatible =3D "xlnx,zynq-spi-r1p6";
>> +			reg =3D <0xe000d000 0x1000>;
>> +			status =3D "disabled";
>> +			interrupt-parent =3D <&intc>;
>> +			interrupts =3D <0 19 4>;
>> +			clocks =3D <&clkc 10>, <&clkc 43>;
>> +			clock-names =3D "ref_clk", "pclk";
>> +			num-cs =3D <1>;
>> +			#address-cells =3D <1>;
>> +			#size-cells =3D <0>;
>> +		};
>> +
> I'm not sure what the status of this driver is. I think QSPI is still
> under review on the mailing lists and I don't think we should add this
> yet.

Driver for qspi is not in the mainline yet but it doesn't mean
that this fragment won't work.
Harini: Can you please correct me if I am wrong?

I would prefer to send two separate patches.

1. just add SPI to zynq
2. if Harini confirms that it is working I think that make sense to enabl=
e
at least simple mode for qspi. That's why not a problem to add it too.
It means qspi patch with enabling for your board as second patch.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--62IjmugcpLSFa0WUUCoDlp5ueHdjeO3qO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlPSDlsACgkQykllyylKDCEgoACgkcsPE8fDliCVFTLRmD1XhFXD
A+0An1N1irkJY/4BGIlsw61O9x8XJVBM
=K5+N
-----END PGP SIGNATURE-----

--62IjmugcpLSFa0WUUCoDlp5ueHdjeO3qO--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
