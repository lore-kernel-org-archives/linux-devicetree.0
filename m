From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v2 3/4] clk: Provide an always-on clock domain framework
Date: Mon, 23 Feb 2015 09:23:44 -0800
Message-ID: <20150223172344.421.62815@quantum>
References: <1424276101-30137-1-git-send-email-lee.jones@linaro.org>
 <1424276101-30137-4-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424276101-30137-4-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: lee.jones@linaro.org, kernel@stlinux.com, sboyd@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Lee Jones (2015-02-18 08:15:00)
> Much h/w contain clocks which if turned off would prove fatal.  The
> only way to recover is to restart the board(s).  This driver takes
> references to clocks which are required to be always-on in order to
> prevent the common clk framework from trying to turn them off during
> the clk_disabled_unused() procedure.
>=20
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/clk/Makefile    |  1 +
>  drivers/clk/clkdomain.c | 63 +++++++++++++++++++++++++++++++++++++++=
++++++++++
>  2 files changed, 64 insertions(+)
>  create mode 100644 drivers/clk/clkdomain.c
>=20
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index d5fba5b..d9e2718 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -3,6 +3,7 @@ obj-$(CONFIG_HAVE_CLK)          +=3D clk-devres.o
>  obj-$(CONFIG_CLKDEV_LOOKUP)    +=3D clkdev.o
>  obj-$(CONFIG_COMMON_CLK)       +=3D clk.o
>  obj-$(CONFIG_COMMON_CLK)       +=3D clk-divider.o
> +obj-$(CONFIG_COMMON_CLK)       +=3D clkdomain.o
>  obj-$(CONFIG_COMMON_CLK)       +=3D clk-fixed-factor.o
>  obj-$(CONFIG_COMMON_CLK)       +=3D clk-fixed-rate.o
>  obj-$(CONFIG_COMMON_CLK)       +=3D clk-gate.o
> diff --git a/drivers/clk/clkdomain.c b/drivers/clk/clkdomain.c
> new file mode 100644
> index 0000000..8c83f99
> --- /dev/null
> +++ b/drivers/clk/clkdomain.c

Naming is hard. I'm not sure clkdomain.c is the best expression. Maybe
clk-alwon.c? I see ALWON used alot amongst hardware people who live in =
a
world of eight-character naming limitations.

> @@ -0,0 +1,63 @@
> +/*
> + * ST Clock Domain
> + *
> + * Copyright (C) 2015 STMicroelectronics =E2=80=93 All Rights Reserv=
ed
> + *
> + * Author: Lee Jones <lee.jones@linaro.org>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <linux/clk-private.h>

If this header still existed I would berate you mercilessly. Luckily fo=
r
you it no longer exists and only causes a compile error ;-)

> +#include <linux/clk-provider.h>
> +#include <linux/of_address.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +static void ao_clock_domain_hog_clock(struct platform_device *pdev, =
int index)
> +{
> +       struct device_node *np =3D pdev->dev.of_node;
> +       struct clk *clk;
> +       int ret;
> +
> +       clk =3D of_clk_get(np, index);
> +       if (IS_ERR(clk)) {
> +               dev_warn(&pdev->dev, "Failed get clock %s[%d]: %li\n"=
,
> +                        np->full_name, index, PTR_ERR(clk));
> +               return;
> +       }
> +
> +       ret =3D clk_prepare_enable(clk);
> +       if (ret)
> +               dev_warn(&pdev->dev, "Failed to enable clock: %s\n", =
clk->name);
> +}
> +
> +static int ao_clock_domain_probe(struct platform_device *pdev)
> +{
> +       struct device_node *np =3D pdev->dev.of_node;
> +       int nclks, i;
> +
> +       nclks =3D of_count_phandle_with_args(np, "clocks", "#clock-ce=
lls");

Minor nitpick: please use of_clk_get_parent_count. I spent a solid 5
minutes writing that function and I need people to use it so I can get =
a
return on my investment.

Otherwise the patch looks good. I believe that this method is targeting
always-on clock in a production environment, which is different from th=
e
CLK_IGNORE_UNUSED stuff which typically is helpful while bringing up ne=
w
hardware or dealing with a platform that has incomplete driver support.

I wonder if there is a clever way for existing clock providers
(expressed in DT) to use this without having to create a separate node
of clocks with the "always-on-clk-domain" flag. Possibly the common
clock binding could declare some always-on flag that is standardized?
Then the framework core could use this code easily. Not sure if that is
a good idea though...

Regards,
Mike

> +
> +       for (i =3D 0; i < nclks; i++)
> +               ao_clock_domain_hog_clock(pdev, i);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id ao_clock_domain_match[] =3D {
> +       { .compatible =3D "always-on-clk-domain" },
> +       { },
> +};
> +
> +static struct platform_driver ao_clock_domain_driver =3D {
> +       .probe =3D ao_clock_domain_probe,
> +       .driver =3D {
> +               .name =3D "always-on-clk-domain",
> +               .of_match_table =3D ao_clock_domain_match,
> +       },
> +};
> +module_platform_driver(ao_clock_domain_driver);
> --=20
> 1.9.1
>=20
