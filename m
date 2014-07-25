From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v2 06/11] ARM: dts: zynq: Add DMAC for Parallella
Date: Fri, 25 Jul 2014 10:02:50 +0200
Message-ID: <53D20F2A.5020209@monstr.eu>
References: <1406242820-20140-1-git-send-email-afaerber@suse.de> <1406242820-20140-7-git-send-email-afaerber@suse.de> <bc390439-9a5b-43a1-a70c-a4c6517a6cb6@BN1AFFO11FD005.protection.gbl>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="k9JQxe2j7S2x6jUeOcPD30TNlojb0SH0N"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bc390439-9a5b-43a1-a70c-a4c6517a6cb6-reflc3kr++MEH1pyDrHbn+hlVc3/7hDbVaz/vdPVXQ4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Andreas Olofsson <andreas-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>, Matteo Vit <matteo.vit-WGsyu9ztxDWovDFt+AQlJdBPR1lH4CV8@public.gmane.org>, Sean Rickerd <srickerd-IBi9RG/b67k@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--k9JQxe2j7S2x6jUeOcPD30TNlojb0SH0N
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 07/25/2014 01:28 AM, S=C3=B6ren Brinkmann wrote:
> On Fri, 2014-07-25 at 01:00AM +0200, Andreas F=C3=A4rber wrote:
>> Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
>> ---
>>  v2: New
>> =20
>>  arch/arm/boot/dts/zynq-7000.dtsi      | 17 +++++++++++++++++
>>  arch/arm/boot/dts/zynq-parallella.dts |  4 ++++
>>  2 files changed, 21 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq=
-7000.dtsi
>> index eed3df0..1a70277 100644
>> --- a/arch/arm/boot/dts/zynq-7000.dtsi
>> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
>> @@ -223,6 +223,23 @@
>>  			};
>>  		};
>> =20
>> +		dmac_s: dmac@f8003000 {
>> +			compatible =3D "arm,pl330", "arm,primecell";
>> +			reg =3D <0xf8003000 0x1000>;
>> +			status =3D "disabled";
> I think for this IP we can omit the 'status' property since it is alway=
s
> enabled. I don't see a reason to override it in each board DT.

Done this change myself

>=20
>> +			interrupt-parent =3D <&intc>;
>> +			interrupts =3D <0 13 4>,
>> +			             <0 14 4>, <0 15 4>,
>> +			             <0 16 4>, <0 17 4>,
>> +			             <0 40 4>, <0 41 4>,
>> +			             <0 42 4>, <0 43 4>;
>> +			#dma-cells =3D <1>;
>> +			#dma-channels =3D <8>;
>> +			#dma-requests =3D <4>;
>> +			clocks =3D <&clkc 27>;
>> +			clock-names =3D "apb_pclk";
>> +		};
>> +
>=20
> Acked-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>


Applied to zynq/dt branch.
https://github.com/Xilinx/linux-xlnx/commits/zynq/dt

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--k9JQxe2j7S2x6jUeOcPD30TNlojb0SH0N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlPSDyoACgkQykllyylKDCFvoACeNvYOj1oEElQG/9lELpAeNXbi
s0cAn15kYHL6gZdZoGB0donCXXsApX/x
=AJVQ
-----END PGP SIGNATURE-----

--k9JQxe2j7S2x6jUeOcPD30TNlojb0SH0N--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
