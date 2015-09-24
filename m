From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH v2 3/3] gpiolib: Add GPIO initialization
Date: Thu, 24 Sep 2015 08:48:37 +0200
Message-ID: <20150924064837.GT32203@pengutronix.de>
References: <1440920686-6892-1-git-send-email-mpa@pengutronix.de>
 <1440920686-6892-4-git-send-email-mpa@pengutronix.de>
 <CACRpkdZTN9_t=pUFQTWzaWoqhRBtn7XPEQjo6zUEMoJJBZmDzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mW9eGbZzDIYYWqGs"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZTN9_t=pUFQTWzaWoqhRBtn7XPEQjo6zUEMoJJBZmDzQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, chrisrfq@gmail.com, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org


--mW9eGbZzDIYYWqGs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 21, 2015 at 04:42:09PM -0700, Linus Walleij wrote:
> On Sun, Aug 30, 2015 at 12:44 AM, Markus Pargmann <mpa@pengutronix.de> wr=
ote:
>=20
> > This functions adds a way to initialize a GPIO without hogging it.
> >
> > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
>=20
> (...)
>=20
> > -The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mech=
anism
> > -providing automatic GPIO request and configuration as part of the
> > -gpio-controller's driver probe function.
> > +The GPIO chip may contain GPIO definitions. These define properties fo=
r single
> > +GPIOs of this controller.
>=20
> Insert text like this:
>=20
> There are two types of GPIO definitions:
>=20
> - GPIO hogs are ...
>=20
> - GPIO initializers are ...
>=20
> This list form is easier to understand.
>=20
> > -Each GPIO hog definition is represented as a child node of the GPIO co=
ntroller.
> > +GPIO hogging is a mechanism providing automatic GPIO request and confi=
guration
> > +as part of the gpio-controller's driver probe function.
> > +
> > +GPIO initialization provides an automatic initialization to known save=
 values.
> > +Instead of GPIO hogging the GPIO's value and direction can be modified=
 by other
> > +users after it was initialized.
> > +
> > +Each GPIO definition is represented as a child node of the GPIO contro=
ller.
> >  Required properties:
> > -- gpio-hog:   A property specifying that this child node represent a G=
PIO hog.
> >  - gpios:      Store the GPIO information (id, flags, ...). Shall conta=
in the
> >               number of cells specified in its parent node (GPIO contro=
ller
> >               node).
> > -Only one of the following properties scanned in the order shown below.
> > -This means that when multiple properties are present they will be sear=
ched
> > -in the order presented below and the first match is taken as the inten=
ded
> > -configuration.
> > +
> > +Optional properties:
> > +- line-name:  The GPIO label name. If not present the node name is use=
d.
> > + Only one of gpio-hog and gpio-initval may be specified.
>=20
> This is confusing. Instead write: "The two following options are
> mutually exclusive. One of them must be specified, but not both."
>=20
> > +- gpio-hog:   A property specifying that this child node represent a G=
PIO hog.
> > +- gpio-initval: This GPIO should be initialized to the specified confi=
guration.
>=20
> > + Only one of input, output-low and output-high may be specified:
>=20
> Insert "Of the following arguments, only one..." (etc)

Okay, thanks. Will change these.

>=20
> >  - input:      A property specifying to set the GPIO direction as input.
> >  - output-low  A property specifying to set the GPIO direction as outpu=
t with
> >               the value low.
> >  - output-high A property specifying to set the GPIO direction as outpu=
t with
> >               the value high.
> >
> > -Optional properties:
> > -- line-name:  The GPIO label name. If not present the node name is use=
d.
> > -
> >  Example of two SOC GPIO banks defined as gpio-controller nodes:
>=20
> (...)
> > --- a/drivers/gpio/gpiolib-of.c
> > +++ b/drivers/gpio/gpiolib-of.c
> > @@ -234,6 +234,15 @@ static void of_gpiochip_scan_gpios(struct gpio_chi=
p *chip)
> >
> >                         if (gpiod_hog(desc, lflags, dflags))
> >                                 continue;
> > +               } else if (of_property_read_bool(np, "gpio-initval")) {
> > +                       if (!dflags) {
> > +                               dev_warn(chip->dev, "GPIO line %d (%s):=
 no initialization state specified, bailing out\n",
> > +                                        desc_to_gpio(desc), np->name);
> > +                               continue;
> > +                       }
> > +
> > +                       if (gpiod_initialize(desc, lflags, dflags))
> > +                               continue;
>=20
> We usually do not mix implementations and bindings but it's OK with me.
>=20
> >                 }
>=20
> You need a terminating  else {} - clause to warn if neither of gpio-hog
> or gpio-initval is specified.

The idea was to have three cases:

1) Just give the gpio a name (desc->name). No hogging or initialization.
2) gpio-hog to initialize and acquire the GPIO for the whole time the
gpiochip is present.
2) gpio-initval to initialize the GPIO to a given value (as gpio-hog
does) but releasing the GPIO afterwards.

>=20
> > -int gpiod_hog(struct gpio_desc *desc, unsigned long lflags,
> > -             enum gpiod_flags dflags)
> > +static int _gpiod_initialize(struct gpio_desc *desc, unsigned long lfl=
ags,
> > +                     enum gpiod_flags dflags)
>=20
> I don't like _underscore functions. Try to find a name that is descriptive
> and does not begin with underscore.
>=20
> What about just gpiod_init()?

Okay, will change.

>=20
> >         if (status < 0) {
> >                 pr_err("setup of hog GPIO %s (chip %s, offset %d) faile=
d\n",
> > -                      name, gpiod_to_chip(desc)->label, gpio_chip_hwgp=
io(desc));
> > +                      name, gpiod_to_chip(desc)->label,
> > +                      gpio_chip_hwgpio(desc));
>=20
> Looks like a random, unrelated code reshuffling. Don't do this.

Right, will remove that.

>=20
> Yours,
> Linus Walleij
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--mW9eGbZzDIYYWqGs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWA5zFAAoJEEpcgKtcEGQQkFMP/0J16hFIZTsCIm/V1Wa9feh3
knWMHwSFTJeT844z0ddtBT4tF8EaknDCyodohUdXJ7Qm/rJz/nq7ZaNJAsPWbRmR
vdrVHTq8zsbiIxJ5P1PTYb0sCl/l2zzR/3dRst6m/Hk7vHOTL2VBP+vTR0g7OIJ3
CgiN3MMJdJvDbZqM0zg+338AYKaGjhfNKYNK24o38yKedl97PdVDkCvZPbItBSVM
Ef1u/GG7NBiAE4zmqhyCgXrgEJRYHnwa5eigsgRzgElORGo3A79Pd0TjLPL+l8hw
Ssv/OgsA/3EtQ/NmCQXRfnwFawJUUF8+Ede6Ew6cXzEC3l+CfQdNG/6+zuSDPzZV
VVVQYjMt/yjw0xdgLpF+F+xjxbKuu5WGZ1FHyBU3Nb7C52WZ8Av2bDeJfb/VgILv
KA+UT9QiAcwn/TVo01wRXEL0Vx03+TiqwV32UeTJNCcQlsXv8LYVrIVEhL5jzhBe
Df4rT8jF80ITcs3t6nXZ49tNckzz2kkrxcE70oo9eE75lii4Lu1smpG5AgxNqFGI
XtyxwaH9tS6Oh7R3azpJFBc+XtaWq/lTHeDo5gXIgSg81d3dgxFbNMC8ACeMIBZd
i76rFbl0t8H/ODkU4PhInH1mfIb+keA1Fx6hqk6IupMJdneUN3PaN4uOclX7W6CV
ODVl/xho8SBZL5G5UT2m
=fzI/
-----END PGP SIGNATURE-----

--mW9eGbZzDIYYWqGs--
