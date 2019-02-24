From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [RFC PATCH 5/5] mtd: hyperbus: Add driver for TI's Hyperbus
 memory controller
Date: Sun, 24 Feb 2019 17:06:44 +0300
Message-ID: <61d04389-414a-70d8-ad33-36ed138df38c@cogentembedded.com>
References: <20190219063607.29949-1-vigneshr@ti.com>
 <20190219063607.29949-6-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219063607.29949-6-vigneshr@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Vignesh R (by way of Boris Brezillon <bbrezillon@kernel.org>)" <vigneshr@ti.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, tudor.ambarus@microchip.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, nsekhar@ti.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello!

On 19.02.2019 9:36, Vignesh R (by way of Boris Brezillon
<bbrezillon@kernel.org>) wrote:

> Add driver for Hyperbus memory controller on TI's AM654 SoC. Programming
> IP is pretty simple and provides direct memory mapped access to
> connected Flash devices.
> 
> Add basic support for the IP without DMA. Second ChipSelect is not
> supported for now.
> 
> Signed-off-by: Vignesh R <vigneshr@ti.com>
> ---
>   drivers/mtd/hyperbus/hbmc_am654.c | 105 ++++++++++++++++++++++++++++++
>   1 file changed, 105 insertions(+)
>   create mode 100644 drivers/mtd/hyperbus/hbmc_am654.c
> 
> diff --git a/drivers/mtd/hyperbus/hbmc_am654.c b/drivers/mtd/hyperbus/hbmc_am654.c
> new file mode 100644
> index 000000000000..1f0d2dc52f9f
> --- /dev/null
> +++ b/drivers/mtd/hyperbus/hbmc_am654.c
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
> +// Author: Vignesh R <vigneshr@ti.com>
> +
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mtd/hyperbus.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/types.h>
> +
> +struct am654_hbmc_priv {
> +	struct hb_device hbdev;
> +	void __iomem	*regbase;
> +};
> +
> +static int am654_hbmc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct am654_hbmc_priv *priv;
> +	struct resource *res;
> +	int err;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (IS_ERR(res)) {

     I don't think that function ever returns error ptrs. It should only 
return NULL on error.

> +		dev_err(&pdev->dev, "failed to get memory resource\n");
> +		return -ENOENT;
> +	}
> +
> +	priv->regbase = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(priv->regbase)) {
> +		dev_err(dev, "Cannot remap controller address.\n");

    The above function already prints its error messages.

[...]
> +module_platform_driver(am654_hbmc_platform_driver);
> +
> +MODULE_DESCRIPTION("HBMC driver for AM654 SoC");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:hbmc-am654");
> +MODULE_AUTHOR("Vignesh R <vigneshr@ti.com>");

MBR, Sergei
