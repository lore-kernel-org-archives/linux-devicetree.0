From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH v3 2/2] gpiolib: Add GPIO initialization
Date: Tue, 17 Nov 2015 11:21:32 +0100
Message-ID: <33694835.x5uTstGuv8@adelgunde>
References: <1447754878-21099-1-git-send-email-mpa@pengutronix.de> <1447754878-21099-3-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3738292.jKVHM1jLed"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1447754878-21099-3-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org


--nextPart3738292.jKVHM1jLed
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

Hi,

On Tuesday 17 November 2015 11:07:58 Markus Pargmann wrote:
[...]
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index a18f00fc1bb8..3b35f2fafeb2 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2329,6 +2329,30 @@ static void gpiochip_free_hogs(struct gpio_chi=
p *chip)
>  }
> =20
>  /**
> + * gpiod_initialize - Initialize a GPIO with a given value
> + * @desc:=09gpio whose value will be assigned
> + * @lflags:=09gpio_lookup_flags - returned from of_find_gpio() or
> + *=09=09of_get_gpio_hog()
> + * @dflags:=09gpiod_flags - optional GPIO initialization flags
> + *
> + * This is used to initialize GPIOs that were defined in DT
> + */
> +int gpiod_initialize(struct gpio_desc *desc, unsigned long lflags,
> +=09=09     enum gpiod_flags dflags)
> +{
> +=09int status;
> +

Sorry, this is missing a gpiod_parse_flags(). Will fix this and resend =
tomorrow.

Best Regards,

Markus

> +=09status =3D gpiod_configure_flags(desc, NULL, dflags);
> +=09if (status < 0) {
> +=09=09pr_err("initial setup of GPIO (chip %s, offset %d) failed\n",
> +=09=09       gpiod_to_chip(desc)->label, gpio_chip_hwgpio(desc));
> +=09=09return status;
> +=09}
> +
> +=09return 0;
> +}
> +
> +/**
>   * gpiod_get_array - obtain multiple GPIOs from a multi-index GPIO f=
unction
>   * @dev:=09GPIO consumer, can be NULL for system-global GPIOs
>   * @con_id:=09function within the GPIO consumer
> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> index 98ab08c0aa2d..4abf53a5e651 100644
> --- a/drivers/gpio/gpiolib.h
> +++ b/drivers/gpio/gpiolib.h
> @@ -107,6 +107,8 @@ int gpiod_request(struct gpio_desc *desc, const c=
har *label);
>  void gpiod_free(struct gpio_desc *desc);
>  int gpiod_hog(struct gpio_desc *desc, const char *name,
>  =09=09unsigned long lflags, enum gpiod_flags dflags);
> +int gpiod_initialize(struct gpio_desc *desc, unsigned long lflags,
> +=09=09     enum gpiod_flags dflags);
> =20
>  /*
>   * Return the GPIO number of the passed descriptor relative to its c=
hip
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

--nextPart3738292.jKVHM1jLed
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWSv+sAAoJEEpcgKtcEGQQ3lAQAJifXF2aOcgytWM1L+LGOuSK
ShCRhYpNubmrErPDFPJpX5H9tJcAsvHDGo1rlOGt1GZXhYHchNflduvp/+Kuusto
945Ljk6nzWXvFhb4MFA3gTKD3xkQcA+wHPs8gUBN4uR9xxHn6g+rBo21Hj0DSlcl
MBr59TR/u4R6woT1Gto1wmm3t9LF5gtd6oKT1cbzo8tMBThcwsnIhBl6yWIFuAvq
P3XPDykz14TreVLUZF4Zy6VRijGOy+snc8B7e9eU7tn6RO/4UUPEzyBNhjHHZ3uC
+VDMLBnjrQHQ7Ths5/TLNW7PHnB/cy/EU9FhFKnonzkrN6e96SYg6V5KZgDmrSJM
4SAa+D16hyQw8Vk1I08CiUpptw+bepEzRszu86Oum9KPWCrDpOqiBY4SpTdFj/UG
4Qb8Bb4TFaCIS0rvl+NeYhcPX3EdCYxYIhVIx7eW2HZpE/b0YRuHvhey/gnwMjFo
77yE0i+oWGCRJXczizl+7sA0K+Vu0FVaZeMGOdojdDgU0mdtlK2U1x0VLdL7/HFg
UY+/RDQhJv4FFmSnWCCV45cP9ZMGXX+U9P4IKGu8XwVuOYNp+Bce6OPccliSxGPj
6SVn55akymMFgrILG3XAGRGj+TENlVABZcfjWxsqI0mXtS/3dryRQkmMS/Adxn/q
sTLkSRButFgrNdarmJgf
=AAj/
-----END PGP SIGNATURE-----

--nextPart3738292.jKVHM1jLed--

