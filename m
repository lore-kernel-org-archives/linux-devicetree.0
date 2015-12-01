From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/2] regulator: Add coupled regulator
Date: Tue, 1 Dec 2015 15:04:36 +0100
Message-ID: <20151201140436.GQ29263@lukather>
References: <1448897346-17780-1-git-send-email-maxime.ripard@free-electrons.com>
 <1448897346-17780-2-git-send-email-maxime.ripard@free-electrons.com>
 <CANLsYkzBjDTCr1NPkPAQXnR5LCQ0MFFGb8EXXO2oVaxuZ0DH_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Evp0T6PXIQ26qRMT"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANLsYkzBjDTCr1NPkPAQXnR5LCQ0MFFGb8EXXO2oVaxuZ0DH_A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Liam Girdwood <lgirdwood@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--Evp0T6PXIQ26qRMT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

On Mon, Nov 30, 2015 at 10:17:45AM -0700, Mathieu Poirier wrote:
> On 30 November 2015 at 08:29, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Some boards, in order to power devices that have a quite high power
> > consumption, wire multiple regulators in parallel.
> >
> > In such a case, the regulators need to be kept in sync, all of them bei=
ng
> > enabled or disabled in parallel.
> >
> > This also requires to expose only the voltages that are common to all t=
he
> > regulators.
> >
> > Eventually support for changing the voltage in parallel should be added
> > too, possibly with delays between each other to avoid having a too brut=
al
> > peak consumption.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/regulator/Kconfig                     |   7 +
> >  drivers/regulator/Makefile                    |   1 +
> >  drivers/regulator/coupled-voltage-regulator.c | 241 ++++++++++++++++++=
++++++++
> >  3 files changed, 249 insertions(+)
> >  create mode 100644 drivers/regulator/coupled-voltage-regulator.c
> >
> > diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> > index 8df0b0e62976..6ba7bc8fda13 100644
> > --- a/drivers/regulator/Kconfig
> > +++ b/drivers/regulator/Kconfig
> > @@ -35,6 +35,13 @@ config REGULATOR_FIXED_VOLTAGE
> >           useful for systems which use a combination of software
> >           managed regulators and simple non-configurable regulators.
> >
> > +config REGULATOR_COUPLED_VOLTAGE
> > +       tristate "Coupled voltage regulator support"
> > +       help
> > +         This driver provides support for regulators that are an
> > +         aggregate of other regulators in the system, and need to
> > +         keep them all in sync.
> > +
> >  config REGULATOR_VIRTUAL_CONSUMER
> >         tristate "Virtual regulator consumer support"
> >         help
> > diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> > index 0f8174913c17..c05839257386 100644
> > --- a/drivers/regulator/Makefile
> > +++ b/drivers/regulator/Makefile
> > @@ -22,6 +22,7 @@ obj-$(CONFIG_REGULATOR_AS3711) +=3D as3711-regulator.o
> >  obj-$(CONFIG_REGULATOR_AS3722) +=3D as3722-regulator.o
> >  obj-$(CONFIG_REGULATOR_AXP20X) +=3D axp20x-regulator.o
> >  obj-$(CONFIG_REGULATOR_BCM590XX) +=3D bcm590xx-regulator.o
> > +obj-$(CONFIG_REGULATOR_COUPLED_VOLTAGE) +=3D coupled-voltage-regulator=
=2Eo
> >  obj-$(CONFIG_REGULATOR_DA903X) +=3D da903x.o
> >  obj-$(CONFIG_REGULATOR_DA9052) +=3D da9052-regulator.o
> >  obj-$(CONFIG_REGULATOR_DA9055) +=3D da9055-regulator.o
> > diff --git a/drivers/regulator/coupled-voltage-regulator.c b/drivers/re=
gulator/coupled-voltage-regulator.c
> > new file mode 100644
> > index 000000000000..dc7aa2aca7e6
> > --- /dev/null
> > +++ b/drivers/regulator/coupled-voltage-regulator.c
> > @@ -0,0 +1,241 @@
> > +/*
> > + * Copyright 2015 Free Electrons
> > + * Copyright 2015 NextThing Co.
> > + *
> > + * Author: Maxime Ripard <maxime.ripard@free-electrons.com>
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License as
> > + * published by the Free Software Foundation; either version 2 of the
> > + * License, or (at your option) any later version.
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/regulator/driver.h>
> > +#include <linux/regulator/of_regulator.h>
> > +
> > +#define COUPLED_REGULATOR_MAX_SUPPLIES 16
> > +
> > +struct coupled_regulator {
> > +       struct regulator        **regulators;
> > +       int                     n_regulators;
> > +
>=20
> Extra line.
>=20
> > +       int                     *voltages;
> > +       int                     n_voltages;
> > +};
>=20
> This new structure needs documentation.

Ack.

> > +
> > +static int coupled_regulator_disable(struct regulator_dev *rdev)
> > +{
> > +       struct coupled_regulator *creg =3D rdev_get_drvdata(rdev);
> > +       int ret, i;
> > +
> > +       for (i =3D 0; i < creg->n_regulators; i++) {
> > +               ret =3D regulator_disable(creg->regulators[i]);
> > +               if (ret)
> > +                       break;
> > +       }
> > +
> > +       return ret;
> > +}
>=20
> What happens to the other regulators when an element of the chain
> fails to disable?  Should they be powered on again?
>=20
> > +
> > +static int coupled_regulator_enable(struct regulator_dev *rdev)
> > +{
> > +       struct coupled_regulator *creg =3D rdev_get_drvdata(rdev);
> > +       int ret, i;
> > +
> > +       for (i =3D 0; i < creg->n_regulators; i++) {
> > +               ret =3D regulator_enable(creg->regulators[i]);
> > +               if (ret)
> > +                       break;
> > +       }
> > +
> > +       return ret;
> > +}
>=20
> Same thing here - shouldn't the previously enabled regulators be
> switched off when one fails to come on?  It might be worth documenting
> the behaviour being enacted.

That's actually a very good question, and I don't have a good answer
to it. I guess the safest approach would be to roll back and do the
opposite operation on the one we previously enabled / disabled.

I wonder whether it might damage the hardware or not though.

Mark?

> > +
> > +static int coupled_regulator_is_enabled(struct regulator_dev *rdev)
> > +{
> > +       struct coupled_regulator *creg =3D rdev_get_drvdata(rdev);
> > +       int ret =3D 0, i;
> > +
> > +       for (i =3D 0; i < creg->n_regulators; i++) {
> > +               ret &=3D regulator_is_enabled(creg->regulators[i]);
>=20
> Why is the '&=3D' here?  Since it is set to '0' from the start, won't it
> always clear all the bits in a potential error return code?  Apologies
> if I'm missing something.

It was supposed to be a bitwise or, and not an and, sorry.

But your comment on the error code that might be altered is still
valid though, I'll rework that part.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Evp0T6PXIQ26qRMT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWXaj0AAoJEBx+YmzsjxAgpbMP/jdBKuofMj42sGG0Tyeoqtqx
Kb3BB92RP58FgyB3QH/0AxWRwj/xMrfb9d2KmsXoRj5+BfVxydu8szHYz7/yLROQ
4q+fQvNFw5sTPCo0h8ZpjCL2qrHdZZYjGWiT7BoB66waZQ5rbmc389hq0jU2IQfR
+XusOnY1K7HHhpYh4GKCBzruPLI3dG5evLZV6YPQGRtDR8/lcWG5wPOVJdYA5pWO
LcVAJIHiyv+083qCYKuQxiKI88ADAIZcfnfFpswW7XdwjOsSH4dq5Zyfz7k1isE/
XXQGE90VV0hAWfrS+KXoiI/goua7DGDSd+PeOpprv5eXYPDsxlgjALxliLmhY5YY
wCldwDh1J5l/VEuA2lwHwGVn3yLlEiF8h0h0RYX7q1gQNC/OmL2GA6FiS/5ru1Uy
cG6xiiVw8Y1lco/Jdx0z5CaNKPZeHtoK6IUByuso3WTEX8NiA6tzVTyJQbLnareA
dcT4mnZeutZLTg/N5Q5FbZ0HTAmZO7uO3zHipezo/jcDu6oOKTMd7o9AEsR+RWFU
sV4ccDfSCvda3YVj5gJ/ERDQb2vsz2dCHSFjO9lUHNp04VVY0u5r5awuP+Fp8WjD
zZ5e2AWRyMEoVCTNAmaKR+KKVb+lFWKyb/eMgmbeQ4wl5CWvkEPtq88KPEWVJNHC
NeSMxOEdLizCM1sInPSz
=QsoO
-----END PGP SIGNATURE-----

--Evp0T6PXIQ26qRMT--
