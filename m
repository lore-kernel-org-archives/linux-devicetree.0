From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [RFC PATCH 5/5] mtd: hyperbus: Add driver for TI's Hyperbus
 memory controller
Date: Tue, 26 Feb 2019 21:28:16 +0300
Message-ID: <4d2e31e3-0130-14a1-ab06-e6ffeae1cd22@cogentembedded.com>
References: <20190219063607.29949-1-vigneshr@ti.com>
 <20190219063607.29949-6-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219063607.29949-6-vigneshr@ti.com>
Content-Language: en-MW
Sender: linux-kernel-owner@vger.kernel.org
To: "Vignesh R (by way of Boris Brezillon <bbrezillon@kernel.org>)" <vigneshr@ti.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, tudor.ambarus@microchip.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, nsekhar@ti.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 02/19/2019 09:36 AM, Vignesh R (by way of Boris Brezillon <bbrezillon@kernel.org>) wrote:

> Add driver for Hyperbus memory controller on TI's AM654 SoC. Programming
> IP is pretty simple and provides direct memory mapped access to
> connected Flash devices.
> 
> Add basic support for the IP without DMA. Second ChipSelect is not
> supported for now.
> 
> Signed-off-by: Vignesh R <vigneshr@ti.com>
> ---
>  drivers/mtd/hyperbus/hbmc_am654.c | 105 ++++++++++++++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 drivers/mtd/hyperbus/hbmc_am654.c
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

   Isn't regbase a controller's data, not a slave device's?

[...]

MBR, Sergei
