From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v4 5/5] mtd: hyperbus: Add driver for TI's HyperBus memory
 controller
Date: Sat, 27 Apr 2019 23:31:54 +0300
Message-ID: <281a479d-3cfb-b9e1-23ee-c8e3acc37abe@cogentembedded.com>
References: <20190423104814.5762-1-vigneshr@ti.com>
 <20190423104814.5762-6-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190423104814.5762-6-vigneshr@ti.com>
Content-Language: en-MW
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh Raghavendra <vigneshr@ti.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, devicetree@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org, nsekhar@ti.com, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On 04/23/2019 01:48 PM, Vignesh Raghavendra wrote:

> Add driver for HyperBus memory controller on TI's AM654 SoC. Programming
> IP is pretty simple and provides direct memory mapped access to
> connected Flash devices.
> 
> Add basic support for the IP without DMA. Second chipSelect is not
> supported for now.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
[...]
> diff --git a/drivers/mtd/hyperbus/hbmc-am654.c b/drivers/mtd/hyperbus/hbmc-am654.c
> new file mode 100644
> index 000000000000..f458d7226df9
> --- /dev/null
> +++ b/drivers/mtd/hyperbus/hbmc-am654.c
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
> +// Author: Vignesh Raghavendra <vigneshr@ti.com>
> +
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mtd/hyperbus.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mux/consumer.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/types.h>
> +
> +struct am654_hbmc_priv {
> +	struct hyperbus_ctlr ctlr;
> +	struct hyperbus_device hbdev;
> +	void __iomem	*regbase;

   You don't seem to use this field.

[...]

MBR, Sergei
