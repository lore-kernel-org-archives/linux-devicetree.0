From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH v3] gpio: of: make it possible to name GPIO lines
Date: Thu, 28 Apr 2016 10:12:26 +0200
Message-ID: <1595634.pn7WvaDMTh@adelgunde>
References: <1461236901-28626-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart9200594.5CvlCET1oc"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1461236901-28626-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Lee Campbell <leecam@google.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, David Mandala <david.mandala@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--nextPart9200594.5CvlCET1oc
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

Hi Linus,

Thanks for creating this. Some minor comments inline.

On Thursday 21 April 2016 13:08:21 Linus Walleij wrote:
> Make it possible to name the producer side of a GPIO line using
> a "gpio-line-names" property array, modeled on the
> "clock-output-names" property from the clock bindings.
>=20
> This naming is especially useful for:
>=20
> - Debugging: lines are named after function, not just opaque
>   offset numbers.
>=20
> - Exploration: systems where some or all GPIO lines are available
>   to end users, such as prototyping, one-off's "makerspace usecases"
>   users are helped by the names of the GPIO lines when tinkering.
>   This usecase has been surfacing recently.
>=20
> The gpio-line-names attribute is completely optional.
>=20
> Example output from lsgpio on a patched Snowball tree:
>=20
> GPIO chip: gpiochip6, "8000e180.gpio", 32 GPIO lines
>         line  0: unnamed unused
>         line  1: "AP_GPIO161" "extkb3" [kernel]
>         line  2: "AP_GPIO162" "extkb4" [kernel]
>         line  3: "ACCELEROMETER_INT1_RDY" unused [kernel]
>         line  4: "ACCELEROMETER_INT2" unused
>         line  5: "MAG_DRDY" unused [kernel]
>         line  6: "GYRO_DRDY" unused [kernel]
>         line  7: "RSTn_MLC" unused
>         line  8: "RSTn_SLC" unused
>         line  9: "GYRO_INT" unused
>         line 10: "UART_WAKE" unused
>         line 11: "GBF_RESET" unused
>         line 12: unnamed unused
>=20
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Grant Likely <grant.likely@linaro.org>
> Cc: Amit Kucheria <amit.kucheria@linaro.org>
> Cc: David Mandala <david.mandala@linaro.org>
> Cc: Lee Campbell <leecam@google.com>
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Michael Welling <mwelling@ieee.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Swap "gpio-names" for "gpio-line-names" as "gpio-names" indicate
>   a consumer endpoint in DT terminology.
> - Index to either:
>   (A) The end of the gpio-names array or
>   (B) ngpios
>   So we don't risk going out of bounds on either
> ChangeLog v1->v2:
> - Make the naming function return void: we continue at all times
>   and always return 0 anyway.
> - Fix a return value check.
>=20
> This has been discussed at some length now.
>=20
> Why we are not using hogs: these are consumer side, not producer
> side. The gpio-controller in DT (gpio_chip in Linux) is a
> producer, not a consumer.
>=20
> This patch is not about assigning initial values to GPIO lines.
> That is an orthogonal usecase. This is just about naming lines.
> ---
>  Documentation/devicetree/bindings/gpio/gpio.txt | 19 +++++++++++
>  drivers/gpio/gpiolib-of.c                       | 43 +++++++++++++++=
++++++++++
>  2 files changed, 62 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Docume=
ntation/devicetree/bindings/gpio/gpio.txt
> index c88d2ccb05ca..68d28f62a6f4 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -152,6 +152,21 @@ additional bitmask is needed to specify which GP=
IOs are actually in use,
>  and which are dummies. The bindings for this case has not yet been
>  specified, but should be specified if/when such hardware appears.
> =20
> +Optionally, a GPIO controller may have a "gpio-line-names" property.=
 This is
> +an array of strings defining the names of the GPIO lines going out o=
f the
> +GPIO controller. This name should be the most meaningful producer na=
me
> +for the system, such as a rail name indicating the usage. Package na=
mes
> +such as pin name are discouraged: such lines have opaque names (sinc=
e they
> +are by definition generic purpose) and such names are usually not ve=
ry
> +helpful. For example "MMC-CD", "Red LED Vdd" and "ethernet reset" ar=
e
> +reasonable line names as they describe what the line is used for. "G=
PIO0"
> +is not a good name to give to a GPIO line. Placeholders are discoura=
ged:

"GPIO0" may not be a good name, but there are plenty of boards out ther=
e
that use just this line name in their schematic for GPIOs that are not
used otherwise. For example the riotboard has line-names "GPIO_1",
"GPIO4_31", "GPIO5_05", ...

> +rather use the "" (blank string) if the use of the GPIO line is unde=
fined
> +in your design. The names are assigned starting from line offset 0 f=
rom
> +left to right from the passed array. An incomplete array (where the =
number
> +of passed named are less than ngpios) will still be used up until th=
e last
> +provided valid line index.
> +
>  Example:
> =20
>  gpio-controller@00000000 {
> @@ -160,6 +175,10 @@ gpio-controller@00000000 {
>  =09gpio-controller;
>  =09#gpio-cells =3D <2>;
>  =09ngpios =3D <18>;
> +=09gpio-line-names =3D "MMC-CD", "MMC-WP", "VDD eth", "RST eth", "LE=
D R",
> +=09=09"LED G", "LED B", "Col A", "Col B", "Col C", "Col D",
> +=09=09"Row A", "Row B", "Row C", "Row D", "NMI button",
> +=09=09"poweroff", "reset";

As many GPIO controllers have something like 32 GPIO lines, it can be
difficult to read which GPIO number the line "reset" is on.
But I think you can get around that by writing one name per file-line o=
r
something similar. Also it should be immediately visible by listing all=

gpio names in the userspace.

>  }
> =20
>  The GPIO chip may contain GPIO hog definitions. GPIO hogging is a me=
chanism
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index d81dbd8e90d9..d43eaca803e3 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -196,6 +196,45 @@ static struct gpio_desc *of_parse_own_gpio(struc=
t device_node *np,
>  }
> =20
>  /**
> + * of_gpiochip_set_names() - set up the names of the lines
> + * @chip: GPIO chip whose lines should be named, if possible
> + */
> +static void of_gpiochip_set_names(struct gpio_chip *gc)
> +{
> +=09struct gpio_device *gdev =3D gc->gpiodev;
> +=09struct device_node *np =3D gc->of_node;
> +=09int i;
> +=09int nstrings;
> +
> +=09/* Do we even have the "gpio-line-names" property */
> +=09if (!of_property_read_bool(np, "gpio-line-names"))
> +=09=09return;
> +
> +=09nstrings =3D of_property_count_strings(np, "gpio-line-names");
> +=09/*
> +=09 * Make sure to not index beyond either the end of the
> +=09 * "gpio-names" array nor the number of descriptors of
> +=09 * the GPIO device.
> +=09 */
> +=09for (i =3D 0; i < nstrings && i < gdev->ngpio; i++) {
> +=09=09const char *name;
> +=09=09int ret;
> +
> +=09=09ret =3D of_property_read_string_index(np,
> +=09=09=09=09=09=09    "gpio-line-names",
> +=09=09=09=09=09=09    i,
> +=09=09=09=09=09=09    &name);
> +=09=09if (!ret)
> +=09=09=09gdev->descs[i].name =3D name;
> +
> +=09=09/* Empty strings are OK */
> +=09=09if (ret < 0 && ret !=3D -ENODATA)
> +=09=09=09dev_err(&gdev->dev, "unable to name line %d\n",
> +=09=09=09=09i);
> +=09}

Maybe a warning for nstrings > ngpio here?

Otherwise this looks good.

Best Regards,

Markus

=2D-=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |

--nextPart9200594.5CvlCET1oc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXIcXvAAoJEEpcgKtcEGQQUXMQALyPFHJ5WNUXETGkcV3BsnSw
hxPn3fkM1aE7fJJfa/1npymuzif+VHNxzFeWxo+Jrpcgn5dgTa1ZN9JA6eI9n+bn
xp3RG5jdG7XlRgtj9zajiRg8+HiTtp588tD3EZTo2Jvz471LgSMNgjDU9wXCi/Az
TRi08feOcHJce5YrVC8j0fPuKNiL5xWGi1qjNZxeSDRmDy01Tftw5K9dY1kHwRsR
NjJcnRjI2vHisfhFWlNto+G8NKxQWo2jTq2QiqmyZDdo3DhGo5kZsStkunu6x9Qy
h4VnT+zsnWUcxxZfDnEbQkBaVPN4thXPvE3ry9gGNgLHdWlh83TfqXhyB+V1E13A
FIGuTzU3sEwvo1U7fDeqgKhCraWK4hmUM0B51VUkUSEKl9I/UpI/qfaGXnDX7el/
zOC/JHUfwodyI3hoHt5ZU7t252F22Frxr6M+midImOhdmCSMLm37wQczxUNSJ1zO
RmYuSdLdxkNXLKxGeqy2V0vNQFx7QpsQUZ2c9/PJrEUksa+sRA3h21MlQgDqtKbK
Jf4ec+1uGywV2jJH9i6SgH6ICtShr8qwYJGlAmXZcCDi31rD83de2EyIMQhRISZm
iWRARTCVUna6KoturVjXfSu8aePe31ZxR6TN+kOAQoG4abxXi5ZeI6+mApvklDPe
trPWbls+k2eFzhvIVCDe
=QRS7
-----END PGP SIGNATURE-----

--nextPart9200594.5CvlCET1oc--

