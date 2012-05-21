From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 2/2] gpio: Add Avionic Design N-bit GPIO expander support
Date: Mon, 21 May 2012 12:20:32 +0200
Message-ID: <20120521102032.GA27686@avionic-0098.mockup.avionic-design.de>
References: <1334229858-1665-1-git-send-email-thierry.reding@avionic-design.de>
 <1334229858-1665-2-git-send-email-thierry.reding@avionic-design.de>
 <20120511234728.0A4623E0791@localhost>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1841635612080875044=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120511234728.0A4623E0791@localhost>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============1841635612080875044==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Grant Likely wrote:
> On Thu, 12 Apr 2012 13:24:18 +0200, Thierry Reding <thierry.reding@avioni=
c-design.de> wrote:
> > This commit adds a driver for the Avionic Design N-bit GPIO expander.
> > The expander provides a variable number of GPIO pins with interrupt
> > support.
>=20
> Hi Thierry,  comments below...
>=20
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index 7875c3f..d86c3b7 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -373,6 +373,25 @@ config GPIO_ADP5588_IRQ
> >  	  Say yes here to enable the adp5588 to be used as an interrupt
> >  	  controller. It requires the driver to be built in the kernel.
> > =20
> > +config GPIO_ADNP
> > +	tristate "Avionic Design N-bit GPIO expander"
> > +	depends on I2C
> > +	help
> > +	  This option enables support for N GPIOs found on Avionic Design
> > +	  I2C GPIO expanders. The register space will be extended by powers
> > +	  of two, so the controller will need to accomodate for that. For
> > +	  example: if a controller provides 48 pins, 6 registers will be
> > +	  enough to represent all pins, but the driver will assume a
> > +	  register layout for 64 pins (8 registers).
> > +
> > +config GPIO_ADNP_IRQ
> > +	bool "Interrupt controller support"
> > +	depends on GPIO_ADNP
> > +	help
> > +	  Say yes here to enable the Avionic Design N-bit GPIO expander to
> > +	  be used as an interrupt controller. It requires the driver to be
> > +	  built in the kernel.
> > +
>=20
> Why does it require the driver to be built in?

That's primarily a relic from pre-IRQ domain days when it wasn't possible to
register interrupt controllers after the boot phase. While this should now =
no
longer be a problem, I still haven't been able to find out how to properly
clean up the IRQ domain when the module is unloaded. I feel that the cleanup
path should be properly implemented before allowing this to be built as a
module.

Can you enlighten me?

> > +struct adnp {
> > +	struct i2c_client *client;
> > +	struct gpio_chip gpio;
> > +	unsigned int reg_shift;
> > +
> > +	struct mutex i2c_lock;
> > +
> > +#ifdef CONFIG_GPIO_ADNP_IRQ
> > +	struct irq_domain *domain;
> > +	struct mutex irq_lock;
> > +
> > +	unsigned int irq_base;
> > +	unsigned int nrirq;
>=20
> This driver should use the irq_domain linear mapping which makes
> irq_base unnecessary.

Okay, I'll have a look.

> > +static int adnp_gpio_setup(struct adnp *gpio, struct adnp_platform_dat=
a *pdata)
> > +{
> > +	struct gpio_chip *chip =3D &gpio->gpio;
> > +
> > +	gpio->reg_shift =3D get_count_order(pdata->nr_gpios) - 3;
> > +
> > +	chip->direction_input =3D adnp_gpio_direction_input;
> > +	chip->direction_output =3D adnp_gpio_direction_output;
> > +	chip->get =3D adnp_gpio_get;
> > +	chip->set =3D adnp_gpio_set;
> > +	chip->dbg_show =3D adnp_gpio_dbg_show;
> > +	chip->can_sleep =3D 1;
> > +
> > +	chip->base =3D pdata->gpio_base;
> > +	chip->ngpio =3D pdata->nr_gpios;
> > +	chip->label =3D gpio->client->name;
> > +	chip->dev =3D &gpio->client->dev;
> > +	chip->owner =3D THIS_MODULE;
> > +	chip->names =3D pdata->names;
> > +
> > +#ifdef CONFIG_OF_GPIO
> > +	chip->of_node =3D chip->dev->of_node;
> > +#endif
>=20
> Drop the #ifdef protection.  dev->of_node always exists so this
> assignment is safe.

I'll do that.

> > +static const struct i2c_device_id adnp_i2c_id[] =3D {
> > +	{ "gpio-adnp" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, adnp_i2c_id);
>=20
> Should use an of_device_id table since this is a DT-enabled
> driver.

Depending on the discussion below, should it be using both an I2C and an OF
table in case it will be used in a non-DT setup.

> > +
> > +static struct i2c_driver adnp_i2c_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "gpio-adnp",
> > +		.owner =3D THIS_MODULE,
> > +	},
> > +	.probe =3D adnp_i2c_probe,
> > +	.remove =3D __devexit_p(adnp_i2c_remove),
> > +	.id_table =3D adnp_i2c_id,
> > +};
> > +module_i2c_driver(adnp_i2c_driver);
> > +
> > +MODULE_DESCRIPTION("Avionic Design N-bit GPIO expander");
> > +MODULE_AUTHOR("Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>");
> > +MODULE_LICENSE("GPL");
> > diff --git a/include/linux/i2c/gpio-adnp.h b/include/linux/i2c/gpio-adn=
p.h
> > new file mode 100644
> > index 0000000..6e077a3
> > --- /dev/null
> > +++ b/include/linux/i2c/gpio-adnp.h
> > @@ -0,0 +1,19 @@
> > +/*
> > + * Copyright (C) 2011-2012 Avionic Design GmbH
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#ifndef _LINUX_I2C_ADNP_H
> > +#define _LINUX_I2C_ADNP_H 1
> > +
> > +struct adnp_platform_data {
> > +	unsigned gpio_base;
> > +	unsigned nr_gpios;
> > +	int irq_base;
> > +	const char *const *names;
> > +};
>=20
> From the start this is a DT enabled driver.  There should be no reason
> to also include platform_data support.

I thought it might be a good idea to support both for now. There have been
some discussions that the device tree should be just an alternative source
for platform data, the main argument being that platform data could be used
to overwrite data provided via DT.

Also I use this driver on some older kernels that can't boot from DT yet, b=
ut
I guess that argument isn't very valid because those kernels don't have IRQ
domain support either and the driver needs more changes anyway.

Is the official position to introduce new drivers as DT only?

Thierry

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+6FvAACgkQZ+BJyKLjJp8+FwCZAV9FwktL+bHq5GP4Adq/NtsQ
rc8AnAstAmup9iL5CZxTKXLtPg49wjnJ
=WgJ4
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--

--===============1841635612080875044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1841635612080875044==--
