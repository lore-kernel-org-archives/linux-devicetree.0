Return-Path: <SRS0=+aPx=TG=ucw.cz=pavel@kernel.org>
Date: Mon, 6 May 2019 17:15:01 +0200
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 2/2] leds: spi-byte: add single byte SPI LED driver
Message-ID: <20190506151500.GA6221@amd>
References: <20190505200022.32209-1-oss@c-mauderer.de>
 <20190505200022.32209-2-oss@c-mauderer.de>
 <8c150278-4bf6-4202-998e-4d82a2a3cd3c@ti.com>
 <3f0d7a10-a67e-a2c2-98fe-a487493b8f2c@c-mauderer.de>
 <fb0bc2a0-1311-3a45-04db-5cddcba48392@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline
In-Reply-To: <fb0bc2a0-1311-3a45-04db-5cddcba48392@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Cc: Christian Mauderer <oss@c-mauderer.de>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Of course it would have been possible to make it a lot more universal by
> > for example adding a prefix, a bit mask or other word lengths. But that
> > would have added a lot of complexity without any actual application.
> >=20
>=20
> I have to disagree here.  If this is supposed to be a universal SPI byte =
driver that
> needs special handling then it is either needs to be created in a univers=
al way or needs to be made
> target specific.
>=20

Let him be. The driver is good.

If some hardware needs more flexibility, we add it.

No need to have 1000 releases of everything.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzQT3QACgkQMOfwapXb+vIUQgCgqTn5AYU9YSSXR5GbdZp//ket
A1gAmwVcwMLdTNaim26kjCnfYzhgCFqx
=Rv6L
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
