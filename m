From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 4/5] phy: add Marvell HSIC 28nm PHY
Date: Thu, 21 May 2015 18:21:14 +0530
Message-ID: <555DD4C2.80406@ti.com>
References: <1431557340-5421-1-git-send-email-robh@kernel.org> <1431557340-5421-5-git-send-email-robh@kernel.org> <555DD384.2090506@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <555DD384.2090506@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On Thursday 21 May 2015 06:15 PM, Kishon Vijay Abraham I wrote:
> Hi,
>
> On Thursday 14 May 2015 04:18 AM, Rob Herring wrote:
>> Add PHY driver for the Marvell HSIC 28nm PHY. This PHY is found in PXA1928
>> SOC.
>>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> Cc: Kishon Vijay Abraham I <kishon@ti.com>
>> ---
>>    drivers/phy/Kconfig       |  10 +++
>>    drivers/phy/Makefile      |   1 +
>>    drivers/phy/phy-mv-hsic.c | 208 ++++++++++++++++++++++++++++++++++++++++++++++
>>    3 files changed, 219 insertions(+)
>>    create mode 100644 drivers/phy/phy-mv-hsic.c
>>
>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>> index ef7634f..cfcae72 100644
>> --- a/drivers/phy/Kconfig
>> +++ b/drivers/phy/Kconfig
>> @@ -52,6 +52,16 @@ config PHY_EXYNOS_MIPI_VIDEO
>>    	  Support for MIPI CSI-2 and MIPI DSI DPHY found on Samsung S5P
>>    	  and EXYNOS SoCs.
>>
>> +config PHY_MV_HSIC
>> +	tristate "Marvell USB HSIC 28nm PHY Driver"
>> +	select GENERIC_PHY
>> +	help
>> +	  Enable this to support Marvell USB HSIC PHY driver for Marvell
>> +	  SoC. This driver will do the PHY initialization and shutdown.
>> +	  The PHY driver will be used by Marvell ehci driver.
>> +
>> +	  To compile this driver as a module, choose M here.
>> +
>>    config PHY_MV_USB2
>>    	tristate "Marvell USB 2.0 28nm PHY Driver"
>>    	select GENERIC_PHY
>> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
>> index 768e55a..472bf0a 100644
>> --- a/drivers/phy/Makefile
>> +++ b/drivers/phy/Makefile
>> @@ -10,6 +10,7 @@ obj-$(CONFIG_ARMADA375_USBCLUSTER_PHY)	+= phy-armada375-usb2.o
>>    obj-$(CONFIG_BCM_KONA_USB2_PHY)		+= phy-bcm-kona-usb2.o
>>    obj-$(CONFIG_PHY_EXYNOS_DP_VIDEO)	+= phy-exynos-dp-video.o
>>    obj-$(CONFIG_PHY_EXYNOS_MIPI_VIDEO)	+= phy-exynos-mipi-video.o
>> +obj-$(CONFIG_PHY_MV_HSIC)		+= phy-mv-hsic.o
>>    obj-$(CONFIG_PHY_MV_USB2)		+= phy-mv-usb2.o
>>    obj-$(CONFIG_PHY_MVEBU_SATA)		+= phy-mvebu-sata.o
>>    obj-$(CONFIG_PHY_MIPHY28LP) 		+= phy-miphy28lp.o
>> diff --git a/drivers/phy/phy-mv-hsic.c b/drivers/phy/phy-mv-hsic.c
>> new file mode 100644
>> index 0000000..aa6cccd
>> --- /dev/null
>> +++ b/drivers/phy/phy-mv-hsic.c
>> @@ -0,0 +1,208 @@
>> +/*
>> + * Copyright (C) 2015 Linaro, Ltd.
>> + * Rob Herring <robh@kernel.org>
>> + *
>> + * Based on vendor driver:
>> + * Copyright (C) 2013 Marvell Inc.
>> + * Author: Chao Xie <xiechao.mail@gmail.com>
>> + *
>> + * This software is licensed under the terms of the GNU General Public
>> + * License version 2, as published by the Free Software Foundation, and
>> + * may be copied, distributed, and modified under those terms.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/slab.h>
>> +#include <linux/of.h>
>> +#include <linux/io.h>
>> +#include <linux/err.h>
>> +#include <linux/clk.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/phy/phy.h>
>> +
>> +#define PHY_28NM_HSIC_CTRL			0x08
>> +#define PHY_28NM_HSIC_IMPCAL_CAL		0x18
>> +#define PHY_28NM_HSIC_PLL_CTRL01		0x1c
>> +#define PHY_28NM_HSIC_PLL_CTRL2			0x20
>> +#define PHY_28NM_HSIC_INT			0x28
>> +
>> +#define PHY_28NM_HSIC_PLL_SELLPFR_SHIFT		26
>> +#define PHY_28NM_HSIC_PLL_FBDIV_SHIFT		0
>> +#define PHY_28NM_HSIC_PLL_REFDIV_SHIFT		9
>> +
>> +#define PHY_28NM_HSIC_S2H_PU_PLL		BIT(10)
>> +#define PHY_28NM_HSIC_H2S_PLL_LOCK		BIT(15)
>> +#define PHY_28NM_HSIC_S2H_HSIC_EN		BIT(7)
>> +#define S2H_DRV_SE0_4RESUME			BIT(14)
>> +#define PHY_28NM_HSIC_H2S_IMPCAL_DONE		BIT(27)
>> +
>> +#define PHY_28NM_HSIC_CONNECT_INT		BIT(1)
>> +#define PHY_28NM_HSIC_HS_READY_INT		BIT(2)
>> +
>> +struct mv_hsic_phy {
>> +	struct phy		*phy;
>> +	struct platform_device	*pdev;
>> +	void __iomem		*base;
>> +	struct clk		*clk;
>> +};
>> +
>> +static bool wait_for_reg(void __iomem *reg, u32 mask, unsigned long timeout)
>> +{
>> +	timeout += jiffies;
>> +	while (time_is_after_eq_jiffies(timeout)) {
>> +		if ((readl(reg) & mask) == mask)
>> +			return true;
>> +		msleep(1);
>> +	}
>> +	return false;
>> +}
>> +
>> +static int mv_hsic_phy_init(struct phy *phy)
>> +{
>> +	struct mv_hsic_phy *mv_phy = phy_get_drvdata(phy);
>> +	struct platform_device *pdev = mv_phy->pdev;
>> +	void __iomem *base = mv_phy->base;
>> +
>> +	clk_prepare_enable(mv_phy->clk);
>> +
>> +	/* Set reference clock */
>> +	writel(0x1 << PHY_28NM_HSIC_PLL_SELLPFR_SHIFT |
>> +		0xf0 << PHY_28NM_HSIC_PLL_FBDIV_SHIFT |
>> +		0xd << PHY_28NM_HSIC_PLL_REFDIV_SHIFT,
>> +		base + PHY_28NM_HSIC_PLL_CTRL01);
>> +
>> +	/* Turn on PLL */
>> +	writel(readl(base + PHY_28NM_HSIC_PLL_CTRL2) |
>> +		PHY_28NM_HSIC_S2H_PU_PLL,
>> +		base + PHY_28NM_HSIC_PLL_CTRL2);
>> +
>> +	/* Make sure PHY PLL is locked */
>> +	if (!wait_for_reg(base + PHY_28NM_HSIC_PLL_CTRL2,
>> +	    PHY_28NM_HSIC_H2S_PLL_LOCK, HZ / 10)) {
>> +		dev_err(&pdev->dev, "HSIC PHY PLL not locked after 100mS.");
>> +		return -ETIMEDOUT;
>> +	}
>> +
>> +	/* Avoid SE0 state when resume for some device will take it as reset */
>> +	writel(readl(base + PHY_28NM_HSIC_CTRL) & ~S2H_DRV_SE0_4RESUME,
>> +		base + PHY_28NM_HSIC_CTRL);
>> +
>> +	/* Enable HSIC PHY */
>> +	writel(readl(base + PHY_28NM_HSIC_CTRL) | PHY_28NM_HSIC_S2H_HSIC_EN,
>> +		base + PHY_28NM_HSIC_CTRL);
>> +
>> +	/*  Calibration Timing
>> +	*		   ____________________________
>> +	*  CAL START   ___|
>> +	*			   ____________________
>> +	*  CAL_DONE    ___________|
>> +	*		  | 400us |
>> +	*/
>
> Please use the comment style used here
> http://lxr.free-electrons.com/source/Documentation/CodingStyle#L464
>
>> +
>> +	/* Make sure PHY Calibration is ready */
>> +	if (!wait_for_reg(base + PHY_28NM_HSIC_IMPCAL_CAL,
>> +	    PHY_28NM_HSIC_H2S_IMPCAL_DONE, HZ / 10)) {
>> +		dev_warn(&pdev->dev, "HSIC PHY READY not set after 100mS.");
>> +		return -ETIMEDOUT;
>> +	}
>> +
>> +	/* Waiting for HSIC connect int*/
>> +	if (!wait_for_reg(base + PHY_28NM_HSIC_INT,
>> +	    PHY_28NM_HSIC_CONNECT_INT, HZ / 5)) {
>> +		dev_warn(&pdev->dev, "HSIC wait for connect interrupt timeout.");
>> +		return -ETIMEDOUT;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int mv_hsic_phy_power_on(struct phy *phy)
>> +{
>> +	struct mv_hsic_phy *mv_phy = phy_get_drvdata(phy);
>> +	struct platform_device *pdev = mv_phy->pdev;
>> +
>> +	/* check HS ready */
>> +	if (!wait_for_reg(mv_phy->base + PHY_28NM_HSIC_INT,
>> +	    PHY_28NM_HSIC_HS_READY_INT, HZ / 10)) {
>> +		dev_err(&pdev->dev, "HSIC HS_READY not set\n");
>> +		return -ETIMEDOUT;
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int mv_hsic_phy_power_off(struct phy *phy)
>> +{
>> +	struct mv_hsic_phy *mv_phy = phy_get_drvdata(phy);
>> +	void __iomem *base = mv_phy->base;
>> +
>> +	writel(readl(base + PHY_28NM_HSIC_CTRL) & ~PHY_28NM_HSIC_S2H_HSIC_EN,
>> +		base + PHY_28NM_HSIC_CTRL);
>> +
>> +	clk_disable_unprepare(mv_phy->clk);
>> +	return 0;
>> +}
>> +
>> +static const struct phy_ops hsic_ops = {
>> +	.init		= mv_hsic_phy_init,
>> +	.power_on	= mv_hsic_phy_power_on,
>> +	.power_off	= mv_hsic_phy_power_off,
>
> exit callback is missing? Shouldn't we turn off the PLLs in exit callback?
Also add the .owner member since this driver can be used as module.

Thanks
Kishon
