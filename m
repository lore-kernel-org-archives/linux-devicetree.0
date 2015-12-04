From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v7 0/5] mfd: tps65912: Driver rewrite with DT support
Date: Fri, 4 Dec 2015 12:02:40 +0000
Message-ID: <20151204120240.GW26072@sirena.org.uk>
References: <1447869580-10416-1-git-send-email-afd@ti.com>
 <20151124162624.GI807@x1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Fw8vdPO5iEPGjqL+"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151124162624.GI807@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: "Andrew F. Davis" <afd@ti.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--Fw8vdPO5iEPGjqL+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 24, 2015 at 04:26:24PM +0000, Lee Jones wrote:
> On Wed, 18 Nov 2015, Andrew F. Davis wrote:

> >  Documentation/devicetree/bindings/mfd/tps65912.txt |  50 ++
> >  drivers/gpio/Kconfig                               |   2 +-
> >  drivers/gpio/gpio-tps65912.c                       | 317 ++++-----
> >  drivers/mfd/Kconfig                                |  20 +-
> >  drivers/mfd/Makefile                               |   3 +-
> >  drivers/mfd/tps65912-core.c                        | 290 ++++-----
> >  drivers/mfd/tps65912-i2c.c                         | 219 +++----
> >  drivers/mfd/tps65912-irq.c                         | 217 -------
> >  drivers/mfd/tps65912-spi.c                         | 219 +++----
> >  drivers/regulator/Kconfig                          |   2 +-
> >  drivers/regulator/tps65912-regulator.c             | 710 +++++----------------
> >  include/linux/mfd/tps65912.h                       | 208 +++---

> Just waiting for the regulator Ack now, right?

No, you also need to work out what to do about the GPIO driver not
building in -next due to interface changes in gpiolib.

--Fw8vdPO5iEPGjqL+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWYYDaAAoJECTWi3JdVIfQasoH/jCW6bFWireb1/pEvX41niNg
vC6k8ppC805meatrkw/OF6BjzcZPLUNl1YFNvgITjaH4gyZeVi9lhQ3TacmtQWRM
BBAK6zuDPT+cmvL4YTFZ7Ga4UQh5CrlXtesW/D/FvNR2oq5BtJF0wlITTB12EQvV
Xwz9aGnIKzqaRIA2wZFkKJFs5b4Sgn19E/VjUDGBlZJzVnqpxjel2TYoxpx0alsD
whfww+g4t4CQ2JGwawPP45AA66UNbmpe2DBzPDXWWpfRlY3UIpf9zAw/u2HWsxmU
dXEhSKZjESu6Ay/dkb0+Ss4Z4ud8Wtaz4uB+lDTKoO6oWAY5gVQ922vD7SqV54Y=
=Vjdx
-----END PGP SIGNATURE-----

--Fw8vdPO5iEPGjqL+--
