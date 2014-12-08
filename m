From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/8] mfd: MT6397: Add support for PMIC MT6397 MFD
Date: Mon, 8 Dec 2014 08:46:29 +0000
Message-ID: <20141208084629.GB3951@x1>
References: <1417752479-4749-1-git-send-email-flora.fu@mediatek.com>
 <1417752479-4749-3-git-send-email-flora.fu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1417752479-4749-3-git-send-email-flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Dongdong Cheng <dongdong.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, HenryC Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Menghui Lin <menghui.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 05 Dec 2014, Flora Fu wrote:

> Add core files for MT6397 MFD driver.
>=20
> Signed-off-by: Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/mfd/Kconfig                  |  10 +
>  drivers/mfd/Makefile                 |   1 +
>  drivers/mfd/mt6397-core.c            |  87 +++++++++
>  include/linux/mfd/mt6397/core.h      |  23 +++
>  include/linux/mfd/mt6397/registers.h | 362 +++++++++++++++++++++++++=
++++++++++
>  5 files changed, 483 insertions(+)
>  create mode 100644 drivers/mfd/mt6397-core.c
>  create mode 100644 include/linux/mfd/mt6397/core.h
>  create mode 100644 include/linux/mfd/mt6397/registers.h

[...]

> +++ b/drivers/mfd/mt6397-core.c
> @@ -0,0 +1,87 @@
> +/*
> + * Copyright (c) 2014 MediaTek Inc.
> + * Author: Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/mt6397/core.h>
> +#include <linux/soc/mediatek/mtk-pmic-wrap.h>
> +
> +static const struct mfd_cell mt6397_devs[] =3D {
> +	{ .name =3D "mt6397-rtc" },
> +	{
> +		.name =3D "mt6397-regulator",
> +		.of_compatible =3D "mediatek,mt6397-regulator",
> +	},
> +	{
> +		.name =3D "mt6397-codec",
> +		.of_compatible =3D "mediatek,mt6397-codec",
> +	},
> +};
> +
> +static int mt6397_probe(struct platform_device *pdev)
> +{
> +	u32 ret;
> +	struct mt6397_chip *mt6397;
> +	struct pmic_wrapper *wrp;
> +
> +	/* mt6397 MFD is child device of soc pmic wrapper. */
> +	if (!pdev->dev.parent)
> +		return -ENODEV;
> +
> +	wrp =3D dev_get_drvdata(pdev->dev.parent);

You're _still_ not checking the return value prior to dereferencing.

> +	mt6397 =3D devm_kzalloc(&pdev->dev, sizeof(*mt6397), GFP_KERNEL);
> +	if (!mt6397)
> +		return -ENOMEM;
> +
> +	mt6397->dev =3D &pdev->dev;
> +	mt6397->regmap =3D wrp->regmap;

> +	platform_set_drvdata(pdev, mt6397);
> +
> +	ret =3D mfd_add_devices(&pdev->dev, -1, &mt6397_devs[0],

Just mt6397_devs here.

> +			ARRAY_SIZE(mt6397_devs), NULL, 0, NULL);
> +	if (ret)
> +		dev_err(&pdev->dev, "failed to add child devices: %d\n", ret);

There is no point in printing ret.  The kernel will do that for you.

[...]

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
