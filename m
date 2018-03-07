Return-Path: <SRS0=BMvq=F5=ucw.cz=pavel@kernel.org>
Date: Wed, 7 Mar 2018 23:07:25 +0100
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 2/2] leds: add Panasonic AN30259A support
Message-ID: <20180307220725.GC10438@amd>
References: <20180307004722.23524-1-simon@lineageos.org>
 <20180307004722.23524-3-simon@lineageos.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8X7/QrJGcKSMr1RN"
Content-Disposition: inline
In-Reply-To: <20180307004722.23524-3-simon@lineageos.org>
To: Simon Shields <simon@lineageos.org>
Cc: linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>


--8X7/QrJGcKSMr1RN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The datasheet is freely available:
> https://www.alliedelec.com/m/d/a9d2b3ee87c2d1a535a41dd747b1c247.pdf

> +	  To compile this driver as a module, choose M here: the module
> +	  will be called leds-an30259a.

leds-an30259a.ko?

> @@ -0,0 +1,382 @@
> +// SPDX-License-Identifier: GPL-2.0

I'd prefer 2.0+, but... your choice.

> +/*
> + * Driver for Panasonic AN30259A 3-channel LED driver
> + *
> + * Copyright (c) 2018 Simon Shields <simon@lineageos.org>
> + *
> + * Datasheet:
> + * https://www.alliedelec.com/m/d/a9d2b3ee87c2d1a535a41dd747b1c247.pdf
> + */
> +#include <linux/i2c.h>
> +#include <linux/leds.h>

I'd do empty line after the comment.

> +static u8 an30259a_get_dutymax(u8 brightness)
> +{
> +	u8 duty_max, floor, ceil;
> +
> +	/* squash 8 bit number into 7-bit PWM range */
> +	duty_max =3D brightness >> 1;

We should really start using max_brightness, so that userspace knows
what=20

> +	/* bottom 3 bits are always set for DUTYMAX
> +	 * figure out the closest value
> +	 */

/*
 * Multiline comments like this.
 */

> +	/* slope time controls on/off cycle length */
> +	ret =3D regmap_write(led->chip->regmap, REG_SLOPE(num),
> +			   LED_SLOPETIME1(off) | LED_SLOPETIME2(on));
> +	if (ret)
> +		return ret;
> +
> +	/* Finally, enable slope mode. */

And yes, having sentences in all the comments would be nice. Or maybe
nowhere. But consistent ;-).

Since all I'm commenting is whitespace...

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--8X7/QrJGcKSMr1RN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlqgYp0ACgkQMOfwapXb+vJF1wCeNrHs6wgH0ZvkyW5+M8plPMOK
oW0AnRvpIhRv8kMBiOJPBiZNNfcXMyyu
=vVw+
-----END PGP SIGNATURE-----

--8X7/QrJGcKSMr1RN--
