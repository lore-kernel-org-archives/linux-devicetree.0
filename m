From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 06/11] ARM: dts: zynq: Add DMAC for Parallella
Date: Fri, 25 Jul 2014 10:36:03 +0200
Message-ID: <42796bf5-b27c-4009-894d-9462c85e2bc2@BY2FFO11FD025.protection.gbl>
References: <1406242820-20140-1-git-send-email-afaerber@suse.de>
 <1406242820-20140-7-git-send-email-afaerber@suse.de>
 <bc390439-9a5b-43a1-a70c-a4c6517a6cb6@BN1AFFO11FD005.protection.gbl>
 <53D20F2A.5020209@monstr.eu> <53D21458.3060403@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="jh01ixvfH45lwgIFL8FIOO8wMdfQKlnbu"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53D21458.3060403-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber-l3A5Bk7waGM@public.gmane.org>, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Andreas Olofsson <andreas-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>, Matteo Vit <matteo.vit-WGsyu9ztxDWovDFt+AQlJdBPR1lH4CV8@public.gmane.org>, Sean Rickerd <srickerd-IBi9RG/b67k@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--jh01ixvfH45lwgIFL8FIOO8wMdfQKlnbu
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 07/25/2014 10:24 AM, Andreas F=C3=A4rber wrote:
> Am 25.07.2014 10:02, schrieb Michal Simek:
>> On 07/25/2014 01:28 AM, S=C3=B6ren Brinkmann wrote:
>>> On Fri, 2014-07-25 at 01:00AM +0200, Andreas F=C3=A4rber wrote:
>>>> Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
>>>> ---
>>>>  v2: New
>>>> =20
>>>>  arch/arm/boot/dts/zynq-7000.dtsi      | 17 +++++++++++++++++
>>>>  arch/arm/boot/dts/zynq-parallella.dts |  4 ++++
>>>>  2 files changed, 21 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zy=
nq-7000.dtsi
>>>> index eed3df0..1a70277 100644
>>>> --- a/arch/arm/boot/dts/zynq-7000.dtsi
>>>> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
>>>> @@ -223,6 +223,23 @@
>>>>  			};
>>>>  		};
>>>> =20
>>>> +		dmac_s: dmac@f8003000 {
>>>> +			compatible =3D "arm,pl330", "arm,primecell";
>>>> +			reg =3D <0xf8003000 0x1000>;
>>>> +			status =3D "disabled";
>>> I think for this IP we can omit the 'status' property since it is alw=
ays
>>> enabled. I don't see a reason to override it in each board DT.
>>
>> Done this change myself
>=20
> Fine with me, but allow me to point out that the TRM documents the DMAC=

> being mapped as DMAC S at the above address, and as DMAC NS at F800_400=
0
> (secure vs. non-secure, ch. 4.6, p. 116). Not sure how this would be
> handled driver-wise if not through alternative dt nodes?

Kernel on zynq runs in secure world. All the sw on zynq from beginning ru=
ns in secure world.
I haven't had any time to look at switching kernel to NS.
That's why having dmac in this dts as default configuration in secure wor=
ld
is fine.

It is not about how driver will handle - driver shouldn't care.
It is how users will handle that kernel runs in non secure
and how to change DTS to reflect this.
Bootloader can do this change for example. Or if there is an option
to detect at run time by kernel that we are in NS than kernel itself can
patch dmac node and use different address.
Definitely bootloader or setup correct address by user is preferred way.

Thanks,
Michal



--jh01ixvfH45lwgIFL8FIOO8wMdfQKlnbu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlPSFvMACgkQykllyylKDCEUXgCeIXT9RPLa3QdhcsmyGTuM2W33
qOoAoJIVvtNryqXw7SIve1LYgxgj53h+
=2/77
-----END PGP SIGNATURE-----

--jh01ixvfH45lwgIFL8FIOO8wMdfQKlnbu--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
