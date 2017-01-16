From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 2/4] phy: qcom-qusb2: New driver for QUSB2 PHY on Qcom
 chips
Date: Mon, 16 Jan 2017 14:15:02 +0530
Message-ID: <587C880E.90803@ti.com>
References: <1484045519-19030-1-git-send-email-vivek.gautam@codeaurora.org>
 <1484045519-19030-3-git-send-email-vivek.gautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484045519-19030-3-git-send-email-vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tuesday 10 January 2017 04:21 PM, Vivek Gautam wrote:
> PHY transceiver driver for QUSB2 phy controller that provides
> HighSpeed functionality for DWC3 controller present on
> Qualcomm chipsets.
> 
> Signed-off-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Reviewed-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
> 
> Changes since v3:
>  - Added 'Reviewed-by' from Stephen.
>  - Fixed debug message for qusb2_phy_set_tune2_param().
>  - Replaced devm_reset_control_get() with devm_reset_control_get_by_index()
>    since we are requesting only one reset.
>  - Updated devm_nvmem_cell_get() with a NULL cell id.
>  - Made error labels more idiomatic.
>  - Refactored qusb2_setbits() and qusb2_clrbits() a little bit to accept
>    base address and register offset as two separate arguments.
> 
> Changes since v2:
>  - Removed selecting 'RESET_CONTROLLER' config.
>  - Added error handling for clk_prepare_enable paths.
>  - Removed explicitly setting ref_clk rate to 19.2 MHz. Don't need to
>    do that since 'xo' is modeled as parent to this clock.
>  - Removed 'ref_clk_src' handling. Driver doesn't need to request and
>    handle this clock.
>  - Moved nvmem_cell_get() to probe function.
>  - Simplified phy pll status handling.
>  - Using of_device_get_match_data() to get match data.
>  - Uniformly using lowercase for hex numbers.
>  - Fixed sparse warnings.
>  - Using shorter variable names in structure and in functions.
>  - Handling various comment style shortcomings.
> 
> Changes since v1:
>  - removed reference to clk_enabled/pwr_enabled.
>  - moved clock and regulator enable code to phy_power_on/off() callbacks.
>  - fixed return on EPROBE_DEFER in qusb2_phy_probe().
>  - fixed phy create and phy register ordering.
>  - removed references to non-lkml links from commit message.
>  - took care of other minor nits.
>  - Fixed coccinelle warnings -
>    'PTR_ERR applied after initialization to constant'
>  - Addressed review comment, regarding qfprom access for tune2 param value.
>    This driver is now based on qfprom patch[1] that allows byte access now.
> 
>  drivers/phy/Kconfig          |  10 +
>  drivers/phy/Makefile         |   1 +
>  drivers/phy/phy-qcom-qusb2.c | 539 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 550 insertions(+)
>  create mode 100644 drivers/phy/phy-qcom-qusb2.c
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index e8eb7f225a88..0ed53d018b23 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -430,6 +430,16 @@ config PHY_STIH407_USB
>  	  Enable this support to enable the picoPHY device used by USB2
>  	  and USB3 controllers on STMicroelectronics STiH407 SoC families.
>  
> +config PHY_QCOM_QUSB2
> +	tristate "Qualcomm QUSB2 PHY Driver"
> +	depends on OF && (ARCH_QCOM || COMPILE_TEST)
> +	select GENERIC_PHY
> +	help
> +	  Enable this to support the HighSpeed QUSB2 PHY transceiver for USB
> +	  controllers on Qualcomm chips. This driver supports the high-speed
> +	  PHY which is usually paired with either the ChipIdea or Synopsys DWC3
> +	  USB IPs on MSM SOCs.
> +
>  config PHY_QCOM_UFS
>  	tristate "Qualcomm UFS PHY driver"
>  	depends on OF && ARCH_QCOM
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index 65eb2f436a41..dad1682b80e3 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -49,6 +49,7 @@ obj-$(CONFIG_PHY_ST_SPEAR1310_MIPHY)	+= phy-spear1310-miphy.o
>  obj-$(CONFIG_PHY_ST_SPEAR1340_MIPHY)	+= phy-spear1340-miphy.o
>  obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
>  obj-$(CONFIG_PHY_STIH407_USB)		+= phy-stih407-usb.o
> +obj-$(CONFIG_PHY_QCOM_QUSB2) 	+= phy-qcom-qusb2.o
>  obj-$(CONFIG_PHY_QCOM_UFS) 	+= phy-qcom-ufs.o
>  obj-$(CONFIG_PHY_QCOM_UFS) 	+= phy-qcom-ufs-qmp-20nm.o
>  obj-$(CONFIG_PHY_QCOM_UFS) 	+= phy-qcom-ufs-qmp-14nm.o
> diff --git a/drivers/phy/phy-qcom-qusb2.c b/drivers/phy/phy-qcom-qusb2.c
> new file mode 100644
> index 000000000000..c69118610164
> --- /dev/null
> +++ b/drivers/phy/phy-qcom-qusb2.c
> @@ -0,0 +1,539 @@
> +/*
> + * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +
> +#define QUSB2PHY_PLL_TEST		0x04
> +#define CLK_REF_SEL			BIT(7)
> +
> +#define QUSB2PHY_PLL_TUNE		0x08
> +#define QUSB2PHY_PLL_USER_CTL1		0x0c
> +#define QUSB2PHY_PLL_USER_CTL2		0x10
> +#define QUSB2PHY_PLL_AUTOPGM_CTL1	0x1c
> +#define QUSB2PHY_PLL_PWR_CTRL		0x18
> +
> +#define QUSB2PHY_PLL_STATUS		0x38
> +#define PLL_LOCKED			BIT(5)
> +
> +#define QUSB2PHY_PORT_TUNE1		0x80
> +#define QUSB2PHY_PORT_TUNE2		0x84
> +#define QUSB2PHY_PORT_TUNE3		0x88
> +#define QUSB2PHY_PORT_TUNE4		0x8c
> +#define QUSB2PHY_PORT_TUNE5		0x90
> +#define QUSB2PHY_PORT_TEST2		0x9c
> +
> +#define QUSB2PHY_PORT_POWERDOWN		0xb4
> +#define CLAMP_N_EN			BIT(5)
> +#define FREEZIO_N			BIT(1)
> +#define POWER_DOWN			BIT(0)
> +
> +#define QUSB2PHY_REFCLK_ENABLE		BIT(0)
> +
> +#define PHY_CLK_SCHEME_SEL		BIT(0)
> +
> +struct qusb2_phy_init_tbl {
> +	unsigned int offset;
> +	unsigned int val;
> +};
> +#define QUSB2_PHY_INIT_CFG(o, v) \
> +	{			\
> +		.offset = o,	\
> +		.val = v,	\
> +	}
> +
> +static const struct qusb2_phy_init_tbl msm8996_init_tbl[] = {
> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PORT_TUNE1, 0xf8),
> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PORT_TUNE2, 0xb3),
> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PORT_TUNE3, 0x83),
> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PORT_TUNE4, 0xc0),
> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_TUNE, 0x30),
> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL1, 0x79),
> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL2, 0x21),
> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PORT_TEST2, 0x14),
> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_AUTOPGM_CTL1, 0x9f),
> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_PWR_CTRL, 0x00),
> +};

I wish all this data comes from device tree and one API in phy-core can do all
these settings. Your other driver qcom-qmp also seems to have a bunch of
similar settings.

The problem is every vnedor driver adds a bunch of code to perform the same
thing again and again when all of these settings can be done by a single phy API.

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
