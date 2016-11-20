From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Subject: Re: [PATCH RFC] ARM: dts: add support for Turris Omnia
Date: Sun, 20 Nov 2016 21:30:37 +0100
Message-ID: <20161120203037.pd5mhqyjeotileve@perseus.defre.kleine-koenig.org>
References: <20161105203841.9661-1-uwe@kleine-koenig.org>
 <1479126185.15557.5@smtp.gmail.com>
 <20161114201640.rr32iyjf5a53v33t@perseus.defre.kleine-koenig.org>
 <20161114202832.GG24546@lunn.ch>
 <1479586147.10840.0@smtp.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lwqntkyvkv7mpzky"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479586147.10840.0-TAvD023jEQEN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tomas.hlavacek-x+rMaJPWets@public.gmane.org
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, marex-ynQEQJNshbs@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Martin Strba??ka <martin.strbacka-x+rMaJPWets@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--lwqntkyvkv7mpzky
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Tomas,

On Sat, Nov 19, 2016 at 09:09:07PM +0100, tomas.hlavacek-x+rMaJPWets@public.gmane.org wrote:
> On Mon, Nov 14, 2016 at 9:28 PM, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:
> > Interrupts don't seem to work very well with the nxp,pca9538. Which
> > is probably why it is disabled by default.
>=20
> I was thinking about this issue and I can remember that there was an earl=
ier
> prototype that had a shared interrupt line from PHY (88E1514) and from the
> PCA9538. In this case we needed to specifically disable the interrupt of =
the
> PHY to release the interrupt line (which needed a hack into PHY driver
> code). The IRQ from PHY is connected as an ordinary input to PCA9538 in
> later board prototype. And the same holds for the production version.

That would explain why I see an "irq but nobody cared" message when
booting the original system.

This isn't the problem I meant though. When adding interrupt-parent =3D
<&pcawan>; interrupts =3D <7 IRQ_TYPE_LEVEL_LOW>; to the phy node I get an
error saying that there is no irq domain associated with this device.
=20
> Do you have CZ11NIC13 or older board revision?

CZ11NIC12 is indicated on my board.

Best regards
Uwe

--lwqntkyvkv7mpzky
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAABCgAGBQJYMgfqAAoJEMH8FHityuwJWFQH/2UOT2XhHFhxTvgXUyj+acQn
8MOCzOAss4MU83XimwWtLETuDOKNvJA3lsJvx0sYUkKfSsw7+mdKYJ/ITW5C0y7V
0gplTfdYEHgg/g/hBsThOroZ5oISahEWZrjxwkKETlqbDmo5jy79sROHjoOmjPw/
JtR2OtB4I+EVUNBi6jgi/0ZfZiVLBaNqGmHbT+daxi9mZuyhRBNVxP7AMKUA6zbC
V8MAkHH3JH67SXyH1FuRXoVbKw8YVF9oT90XeHvHcRU4xAp9oraHWpShulppiS3C
OgEjqOy0CZILtLXmwjqHaayL70Pu+G7mYNiomeNYU2t4eh3Y4X1jolE9sPw+3+s=
=1Y7e
-----END PGP SIGNATURE-----

--lwqntkyvkv7mpzky--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
