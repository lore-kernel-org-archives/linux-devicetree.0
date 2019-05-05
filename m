Return-Path: <SRS0=7m+E=TF=ucw.cz=pavel@kernel.org>
Date: Sun, 5 May 2019 22:12:18 +0200
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 2/2] leds: spi-byte: add single byte SPI LED driver
Message-ID: <20190505201218.GA21957@amd>
References: <20190505125242.10298-1-oss@c-mauderer.de>
 <20190505125242.10298-2-oss@c-mauderer.de>
 <da311a7e-0d3b-5c60-5bed-06446e71e5ff@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline
In-Reply-To: <da311a7e-0d3b-5c60-5bed-06446e71e5ff@gmail.com>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: oss@c-mauderer.de, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >+	led =3D devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
> >+	if (!led)
> >+		return -ENOMEM;
> >+
> >+	led->spi =3D spi;
> >+	strlcpy(led->name, name, sizeof(led->name));
> >+	mutex_init(&led->mutex);
> >+	led->off_value =3D off_value;
> >+	led->max_value =3D max_value;
> >+	led->ldev.name =3D led->name;
> >+	led->ldev.brightness =3D LED_OFF;
>=20
> This line is redundant - already zeroed by kzalloc.

Actually I'd prefer to leave it in. Yes, LED_OFF =3D=3D 0, and will
probably stay =3D=3D 0 in future, but...
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzPQ6IACgkQMOfwapXb+vJB5wCfVsrHacNFe5Q0YrkvGXTZ63HV
cScAoJdotkWRsq1O+bPIyCj6bEXKlSjP
=ZfHt
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
