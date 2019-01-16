From: Scott Branden <scott.branden@broadcom.com>
Subject: Re: [PATCH v2 2/2] reset: Add Broadcom STB SW_INIT reset controller
 driver
Date: Wed, 16 Jan 2019 10:15:01 -0800
Message-ID: <7bc8d9ee-5be1-1765-55dd-b7407cff962f@broadcom.com>
References: <20190115184406.3164-1-f.fainelli@gmail.com>
 <20190115184406.3164-3-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190115184406.3164-3-f.fainelli@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


On 2019-01-15 10:44 a.m., Florian Fainelli wrote:
> Add support for resetting blocks through the Linux reset controller
> subsystem when reset lines are provided through a SW_INIT-style reset
> controller on Broadcom STB SoCs.
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>   drivers/reset/Kconfig         |   7 ++
>   drivers/reset/Makefile        |   1 +
>   drivers/reset/reset-brcmstb.c | 130 ++++++++++++++++++++++++++++++++++
>   3 files changed, 138 insertions(+)
>   create mode 100644 drivers/reset/reset-brcmstb.c
>
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 2e01bd833ffd..1ca03c57e049 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -40,6 +40,13 @@ config RESET_BERLIN
>   	help
>   	  This enables the reset controller driver for Marvell Berlin SoCs.
>   
> +config RESET_BRCMSTB
> +	bool "Broadcom STB reset controller" if COMPILE_TEST

Could this even be:

depends on ARCH_BRCMSTB || COMPILE_TEST

> +	default ARCH_BRCMSTB
> +	help
> +	  This enables the reset controller driver for Broadcom STB SoCs using
> +	  a SUN_TOP_CTRL_SW_INIT style controller.
> +
>   config RESET_HSDK
>   	bool "Synopsys HSDK Reset Driver"
>   	depends on HAS_IOMEM
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index dc7874df78d9..7395db2cb1dd 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -7,6 +7,7 @@ obj-$(CONFIG_RESET_A10SR) += reset-a10sr.o
>   obj-$(CONFIG_RESET_ATH79) += reset-ath79.o
>   obj-$(CONFIG_RESET_AXS10X) += reset-axs10x.o
>   obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
> +obj-$(CONFIG_RESET_BRCMSTB) += reset-brcmstb.o
>   obj-$(CONFIG_RESET_HSDK) += reset-hsdk.o
>   obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
>   obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
> diff --git a/drivers/reset/reset-brcmstb.c b/drivers/reset/reset-brcmstb.c
> new file mode 100644
> index 000000000000..01ab1f71518b
> --- /dev/null
> +++ b/drivers/reset/reset-brcmstb.c
> @@ -0,0 +1,130 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Broadcom STB generic reset controller for SW_INIT style reset controller
> + *
> + * Author: Florian Fainelli <f.fainelli@gmail.com>
> + * Copyright (C) 2018 Broadcom
> + */
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/types.h>
> +
> +struct brcmstb_reset {
> +	void __iomem *base;
> +	struct reset_controller_dev rcdev;
> +};
> +
> +#define SW_INIT_SET		0x00
> +#define SW_INIT_CLEAR		0x04
> +#define SW_INIT_STATUS		0x08
> +
> +#define SW_INIT_BIT(id)		BIT((id) & 0x1f)
> +#define SW_INIT_BANK(id)	((id) >> 5)
> +
> +/* A full bank contains extra registers that we are not utilizing but still
> + * qualify as a single bank.
> + */
> +#define SW_INIT_BANK_SIZE	0x18
> +
> +static inline
> +struct brcmstb_reset *to_brcmstb(struct reset_controller_dev *rcdev)
> +{
> +	return container_of(rcdev, struct brcmstb_reset, rcdev);
> +}
> +
> +static int brcmstb_reset_assert(struct reset_controller_dev *rcdev,
> +				unsigned long id)
> +{
> +	unsigned int off = SW_INIT_BANK(id) * SW_INIT_BANK_SIZE;
> +	struct brcmstb_reset *priv = to_brcmstb(rcdev);
> +
> +	writel_relaxed(SW_INIT_BIT(id), priv->base + off + SW_INIT_SET);
> +
> +	return 0;
> +}
> +
> +static int brcmstb_reset_deassert(struct reset_controller_dev *rcdev,
> +				  unsigned long id)
> +{
> +	unsigned int off = SW_INIT_BANK(id) * SW_INIT_BANK_SIZE;
> +	struct brcmstb_reset *priv = to_brcmstb(rcdev);
> +
> +	writel_relaxed(SW_INIT_BIT(id), priv->base + off + SW_INIT_CLEAR);
> +	/* Maximum reset delay after de-asserting a line and seeing block
> +	 * operation is typically 14us for the worst case, build some slack
> +	 * here.
> +	 */
> +	usleep_range(100, 200);
> +
> +	return 0;
> +}
> +
> +static int brcmstb_reset_status(struct reset_controller_dev *rcdev,
> +				unsigned long id)
> +{
> +	unsigned int off = SW_INIT_BANK(id) * SW_INIT_BANK_SIZE;
> +	struct brcmstb_reset *priv = to_brcmstb(rcdev);
> +
> +	return readl_relaxed(priv->base + off + SW_INIT_STATUS) &
> +			     SW_INIT_BIT(id);
> +}
> +
> +static const struct reset_control_ops brcmstb_reset_ops = {
> +	.assert	= brcmstb_reset_assert,
> +	.deassert = brcmstb_reset_deassert,
> +	.status = brcmstb_reset_status,
> +};
> +
> +static int brcmstb_reset_probe(struct platform_device *pdev)
> +{
> +	struct device *kdev = &pdev->dev;
> +	struct brcmstb_reset *priv;
> +	struct resource *res;
> +
> +	priv = devm_kzalloc(kdev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (resource_size(res) % SW_INIT_BANK_SIZE) {
> +		dev_err(kdev, "incorrect register range\n");
> +		return -EINVAL;
> +	}
> +
> +	priv->base = devm_ioremap_resource(kdev, res);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	dev_set_drvdata(kdev, priv);
> +
> +	priv->rcdev.owner = THIS_MODULE;
> +	priv->rcdev.nr_resets = (resource_size(res) / SW_INIT_BANK_SIZE) * 32;
> +	priv->rcdev.ops = &brcmstb_reset_ops;
> +	priv->rcdev.of_node = kdev->of_node;
> +	/* Use defaults: 1 cell and simple xlate function */
> +
> +	return devm_reset_controller_register(kdev, &priv->rcdev);
> +}
> +
> +static const struct of_device_id brcmstb_reset_of_match[] = {
> +	{ .compatible = "brcm,brcmstb-reset" },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver brcmstb_reset_driver = {
> +	.probe	= brcmstb_reset_probe,
> +	.driver	= {
> +		.name = "brcmstb-reset",
> +		.of_match_table = brcmstb_reset_of_match,
> +	},
> +};
> +module_platform_driver(brcmstb_reset_driver);
> +
> +MODULE_AUTHOR("Broadcom");
> +MODULE_DESCRIPTION("Broadcom STB reset controller");
> +MODULE_LICENSE("GPL");
