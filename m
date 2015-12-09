From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH linux-next (v2) 3/3] mtd: brcmnand: Add support for the
 BCM6368
Date: Wed, 9 Dec 2015 13:04:54 -0800
Message-ID: <56689776.20107@gmail.com>
References: <566891DA.1050208@simon.arlott.org.uk>
 <5668928A.50601@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5668928A.50601-qdVf85lJwsCyrPCCpiK2c/XRex20P6io@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Kamal Dasu <kdasu.kdev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 09/12/2015 12:43, Simon Arlott a =C3=A9crit :
> The BCM6368 has a NAND interrupt register with combined status and en=
able
> registers.
>=20
> As the BCM6328, BCM6362 and BCM6368 all use v2.1 controllers, the fir=
st
> variant that will work with this driver is the BCM63268 using a v4.0
> controller.
>=20
> Set up the device by disabling and acking all interrupts, then handle
> the CTRL_READY interrupt.
>=20
> Signed-off-by: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>

Reviewed-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> ---
> Changed "nand-intr-base" reg name to "nand-int-base".
>=20
>  drivers/mtd/nand/brcmnand/Makefile       |   1 +
>  drivers/mtd/nand/brcmnand/bcm6368_nand.c | 145 +++++++++++++++++++++=
++++++++++
>  2 files changed, 146 insertions(+)
>  create mode 100644 drivers/mtd/nand/brcmnand/bcm6368_nand.c
>=20
> diff --git a/drivers/mtd/nand/brcmnand/Makefile b/drivers/mtd/nand/br=
cmnand/Makefile
> index 3b1fbfd..b28ffb59 100644
> --- a/drivers/mtd/nand/brcmnand/Makefile
> +++ b/drivers/mtd/nand/brcmnand/Makefile
> @@ -2,5 +2,6 @@
>  # more specific iproc_nand.o, for instance
>  obj-$(CONFIG_MTD_NAND_BRCMNAND)		+=3D iproc_nand.o
>  obj-$(CONFIG_MTD_NAND_BRCMNAND)		+=3D bcm63138_nand.o
> +obj-$(CONFIG_MTD_NAND_BRCMNAND)		+=3D bcm6368_nand.o
>  obj-$(CONFIG_MTD_NAND_BRCMNAND)		+=3D brcmstb_nand.o
>  obj-$(CONFIG_MTD_NAND_BRCMNAND)		+=3D brcmnand.o
> diff --git a/drivers/mtd/nand/brcmnand/bcm6368_nand.c b/drivers/mtd/n=
and/brcmnand/bcm6368_nand.c
> new file mode 100644
> index 0000000..7f5359b
> --- /dev/null
> +++ b/drivers/mtd/nand/brcmnand/bcm6368_nand.c
> @@ -0,0 +1,145 @@
> +/*
> + * Copyright 2015 Simon Arlott
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + *
> + * Derived from bcm63138_nand.c:
> + * Copyright =C2=A9 2015 Broadcom Corporation
> + *
> + * Derived from bcm963xx_4.12L.06B_consumer/shared/opensource/includ=
e/bcm963xx/63268_map_part.h:
> + * Copyright 2000-2010 Broadcom Corporation
> + *
> + * Derived from bcm963xx_4.12L.06B_consumer/shared/opensource/flash/=
nandflash.c:
> + * Copyright 2000-2010 Broadcom Corporation
> + */
> +
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/ioport.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include "brcmnand.h"
> +
> +struct bcm6368_nand_soc {
> +	struct brcmnand_soc soc;
> +	void __iomem *base;
> +};
> +
> +#define BCM6368_NAND_INT		0x00
> +#define  BCM6368_NAND_STATUS_SHIFT	0
> +#define  BCM6368_NAND_STATUS_MASK	(0xfff << BCM6368_NAND_STATUS_SHIF=
T)
> +#define  BCM6368_NAND_ENABLE_SHIFT	16
> +#define  BCM6368_NAND_ENABLE_MASK	(0xffff << BCM6368_NAND_ENABLE_SHI=
=46T)
> +#define BCM6368_NAND_BASE_ADDR0	0x04
> +#define BCM6368_NAND_BASE_ADDR1	0x0c
> +
> +enum {
> +	BCM6368_NP_READ		=3D BIT(0),
> +	BCM6368_BLOCK_ERASE	=3D BIT(1),
> +	BCM6368_COPY_BACK	=3D BIT(2),
> +	BCM6368_PAGE_PGM	=3D BIT(3),
> +	BCM6368_CTRL_READY	=3D BIT(4),
> +	BCM6368_DEV_RBPIN	=3D BIT(5),
> +	BCM6368_ECC_ERR_UNC	=3D BIT(6),
> +	BCM6368_ECC_ERR_CORR	=3D BIT(7),
> +};
> +
> +static bool bcm6368_nand_intc_ack(struct brcmnand_soc *soc)
> +{
> +	struct bcm6368_nand_soc *priv =3D
> +			container_of(soc, struct bcm6368_nand_soc, soc);
> +	void __iomem *mmio =3D priv->base + BCM6368_NAND_INT;
> +	u32 val =3D brcmnand_readl(mmio);
> +
> +	if (val & (BCM6368_CTRL_READY << BCM6368_NAND_STATUS_SHIFT)) {
> +		/* Ack interrupt */
> +		val &=3D ~BCM6368_NAND_STATUS_MASK;
> +		val |=3D BCM6368_CTRL_READY << BCM6368_NAND_STATUS_SHIFT;
> +		brcmnand_writel(val, mmio);
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static void bcm6368_nand_intc_set(struct brcmnand_soc *soc, bool en)
> +{
> +	struct bcm6368_nand_soc *priv =3D
> +			container_of(soc, struct bcm6368_nand_soc, soc);
> +	void __iomem *mmio =3D priv->base + BCM6368_NAND_INT;
> +	u32 val =3D brcmnand_readl(mmio);
> +
> +	/* Don't ack any interrupts */
> +	val &=3D ~BCM6368_NAND_STATUS_MASK;
> +
> +	if (en)
> +		val |=3D BCM6368_CTRL_READY << BCM6368_NAND_ENABLE_SHIFT;
> +	else
> +		val &=3D ~(BCM6368_CTRL_READY << BCM6368_NAND_ENABLE_SHIFT);
> +
> +	brcmnand_writel(val, mmio);
> +}
> +
> +static int bcm6368_nand_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct bcm6368_nand_soc *priv;
> +	struct brcmnand_soc *soc;
> +	struct resource *res;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +	soc =3D &priv->soc;
> +
> +	res =3D platform_get_resource_byname(pdev,
> +		IORESOURCE_MEM, "nand-int-base");
> +	if (!res)
> +		return -EINVAL;
> +
> +	priv->base =3D devm_ioremap_resource(dev, res);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	soc->ctlrdy_ack =3D bcm6368_nand_intc_ack;
> +	soc->ctlrdy_set_enabled =3D bcm6368_nand_intc_set;
> +
> +	/* Disable and ack all interrupts  */
> +	brcmnand_writel(0, priv->base + BCM6368_NAND_INT);
> +	brcmnand_writel(BCM6368_NAND_STATUS_MASK,
> +			priv->base + BCM6368_NAND_INT);
> +
> +	return brcmnand_probe(pdev, soc);
> +}
> +
> +static const struct of_device_id bcm6368_nand_of_match[] =3D {
> +	{ .compatible =3D "brcm,nand-bcm6368" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, bcm6368_nand_of_match);
> +
> +static struct platform_driver bcm6368_nand_driver =3D {
> +	.probe			=3D bcm6368_nand_probe,
> +	.remove			=3D brcmnand_remove,
> +	.driver =3D {
> +		.name		=3D "bcm6368_nand",
> +		.pm		=3D &brcmnand_pm_ops,
> +		.of_match_table	=3D bcm6368_nand_of_match,
> +	}
> +};
> +module_platform_driver(bcm6368_nand_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Simon Arlott");
> +MODULE_DESCRIPTION("NAND driver for BCM6368");
>=20


--=20
=46lorian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
