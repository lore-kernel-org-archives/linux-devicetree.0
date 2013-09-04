From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Wed, 4 Sep 2013 12:33:22 +0100
Message-ID: <20130904113322.GA5859@sirena.org.uk>
References: <1377828449-18912-1-git-send-email-b32955@freescale.com>
 <522697E9.1050208@freescale.com>
 <20130904095523.GT3084@sirena.org.uk>
 <52270B8E.5080402@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <52270B8E.5080402@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Huang Shijie <b32955@freescale.com>
Cc: dwmw2@infradead.org, dedekind1@gmail.com, computersforpeace@gmail.com, shawn.guo@linaro.org, kernel@pengutronix.de, b18965@freescale.com, b44548@freescale.com, lznuaa@gmail.com, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 04, 2013 at 06:29:34PM +0800, Huang Shijie wrote:
> =E4=BA=8E 2013=E5=B9=B409=E6=9C=8804=E6=97=A5 17:55, Mark Brown =E5=86=99=
=E9=81=93:
> > On Wed, Sep 04, 2013 at 10:16:09AM +0800, Huang Shijie wrote:

> >> Since this quadspi driver depends on the mtd code, could this driver
> >> goes to the kernel by
> >> the l2-mtd tree?

> > Why would a SPI driver depend on MTD?

> The patch 1-4 are for m25p80.c, and this quadspi controller drivers
> depends on the
> patch 1-4.

In what way does the controller driver depend on those changes?

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSJxp/AAoJELSic+t+oim9pm0P/0XezBOtd7XCX+1DJDOLwf+H
LjAMuGRdSiytDUSCNpsBz7Re6ojT1hK2HFqKisELw7+nSTPcRInzYnsmE+UiJRny
TVTQwG8t9LoN8s2MQEVfJ3ndtLsGt3jtDhAou5FXNl8McmqbJYiNYzE+kWKQymxK
Gk8wKfVWTzg6la0AFB2eJH9L8ekEbl2Qxgu4aNpQrgDlbYRjG00g2a6Squ8tp+Ha
WAENt8s5cXKPhpq4PzuK02W3bfb7IXLjPH2ecoRN3LR5ORU1oy6Y+tdLL4IYBNlN
YjNO8EcfREXHb9vT0rToPRMvhwurlHw0QvBh8wYTj6mO5/+KV+iLntFz5fomdGfj
vSvfGcAv6coDTaDRXiYXVycMdJ8Zp41epWUox+TZeHowvRhbzMTwJjDNQD4PR2+a
VVJvAaBGlajDBwOLqftPnQ5E11VFwJmMM1DK/dM0AYmie+qJleE9sktzGMl8v/ZF
uVNklBIF5IQqNpkBzuLFVuAbaNjVwwXVtEwhXYZfdHS2I44lYVoFqOW47d5OkhBp
9t5FcgKvJxgtfUopeEJW8pdczUwKM1r1qFaYjya6z0d+G7rsuItomU2Ec9IChwWz
sbFafT+5edbHzaBxtAUNAf8FeqIFK41CkIacUk/if2aiPzJdpKZ37O8Sd8SwOBcT
ZFrLnK2WHjny/CffRa+j
=g6r9
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
