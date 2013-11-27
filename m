From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/2] regulator: max14577: Add regulator driver for
 Maxim 14577
Date: Wed, 27 Nov 2013 13:59:47 +0000
Message-ID: <20131127135947.GL3296@lee--X1>
References: <1385559982-32039-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385559982-32039-1-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 27 Nov 2013, Krzysztof Kozlowski wrote:

> MAX14577 chip is a multi-function device which includes MUIC,
> charger and voltage regulator. The driver is located in drivers/mfd.
>=20
> This patch adds regulator driver for MAX14577 chip. There are two
> regulators in this chip:
> 1. Safeout LDO with constant voltage output of 4.9V. It can be only
>    enabled or disabled.
> 2. Current regulator for the charger. It provides current from 90mA u=
p
>    to 950mA.
> Driver supports Device Tree.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/mfd/max14577.c       |   13 +-
>  drivers/regulator/Kconfig    |    7 ++
>  drivers/regulator/Makefile   |    1 +
>  drivers/regulator/max14577.c |  269 ++++++++++++++++++++++++++++++++=
++++++++++
>  4 files changed, 287 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/regulator/max14577.c
>=20
> diff --git a/drivers/mfd/max14577.c b/drivers/mfd/max14577.c
> index 94b766d..9af46c2 100644
> --- a/drivers/mfd/max14577.c
> +++ b/drivers/mfd/max14577.c
> @@ -25,9 +25,16 @@
>  #include <linux/mfd/max14577-private.h>
> =20
>  static struct mfd_cell max14577_devs[] =3D {
> -	{ .name =3D "max14577-muic", },
> -	{ .name =3D "max14577-regulator", },
> -	{ .name =3D "max14577-charger", },
> +	{
> +		.name =3D "max14577-muic",
> +	},
> +	{
> +		.name =3D "max14577-regulator",
> +		.of_compatible =3D "maxim,max14577-regulator",
> +	},
> +	{
> +		.name =3D "max14577-charger",
> +	},
>  };

Still it still part of the regulator patch.

Can you pull the code above into a separate patch please?

Also, there's no requirement to open out all of the one liners, just
the entry where you're using two properties.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
