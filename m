From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 4/4] gpio: Add parsing of DT GPIO line-names
Date: Wed, 24 Feb 2016 08:03:09 +0100
Message-ID: <4005432.tnZmp1QKdV@adelgunde>
References: <1456214089-13954-1-git-send-email-mpa@pengutronix.de> <1456214089-13954-4-git-send-email-mpa@pengutronix.de> <CACRpkdb3gEZt5-25mi5pPvDePzLzNHfFRpjKMOW_-WfcBBLtUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3344746.XlzoLCETQz"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb3gEZt5-25mi5pPvDePzLzNHfFRpjKMOW_-WfcBBLtUQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--nextPart3344746.XlzoLCETQz
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Tuesday, February 23, 2016 02:36:42 PM Linus Walleij wrote:
> On Tue, Feb 23, 2016 at 8:54 AM, Markus Pargmann <mpa@pengutronix.de>=
 wrote:
>=20
> > This patch reuses the DT bindings that are already in place for the=

> > gpio-hogging mechanism. These bindings define line-name properties =
for
> > GPIOs inside the gpio-chip device node.
> >
> > of_parse_own_gpio() now sets the gpio descriptor name using the new=
ly
> > introduced gpiod_set_name(). It checks for name collisions within a=
 GPIO
> > chip to avoid GPIOs with the same name that are exported over the s=
ame
> > GPIO character device.
> >
> > The GPIO flags that describe the GPIO state are not required anymor=
e in
> > general but are checked if the gpio-hog property was found.
> >
> > This can be used to use the line names from the schematic. Example =
of lsgpio on
> > a modified i.MX6s Riotboard:
> >
> >         GPIO chip: gpiochip0, "209c000.gpio", 32 GPIO lines
> >                 line 0: unnamed unlabeled
> >                 line 1: unnamed unlabeled
> >                 line 2: SD2_WP "wp" [kernel output open-drain]
> >                 line 3: GPIO_3_CLK unlabeled
> >                 line 4: SD2_CD "cd" [kernel output open-drain]
> >                 ...
> >
> > The modified DT:
> >          &gpio1 {
> >                 sd2_wp {
> >                         gpios =3D <2 0>;
> >                         line-name =3D "SD2_WP";
> >                 };
> >
> >                 gpio_3_clk {
> >                         gpios =3D <3 0>;
> >                         line-name =3D "GPIO_3_CLK";
> >                 };
> >
> >                 sd2_cd {
> >                         gpios =3D <4 0>;
> >                         line-name =3D "SD2_CD";
> >                 };
> >         };
> >
> > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
>=20
> NICE! And this is what I want too.
>=20
> We need to remove some rough edges:
>=20
> > +static struct gpio_desc *gpiodev_find_gpiod_by_name(struct gpio_de=
vice *gdev,
> > +                                                   const char *nam=
e)
> > +{
> > +       int i;
> > +
> > +       for (i =3D 0; i !=3D gdev->ngpio; ++i) {
> > +               struct gpio_desc *desc =3D &gdev->descs[i];
> > +
> > +               if (desc->name && !strcmp(desc->name, name))
> > +                       return desc;
> > +       }
> > +
> > +       return NULL;
> > +}
>=20
> We already have gpio_name_to_desc() which does something
> similar but across all chips.
>=20
> Can we break out one gpiodev_name_to_desc() like
> yours, and refactor gpio_name_to_desc() to just call
> that for each chip?

Yes, that sounds good.

Thanks,

Markus

>=20
> > +/**
> > + * gpid_set_name() - sets the name of a gpio descriptor
>=20
> Missing "o" in gpid_
>=20
> > + * @desc: the gpio descriptor
> > + * @name: the name pointer that is assigned. It is internally not =
copied.
> > + *
> > + * This function sets a new name for the GPIO. It checks for colli=
sions with
> > + * other GPIOs with the same name within the gpio chip. It returns=
 0 on success
> > + * or -EEXIST if the name is already used within the GPIO chip.
> > + */
> > +int gpiod_set_name(struct gpio_desc *desc, const char *name)
> > +{
> > +       struct gpio_desc *coll =3D gpiodev_find_gpiod_by_name(desc-=
>gdev, name);
> > +
> > +       if (coll)
> > +               return -EEXIST;
> > +
> > +       desc->name =3D name;
> > +
> > +       return 0;
> > +}
>=20
> Otherwise I'm OK with this.
>=20
> Yours,
> Linus Walleij
>=20

=2D-=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |

--nextPart3344746.XlzoLCETQz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWzVWtAAoJEEpcgKtcEGQQSWYQAJCPpqYvsJJmMuxv9oBqEiAL
z74Q4e0EzJjmVXZkQ9S+pcypbNOSfftmlKbYwRd2E3GLMzIRdIZ9JulYDLdJOExK
R5e/iV1/jdRlzsAuafFRPyrJ3f4dVhVXxUvccIUKaILkPP6SQehDEQ1FMJSJFt3Q
9d3KznxMU1RDt6jpG+JzTr9cLLMz0S5M6eiXGaPZu9AaXyXjVPdPoFglJi3HTFO0
KHAKduuDTfEmJjlqFwBDMNYKRLpG43WxnFLI5KSNg0ThtaE49bMAqtqpxoavM7zD
rpVQX8YoDiYk9xDlofuqBrABJdjyq5HiLF04YxcUkl/80RiWKgQrHcbRNbcZ3mAz
12uns6ASS2+QkLKaOY9qzA6AMsCkPpdthiOL15dlwXcPhIv3Qb8XKSHYweA+7niC
TJZAYoTxsuvYXqDb+ihrCCzhuVro1wx3g0bg7/JaYN7HEkAaLC/djErrWZ+BsGif
0EqQc3/vueyIlksZN9jI+eGMks/BW0InAbgccYgtF+5bY54hnSlA6ZMdrzsyH/eU
BkYiajPl5WaaO6NfUVZLIsBkuQPkjLg8uxT0rtJsCREHxxZZGOcy1N/WEaB8/eLG
dVaxY9CymcfGpglr9IGYakM0JBgve1yTzulhF5JlBHUwGpFwcmaXq46aNgHKBNiA
0EXGgOm9gYZoK7Zw6TV7
=o0pX
-----END PGP SIGNATURE-----

--nextPart3344746.XlzoLCETQz--

