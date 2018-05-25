From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 8/9] regulator: bd71837: BD71837 PMIC regulator driver
Date: Fri, 25 May 2018 11:14:23 +0100
Message-ID: <20180525101423.GH4828@sirena.org.uk>
References: <20180524060036.GI4249@localhost.localdomain>
 <20180524141427.GU4828@sirena.org.uk>
 <042F8805D2046347BB8420BEAE397A4016C06B60@WILL-MAIL002.REu.RohmEu.com>
 <20180525072253.GC16888@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5joxkA65nhhP20dL"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180525072253.GC16888@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Mutanen, Mikko" <Mikko.Mutanen@fi.rohmeurope.com>, "Haikola, Heikki" <Heikki.Haikola@fi.rohmeurope.com>
List-Id: devicetree@vger.kernel.org


--5joxkA65nhhP20dL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 25, 2018 at 10:22:53AM +0300, Matti Vaittinen wrote:
> On Thu, May 24, 2018 at 05:51:27PM +0000, Vaittinen, Matti wrote:

> > > devm_regulator_regster()

> > Makes sense. Thanks

> I was going to do=20

> -       pmic =3D kzalloc(sizeof(struct bd71837_pmic), GFP_KERNEL);
> +       pmic =3D devm_kzalloc(&pdev->dev, sizeof(struct bd71837_pmic),
> +                           GFP_KERNEL);

> and

> -               rdev =3D regulator_register(desc, &config);
> +               rdev =3D devm_regulator_register(&pdev->dev, desc, &confi=
g);
>=20
> but is there now a race regarding freeing the pmic structure and
> unregistering the regulator?

Why?  devm_ stuff gets unwound in the opposite order to the order in
which it was allocated.

--5joxkA65nhhP20dL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlsH4f8ACgkQJNaLcl1U
h9DKDQf4uSA3vgrIWIUP402K0U92AnqIGE1tuwBS18LG8nCPC8ZFZ1eCX6TiGT4Y
EZazDly8jgR+PHzV7EqWpfw9HwhYjrRbBzuAbC7JdtQQVRT1e71OPiE8DIS8j9Il
3T7/T3olewntmTbmYB74HC/lkR/eLm7b4n26JNVZQE0UuP1YV6RPi3gAHlFGmZov
wEPbl4JhzJoDL3Wwjh0YzU66ZwwvgpvKsS6xBITDUn23npchiK5zJ3ue++ZeW4P9
UhudtTqJr7Z8m5LKoMnGFPYeo9m5TjOKBxoCmoQFvoCo7EykP1DXeITA4uXnex3L
w/0IG0ArdpwwX/Wuq65wz7EcL4jn
=OtVA
-----END PGP SIGNATURE-----

--5joxkA65nhhP20dL--
