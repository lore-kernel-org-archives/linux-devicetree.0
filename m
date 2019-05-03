From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 7/7] iio: adc: sun4i-gpadc-iio convert to SPDX license
 tags
Date: Fri, 3 May 2019 11:18:35 +0200
Message-ID: <20190503091835.jx2fosyygkhy67aw@flea>
References: <20190503072813.2719-1-tiny.windzz@gmail.com>
 <20190503072813.2719-8-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ddeoccdv6vp3wp6d"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190503072813.2719-8-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>
Cc: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--ddeoccdv6vp3wp6d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 03, 2019 at 03:28:13AM -0400, Yangtao Li wrote:
> Updates license to use SPDX-License-Identifier.
>
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/iio/adc/sun4i-gpadc-iio.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
> index 9b6fc592f54c..cf2bf3ab3342 100644
> --- a/drivers/iio/adc/sun4i-gpadc-iio.c
> +++ b/drivers/iio/adc/sun4i-gpadc-iio.c
> @@ -1,11 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0+
>  /* ADC driver for sunxi platforms' (A10, A13 and A31) GPADC
>   *
>   * Copyright (c) 2016 Quentin Schulz <quentin.schulz@free-electrons.com>
>   *
> - * This program is free software; you can redistribute it and/or modify it under
> - * the terms of the GNU General Public License version 2 as published by the
> - * Free Software Foundation.
> - *

The license here is GPL2 only, not GPL2 or later.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ddeoccdv6vp3wp6d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXMwHawAKCRDj7w1vZxhR
xR/3AP9LxurFTEoLfKKf5UUVWYtYBc+a5fX72/5UF72Jinp4/gEAjdVi2+M2F4Tw
jC8P95k9Tn48jKQZ3GKADIypTMkcMQ8=
=LsGW
-----END PGP SIGNATURE-----

--ddeoccdv6vp3wp6d--
