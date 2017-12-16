From: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH v4 2/2] misc: xlnx_vcu: Add Xilinx ZYNQMP VCU logicoreIP
 init driver
Date: Sat, 16 Dec 2017 14:18:05 -0800
Message-ID: <d9e263f9-827c-656d-77fd-bbbb2b172040@infradead.org>
References: <29198c0a-783e-8aa0-00e4-44b1fa1acef7@infradead.org>
 <1513322656-4571-1-git-send-email-dshah@xilinx.com>
 <1513322656-4571-3-git-send-email-dshah@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513322656-4571-3-git-send-email-dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dhaval Shah <dhaval.shah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, Dhaval Shah <dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/14/2017 11:24 PM, Dhaval Shah wrote:
> Xilinx ZYNQMP logicoreIP Init driver is based on the new
> LogiCoreIP design created. This driver provides the processing system
> and programmable logic isolation. Set the frequency based on the clock
> information get from the logicoreIP register set.
> 
> It is put in drivers/misc as there is no subsystem for this logicoreIP.
> 
> Signed-off-by: Dhaval Shah <dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
> 
>  drivers/misc/Kconfig    |  15 ++
>  drivers/misc/Makefile   |   1 +
>  drivers/misc/xlnx_vcu.c | 631 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 647 insertions(+)
>  create mode 100644 drivers/misc/xlnx_vcu.c

> diff --git a/drivers/misc/xlnx_vcu.c b/drivers/misc/xlnx_vcu.c
> new file mode 100644
> index 0000000..f489d34
> --- /dev/null
> +++ b/drivers/misc/xlnx_vcu.c
> @@ -0,0 +1,631 @@
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

[snip]


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
> +	/*
> +	 * The divide-by-2 should be always enabled (==1)
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

When does that for loop terminate?

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

[snip]

-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
