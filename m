From: Lars Persson <lars.persson@axis.com>
Subject: [PATCH v2 2/2] clk: add artpec-6 clock controller
Date: Fri, 19 Feb 2016 15:30:15 +0100
Message-ID: <a8281a02d6683648480d634b85b67a18a5688884.1455891890.git.larper@axis.com>
References: <cover.1455891890.git.larper@axis.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1455891890.git.larper@axis.com>
In-Reply-To: <cover.1455891890.git.larper@axis.com>
References: <cover.1455891890.git.larper@axis.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org, Lars Persson <larper@axis.com>
List-Id: devicetree@vger.kernel.org

Add a driver for the main clock controller of the Artpec-6 Soc.

Signed-off-by: Lars Persson <larper@axis.com>
---
 drivers/clk/Makefile                             |   1 +
 drivers/clk/axis/Makefile                        |   1 +
 drivers/clk/axis/clk-artpec6.c                   | 177 +++++++++++++++++++++++
 include/dt-bindings/clock/axis,artpec6-clkctrl.h |  38 +++++
 4 files changed, 217 insertions(+)
 create mode 100644 drivers/clk/axis/Makefile
 create mode 100644 drivers/clk/axis/clk-artpec6.c
 create mode 100644 include/dt-bindings/clock/axis,artpec6-clkctrl.h

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index b038e36..8cd72e7 100644
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
index 0000000..c1e3048
--- /dev/null
+++ b/drivers/clk/axis/clk-artpec6.c
@@ -0,0 +1,177 @@
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
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <dt-bindings/clock/axis,artpec6-clkctrl.h>
+
+struct artpec6_clkctrl_drvdata {
+	struct clk *clk_table[ARTPEC6_CLK_NUMCLOCKS];
+	void __iomem *syscon_base;
+	struct clk_onecell_data clk_data;
+	spinlock_t i2scfg_lock;
+};
+
+static struct artpec6_clkctrl_drvdata *clkdata;
+
+static void of_artpec6_clkctrl_setup(struct device_node *np)
+{
+	int propidx;
+	const char *i2s_refclk_name = NULL;
+	const char *frac_clk_name = NULL;
+	struct clk *sys_refclk;
+	const char *sys_refclk_name;
+	const char *i2s_mux_parents[2] = { NULL, NULL };
+	u32 pll_mode, pll_m, pll_n;
+
+	/* Mandatory parent clock. */
+	sys_refclk = of_clk_get_by_name(np, "sys_refclk");
+	if (IS_ERR(sys_refclk))
+		return;
+
+	sys_refclk_name = __clk_get_name(sys_refclk);
+	if (!sys_refclk_name)
+		return;
+
+	clkdata = kzalloc(sizeof(*clkdata), GFP_KERNEL);
+	if (!clkdata)
+		return;
+
+	/* Find clock names of optional parent clocks. */
+	propidx = of_property_match_string(np, "clock-names", "i2s_refclk");
+	if (propidx >= 0)
+		i2s_refclk_name = of_clk_get_parent_name(np, propidx);
+
+	propidx = of_property_match_string(np, "clock-names", "frac_clk");
+	if (propidx >= 0)
+		frac_clk_name = of_clk_get_parent_name(np, propidx);
+
+	spin_lock_init(&clkdata->i2scfg_lock);
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
+	if (i2s_refclk_name && frac_clk_name) {
+		i2s_mux_parents[0] = frac_clk_name;
+		i2s_mux_parents[1] = i2s_refclk_name;
+
+		clkdata->clk_table[ARTPEC6_CLK_I2S0_CLK] =
+		    clk_register_mux(NULL, "i2s0", i2s_mux_parents, 2,
+				     CLK_SET_RATE_NO_REPARENT |
+				     CLK_SET_RATE_PARENT,
+				     clkdata->syscon_base + 0x14, 0, 1, 0,
+				     &clkdata->i2scfg_lock);
+
+		clkdata->clk_table[ARTPEC6_CLK_I2S1_CLK] =
+		    clk_register_mux(NULL, "i2s1", i2s_mux_parents, 2,
+				     CLK_SET_RATE_NO_REPARENT |
+				     CLK_SET_RATE_PARENT,
+				     clkdata->syscon_base + 0x14, 1, 1, 0,
+				     &clkdata->i2scfg_lock);
+	} else if (frac_clk_name) {
+		/* Lock the mux for internal clock reference. */
+		writel(0x0, clkdata->syscon_base + 0x14);
+		clkdata->clk_table[ARTPEC6_CLK_I2S0_CLK] =
+			clk_register_fixed_factor(NULL, "i2s0", frac_clk_name,
+						  0, 1, 1);
+		clkdata->clk_table[ARTPEC6_CLK_I2S1_CLK] =
+			clk_register_fixed_factor(NULL, "i2s1", frac_clk_name,
+						  0, 1, 1);
+	} else if (i2s_refclk_name) {
+		/* Lock the mux for external clock reference. */
+		writel(0x3, clkdata->syscon_base + 0x14);
+		clkdata->clk_table[ARTPEC6_CLK_I2S0_CLK] =
+			clk_register_fixed_factor(NULL, "i2s0", i2s_refclk_name,
+						  0, 1, 1);
+		clkdata->clk_table[ARTPEC6_CLK_I2S1_CLK] =
+			clk_register_fixed_factor(NULL, "i2s1", i2s_refclk_name,
+						  0, 1, 1);
+	}
+
+	clkdata->clk_table[ARTPEC6_CLK_UART_PCLK] =
+	    clk_register_fixed_factor(NULL, "uart_pclk", "cpu", 0, 1, 8);
+	clkdata->clk_table[ARTPEC6_CLK_UART_REFCLK] =
+	    clk_register_fixed_rate(NULL, "uart_ref", sys_refclk_name, 0,
+				    50000000);
+	clkdata->clk_table[ARTPEC6_CLK_I2C] =
+	    clk_register_fixed_rate(NULL, "i2c", sys_refclk_name, 0, 100000000);
+	clkdata->clk_table[ARTPEC6_CLK_SPI_PCLK] =
+	    clk_register_fixed_factor(NULL, "spi_pclk", "cpu", 0, 1, 8);
+	clkdata->clk_table[ARTPEC6_CLK_SPI_SSPCLK] =
+	    clk_register_fixed_rate(NULL, "spi_sspclk", sys_refclk_name, 0,
+				    50000000);
+	clkdata->clk_table[ARTPEC6_CLK_SYS_TIMER] =
+	    clk_register_fixed_rate(NULL, "timer", sys_refclk_name, 0,
+				    100000000);
+	clkdata->clk_table[ARTPEC6_CLK_FRACDIV_IN] =
+	    clk_register_fixed_rate(NULL, "fracdiv_in", sys_refclk_name, 0,
+				    600000000);
+	clkdata->clk_table[ARTPEC6_CLK_DBG_PCLK] =
+	    clk_register_fixed_factor(NULL, "dbg_pclk", "cpu", 0, 1, 8);
+
+	clkdata->clk_data.clks = clkdata->clk_table;
+	clkdata->clk_data.clk_num = ARTPEC6_CLK_NUMCLOCKS;
+
+	of_clk_add_provider(np, of_clk_src_onecell_get,
+			    &clkdata->clk_data);
+}
+
+CLK_OF_DECLARE(artpec6_clkctrl, "axis,artpec6-clkctrl",
+	       of_artpec6_clkctrl_setup);
diff --git a/include/dt-bindings/clock/axis,artpec6-clkctrl.h b/include/dt-bindings/clock/axis,artpec6-clkctrl.h
new file mode 100644
index 0000000..f9f04dc
--- /dev/null
+++ b/include/dt-bindings/clock/axis,artpec6-clkctrl.h
@@ -0,0 +1,38 @@
+/*
+ * ARTPEC-6 clock controller indexes
+ *
+ * Copyright 2016 Axis Comunications AB.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef DT_BINDINGS_CLK_ARTPEC6_CLKCTRL_H
+#define DT_BINDINGS_CLK_ARTPEC6_CLKCTRL_H
+
+#define ARTPEC6_CLK_CPU			0
+#define ARTPEC6_CLK_CPU_PERIPH		1
+#define ARTPEC6_CLK_NAND_CLKA		2
+#define ARTPEC6_CLK_NAND_CLKB		3
+#define ARTPEC6_CLK_ETH_ACLK		4
+#define ARTPEC6_CLK_DMA_ACLK		5
+#define ARTPEC6_CLK_PTP_REF		6
+#define ARTPEC6_CLK_SD_PCLK		7
+#define ARTPEC6_CLK_SD_IMCLK		8
+#define ARTPEC6_CLK_I2S_HST		9
+#define ARTPEC6_CLK_I2S0_CLK		10
+#define ARTPEC6_CLK_I2S1_CLK		11
+#define ARTPEC6_CLK_UART_PCLK		12
+#define ARTPEC6_CLK_UART_REFCLK		13
+#define ARTPEC6_CLK_I2C			14
+#define ARTPEC6_CLK_SPI_PCLK		15
+#define ARTPEC6_CLK_SPI_SSPCLK		16
+#define ARTPEC6_CLK_SYS_TIMER		17
+#define ARTPEC6_CLK_FRACDIV_IN		18
+#define ARTPEC6_CLK_DBG_PCLK		19
+
+/* This must be the highest clock index plus one. */
+#define ARTPEC6_CLK_NUMCLOCKS		20
+
+#endif
-- 
2.1.4
