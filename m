From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 3/7] mfd: add support for sun6i PRCM
 (Power/Reset/Clock Management) unit
Date: Thu, 8 May 2014 12:02:05 +0100
Message-ID: <20140508110205.GB5767@lee--X1>
References: <1399483554-8824-1-git-send-email-boris.brezillon@free-electrons.com>
 <1399483554-8824-4-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1399483554-8824-4-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-doc-owner@vger.kernel.org
To: Boris BREZILLON <boris.brezillon@free-electrons.com>
Cc: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Philipp Zabel <p.zabel@pengutronix.de>, Shuge <shuge@allwinnertech.com>, kevin@allwinnertech.com, Hans de Goede <hdegoede@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dev@linux-sunxi.org
List-Id: devicetree@vger.kernel.org

> The PRCM (Power/Reset/Clock Management) block exposes several subdevi=
ces
> in different subsystems (clk, reset ...)
>=20
> Add basic support for the PRCM unit with clk (AR100, AHB0, and APB0 c=
lks)
> and reset controller subdevices.
>=20
> Other subdevices might be added later (if needed).
>=20
> Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
> ---
>  drivers/mfd/Kconfig      |   8 +++
>  drivers/mfd/Makefile     |   1 +
>  drivers/mfd/sun6i-prcm.c | 151 +++++++++++++++++++++++++++++++++++++=
++++++++++
>  3 files changed, 160 insertions(+)
>  create mode 100644 drivers/mfd/sun6i-prcm.c

[...]

> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/errno.h>
> +#include <linux/err.h>
> +#include <linux/spinlock.h>
> +#include <linux/io.h>
> +#include <linux/slab.h>
> +#include <linux/mutex.h>
> +#include <linux/completion.h>
> +#include <linux/irq.h>
> +#include <linux/jiffies.h>
> +#include <linux/bitops.h>
> +#include <linux/fs.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/uaccess.h>
> +#include <linux/mfd/core.h>

I'm pretty sure you don't need half of these.  Please only add the
ones you make use of.

[...]

> +	dev_info(&pdev->dev, "PRCM initialized\n");

Please remove this from here.

[...]

> +static struct platform_driver sun6i_prcm_driver =3D {
> +	.driver =3D {
> +		.name =3D "sun6i-prcm",
> +		.owner =3D THIS_MODULE,
> +		.of_match_table =3D sun6i_prcm_dt_ids,
> +	},
> +	.probe =3D sun6i_prcm_probe,

You need a .remove() call-back.

> +};
> +module_platform_driver(sun6i_prcm_driver);
> +
> +MODULE_AUTHOR("Boris BREZILLON <boris.brezillon@free-electrons.com>"=
);
> +MODULE_DESCRIPTION("Allwinner sun6i PRCM driver");
> +MODULE_LICENSE("GPL v2");

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
