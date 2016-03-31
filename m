From: Lars Persson <lars.persson-VrBV9hrLPhE@public.gmane.org>
Subject: [PATCH v5 2/2] clk: add artpec-6 clock controller
Date: Thu, 31 Mar 2016 20:02:51 +0200
Message-ID: <24806729fd9726fe79d315a3c88ecf1c9ea237ef.1459447089.git.larper@axis.com>
References: <cover.1459447089.git.larper@axis.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1459447089.git.larper-VrBV9hrLPhE@public.gmane.org>
In-Reply-To: <cover.1459447089.git.larper-VrBV9hrLPhE@public.gmane.org>
References: <cover.1459447089.git.larper-VrBV9hrLPhE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lars Persson <larper-VrBV9hrLPhE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a driver for the main clock controller of the Artpec-6 Soc.

Signed-off-by: Lars Persson <larper-VrBV9hrLPhE@public.gmane.org>
---
 MAINTAINERS                    |   2 +-
 drivers/clk/Makefile           |   1 +
 drivers/clk/axis/Makefile      |   1 +
 drivers/clk/axis/clk-artpec6.c | 230 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 233 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/axis/Makefile
 create mode 100644 drivers/clk/axis/clk-artpec6.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 378ebff..074e39e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -973,7 +973,7 @@ S:	Maintained
 L:	linux-arm-kernel-VrBV9hrLPhE@public.gmane.org
 F:	arch/arm/mach-artpec
 F:	arch/arm/boot/dts/artpec6*
-F:	drivers/clk/clk-artpec6.c
+F:	drivers/clk/axis
 
 ARM/ATMEL AT91RM9200, AT91SAM9 AND SAMA5 SOC SUPPORT
 M:	Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 46869d6..ca9aa7b 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_COMMON_CLK_WM831X)		+= clk-wm831x.o
 obj-$(CONFIG_COMMON_CLK_XGENE)		+= clk-xgene.o
 obj-$(CONFIG_COMMON_CLK_PWM)		+= clk-pwm.o
 obj-$(CONFIG_COMMON_CLK_AT91)		+= at91/
+obj-$(CONFIG_ARCH_ARTPEC)		+= axis/
 obj-y					+= bcm/
 obj-$(CONFIG_ARCH_BERLIN)		+= berlin/
 obj-$(CONFIG_ARCH_HISI)			+= hisilicon/
diff --git a/drivers/clk/axis/Makefile b/drivers/clk/axis/Makefile
new file mode 100644
index 0000000..628c9d3
--- /dev/null
+++ b/drivers/clk/axis/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_MACH_ARTPEC6)	+= clk-artpec6.o
diff --git a/drivers/clk/axis/clk-artpec6.c b/drivers/clk/axis/clk-artpec6.c
new file mode 100644
index 0000000..cf716f1
--- /dev/null
+++ b/drivers/clk/axis/clk-artpec6.c
@@ -0,0 +1,230 @@
+/*
+ * ARTPEC-6 clock initialization
+ *
+ * Copyright 2015-2016 Axis Comunications AB.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/clkdev.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/clock/axis,artpec6-clkctrl.h>
+
+#define NUM_I2S_CLOCKS 2
+
+struct artpec6_clkctrl_drvdata {
+	struct clk *clk_table[ARTPEC6_CLK_NUMCLOCKS];
+	void __iomem *syscon_base;
+	struct clk_onecell_data clk_data;
+	spinlock_t i2scfg_lock;
+};
+
+
+static struct artpec6_clkctrl_drvdata *clkdata;
+
+static const char *i2s_clk_names[NUM_I2S_CLOCKS] = {
+	"i2s0",
+	"i2s1",
+};
+
+static const int i2s_clk_indexes[NUM_I2S_CLOCKS] = {
+	ARTPEC6_CLK_I2S0_CLK,
+	ARTPEC6_CLK_I2S1_CLK,
+};
+
+static void of_artpec6_clkctrl_setup(struct device_node *np)
+{
+	int i;
+	const char *sys_refclk_name;
+	u32 pll_mode, pll_m, pll_n;
+
+	pr_info("of_artpec6_clkctrl_setup\n");
+
+	/* Mandatory parent clock. */
+	i = of_property_match_string(np, "clock-names", "sys_refclk");
+	if (i < 0)
+		return;
+
+	sys_refclk_name = of_clk_get_parent_name(np, i);
+
+	clkdata = kzalloc(sizeof(*clkdata), GFP_KERNEL);
+	if (!clkdata)
+		return;
+
+	for (i = 0; i < ARTPEC6_CLK_NUMCLOCKS; ++i)
+		clkdata->clk_table[i] = ERR_PTR(-EPROBE_DEFER);
+
+	clkdata->syscon_base = of_iomap(np, 0);
+
+	/* Read PLL1 factors configured by boot strap pins. */
+	pll_mode = (readl(clkdata->syscon_base) >> 6) & 3;
+	switch (pll_mode) {
+	case 0:		/* DDR3-2133 mode */
+		pll_m = 4;
+		pll_n = 85;
+		break;
+	case 1:		/* DDR3-1866 mode */
+		pll_m = 6;
+		pll_n = 112;
+		break;
+	case 2:		/* DDR3-1600 mode */
+		pll_m = 4;
+		pll_n = 64;
+		break;
+	case 3:		/* DDR3-1333 mode */
+		pll_m = 8;
+		pll_n = 106;
+		break;
+	}
+
+	clkdata->clk_table[ARTPEC6_CLK_CPU] =
+	    clk_register_fixed_factor(NULL, "cpu", sys_refclk_name, 0, pll_n,
+				      pll_m);
+	clkdata->clk_table[ARTPEC6_CLK_CPU_PERIPH] =
+	    clk_register_fixed_factor(NULL, "cpu_periph", "cpu", 0, 1, 2);
+
+	/* EPROBE_DEFER on the apb_clock is not handled in amba devices. */
+	clkdata->clk_table[ARTPEC6_CLK_UART_PCLK] =
+	    clk_register_fixed_factor(NULL, "uart_pclk", "cpu", 0, 1, 8);
+	clkdata->clk_table[ARTPEC6_CLK_UART_REFCLK] =
+	    clk_register_fixed_rate(NULL, "uart_ref", sys_refclk_name, 0,
+				    50000000);
+
+	clkdata->clk_table[ARTPEC6_CLK_SPI_PCLK] =
+	    clk_register_fixed_factor(NULL, "spi_pclk", "cpu", 0, 1, 8);
+	clkdata->clk_table[ARTPEC6_CLK_SPI_SSPCLK] =
+	    clk_register_fixed_rate(NULL, "spi_sspclk", sys_refclk_name, 0,
+				    50000000);
+
+	clkdata->clk_table[ARTPEC6_CLK_DBG_PCLK] =
+	    clk_register_fixed_factor(NULL, "dbg_pclk", "cpu", 0, 1, 8);
+
+	clkdata->clk_data.clks = clkdata->clk_table;
+	clkdata->clk_data.clk_num = ARTPEC6_CLK_NUMCLOCKS;
+
+	of_clk_add_provider(np, of_clk_src_onecell_get, &clkdata->clk_data);
+}
+
+CLK_OF_DECLARE(artpec6_clkctrl, "axis,artpec6-clkctrl",
+	       of_artpec6_clkctrl_setup);
+
+static int artpec6_clkctrl_probe(struct platform_device *pdev)
+{
+	int propidx;
+	struct device_node *np = pdev->dev.of_node;
+	const char *sys_refclk_name;
+	const char *i2s_refclk_name = NULL;
+	const char *frac_clk_name[2] = { NULL, NULL };
+	const char *i2s_mux_parents[2] = { NULL, NULL };
+	u32 muxreg;
+	u32 i;
+
+	/* Mandatory parent clock. */
+	propidx = of_property_match_string(np, "clock-names", "sys_refclk");
+	if (propidx < 0)
+		return -EINVAL;
+
+	sys_refclk_name = of_clk_get_parent_name(np, propidx);
+
+	/* Find clock names of optional parent clocks. */
+	propidx = of_property_match_string(np, "clock-names", "i2s_refclk");
+	if (propidx >= 0)
+		i2s_refclk_name = of_clk_get_parent_name(np, propidx);
+
+	propidx = of_property_match_string(np, "clock-names", "frac_clk0");
+	if (propidx >= 0)
+		frac_clk_name[0] = of_clk_get_parent_name(np, propidx);
+	propidx = of_property_match_string(np, "clock-names", "frac_clk1");
+	if (propidx >= 0)
+		frac_clk_name[1] = of_clk_get_parent_name(np, propidx);
+
+	spin_lock_init(&clkdata->i2scfg_lock);
+
+	clkdata->clk_table[ARTPEC6_CLK_NAND_CLKA] =
+	    clk_register_fixed_factor(NULL, "nand_clka", "cpu", 0, 1, 8);
+	clkdata->clk_table[ARTPEC6_CLK_NAND_CLKB] =
+	    clk_register_fixed_rate(NULL, "nand_clkb", sys_refclk_name, 0,
+				    100000000);
+	clkdata->clk_table[ARTPEC6_CLK_ETH_ACLK] =
+	    clk_register_fixed_factor(NULL, "eth_aclk", "cpu", 0, 1, 4);
+	clkdata->clk_table[ARTPEC6_CLK_DMA_ACLK] =
+	    clk_register_fixed_factor(NULL, "dma_aclk", "cpu", 0, 1, 4);
+	clkdata->clk_table[ARTPEC6_CLK_PTP_REF] =
+	    clk_register_fixed_rate(NULL, "ptp_ref", sys_refclk_name, 0,
+				    100000000);
+	clkdata->clk_table[ARTPEC6_CLK_SD_PCLK] =
+	    clk_register_fixed_rate(NULL, "sd_pclk", sys_refclk_name, 0,
+				    100000000);
+	clkdata->clk_table[ARTPEC6_CLK_SD_IMCLK] =
+	    clk_register_fixed_rate(NULL, "sd_imclk", sys_refclk_name, 0,
+				    100000000);
+	clkdata->clk_table[ARTPEC6_CLK_I2S_HST] =
+	    clk_register_fixed_factor(NULL, "i2s_hst", "cpu", 0, 1, 8);
+
+	for (i = 0; i < NUM_I2S_CLOCKS; ++i) {
+		if (i2s_refclk_name && frac_clk_name[i]) {
+			i2s_mux_parents[0] = frac_clk_name[i];
+			i2s_mux_parents[1] = i2s_refclk_name;
+
+			clkdata->clk_table[i2s_clk_indexes[i]] =
+			    clk_register_mux(NULL, i2s_clk_names[i],
+					     i2s_mux_parents, 2,
+					     CLK_SET_RATE_NO_REPARENT |
+					     CLK_SET_RATE_PARENT,
+					     clkdata->syscon_base + 0x14, i, 1,
+					     0, &clkdata->i2scfg_lock);
+		} else if (frac_clk_name[i]) {
+			/* Lock the mux for internal clock reference. */
+			muxreg = readl(clkdata->syscon_base + 0x14);
+			muxreg &= ~BIT(i);
+			writel(muxreg, clkdata->syscon_base + 0x14);
+			clkdata->clk_table[i2s_clk_indexes[i]] =
+			    clk_register_fixed_factor(NULL, i2s_clk_names[i],
+						      frac_clk_name[i], 0, 1,
+						      1);
+		} else if (i2s_refclk_name) {
+			/* Lock the mux for external clock reference. */
+			muxreg = readl(clkdata->syscon_base + 0x14);
+			muxreg |= BIT(i);
+			writel(muxreg, clkdata->syscon_base + 0x14);
+			clkdata->clk_table[i2s_clk_indexes[i]] =
+			    clk_register_fixed_factor(NULL, i2s_clk_names[i],
+						      i2s_refclk_name, 0, 1, 1);
+		}
+	}
+
+	clkdata->clk_table[ARTPEC6_CLK_I2C] =
+	    clk_register_fixed_rate(NULL, "i2c", sys_refclk_name, 0, 100000000);
+
+	clkdata->clk_table[ARTPEC6_CLK_SYS_TIMER] =
+	    clk_register_fixed_rate(NULL, "timer", sys_refclk_name, 0,
+				    100000000);
+	clkdata->clk_table[ARTPEC6_CLK_FRACDIV_IN] =
+	    clk_register_fixed_rate(NULL, "fracdiv_in", sys_refclk_name, 0,
+				    600000000);
+
+	return 0;
+}
+
+static const struct of_device_id artpec_clkctrl_of_match[] = {
+	{ .compatible = "axis,artpec6-clkctrl" },
+	{},
+};
+
+static struct platform_driver artpec6_clkctrl_driver = {
+	.probe = artpec6_clkctrl_probe,
+	.driver = {
+		.name = "artpec6_clkctrl",
+		.of_match_table = artpec_clkctrl_of_match,
+	},
+};
+
+builtin_platform_driver(artpec6_clkctrl_driver);
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
