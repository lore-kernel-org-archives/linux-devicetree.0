From: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH v3 2/2] misc: Add Xilinx ZYNQMP VCU logicoreIP init driver
Date: Thu, 14 Dec 2017 10:42:59 -0800
Message-ID: <29198c0a-783e-8aa0-00e4-44b1fa1acef7@infradead.org>
References: <200703.nxabyfcjbswwbp4v@rob-hp-laptop>
 <1513230920-9005-1-git-send-email-dshah@xilinx.com>
 <1513230920-9005-3-git-send-email-dshah@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513230920-9005-3-git-send-email-dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dhaval Shah <dhaval.shah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, pombredanne-od1rfyK75/E@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, Dhaval Shah <dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/13/2017 09:55 PM, Dhaval Shah wrote:
> Xilinx ZYNQMP logicoreIP Init driver is based on the new
> LogiCoreIP design created. This driver provides the processing system
> and programmable logic isolation. Set the frequency based on the clock
> information get from the logicoreIP register set.
> 
> It is put in drivers/misc as there is no subsystem for this logicoreIP.
> 
> Signed-off-by: Dhaval Shah <dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
> Changes since v3:
>  No Changes.
> Changes since v2:
>  * Removed the "default n" from the Kconfig
>  * More help text added to explain more about the logicoreIP driver
>  * SPDX id is relocated at top of the file with // style comment
>  * Removed the export API and header file and make it a single driver
>    which provides logocoreIP init.
>  * Provide the information in commit message as well for the why driver
>    in drivers/misc.
> 
>  drivers/misc/Kconfig    |  15 ++
>  drivers/misc/Makefile   |   1 +
>  drivers/misc/xlnx_vcu.c | 629 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 645 insertions(+)
>  create mode 100644 drivers/misc/xlnx_vcu.c
> 
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index f1a5c23..24ea516 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -496,6 +496,21 @@ config PCI_ENDPOINT_TEST
>             Enable this configuration option to enable the host side test driver
>             for PCI Endpoint.
>  
> +config XILINX_VCU
> +       tristate "Xilinx VCU logicoreIP Init"
> +       help

Please indent the help text (below) by 2 additional spaces, as documented
in coding-style.rst.

> +	  Provides the driver to enable and disable the isolation between the
> +	  processing system and programmable logic part by using the logicoreIP
> +	  register set. This driver also configure the frequency based on the

	                                 configures

> +	  clock information get from the logicoreIP register set.

                    drop   ^get^

> +
> +	  If you say yes here you get support for the logcoreIP.

	                                              logicoreIP.

> +
> +	  If unsure, say N.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called xlnx_vcu.
> +
>  source "drivers/misc/c2port/Kconfig"
>  source "drivers/misc/eeprom/Kconfig"
>  source "drivers/misc/cb710/Kconfig"
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index 5ca5f64..a6bd0b1 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -55,6 +55,7 @@ obj-$(CONFIG_CXL_BASE)		+= cxl/
>  obj-$(CONFIG_ASPEED_LPC_CTRL)	+= aspeed-lpc-ctrl.o
>  obj-$(CONFIG_ASPEED_LPC_SNOOP)	+= aspeed-lpc-snoop.o
>  obj-$(CONFIG_PCI_ENDPOINT_TEST)	+= pci_endpoint_test.o
> +obj-$(CONFIG_XILINX_VCU)	+= xlnx_vcu.o
>  
>  lkdtm-$(CONFIG_LKDTM)		+= lkdtm_core.o
>  lkdtm-$(CONFIG_LKDTM)		+= lkdtm_bugs.o
> diff --git a/drivers/misc/xlnx_vcu.c b/drivers/misc/xlnx_vcu.c
> new file mode 100644
> index 0000000..41819f0
> --- /dev/null
> +++ b/drivers/misc/xlnx_vcu.c
> @@ -0,0 +1,629 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Xilinx VCU Init
> + *
> + * Copyright (C) 2016 - 2017 Xilinx, Inc.
> + *
> + * Contacts   Dhaval Shah <dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> + */
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +> +/* Address map for different registers implemented in the VCU LogiCORE IP. */

[snip]


> +/**
> + * xvcu_read - Read from the VCU register space
> + * @iomem:	vcu reg space base address
> + * @offset:	vcu reg offset from base
> + *
> + * Return:	Returns 32bit value from VCU register specified
> + *
> + */
> +static u32 xvcu_read(void __iomem *iomem, u32 offset)

You could inline the read() and write() functions...

> +{
> +	return ioread32(iomem + offset);
> +}
> +
> +/**
> + * xvcu_write - Write to the VCU register space
> + * @iomem:	vcu reg space base address
> + * @offset:	vcu reg offset from base
> + * @value:	Value to write
> + */
> +static void xvcu_write(void __iomem *iomem, u32 offset, u32 value)
> +{
> +	iowrite32(value, iomem + offset);
> +}
> +
> +/**
> + * xvcu_write_field_reg - Write to the vcu reg field
> + * @iomem:	vcu reg space base address
> + * @offset:	vcu reg offset from base
> + * @field:	vcu reg field to write to
> + * @mask:	vcu reg mask
> + * @shift:	vcu reg number of bits to shift the bitfield
> + */
> +static void xvcu_write_field_reg(void __iomem *iomem, int offset,
> +				u32 field, u32 mask, int shift)
> +{
> +	u32 val = xvcu_read(iomem, offset);
> +
> +	val &= ~(mask << shift);
> +	val |= (field & mask) << shift;
> +
> +	xvcu_write(iomem, offset, val);
> +}
> +
> +/**
> + * xvcu_set_vcu_pll_info - Set the VCU PLL info
> + * @xvcu:	Pointer to the xvcu_device structure
> + *
> + * Programming the VCU PLL based on the user configuration
> + * (ref clock freq, core clock freq, mcu clock freq).
> + * Core clock frequency has higher priority than mcu clock frequency
> + * Errors in following cases
> + *    - When mcu or clock clock get from logicoreIP is 0
> + *    - When VCU PLL DIV related bits value other than 1
> + *    - When proper data not found for given data
> + *    - When sis570_1 clocksource related operation failed
> + *
> + * Return:	Returns status, either success or error+reason
> + */
> +static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
> +{
> +	u32 refclk, coreclk, mcuclk, inte, deci;
> +	u32 divisor_mcu, divisor_core, fvco;
> +	u32 clkoutdiv, vcu_pll_ctrl, pll_clk;
> +	u32 cfg_val, mod, ctrl;
> +	int ret;
> +	unsigned int i;
> +	const struct xvcu_pll_cfg *found = NULL;
> +
> +	inte = xvcu_read(xvcu->logicore_reg_ba, VCU_PLL_CLK);
> +	deci = xvcu_read(xvcu->logicore_reg_ba, VCU_PLL_CLK_DEC);
> +	coreclk = xvcu_read(xvcu->logicore_reg_ba, VCU_CORE_CLK) * MHZ;
> +	mcuclk = xvcu_read(xvcu->logicore_reg_ba, VCU_MCU_CLK) * MHZ;
> +	if (!mcuclk || !coreclk) {
> +		dev_err(xvcu->dev, "Invalid mcu and core clock data\n");
> +		return -EINVAL;
> +	}
> +
> +	refclk = (inte * MHZ) + (deci * (MHZ / FRAC));
> +	dev_dbg(xvcu->dev, "Ref clock from logicoreIP is %uHz\n", refclk);
> +	dev_dbg(xvcu->dev, "Core clock from logicoreIP is %uHz\n", coreclk);
> +	dev_dbg(xvcu->dev, "Mcu clock from logicoreIP is %uHz\n", mcuclk);
> +
> +	clk_disable_unprepare(xvcu->pll_ref);
> +	ret = clk_set_rate(xvcu->pll_ref, refclk);
> +	if (ret)
> +		dev_warn(xvcu->dev, "failed to set logicoreIP refclk rate\n");
> +
> +	ret = clk_prepare_enable(xvcu->pll_ref);
> +	if (ret) {
> +		dev_err(xvcu->dev, "failed to enable pll_ref clock source\n");
> +		return ret;
> +	}
> +
> +	refclk = clk_get_rate(xvcu->pll_ref);
> +
> +	/* The divide-by-2 should be always enabled (==1)

multi-line comment style:
	/*
	 * The divide-by-2 should always be enabled (==1)

> +	 * to meet the timing in the design.
> +	 * Otherwise, it's an error
> +	 */
> +	vcu_pll_ctrl = xvcu_read(xvcu->vcu_slcr_ba, VCU_PLL_CTRL);
> +	clkoutdiv = vcu_pll_ctrl >> VCU_PLL_CTRL_CLKOUTDIV_SHIFT;
> +	clkoutdiv = clkoutdiv && VCU_PLL_CTRL_CLKOUTDIV_MASK;
> +	if (clkoutdiv != 1) {
> +		dev_err(xvcu->dev, "clkoutdiv value is invalid\n");
> +		return -EINVAL;
> +	}
> +
> +	for (i = ARRAY_SIZE(xvcu_pll_cfg) - 1; i > 0; i--) {
> +		const struct xvcu_pll_cfg *cfg = &xvcu_pll_cfg[i];
> +
> +		fvco = cfg->fbdiv * refclk;
> +		if (fvco >= FVCO_MIN && fvco <= FVCO_MAX) {
> +			pll_clk = fvco / VCU_PLL_DIV2;
> +			if (fvco % VCU_PLL_DIV2 != 0)
> +				pll_clk++;
> +			mod = pll_clk % coreclk;
> +			if (mod < LIMIT) {
> +				divisor_core = pll_clk / coreclk;
> +			} else if (coreclk - mod < LIMIT) {
> +				divisor_core = pll_clk / coreclk;
> +				divisor_core++;
> +			} else {
> +				continue;
> +			}
> +			if (divisor_core >= DIVISOR_MIN &&
> +			    divisor_core <= DIVISOR_MAX) {
> +				found = cfg;
> +				divisor_mcu = pll_clk / mcuclk;
> +				mod = pll_clk % mcuclk;
> +				if (mcuclk - mod < LIMIT)
> +					divisor_mcu++;
> +				break;
> +			}
> +		}
> +	}
> +
> +	if (!found) {
> +		dev_err(xvcu->dev, "Invalid clock combination.\n");
> +		return -EINVAL;
> +	}
> +
> +	xvcu->coreclk = pll_clk / divisor_core;
> +	mcuclk = pll_clk / divisor_mcu;
> +	dev_dbg(xvcu->dev, "Actual Ref clock freq is %uHz\n", refclk);
> +	dev_dbg(xvcu->dev, "Actual Core clock freq is %uHz\n", xvcu->coreclk);
> +	dev_dbg(xvcu->dev, "Actual Mcu clock freq is %uHz\n", mcuclk);
> +
> +	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_FBDIV_MASK << VCU_PLL_CTRL_FBDIV_SHIFT);
> +	vcu_pll_ctrl |= (found->fbdiv & VCU_PLL_CTRL_FBDIV_MASK) <<
> +			 VCU_PLL_CTRL_FBDIV_SHIFT;
> +	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_POR_IN_MASK <<
> +			  VCU_PLL_CTRL_POR_IN_SHIFT);
> +	vcu_pll_ctrl |= (VCU_PLL_CTRL_DEFAULT & VCU_PLL_CTRL_POR_IN_MASK) <<
> +			 VCU_PLL_CTRL_POR_IN_SHIFT;
> +	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_PWR_POR_MASK <<
> +			  VCU_PLL_CTRL_PWR_POR_SHIFT);
> +	vcu_pll_ctrl |= (VCU_PLL_CTRL_DEFAULT & VCU_PLL_CTRL_PWR_POR_MASK) <<
> +			 VCU_PLL_CTRL_PWR_POR_SHIFT;
> +	xvcu_write(xvcu->vcu_slcr_ba, VCU_PLL_CTRL, vcu_pll_ctrl);
> +
> +	/* Set divisor for the core and mcu clock */
> +	ctrl = xvcu_read(xvcu->vcu_slcr_ba, VCU_ENC_CORE_CTRL);
> +	ctrl &= ~(VCU_PLL_DIVISOR_MASK << VCU_PLL_DIVISOR_SHIFT);
> +	ctrl |= (divisor_core & VCU_PLL_DIVISOR_MASK) <<
> +		 VCU_PLL_DIVISOR_SHIFT;
> +	ctrl &= ~(VCU_SRCSEL_MASK << VCU_SRCSEL_SHIFT);
> +	ctrl |= (VCU_SRCSEL_PLL & VCU_SRCSEL_MASK) << VCU_SRCSEL_SHIFT;
> +	xvcu_write(xvcu->vcu_slcr_ba, VCU_ENC_CORE_CTRL, ctrl);
> +
> +	ctrl = xvcu_read(xvcu->vcu_slcr_ba, VCU_DEC_CORE_CTRL);
> +	ctrl &= ~(VCU_PLL_DIVISOR_MASK << VCU_PLL_DIVISOR_SHIFT);
> +	ctrl |= (divisor_core & VCU_PLL_DIVISOR_MASK) <<
> +		 VCU_PLL_DIVISOR_SHIFT;
> +	ctrl &= ~(VCU_SRCSEL_MASK << VCU_SRCSEL_SHIFT);
> +	ctrl |= (VCU_SRCSEL_PLL & VCU_SRCSEL_MASK) << VCU_SRCSEL_SHIFT;
> +	xvcu_write(xvcu->vcu_slcr_ba, VCU_DEC_CORE_CTRL, ctrl);
> +
> +	ctrl = xvcu_read(xvcu->vcu_slcr_ba, VCU_ENC_MCU_CTRL);
> +	ctrl &= ~(VCU_PLL_DIVISOR_MASK << VCU_PLL_DIVISOR_SHIFT);
> +	ctrl |= (divisor_mcu & VCU_PLL_DIVISOR_MASK) << VCU_PLL_DIVISOR_SHIFT;
> +	ctrl &= ~(VCU_SRCSEL_MASK << VCU_SRCSEL_SHIFT);
> +	ctrl |= (VCU_SRCSEL_PLL & VCU_SRCSEL_MASK) << VCU_SRCSEL_SHIFT;
> +	xvcu_write(xvcu->vcu_slcr_ba, VCU_ENC_MCU_CTRL, ctrl);
> +
> +	ctrl = xvcu_read(xvcu->vcu_slcr_ba, VCU_DEC_MCU_CTRL);
> +	ctrl &= ~(VCU_PLL_DIVISOR_MASK << VCU_PLL_DIVISOR_SHIFT);
> +	ctrl |= (divisor_mcu & VCU_PLL_DIVISOR_MASK) << VCU_PLL_DIVISOR_SHIFT;
> +	ctrl &= ~(VCU_SRCSEL_MASK << VCU_SRCSEL_SHIFT);
> +	ctrl |= (VCU_SRCSEL_PLL & VCU_SRCSEL_MASK) << VCU_SRCSEL_SHIFT;
> +	xvcu_write(xvcu->vcu_slcr_ba, VCU_DEC_MCU_CTRL, ctrl);
> +
> +	/* Set RES, CP, LFHF, LOCK_CNT and LOCK_DLY cfg values */
> +	cfg_val = (found->res << VCU_PLL_CFG_RES_SHIFT) |
> +		   (found->cp << VCU_PLL_CFG_CP_SHIFT) |
> +		   (found->lfhf << VCU_PLL_CFG_LFHF_SHIFT) |
> +		   (found->lock_cnt << VCU_PLL_CFG_LOCK_CNT_SHIFT) |
> +		   (found->lock_dly << VCU_PLL_CFG_LOCK_DLY_SHIFT);
> +	xvcu_write(xvcu->vcu_slcr_ba, VCU_PLL_CFG, cfg_val);
> +
> +	return 0;
> +}
> +
> +/**
> + * xvcu_set_pll - PLL init sequence
> + * @xvcu:	Pointer to the xvcu_device structure
> + *
> + * Call the api to set the PLL info and once that is done then
> + * init the PLL sequence to make the PLL stable.
> + *
> + * Return:	Returns status, either success or error+reason
> + */
> +static int xvcu_set_pll(struct xvcu_device *xvcu)
> +{
> +	u32 lock_status;
> +	unsigned long timeout;
> +	int ret;
> +
> +	ret = xvcu_set_vcu_pll_info(xvcu);
> +	if (ret) {
> +		dev_err(xvcu->dev, "failed to set pll info\n");
> +		return ret;
> +	}
> +
> +	xvcu_write_field_reg(xvcu->vcu_slcr_ba, VCU_PLL_CTRL,
> +			     1, VCU_PLL_CTRL_BYPASS_MASK,
> +			     VCU_PLL_CTRL_BYPASS_SHIFT);
> +	xvcu_write_field_reg(xvcu->vcu_slcr_ba, VCU_PLL_CTRL,
> +			     1, VCU_PLL_CTRL_RESET_MASK,
> +			     VCU_PLL_CTRL_RESET_SHIFT);
> +	xvcu_write_field_reg(xvcu->vcu_slcr_ba, VCU_PLL_CTRL,
> +			     0, VCU_PLL_CTRL_RESET_MASK,
> +			     VCU_PLL_CTRL_RESET_SHIFT);
> +	/* Defined the timeout for the max time to wait the

comment style.

> +	 * PLL_STATUS to be locked.
> +	 */
> +	timeout = jiffies + msecs_to_jiffies(2000);
> +	do {
> +		lock_status = xvcu_read(xvcu->vcu_slcr_ba, VCU_PLL_STATUS);
> +		if (lock_status & VCU_PLL_STATUS_LOCK_STATUS_MASK) {
> +			xvcu_write_field_reg(xvcu->vcu_slcr_ba, VCU_PLL_CTRL,
> +					     0, VCU_PLL_CTRL_BYPASS_MASK,
> +					     VCU_PLL_CTRL_BYPASS_SHIFT);
> +			return 0;
> +		}
> +	} while (!time_after(jiffies, timeout));
> +
> +	/* PLL is not locked even after the timeout of the 2sec */
> +	dev_err(xvcu->dev, "PLL is not locked\n");
> +	return -ETIMEDOUT;
> +}
> +
> +/**
> + * xvcu_probe - Probe existence of the logicoreIP
> + *			and initialize PLL
> + *
> + * @pdev:	Pointer to the platform_device structure
> + *
> + * Return:	Returns 0 on success
> + *		Negative error code otherwise
> + */
> +static int xvcu_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	struct xvcu_device *xvcu;
> +	int ret;
> +
> +	xvcu = devm_kzalloc(&pdev->dev, sizeof(*xvcu), GFP_KERNEL);
> +	if (!xvcu)
> +		return -ENOMEM;
> +
> +	xvcu->dev = &pdev->dev;
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "vcu_slcr");
> +	if (!res) {
> +		dev_err(&pdev->dev, "get vcu_slcr memory resource failed.\n");
> +		return -ENODEV;
> +	}
> +
> +	xvcu->vcu_slcr_ba = devm_ioremap_nocache(&pdev->dev,
> +			res->start, resource_size(res));
> +	if (!xvcu->vcu_slcr_ba) {
> +		dev_err(&pdev->dev, "vcu_slcr register mapping failed.\n");
> +		return -ENOMEM;
> +	}
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "logicore");
> +	if (!res) {
> +		dev_err(&pdev->dev, "get logicore memory resource failed.\n");
> +		return -ENODEV;
> +	}
> +
> +	xvcu->logicore_reg_ba = devm_ioremap_nocache(&pdev->dev,
> +			res->start, resource_size(res));
> +	if (!xvcu->logicore_reg_ba) {
> +		dev_err(&pdev->dev, "logicore register mapping failed.\n");
> +		return -ENOMEM;
> +	}
> +
> +	xvcu->aclk = devm_clk_get(&pdev->dev, "aclk");
> +	if (IS_ERR(xvcu->aclk)) {
> +		dev_err(&pdev->dev, "Could not get aclk clock\n");
> +		return PTR_ERR(xvcu->aclk);
> +	}
> +
> +	xvcu->pll_ref = devm_clk_get(&pdev->dev, "pll_ref");
> +	if (IS_ERR(xvcu->pll_ref)) {
> +		dev_err(&pdev->dev, "Could not get pll_ref clock\n");
> +		return PTR_ERR(xvcu->pll_ref);
> +	}
> +
> +	ret = clk_prepare_enable(xvcu->aclk);
> +	if (ret) {
> +		dev_err(&pdev->dev, "aclk clock enable failed\n");
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(xvcu->pll_ref);
> +	if (ret) {
> +		dev_err(&pdev->dev, "pll_ref clock enable failed\n");
> +		goto error_aclk;
> +	}
> +
> +	/* Do the Gasket isolation and put the VCU out of reset

comment style.

> +	 * Bit 0 : Gasket isolation
> +	 * Bit 1 : put VCU out of reset
> +	 */
> +	xvcu_write(xvcu->logicore_reg_ba, VCU_GASKET_INIT, VCU_GASKET_VALUE);
> +
> +	/* Do the PLL Settings based on the ref clk,core and mcu clk freq */
> +	ret = xvcu_set_pll(xvcu);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to set the pll\n");
> +		goto error_pll_ref;
> +	}
> +
> +	dev_set_drvdata(&pdev->dev, xvcu);
> +
> +	dev_info(&pdev->dev, "%s: Probed successfully\n", __func__);
> +
> +	return 0;
> +
> +error_pll_ref:
> +	clk_disable_unprepare(xvcu->pll_ref);
> +error_aclk:
> +	clk_disable_unprepare(xvcu->aclk);
> +	return ret;
> +}
> +
> +/**
> + * xvcu_remove - Insert gasket isolation
> + *			and disable the clock
> + * @pdev:	Pointer to the platform_device structure
> + *
> + * Return:	Returns 0 on success
> + *		Negative error code otherwise
> + */
> +static int xvcu_remove(struct platform_device *pdev)
> +{
> +	struct xvcu_device *xvcu;
> +
> +	xvcu = platform_get_drvdata(pdev);
> +	if (!xvcu)
> +		return -ENODEV;
> +
> +	/* Add the the Gasket isolation and put the VCU in reset.

style.

> +	 */
> +	xvcu_write(xvcu->logicore_reg_ba, VCU_GASKET_INIT, 0);
> +
> +	clk_disable_unprepare(xvcu->pll_ref);
> +	clk_disable_unprepare(xvcu->aclk);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id xvcu_of_id_table[] = {
> +	{ .compatible = "xlnx,vcu" },
> +	{ .compatible = "xlnx,vcu-logicoreip-1.0" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, xvcu_of_id_table);
> +
> +static struct platform_driver xvcu_driver = {
> +	.driver = {
> +		.name           = "xilinx-vcu",
> +		.of_match_table = xvcu_of_id_table,
> +	},
> +	.probe                  = xvcu_probe,
> +	.remove                 = xvcu_remove,
> +};
> +
> +module_platform_driver(xvcu_driver);
> +
> +MODULE_AUTHOR("Dhaval Shah <dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>");
> +MODULE_DESCRIPTION("Xilinx VCU init Driver");
> +MODULE_LICENSE("GPL v2");
> 

The code has several divide operations. Does it build OK for 32-bit target?

-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
