From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/3] mfd: lubbock_io: add lubbock_io board
Date: Mon, 19 Jan 2015 09:17:05 +0000
Message-ID: <20150119091705.GG21886@x1>
References: <1421406010-14851-1-git-send-email-robert.jarzmik@free.fr>
 <1421406010-14851-2-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1421406010-14851-2-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 16 Jan 2015, Robert Jarzmik wrote:

> Lubbock () board is the IO motherboard of the Intel PXA25x Developmen=
t
> Platform, which supports the Lubbock pxa25x soc board.
>=20
> Historically, this support was in arch/arm/mach-pxa/lubbock.c. When
> gpio-pxa was moved to drivers/pxa, it became a driver, and its
> initialization and probing happened at postcore initcall. The lubbock
> code used to install the chained lubbock interrupt handler at init_ir=
q()
> time.
>=20
> The consequence of the gpio-pxa change is that the installed chained =
irq
> handler lubbock_irq_handler() was overwritten in pxa_gpio_probe(_dt)(=
),
> removing :
>  - the handler
>  - the falling edge detection setting of GPIO0, which revealed the
>    interrupt request from the lubbock IO board.
>=20
> As a fix, move the gpio0 chained handler setup to a place where we ha=
ve
> the guarantee that pxa_gpio_probe() was called before, so that lubboc=
k
> handler becomes the true IRQ chained handler of GPIO0, demuxing the
> lubbock IO board interrupts.

How is this guaranteed?

> This patch moves all that handling to a mfd driver. It's only purpose
> for the time being is the interrupt handling, but in the future it
> should encompass all the motherboard CPLDs handling :
>  - leds
>  - switches
>  - hexleds
>=20
> Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
> ---
> Since v1: change the name from cottula to lubbock_io
>             Dmitry pointed out the Cottula was the pxa25x family name=
,
> 	    lubbock was the pxa25x development board name. Therefore the
> 	    name was changed to lubbock_io (lubbock IO board)
> 	  change the resources to bi-irq ioresource
> 	    Discussion between Arnd and Robert to change the gpio
> 	    request by a irq request.
> Since v2: take into account Mark's review
>       	    Use irq flags from resources (DT case and pdata case).
> 	    Change of name from lubbock_io to lubbock-io
> ---
>  drivers/mfd/Kconfig   |  10 +++
>  drivers/mfd/Makefile  |   1 +
>  drivers/mfd/lubbock.c | 196 ++++++++++++++++++++++++++++++++++++++++=
++++++++++
>  3 files changed, 207 insertions(+)
>  create mode 100644 drivers/mfd/lubbock.c
>=20
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 2e6b731..4d8939f 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -91,6 +91,16 @@ config MFD_AXP20X
>  	  components like regulators or the PEK (Power Enable Key) under th=
e
>  	  corresponding menus.
> =20
> +config MFD_LUBBOCK
> +	bool "Lubbock Motherboard"
> +	def_bool ARCH_LUBBOCK
> +	select MFD_CORE
> +	help
> +	  This driver supports the Lubbock multifunction chip found on the
> +	  pxa25x development platform system (named Lubbock). This IO board
> +	  supports the interrupts handling, ethernet controller, flash chip=
s,
> +	  etc ...
> +
>  config MFD_CROS_EC
>  	tristate "ChromeOS Embedded Controller"
>  	select MFD_CORE
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 53467e2..aff1f4f 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_MFD_88PM805)	+=3D 88pm805.o 88pm80x.o
>  obj-$(CONFIG_MFD_SM501)		+=3D sm501.o
>  obj-$(CONFIG_MFD_ASIC3)		+=3D asic3.o tmio_core.o
>  obj-$(CONFIG_MFD_BCM590XX)	+=3D bcm590xx.o
> +obj-$(CONFIG_MFD_LUBBOCK)	+=3D lubbock.o
>  obj-$(CONFIG_MFD_CROS_EC)	+=3D cros_ec.o
>  obj-$(CONFIG_MFD_CROS_EC_I2C)	+=3D cros_ec_i2c.o
>  obj-$(CONFIG_MFD_CROS_EC_SPI)	+=3D cros_ec_spi.o
> diff --git a/drivers/mfd/lubbock.c b/drivers/mfd/lubbock.c
> new file mode 100644
> index 0000000..6025135
> --- /dev/null
> +++ b/drivers/mfd/lubbock.c
> @@ -0,0 +1,196 @@
> +/*
> + * Intel Cotulla MFD - lubbock motherboard
> + *
> + * Copyright (C) 2014 Robert Jarzmik
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * Lubbock motherboard driver, supporting lubbock (aka. pxa25x) soc =
board.

Please use uppercase characters i.e. Lubbock, PXA25X, SoC, etc.

> + *

Superfluous '\n'.

> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>

Can this be built as a module?

If so, why isn't it a tristate?

> +#include <linux/of_platform.h>
> +
> +#define COT_IRQ_MASK_EN 0xc0
> +#define COT_IRQ_SET_CLR 0xd0
> +
> +#define LUBBOCK_NB_IRQ	8
> +
> +struct lubbock {
> +	void __iomem	*base;

Random spacing.

> +	int irq;
> +	unsigned int irq_mask;
> +	struct gpio_desc *gpio0;
> +	struct irq_domain *irqdomain;
> +};
> +
> +static irqreturn_t lubbock_irq_handler(int in_irq, void *d)
> +{
> +	struct lubbock *cot =3D d;
> +	unsigned long pending;
> +	unsigned int bit;
> +
> +	pending =3D readl(cot->base + COT_IRQ_SET_CLR) & cot->irq_mask;
> +	for_each_set_bit(bit, &pending, LUBBOCK_NB_IRQ)
> +		generic_handle_irq(irq_find_mapping(cot->irqdomain, bit));

I'd like to see a '\n' here.

> +	return IRQ_HANDLED;
> +}
> +
> +static void lubbock_irq_mask_ack(struct irq_data *d)
> +{
> +	struct lubbock *cot =3D irq_data_get_irq_chip_data(d);
> +	unsigned int lubbock_irq =3D irqd_to_hwirq(d);
> +	unsigned int set, bit =3D BIT(lubbock_irq);
> +
> +	cot->irq_mask &=3D ~bit;
> +	writel(cot->irq_mask, cot->base + COT_IRQ_MASK_EN);
> +	set =3D readl(cot->base + COT_IRQ_SET_CLR);
> +	writel(set & ~bit, cot->base + COT_IRQ_SET_CLR);
> +}
> +
> +static void lubbock_irq_unmask(struct irq_data *d)
> +{
> +	struct lubbock *cot =3D irq_data_get_irq_chip_data(d);
> +	unsigned int lubbock_irq =3D irqd_to_hwirq(d);
> +	unsigned int bit =3D BIT(lubbock_irq);
> +
> +	cot->irq_mask |=3D bit;
> +	writel(cot->irq_mask, cot->base + COT_IRQ_MASK_EN);
> +}
> +
> +static struct irq_chip lubbock_irq_chip =3D {
> +	.name		=3D "lubbock",
> +	.irq_mask_ack	=3D lubbock_irq_mask_ack,
> +	.irq_unmask	=3D lubbock_irq_unmask,
> +	.flags		=3D IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_SKIP_SET_WAKE,
> +};
> +
> +static int lubbock_irq_domain_map(struct irq_domain *d, unsigned int=
 irq,
> +				   irq_hw_number_t hwirq)
> +{
> +	struct lubbock *cot =3D d->host_data;
> +
> +	irq_set_chip_and_handler(irq, &lubbock_irq_chip, handle_level_irq);
> +	irq_set_chip_data(irq, cot);

Again, I'd prefer some separation between code and the return.

(same in all cases below).

> +	return 0;
> +}
> +
> +static const struct irq_domain_ops lubbock_irq_domain_ops =3D {
> +	.xlate =3D irq_domain_xlate_twocell,
> +	.map =3D lubbock_irq_domain_map,
> +};
> +
> +static int lubbock_resume(struct platform_device *pdev)
> +{
> +	struct lubbock *cot =3D platform_get_drvdata(pdev);
> +
> +	writel(cot->irq_mask, cot->base + COT_IRQ_MASK_EN);
> +	return 0;
> +}
> +
> +static int lubbock_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	struct lubbock *cot;
> +	int ret;
> +	unsigned int base_irq =3D 0;
> +	unsigned long irqflags;
> +
> +	cot =3D devm_kzalloc(&pdev->dev, sizeof(*cot), GFP_KERNEL);
> +	if (!cot)
> +		return -ENOMEM;

'\n' here.

> +	res =3D platform_get_resource(pdev, IORESOURCE_IRQ, 0);

platform_get_irq()?

> +	if (res) {
> +		cot->irq =3D (unsigned int)res->start;
> +		irqflags =3D res->flags;
> +	}
> +	if (!cot->irq)
> +		return -ENODEV;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_IRQ, 1);

platform_get_irq()?

> +	if (res)
> +		base_irq =3D (unsigned int)res->start;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	cot->base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(cot->base))
> +		return PTR_ERR(cot->base);
> +
> +	platform_set_drvdata(pdev, cot);
> +
> +	writel(cot->irq_mask, cot->base + COT_IRQ_MASK_EN);
> +	writel(0, cot->base + COT_IRQ_SET_CLR);

'\n'

> +	ret =3D devm_request_irq(&pdev->dev, cot->irq, lubbock_irq_handler,
> +			       irqflags, dev_name(&pdev->dev), cot);
> +	if (ret =3D=3D -ENOSYS)
> +		return -EPROBE_DEFER;

I haven't seen anyone do this after devm_request_irq() before.

Why is it required here?

> +	if (ret) {
> +		dev_err(&pdev->dev, "Couldn't request main irq : ret =3D %d\n",
> +			ret);

I'm not keen on this type of formatting.  Besides the system will
print out the returned error on failure.

> +		return ret;
> +	}
> +	irq_set_irq_wake(cot->irq, 1);
> +
> +	cot->irqdomain =3D
> +		irq_domain_add_linear(pdev->dev.of_node, LUBBOCK_NB_IRQ,
> +				      &lubbock_irq_domain_ops, cot);

As a personal preference, I would prefer to see:

	cot->irqdomain =3D irq_domain_add_linear(pdev->dev.of_node,
					       LUBBOCK_NB_IRQ,
					       &lubbock_irq_domain_ops, cot);

> +	if (!cot->irqdomain)
> +		return -ENODEV;
> +
> +	ret =3D 0;

'ret' will be zero here, or we would have returned already.

> +	if (base_irq)
> +		ret =3D irq_create_strict_mappings(cot->irqdomain, base_irq, 0,
> +						 LUBBOCK_NB_IRQ);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Couldn't create the irq mapping %d..%d\n",
> +			base_irq, base_irq + LUBBOCK_NB_IRQ);
> +		return ret;
> +	}

Is this solely the check from irq_create_strict_mappings(), therefore
it should be inside the previous if () { ... }.

> +	dev_info(&pdev->dev, "base=3D%p, irq=3D%d, base_irq=3D%d\n",
> +		 cot->base, cot->irq, base_irq);

Please remove this line.

> +	return 0;
> +}
> +
> +static int lubbock_remove(struct platform_device *pdev)
> +{
> +	struct lubbock *cot =3D platform_get_drvdata(pdev);
> +
> +	irq_set_chip_and_handler(cot->irq, NULL, NULL);
> +	return 0;
> +}
> +
> +static const struct of_device_id lubbock_id_table[] =3D {
> +	{ .compatible =3D "intel,lubbock-io", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, lubbock_id_table);
> +
> +static struct platform_driver lubbock_driver =3D {
> +	.driver		=3D {
> +		.name	=3D "lubbock_io",
> +		.of_match_table =3D of_match_ptr(lubbock_id_table),
> +	},
> +	.probe		=3D lubbock_probe,
> +	.remove		=3D lubbock_remove,
> +	.resume		=3D lubbock_resume,
> +};
> +
> +module_platform_driver(lubbock_driver);
> +
> +MODULE_DESCRIPTION("Lubbock driver");

"Lubbock MFD Driver"?

> +MODULE_AUTHOR("Robert Jarzmik");

Email.

> +MODULE_LICENSE("GPL");

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
