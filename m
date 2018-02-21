Return-Path: <SRS0=hOvY=FP=ucw.cz=pavel@kernel.org>
Date: Wed, 21 Feb 2018 13:22:26 +0100
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/2] leds: add Panasonic AN30259A support
Message-ID: <20180221071455.GA25848@amd>
References: <20180220005446.8577-1-simon@lineageos.org>
 <20180220005446.8577-3-simon@lineageos.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="c3bfwLpm8qysLVxt"
Content-Disposition: inline
In-Reply-To: <20180220005446.8577-3-simon@lineageos.org>
To: Simon Shields <simon@lineageos.org>
Cc: linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>


--c3bfwLpm8qysLVxt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 3e763d2a0cb3..80bed557cc6b 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -57,6 +57,16 @@ config LEDS_AAT1290
>  	depends on PINCTRL
>  	help
>  	 This option enables support for the LEDs on the AAT1290.
> +
> +config LEDS_AN30259A
> +    tristate "LED support for Panasonic AN30259A"
> +    depends on OF
> +    depends on I2C
> +    depends on LEDS_CLASS
> +    help
> +     This option enables support for the AN30259A 3-channel
> +     LED driver.

Something funny goes on with the indentation here. And normally we'd
do depends on A && B && ... and have note how the module will be
called.


> +++ b/drivers/leds/leds-an30259a.c
> @@ -0,0 +1,338 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/i2c.h>

This would be suitable place for author name, and very short hw
description. http link for datasheet would be preffered here over the
dts binding.

> +		duty_max =3D an30259a_get_duty_max(brightness & 0xff);
> +		ret =3D regmap_write(led->chip->regmap,
> +				REG_LEDCNT1(led->num),
> +				LED_DUTYMAX(duty_max) | LED_DUTYMID(duty_max));
> +		if (ret)
> +			return ret;
> +		break;
> +	}
> +	ret =3D regmap_write(led->chip->regmap, REG_LEDON,
> +				ledon);

You can fit this on one line.

> +		chip->leds[i].cdev.brightness_set_blocking =3D an30259a_led_set;
> +		chip->leds[i].cdev.blink_set =3D an30259a_blink_set;
> +
> +		err =3D led_classdev_register(&client->dev, &chip->leds[i].cdev);
> +		if (err < 0)
> +			goto exit;
> +	}

Do ve have devm version of led class register?

> +static int an30259a_remove(struct i2c_client *client)
> +{
> +	struct an30259a *chip =3D i2c_get_clientdata(client);
> +	int i;
> +
> +	for (i =3D 0; i < MAX_LEDS; i++)
> +		led_classdev_unregister(&chip->leds[i].cdev);

You always unregister 3 leds; what if only 1 is described in the
device tree?

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--c3bfwLpm8qysLVxt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlqNZIIACgkQMOfwapXb+vL9ywCePtBOb2S02kYJEcyNLDmwuAro
dlQAmwRIHxm1uuwwdZFk2+qB7siv85Px
=pKSJ
-----END PGP SIGNATURE-----

--c3bfwLpm8qysLVxt--
