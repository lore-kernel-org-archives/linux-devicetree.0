From: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Subject: Re: [PATCH v2 3/4] drivers: reset: Add STM32 reset driver
Date: Thu, 21 Jul 2016 15:48:09 -0400
Message-ID: <CAP=VYLq+Yp=dyMLY5zp8evNJ+jLkUgJ_s19gD1uC6KP8MmXPDQ@mail.gmail.com>
References: <1469092768-17489-1-git-send-email-gabriel.fernandez@st.com> <1469092768-17489-4-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1469092768-17489-4-git-send-email-gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gabriel.fernandez-qxv4g6HH51o@public.gmane.org
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, patrice.chotard-qxv4g6HH51o@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 21, 2016 at 5:19 AM,  <gabriel.fernandez-qxv4g6HH51o@public.gmane.org> wrote:
> From: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> The STM32 MCUs family IPs can be reset by accessing some registers
> from the RCC block.
>
> The list of available reset lines is documented in the DT bindings.
>
> Signed-off-by: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
> ---
>  drivers/reset/Makefile      |   1 +
>  drivers/reset/reset-stm32.c | 113 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 114 insertions(+)
>  create mode 100644 drivers/reset/reset-stm32.c
>
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 5d65a93..64ebb0c 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -4,6 +4,7 @@ obj-$(CONFIG_ARCH_SOCFPGA) += reset-socfpga.o
>  obj-$(CONFIG_ARCH_BERLIN) += reset-berlin.o
>  obj-$(CONFIG_MACH_PISTACHIO) += reset-pistachio.o
>  obj-$(CONFIG_ARCH_MESON) += reset-meson.o
> +obj-$(CONFIG_ARCH_STM32) += reset-stm32.o

In my tree, this Kconfig ARCH_STM32 is a bool, so...

>  obj-$(CONFIG_ARCH_SUNXI) += reset-sunxi.o
>  obj-$(CONFIG_ARCH_STI) += sti/
>  obj-$(CONFIG_ARCH_HISI) += hisilicon/
> diff --git a/drivers/reset/reset-stm32.c b/drivers/reset/reset-stm32.c
> new file mode 100644
> index 0000000..993af2a
> --- /dev/null
> +++ b/drivers/reset/reset-stm32.c
> @@ -0,0 +1,113 @@
> +/*
> + * Copyright (C) Maxime Coquelin 2015
> + * Author:  Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>_
> + * License terms:  GNU General Public License (GPL), version 2
> + *
> + * Heavily based on sunxi driver from Maxime Ripard.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/module.h>

...we probably don't need module.h here or any of the other
MODULE_<blah> tags/macros either.  Use the builtin for the
register and all should be good.

Thanks,
Paul.
--


> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +
> +struct stm32_reset_data {
> +       spinlock_t                      lock;
> +       void __iomem                    *membase;
> +       struct reset_controller_dev     rcdev;
> +};
> +
> +static int stm32_reset_assert(struct reset_controller_dev *rcdev,
> +                             unsigned long id)
> +{
> +       struct stm32_reset_data *data = container_of(rcdev,
> +                                                    struct stm32_reset_data,
> +                                                    rcdev);
> +       int bank = id / BITS_PER_LONG;
> +       int offset = id % BITS_PER_LONG;
> +       unsigned long flags;
> +       u32 reg;
> +
> +       spin_lock_irqsave(&data->lock, flags);
> +
> +       reg = readl(data->membase + (bank * 4));
> +       writel(reg | BIT(offset), data->membase + (bank * 4));
> +
> +       spin_unlock_irqrestore(&data->lock, flags);
> +
> +       return 0;
> +}
> +
> +static int stm32_reset_deassert(struct reset_controller_dev *rcdev,
> +                               unsigned long id)
> +{
> +       struct stm32_reset_data *data = container_of(rcdev,
> +                                                    struct stm32_reset_data,
> +                                                    rcdev);
> +       int bank = id / BITS_PER_LONG;
> +       int offset = id % BITS_PER_LONG;
> +       unsigned long flags;
> +       u32 reg;
> +
> +       spin_lock_irqsave(&data->lock, flags);
> +
> +       reg = readl(data->membase + (bank * 4));
> +       writel(reg & ~BIT(offset), data->membase + (bank * 4));
> +
> +       spin_unlock_irqrestore(&data->lock, flags);
> +
> +       return 0;
> +}
> +
> +static const struct reset_control_ops stm32_reset_ops = {
> +       .assert         = stm32_reset_assert,
> +       .deassert       = stm32_reset_deassert,
> +};
> +
> +static const struct of_device_id stm32_reset_dt_ids[] = {
> +        { .compatible = "st,stm32-rcc", },
> +        { /* sentinel */ },
> +};
> +
> +static int stm32_reset_probe(struct platform_device *pdev)
> +{
> +       struct stm32_reset_data *data;
> +       struct resource *res;
> +
> +       data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       data->membase = devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(data->membase))
> +               return PTR_ERR(data->membase);
> +
> +       spin_lock_init(&data->lock);
> +
> +       data->rcdev.owner = THIS_MODULE;
> +       data->rcdev.nr_resets = resource_size(res) * 8;
> +       data->rcdev.ops = &stm32_reset_ops;
> +       data->rcdev.of_node = pdev->dev.of_node;
> +
> +       return devm_reset_controller_register(&pdev->dev, &data->rcdev);
> +}
> +
> +static struct platform_driver stm32_reset_driver = {
> +       .probe  = stm32_reset_probe,
> +       .driver = {
> +               .name           = "stm32-rcc-reset",
> +               .of_match_table = stm32_reset_dt_ids,
> +       },
> +};
> +module_platform_driver(stm32_reset_driver);
> +
> +MODULE_AUTHOR("Maxime Coquelin <maxime.coquelin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>");
> +MODULE_DESCRIPTION("STM32 MCUs Reset Controller Driver");
> +MODULE_LICENSE("GPL");
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
