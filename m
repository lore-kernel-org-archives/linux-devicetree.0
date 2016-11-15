From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: zynq: Fix W=1 dtc 1.4 warnings
Date: Tue, 15 Nov 2016 19:01:17 +0100
Message-ID: <89b753f1-91ec-c9f9-5a67-17ef91224e9c@monstr.eu>
References: <2d42e25d7dd03e562e12e71fd037837737115940.1479218844.git.michal.simek@xilinx.com>
 <90eca8dfcdcef68ce5fe39f2329c4b61d2662598.1479218844.git.michal.simek@xilinx.com>
 <20161115154608.GH30999@jcartwri.amer.corp.natinst.com>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="5Sw0NR6CNd0pNK701FuaTAhuJaKbLjeW5"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161115154608.GH30999-ew3lsbMjNqt5wtABiV/Xjqyly8cj88Ttqxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julia Cartwright <julia-acOepvfBmUk@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, S?ren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5Sw0NR6CNd0pNK701FuaTAhuJaKbLjeW5
Content-Type: multipart/mixed; boundary="nkpMka9cga8EI0dQNEVxm2drunhpalC1I";
 protected-headers="v1"
From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
To: Julia Cartwright <julia-acOepvfBmUk@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org,
 S?ren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>,
 Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
 Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Message-ID: <89b753f1-91ec-c9f9-5a67-17ef91224e9c-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: zynq: Fix W=1 dtc 1.4 warnings
References: <2d42e25d7dd03e562e12e71fd037837737115940.1479218844.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
 <90eca8dfcdcef68ce5fe39f2329c4b61d2662598.1479218844.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
 <20161115154608.GH30999-ew3lsbMjNqt5wtABiV/Xjqyly8cj88Ttqxv4g6HH51o@public.gmane.org>
In-Reply-To: <20161115154608.GH30999-ew3lsbMjNqt5wtABiV/Xjqyly8cj88Ttqxv4g6HH51o@public.gmane.org>

--nkpMka9cga8EI0dQNEVxm2drunhpalC1I
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi,

On 15.11.2016 16:46, Julia Cartwright wrote:
> On Tue, Nov 15, 2016 at 03:07:27PM +0100, Michal Simek wrote:
>> The patch removes these warnings reported by dtc 1.4:
>> Warning (unit_address_vs_reg): Node /pmu has a reg or ranges property,=

>> but no unit name
>> Warning (unit_address_vs_reg): Node /fixedregulator@0 has a unit name,=

>> but no reg property
>> Warning (unit_address_vs_reg): Node /memory has a reg or ranges
>> property, but no unit name
>>
>> Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>=20
> Reviewed-by: Julia Cartwright <julia-acOepvfBmUk@public.gmane.org>
>>
>> ---
>>
>>  arch/arm/boot/dts/zynq-7000.dtsi      | 4 ++--
>>  arch/arm/boot/dts/zynq-parallella.dts | 2 +-
>>  arch/arm/boot/dts/zynq-zc702.dts      | 2 +-
>>  arch/arm/boot/dts/zynq-zc706.dts      | 2 +-
>>  arch/arm/boot/dts/zynq-zed.dts        | 2 +-
>>  arch/arm/boot/dts/zynq-zybo.dts       | 2 +-
>>  6 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq=
-7000.dtsi
>> index f47a6c1cc752..402b5bbe3b5b 100644
>> --- a/arch/arm/boot/dts/zynq-7000.dtsi
>> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
>> @@ -42,14 +42,14 @@
>>  		};
>>  	};
>> =20
>> -	pmu {
>> +	pmu@f8891000 {
>>  		compatible =3D "arm,cortex-a9-pmu";
>>  		interrupts =3D <0 5 4>, <0 6 4>;
>>  		interrupt-parent =3D <&intc>;
>>  		reg =3D < 0xf8891000 0x1000 0xf8893000 0x1000 >;
>=20
> Style nit: we should drop the space before/after '<' and '>'; and,
> perhaps separate the entries to be a bit more readable:
>=20
>    reg =3D <0xf8891000 0x1000>,
>          <0xf8893000 0x1000>;

yes we can do it. Do you want to send separate patch for it?

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP SoCs



--nkpMka9cga8EI0dQNEVxm2drunhpalC1I--

--5Sw0NR6CNd0pNK701FuaTAhuJaKbLjeW5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlgrTW0ACgkQykllyylKDCF43gCglPzQn7wryin+VXgynlu4IYAb
gMEAn21fs6ph2/zP19F7DqiWBLOsNsFl
=bgir
-----END PGP SIGNATURE-----

--5Sw0NR6CNd0pNK701FuaTAhuJaKbLjeW5--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
