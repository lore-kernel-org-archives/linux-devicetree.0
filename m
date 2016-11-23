From: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Subject: Re: [PATCH RFC] ARM: dts: add support for Turris Omnia
Date: Wed, 23 Nov 2016 19:36:53 +0100
Message-ID: <09b7d4a1-40e5-7aee-d777-9bd9f9b434b4@kleine-koenig.org>
References: <20161105203841.9661-1-uwe@kleine-koenig.org>
 <1479126185.15557.5@smtp.gmail.com>
 <20161114201640.rr32iyjf5a53v33t@perseus.defre.kleine-koenig.org>
 <20161114202832.GG24546@lunn.ch> <1479586147.10840.0@smtp.gmail.com>
 <20161120203037.pd5mhqyjeotileve@perseus.defre.kleine-koenig.org>
 <1479851991.26813.2@smtp.gmail.com> <20161123145916.GL14947@lunn.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="Gv9xbGlNg2VegxgXFNQr0sQ3v9abR4xbt"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161123145916.GL14947-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, tomas.hlavacek-x+rMaJPWets@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, marex-ynQEQJNshbs@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Gv9xbGlNg2VegxgXFNQr0sQ3v9abR4xbt
Content-Type: multipart/mixed; boundary="ot4nOiPW2Hs9QcqlGhHUWEgs9wAEu61MV";
 protected-headers="v1"
From: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, tomas.hlavacek-x+rMaJPWets@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, marex-ynQEQJNshbs@public.gmane.org,
 Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>,
 Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>,
 linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org,
 Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Message-ID: <09b7d4a1-40e5-7aee-d777-9bd9f9b434b4-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Subject: Re: [PATCH RFC] ARM: dts: add support for Turris Omnia
References: <20161105203841.9661-1-uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
 <1479126185.15557.5-TAvD023jEQEN+BqQ9rBEUg@public.gmane.org>
 <20161114201640.rr32iyjf5a53v33t-jgopVnDzZD+b0XQX99//ntPVjbGH4+40kFgPdswSElo@public.gmane.org>
 <20161114202832.GG24546-g2DYL2Zd6BY@public.gmane.org> <1479586147.10840.0-TAvD023jEQEN+BqQ9rBEUg@public.gmane.org>
 <20161120203037.pd5mhqyjeotileve-jgopVnDzZD+b0XQX99//ntPVjbGH4+40kFgPdswSElo@public.gmane.org>
 <1479851991.26813.2-TAvD023jEQEN+BqQ9rBEUg@public.gmane.org> <20161123145916.GL14947-g2DYL2Zd6BY@public.gmane.org>
In-Reply-To: <20161123145916.GL14947-g2DYL2Zd6BY@public.gmane.org>

--ot4nOiPW2Hs9QcqlGhHUWEgs9wAEu61MV
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hello Andrew,

On 11/23/2016 03:59 PM, Andrew Lunn wrote:
>>> CZ11NIC12 is indicated on my board.
>>
>> :-( Well, this board version has wrongly matched length of some
>> differential pairs, IRQ from 88E1514 is connected differently, there
>> are slight differences in power supplies and (if I am not mistaken)
>> something changed in RTC support circuitry. It looks like a huge
>> mistake on our side.
>=20
> Hi Tomas
>=20
> Would these problems also explain why the Ethernet links to the switch
> don't work? Maybe the differential pairs?

no this is not the problem. When booting the OpenWRT based system I can
communicate with the device via the switch. (Didn't test deeply, but my
Laptop got a dhcp lease from the Turris Omnia and I can ping it.) But
this convinces me, that the hardware is good enough.

If you have any ideas what I can try to make the switch work or help to
diagnose the problem, just let me know.

Best regards
Uwe


--ot4nOiPW2Hs9QcqlGhHUWEgs9wAEu61MV--

--Gv9xbGlNg2VegxgXFNQr0sQ3v9abR4xbt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAlg14ckACgkQwfwUeK3K
7Anc2Qf/fl+uNbyp1h/Hd+jSgpsYxqPlS/7XxFusPLnelEkUvirTyMSexFUOKv+W
mfLSk87tdfKR8D0jFHHEXGYh+CRQhS3U4mgsik3i/ipWKB3dxN29lQARoaMOTqrg
M0yaj7GK24xzxqWmSweoDdlBWJTNkHDO1Kbj6f4WJlJSJSB42wAXbfWtmcgWZrVz
pgIh54sxuOrM7EKEMiiP0tjt6Nramr24weuH7d9dqtVOAXmRHF4pLZ59StNDGD0W
XLJX++uVdB+Sl0o1IbyA1/vTY2s1p2GQZSe+N9HIGc6xUFSjDwSqkH0I6Zsy8C52
EVGaMKiqbye58Keb2cgkyxsS1t7psg==
=7fW/
-----END PGP SIGNATURE-----

--Gv9xbGlNg2VegxgXFNQr0sQ3v9abR4xbt--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
