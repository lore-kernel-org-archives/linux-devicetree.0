Return-Path: <SRS0=XqkU=TT=ucw.cz=pavel@kernel.org>
Date: Sun, 19 May 2019 23:25:01 +0200
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v4 1/2] dt-bindings: leds: Add binding for spi-byte LED.
Message-ID: <20190519212501.GC31403@amd>
References: <20190513193307.11591-1-oss@c-mauderer.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="adJ1OR3c6QgCpb/j"
Content-Disposition: inline
In-Reply-To: <20190513193307.11591-1-oss@c-mauderer.de>
To: oss@c-mauderer.de
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>


--adJ1OR3c6QgCpb/j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Christian Mauderer <oss@c-mauderer.de>
>=20
> This patch adds the binding documentation for a simple SPI based LED
> controller which use only one byte for setting the brightness.
>=20
> Signed-off-by: Christian Mauderer <oss@c-mauderer.de>
> ---

> diff --git a/Documentation/devicetree/bindings/leds/leds-spi-byte.txt b/D=
ocumentation/devicetree/bindings/leds/leds-spi-byte.txt
> new file mode 100644
> index 000000000000..28b6b2d9091e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-spi-byte.txt
> @@ -0,0 +1,44 @@
> +* Single Byte SPI LED Device Driver.

> +The driver can be used for controllers with a very simple SPI protocol:
> +- one LED is controlled by a single byte on MOSI
> +- the value of the byte gives the brightness between two values (lowest =
to
> +  highest)
> +- no return value is necessary (no MISO signal)

I'd expect this file to be named acb-spi-led.txt, or something, and
talk about that u-controller, not its device driver -- as devicetree
binding describes hardware, not driver.

But you already have an ack from rob, so...
									Pavel
								=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--adJ1OR3c6QgCpb/j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzhya0ACgkQMOfwapXb+vJZQgCgwC5M2kWZ828AwPlwAwIwuk46
8hAAoKSfdSHKzWEUDoCSH/1nUZHu99LO
=vkKI
-----END PGP SIGNATURE-----

--adJ1OR3c6QgCpb/j--
