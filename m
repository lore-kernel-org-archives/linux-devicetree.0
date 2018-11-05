From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/2] dt-bindings: himax,hx8837: add HiMax HX8837 bindings
Date: Mon, 5 Nov 2018 10:19:25 +0100
Message-ID: <20181105091925.GE4439@amd>
References: <20181008202321.128937-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="u5E4XgoOPWr4PD9E"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181008202321.128937-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--u5E4XgoOPWr4PD9E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2018-10-08 22:23:20, Lubomir Rintel wrote:
> HiMax HX8837 is a display controller used on OLPC platforms.
> It controlls backlight and is able to capture and freeze a frame when
> the LCD controller (and the rest of the plaform) is powered off.
>=20
> What is missing here is the description of connections to the LCD
> controller and the panel. Maybe it would be a good idea to plug in it
> betweend the two in a manner described in

"between"

> <Documentation/devicetree/bindings/graph.txt>.

Acked-by: Pavel Machek <pavel@ucw.cz>
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--u5E4XgoOPWr4PD9E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvgCx0ACgkQMOfwapXb+vJC6wCgwyyMNgE+ZNhHZGM4jur9wr0c
3VwAoIsGvEfgQZdTH3Up/Z0wvG+PN1ZX
=ln3B
-----END PGP SIGNATURE-----

--u5E4XgoOPWr4PD9E--
