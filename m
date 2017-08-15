From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [PATCH v5] clk: sunxi-ng: support R40 SoC
Date: Tue, 15 Aug 2017 16:52:29 +0800
Message-ID: <ba1af994f165b96c096ec03a72836739@aosc.io>
References: <20170815055529.4780-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170815055529.4780-1-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

在 2017-08-15 13:55，Icenowy Zheng 写道：
> Allwinner R40 SoC have a clock controller module in the style of the
> SoCs beyond sun6i, however, it's more rich and complex.
> 
> Add support for it.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
> Changes in v5:
> - Added TODO's for PLL constraints.
> - Forced OHCI12M mux to 0.
> - Changed "adda" clock to "codec" to be consistent with "bus-codec".
> - Added several CLK_SET_RATE_{UNGATE,PARENT} flags.
> - Added PLL_CPU gate notifier.
> Changes in v4:
> - Removed usb-ohci-12M mux clocks.
> - Removed unused (and not in user manual) adda-4x clock.
> - Implemented proper SATA PLL system.
> - Renamed MP (Mixed Processor) clock names to drop the extra "DE_".
> - Renamed TCONs' clock names to "tcon-lcdX" or "tcon-tvX".
> - Added missing RST_DRAM.
> - Several clock post/pre-dividers and constraints fixes.
> Changes in v3:
> - Rebased on current linux-next.
> Changes in v2:
> - Fixes according to the SoC's user manual.
> 
>  drivers/clk/sunxi-ng/Kconfig              |    5 +
>  drivers/clk/sunxi-ng/Makefile             |    1 +
>  drivers/clk/sunxi-ng/ccu-sun8i-r40.c      | 1290 
> +++++++++++++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu-sun8i-r40.h      |   69 ++
>  include/dt-bindings/clock/sun8i-r40-ccu.h |  187 +++++
>  include/dt-bindings/reset/sun8i-r40-ccu.h |  130 +++
>  6 files changed, 1682 insertions(+)
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-r40.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-r40.h
>  create mode 100644 include/dt-bindings/clock/sun8i-r40-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun8i-r40-ccu.h
> 
> [...]
> +static void __init sun8i_r40_ccu_setup(struct device_node *node)
> +{
> +	void __iomem *reg;
> +	u32 val;
> +
> +	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
> +	if (IS_ERR(reg)) {
> +		pr_err("%s: Could not map the clock registers\n",
> +		       of_node_full_name(node));
> +		return;
> +	}
> +
> +	/* Force the PLL-Audio-1x divider to 4 */
> +	val = readl(reg + SUN8I_R40_PLL_AUDIO_REG);
> +	val &= ~GENMASK(19, 16);
> +	writel(val | (3 << 16), reg + SUN8I_R40_PLL_AUDIO_REG);
> +
> +	/* Force PLL-MIPI to MIPI mode */
> +	val = readl(reg + SUN8I_R40_PLL_MIPI_REG);
> +	val &= ~BIT(16);
> +	writel(val, reg + SUN8I_R40_PLL_MIPI_REG);
> +
> +	/* Force OHCI 12M parent to 0 */
> +	val = readl(reg + SUN8I_R40_USB_CLK_REG);
> +	val &= ~GENMASK(20, 6);

Sorry but I think this line should be:

val &= ~GENMASK(25, 20);

I didn't understand GENMASK well...

> +	writel(val, reg + SUN8I_R40_USB_CLK_REG);
> +
> +	sunxi_ccu_probe(node, reg, &sun8i_r40_ccu_desc);
> +
> +	/* Gate then ungate PLL CPU after any rate changes */
> +	ccu_pll_notifier_register(&sun8i_r40_pll_cpu_nb);
> +
> +	/* Reparent CPU during PLL CPU rate changes */
> +	ccu_mux_notifier_register(pll_cpu_clk.common.hw.clk,
> +				  &sun8i_r40_cpu_nb);
> +}
> [...]
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
