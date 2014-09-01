From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: zynq: DT: Add Ethernet phys
Date: Mon, 01 Sep 2014 13:26:59 +0200
Message-ID: <54045803.70705@monstr.eu>
References: <53F5D8D9.7040604@suse.de> <f166a186-301c-4288-97cf-71f8173c07e7@BN1AFFO11FD010.protection.gbl> <CAGVrzcYWN83tznwvw1M9V_mwWgobs2kwtRvEj4stqE=XGC10fg@mail.gmail.com> <20140825174610.GA13737@obsidianresearch.com> <53FB9AC4.8010704@gmail.com> <660fe929-1f16-4e22-8bd3-0388cd363978@BY2FFO11FD038.protection.gbl> <540099AF.4020005@suse.de> <e52ebd6c-2f0d-4ea9-a01f-882212956ace@BL2FFO11FD029.protection.gbl> <20140829173102.GA30917@obsidianresearch.com> <5400C53D.70501@gmail.com> <20140829232203.GA17664@obsidianresearch.com> <54011E31.8060409@gmail.com>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="b115GkuvilLIJPvAOFSIChDD4dAxNlkw1"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54011E31.8060409-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--b115GkuvilLIJPvAOFSIChDD4dAxNlkw1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 08/30/2014 02:43 AM, Florian Fainelli wrote:
> On 08/29/2014 04:22 PM, Jason Gunthorpe wrote:
>> On Fri, Aug 29, 2014 at 11:23:57AM -0700, Florian Fainelli wrote:
>>> On 08/29/2014 10:31 AM, Jason Gunthorpe wrote:
>>>> On Fri, Aug 29, 2014 at 08:35:36AM -0700, S=C3=B6ren Brinkmann wrote=
:
>>>>
>>>>> The compatible string is listed as optional property for PHYs. So, =
not
>>>>> having one is an option, I guess. But, I'd also prefer to at least =
keep
>>>>> the -c22 one, since I saw problems when I tried using -c45 (the Zed=
 phy
>>>>> should support it...).
>>>>
>>>> -c45 and -c22 use a completely different MDIO protocol, Zed doesn't
>>>> have a 10GE port, so it certainly doesn't use -c45.
>>>
>>> Most recent 1GbE PHYs should also implement clause 45. It is a nice
>>> improvement if you are using lot of transactions, otherwise clause 45=

>>> over clause 22 is suitable and supported by the PHY library (for EEE =
in
>>> particular).
>>
>> Oh, that is interesting, I haven't actually seen one of those yet..
>>
>> Hum. So that is messy, even if the Zed phy supports the C45 format,
>> the macb driver (and by my reading, the Zynq hardware) lacks the
>> capability to generate C45 frames.
>=20
> We should restrict ourselves to clause 45 over clause 22 compatibility
> mode, which requires no MDIO bus driver changes.
>=20
>>
>> It could be supported, but you'd have to use the GPIO bitbang MDIO
>> driver to talk to the phy.
>>
>> So... that makes the compatible string for the phy even more
>> confusing. 'Describe The HW' says it should have both c22 and c45
>> listed - however we don't have software support in Linux to negotiate
>> c22 and c45 support between the phy bus driver and attached phy :(
>=20
> Right now, if you set the c45 compatible string, the MDIO bus driver an=
d
> the PHY must support native c45 transactions to set phydev->is_c45, if
> one or the other, or neither of those work, we will fallback to c22.
>=20
> The part that is not figured out properly yet is how do we want to
> handle functions (e.g: EEE) that are only accessible using c45 (native
> or in compatible mode), since the PHY library uses two pairs of
> accessors, with the native accessors not falling back to the indirect
> accessor...

ok. I have read all responses listed here and still IMHO the best resolut=
ion
is not to add any compatible string.
I agree with Florian that we can have shorten boot time when idAAAA.BBBB =
is used
but also we are not checking that phy can be detect.

I believe all my points in my response are still valid and we have 3 opti=
ons.
1. not to add any compatible string and use autodetection
2. Add idAAAA.BBBB to shorten boot up time
3. Add c22
4. Add c22 and idAAAA.BBBB

My preference is 1. because there could be problem with MII setting
and autodetection is good proof that everything is working.
If any user wants to have short boot up time it can specify ID in DTS
and also I believe DTS will be much longer because of some IPs in PL.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--b115GkuvilLIJPvAOFSIChDD4dAxNlkw1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAlQEWAMACgkQykllyylKDCEOlgCfepKdCxF79ho0IP1VA92Wk9sf
7PMAnA9/z39AyPFI/wZ9pin/XKkqo0Up
=EkEs
-----END PGP SIGNATURE-----

--b115GkuvilLIJPvAOFSIChDD4dAxNlkw1--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
