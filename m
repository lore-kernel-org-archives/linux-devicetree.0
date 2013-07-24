From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4] regulator: pfuze100: add pfuze100 regulator driver
Date: Wed, 24 Jul 2013 15:39:31 +0100
Message-ID: <20130724143931.GJ9858@sirena.org.uk>
References: <1374398247-11384-1-git-send-email-b38343@freescale.com>
 <20130724083041.GC4332@pengutronix.de>
 <20130724094228.GY9858@sirena.org.uk>
 <20130724095145.GE4332@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y/C4Z0ZQWa14ewtO"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130724095145.GE4332@pengutronix.de>
Sender: linux-doc-owner@vger.kernel.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Robin Gong <b38343@freescale.com>, shawn.guo@linaro.org, grant.likely@linaro.org, rob.herring@calxeda.com, rob@landley.net, lgirdwood@gmail.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--y/C4Z0ZQWa14ewtO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 24, 2013 at 11:51:45AM +0200, Steffen Trumtrar wrote:
> On Wed, Jul 24, 2013 at 10:42:28AM +0100, Mark Brown wrote:

> > >  static struct regulator_ops pfuze100_fixed_regulator_ops = {
> > > 	.list_voltage = regulator_list_voltage_linear,
> > > +	.set_voltage_sel = regulator_set_voltage_sel_regmap,
> > >  };

> > This doesn't make much sense, you're adding a set voltage operation to a
> > fixed voltage regulator...

> Hm, okay, sounds reasonable. But if I don't, VREFDDR isn't registered because
> _regulator_do_set_voltage returns with -EINVAL.
> So, I probably just fixed a symptom and not the cause.

Yes, the obvious question is why we're trying to set a voltage on a
regulator which can't change voltage.  Usually this is a result of
setting a constraint that tries to force the voltage.

--y/C4Z0ZQWa14ewtO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR7+cgAAoJELSic+t+oim9ElUP/juGJDGofhINfhGRYY0cB/3O
4852+UyhdHtjl3vRVGPgp1tqzFApYRzYgGdhg5w20k2tHz4OuUxmcsQGqSDtnNTD
zyvv3NMmkWpjK5qE+ZYAMPfACQlWYJPWrdHgJBt+O9fZGsPkwzDePHyVEAQzTLxI
9SXn8tvumXbDqV3KIbBddNzbpwvVh0PQzPtYnhyr+5lOh29nXX6G11gKWQuMNQtc
d4S+m8w/Li3SpIPwGcJwK6Ym8nZsFz9L/huLKPi+sEH0gN6QanepEbkVR2046cFh
FTYdtr0ugH2HahiYou0yFWmaWH9qbS0hqUeYwcQs3Chq1qDgkoOI1SGixXzNzawn
dgc5DuNMqj9FDiSCJtie248zJbQbctxw7CCsyBmINRzzzAc9xtaWonfV8glteGZn
nvZmjXa+WZQj1t+Ow93VqcKam+I5F1GgSiKY0fs50PXdFYJkRlFv5KqPPQcY1ZsN
uiHTqkPWZ/8a6eRr1Ku5bOODX+0h6NdVfZOij/+oxFVQ2OlcSG9sXQrgMjc2kgMp
fXmTTpMRdrgieYkZcwlkc0dZXU0fyJ9FJtRYfsZIIID1moWmnaUtjnUR8kfZSiDr
jkcSlhJfoZ9XDR537eCCA9tXZ8uBArIQ3oJjyji7s/3XZe6Ib07e9yhtswHtglYX
oKO53R8qFnBMZbtFqvLc
=CLTb
-----END PGP SIGNATURE-----

--y/C4Z0ZQWa14ewtO--
