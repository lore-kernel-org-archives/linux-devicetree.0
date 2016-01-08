From: Mark Brown <broonie@kernel.org>
Subject: Re: [rtc-linux] [PATCH 5/6] rtc: max77620: add support for
 max77620/max20024 RTC driver
Date: Fri, 8 Jan 2016 13:36:48 +0000
Message-ID: <20160108133648.GQ6588@sirena.org.uk>
References: <1452177524-23192-1-git-send-email-ldewangan@nvidia.com>
 <1452177524-23192-6-git-send-email-ldewangan@nvidia.com>
 <CAJKOXPd938soaa5M0GFo5HpVCYzAS1w8j8Hko3Ja9mx47NYkEQ@mail.gmail.com>
 <568F8D7E.10500@nvidia.com>
 <20160108125117.GM6588@sirena.org.uk>
 <568FB3DD.4090503@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yhCE4sTDB5mqd9YJ"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <568FB3DD.4090503@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, swarren@nvidia.com, treding@nvidia.com, Chaitanya Bandi <bandik@nvidia.com>
List-Id: devicetree@vger.kernel.org


--yhCE4sTDB5mqd9YJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 08, 2016 at 06:34:29PM +0530, Laxman Dewangan wrote:

> If we get the parent device, regmap handle and interrupt number from mfd
> core independent of the PMIC (MAX77620 or MAX77686), then same driver can be
> used here.
> Two way which I can think of here:

Parent device is just dev->parent, you can use dev_get_regmap() to get a
regmap given a struct device and you can use platform resources to pass
the interrupts to the children from the MFD (there's some examples,
wm831x is one).

--yhCE4sTDB5mqd9YJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWj7tvAAoJECTWi3JdVIfQFUYH/iWXnQyflBGLqEOSyhQUyPgp
NOq8StSdQ/zEvoKZ7DfFPZ+aRlOXJPG9dQ6PDczj1PSl5xXlgkUAtcHVfPc8aFOp
9c70hUDX74st468a80SlmDQc49LYDH99umpzeJs1akq8l8b9Z9s6gOFNGV79lHXW
GJwpG/KtmMe3hApod10gF0SlfArie6DC30xxPa2sQQgBUqrmfA3eoxvSSLuiLcIn
X5KVtNUO9/tRYJWN7Jo33S6aqXriMbsvuJxXlttuONFYVUKGMz/uPd493Pt8Za3O
02Lgm6YtKWgKC3zi9lQ6MA13lIqFQT6y3anU3zAATZoSYiHiGjQPeKRdYctfNrQ=
=R4fS
-----END PGP SIGNATURE-----

--yhCE4sTDB5mqd9YJ--
