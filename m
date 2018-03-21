Return-Path: <SRS0=0uUh=GL=ucw.cz=pavel@kernel.org>
Date: Thu, 22 Mar 2018 00:08:27 +0100
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 2/2] leds: add Panasonic AN30259A support
Message-ID: <20180321230827.GB6668@amd>
References: <20180319135937.18772-1-simon@lineageos.org>
 <20180319135937.18772-3-simon@lineageos.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XF85m9dhOBO43t/C"
Content-Disposition: inline
In-Reply-To: <20180319135937.18772-3-simon@lineageos.org>
To: Simon Shields <simon@lineageos.org>
Cc: linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>


--XF85m9dhOBO43t/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Tue 2018-03-20 00:59:37, Simon Shields wrote:
> AN30259A is a 3-channel LED driver which uses I2C. It supports timed
> operation via an internal PWM clock, and variable brightness. This
> driver offers support for basic hardware-based blinking and brightness
> control.
>=20
> The datasheet is freely available:
> https://www.alliedelec.com/m/d/a9d2b3ee87c2d1a535a41dd747b1c247.pdf
>=20
> Signed-off-by: Simon Shields <simon@lineageos.org>

Acked-by: Pavel Machek <pavel@ucw.cz>

You still need device tree description AFAICT:

pavel@amd:/data/l/linux$ grep -ri an30259 Documentation/devicetree/
pavel@amd:/data/l/linux$

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--XF85m9dhOBO43t/C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlqy5esACgkQMOfwapXb+vK6swCgg2sLbKFzYvBtn6uHGtwagokr
4doAoJEqs8uuA6vh4s8aa3yNigx6oXs2
=AnjF
-----END PGP SIGNATURE-----

--XF85m9dhOBO43t/C--
