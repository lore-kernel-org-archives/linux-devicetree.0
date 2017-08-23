From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 2/2] clk: renesas: cpg-mssr: add R8A7797 support
Date: Wed, 23 Aug 2017 15:52:29 +0300
Message-ID: <20170823125744.424675523@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline; filename=clk-renesas-cpg-mssr-add-R8A7797-support.patch
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Simon Horman <horms+renesas@verge.net.au>
List-Id: devicetree@vger.kernel.org

Add R-Car V3M (R8A7797) Clock Pulse Generator / Module Standby and
Software Reset support, using the CPG/MSSR driver core and the common
R-Car Gen3 code.

Based on the original (and large) patch by Daisuke Matsushita
<daisuke.matsushita.ns@hitachi.com>.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt |    5 
 drivers/clk/renesas/Kconfig                                  |    5 
 drivers/clk/renesas/Makefile                                 |    1 
 drivers/clk/renesas/r8a7797-cpg-mssr.c                       |  207 +++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c                       |    6 
 drivers/clk/renesas/renesas-cpg-mssr.h                       |    1 
 6 files changed, 223 insertions(+), 2 deletions(-)

Index: linux/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
===================================================================
--- linux.orig/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
+++ linux/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
@@ -22,6 +22,7 @@ Required Properties:
       - "renesas,r8a7794-cpg-mssr" for the r8a7794 SoC (R-Car E2)
       - "renesas,r8a7795-cpg-mssr" for the r8a7795 SoC (R-Car H3)
       - "renesas,r8a7796-cpg-mssr" for the r8a7796 SoC (R-Car M3-W)
+      - "renesas,r8a7797-cpg-mssr" for the r8a7797 SoC (R-Car V3M)
 
   - reg: Base address and length of the memory resource used by the CPG/MSSR
     block
@@ -30,8 +31,8 @@ Required Properties:
     clock-names
   - clock-names: List of external parent clock names. Valid names are:
       - "extal" (r8a7743, r8a7745, r8a7790, r8a7791, r8a7792, r8a7793, r8a7794,
-		 r8a7795, r8a7796)
-      - "extalr" (r8a7795, r8a7796)
+		 r8a7795, r8a7796, r8a7797)
+      - "extalr" (r8a7795, r8a7796, r8a7797)
       - "usb_extal" (r8a7743, r8a7745, r8a7790, r8a7791, r8a7793, r8a7794)
 
   - #clock-cells: Must be 2
Index: linux/drivers/clk/renesas/Kconfig
===================================================================
--- linux.orig/drivers/clk/renesas/Kconfig
+++ linux/drivers/clk/renesas/Kconfig
@@ -15,6 +15,7 @@ config CLK_RENESAS
 	select CLK_R8A7794 if ARCH_R8A7794
 	select CLK_R8A7795 if ARCH_R8A7795
 	select CLK_R8A7796 if ARCH_R8A7796
+	select CLK_R8A7797 if ARCH_R8A7797
 	select CLK_SH73A0 if ARCH_SH73A0
 
 if CLK_RENESAS
@@ -94,6 +95,10 @@ config CLK_R8A7796
 	bool
 	select CLK_RCAR_GEN3_CPG
 
+config CLK_R8A7797
+	bool
+	select CLK_RCAR_GEN3_CPG
+
 config CLK_SH73A0
 	bool
 	select CLK_RENESAS_CPG_MSTP
Index: linux/drivers/clk/renesas/Makefile
===================================================================
--- linux.orig/drivers/clk/renesas/Makefile
+++ linux/drivers/clk/renesas/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_CLK_R8A7792)		+= r8a7792-cp
 obj-$(CONFIG_CLK_R8A7794)		+= r8a7794-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A7795)		+= r8a7795-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A7796)		+= r8a7796-cpg-mssr.o
+obj-$(CONFIG_CLK_R8A7797)		+= r8a7797-cpg-mssr.o
 obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
 
 # Family
Index: linux/drivers/clk/renesas/r8a7797-cpg-mssr.c
===================================================================
--- /dev/null
+++ linux/drivers/clk/renesas/r8a7797-cpg-mssr.c
@@ -0,0 +1,207 @@
+/*
+ * r8a7797 Clock Pulse Generator / Module Standby and Software Reset
+ *
+ * Copyright (C) 2017 Cogent Embedded Inc.
+ *
+ * Based on r8a7795-cpg-mssr.c
+ *
+ * Copyright (C) 2015 Glider bvba
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ */
+
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/soc/renesas/rcar-rst.h>
+
+#include <dt-bindings/clock/r8a7797-cpg-mssr.h>
+
+#include "renesas-cpg-mssr.h"
+#include "rcar-gen3-cpg.h"
+
+enum clk_ids {
+	/* Core Clock Outputs exported to DT */
+	LAST_DT_CORE_CLK = R8A7797_CLK_OSC,
+
+	/* External Input Clocks */
+	CLK_EXTAL,
+	CLK_EXTALR,
+
+	/* Internal Core Clocks */
+	CLK_MAIN,
+	CLK_PLL0,
+	CLK_PLL1,
+	CLK_PLL3,
+	CLK_PLL1_DIV2,
+	CLK_PLL1_DIV4,
+	CLK_S1,
+	CLK_S2,
+
+	/* Module Clocks */
+	MOD_CLK_BASE
+};
+
+static const struct cpg_core_clk r8a7797_core_clks[] __initconst = {
+	/* External Clock Inputs */
+	DEF_INPUT("extal",	CLK_EXTAL),
+	DEF_INPUT("extalr",	CLK_EXTALR),
+
+	/* Internal Core Clocks */
+	DEF_BASE(".main",	CLK_MAIN, CLK_TYPE_GEN3_MAIN, CLK_EXTAL),
+	DEF_BASE(".pll0",	CLK_PLL0, CLK_TYPE_GEN3_PLL0, CLK_MAIN),
+	DEF_BASE(".pll1",	CLK_PLL1, CLK_TYPE_GEN3_PLL1, CLK_MAIN),
+	DEF_BASE(".pll3",	CLK_PLL3, CLK_TYPE_GEN3_PLL3, CLK_MAIN),
+
+	DEF_FIXED(".pll1_div2",	CLK_PLL1_DIV2,	CLK_PLL1,	2, 1),
+	DEF_FIXED(".pll1_div4",	CLK_PLL1_DIV4,	CLK_PLL1_DIV2,	2, 1),
+	DEF_FIXED(".s1",	CLK_S1,		CLK_PLL1_DIV2,	4, 1),
+	DEF_FIXED(".s2",	CLK_S2,		CLK_PLL1_DIV2,	6, 1),
+
+	/* Core Clock Outputs */
+	DEF_FIXED("ztr",	R8A7797_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
+	DEF_FIXED("ztrd2",	R8A7797_CLK_ZTRD2, CLK_PLL1_DIV2, 12, 1),
+	DEF_FIXED("zt",		R8A7797_CLK_ZT,    CLK_PLL1_DIV2,  4, 1),
+	DEF_FIXED("zx",		R8A7797_CLK_ZX,    CLK_PLL1_DIV2,  3, 1),
+	DEF_FIXED("s1d1",	R8A7797_CLK_S1D1,  CLK_S1,	   1, 1),
+	DEF_FIXED("s1d2",	R8A7797_CLK_S1D2,  CLK_S1,	   2, 1),
+	DEF_FIXED("s1d4",	R8A7797_CLK_S1D4,  CLK_S1,	   4, 1),
+	DEF_FIXED("s2d1",	R8A7797_CLK_S2D1,  CLK_S2,	   1, 1),
+	DEF_FIXED("s2d2",	R8A7797_CLK_S2D2,  CLK_S2,	   2, 1),
+	DEF_FIXED("s2d4",	R8A7797_CLK_S2D4,  CLK_S2,	   4, 1),
+
+	DEF_FIXED("cl",		R8A7797_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
+	DEF_FIXED("cp",		R8A7797_CLK_CP,    CLK_EXTAL,	   2, 1),
+
+	DEF_DIV6P1("canfd",	R8A7797_CLK_CANFD, CLK_PLL1_DIV4,  0x244),
+	DEF_DIV6P1("mso",	R8A7797_CLK_MSO,   CLK_PLL1_DIV4,  0x014),
+	DEF_DIV6P1("csi0",	R8A7797_CLK_CSI0,  CLK_PLL1_DIV4,  0x00c),
+
+	DEF_FIXED("osc",	R8A7797_CLK_OSC,   CLK_PLL1_DIV2, (12*1024), 1),
+	DEF_FIXED("r",		R8A7797_CLK_R,	   CLK_EXTALR,	   1, 1),
+};
+
+static const struct mssr_mod_clk r8a7797_mod_clks[] __initconst = {
+	DEF_MOD("ivcp1e",		 127,	R8A7797_CLK_S2D1),
+	DEF_MOD("scif4",		 203,	R8A7797_CLK_S2D4),
+	DEF_MOD("scif3",		 204,	R8A7797_CLK_S2D4),
+	DEF_MOD("scif1",		 206,	R8A7797_CLK_S2D4),
+	DEF_MOD("scif0",		 207,	R8A7797_CLK_S2D4),
+	DEF_MOD("msiof3",		 208,	R8A7797_CLK_MSO),
+	DEF_MOD("msiof2",		 209,	R8A7797_CLK_MSO),
+	DEF_MOD("msiof1",		 210,	R8A7797_CLK_MSO),
+	DEF_MOD("msiof0",		 211,	R8A7797_CLK_MSO),
+	DEF_MOD("mfis",			 213,	R8A7797_CLK_S2D2),
+	DEF_MOD("sys-dmac2",		 217,	R8A7797_CLK_S2D1),
+	DEF_MOD("sys-dmac1",		 218,	R8A7797_CLK_S2D1),
+	DEF_MOD("rwdt",			 402,	R8A7797_CLK_R),
+	DEF_MOD("intc-ex",		 407,	R8A7797_CLK_CP),
+	DEF_MOD("intc-ap",		 408,	R8A7797_CLK_S2D1),
+	DEF_MOD("hscif3",		 517,	R8A7797_CLK_S2D1),
+	DEF_MOD("hscif2",		 518,	R8A7797_CLK_S2D1),
+	DEF_MOD("hscif1",		 519,	R8A7797_CLK_S2D1),
+	DEF_MOD("hscif0",		 520,	R8A7797_CLK_S2D1),
+	DEF_MOD("thermal",		 522,	R8A7797_CLK_CP),
+	DEF_MOD("pwm",			 523,	R8A7797_CLK_S2D4),
+	DEF_MOD("fcpvd0",		 603,	R8A7797_CLK_S2D1),
+	DEF_MOD("vspd0",		 623,	R8A7797_CLK_S2D1),
+	DEF_MOD("csi40",		 716,	R8A7797_CLK_CSI0),
+	DEF_MOD("du0",			 724,	R8A7797_CLK_S2D1),
+	DEF_MOD("vin3",			 808,	R8A7797_CLK_S2D1),
+	DEF_MOD("vin2",			 809,	R8A7797_CLK_S2D1),
+	DEF_MOD("vin1",			 810,	R8A7797_CLK_S2D1),
+	DEF_MOD("vin0",			 811,	R8A7797_CLK_S2D1),
+	DEF_MOD("etheravb",		 812,	R8A7797_CLK_S2D2),
+	DEF_MOD("gpio5",		 907,	R8A7797_CLK_CP),
+	DEF_MOD("gpio4",		 908,	R8A7797_CLK_CP),
+	DEF_MOD("gpio3",		 909,	R8A7797_CLK_CP),
+	DEF_MOD("gpio2",		 910,	R8A7797_CLK_CP),
+	DEF_MOD("gpio1",		 911,	R8A7797_CLK_CP),
+	DEF_MOD("gpio0",		 912,	R8A7797_CLK_CP),
+	DEF_MOD("can-fd",		 914,	R8A7797_CLK_S2D2),
+	DEF_MOD("i2c4",			 927,	R8A7797_CLK_S2D2),
+	DEF_MOD("i2c3",			 928,	R8A7797_CLK_S2D2),
+	DEF_MOD("i2c2",			 929,	R8A7797_CLK_S2D2),
+	DEF_MOD("i2c1",			 930,	R8A7797_CLK_S2D2),
+	DEF_MOD("i2c0",			 931,	R8A7797_CLK_S2D2),
+};
+
+static const unsigned int r8a7797_crit_mod_clks[] __initconst = {
+	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
+};
+
+
+/*
+ * CPG Clock Data
+ */
+
+/*
+ *   MD		EXTAL		PLL0	PLL1	PLL3
+ * 14 13 19	(MHz)
+ *-------------------------------------------------
+ * 0  0  0	16.66 x 1	x192	x192	x96
+ * 0  0  1	16.66 x 1	x192	x192	x80
+ * 0  1  0	20    x 1	x160	x160	x80
+ * 0  1  1	20    x 1	x160	x160	x66
+ * 1  0  0	27    / 2	x236	x236	x118
+ * 1  0  1	27    / 2	x236	x236	x98
+ * 1  1  0	33.33 / 2	x192	x192	x96
+ * 1  1  1	33.33 / 2	x192	x192	x80
+ */
+#define CPG_PLL_CONFIG_INDEX(md)	((((md) & BIT(14)) >> 12) | \
+					 (((md) & BIT(13)) >> 12) | \
+					 (((md) & BIT(19)) >> 19))
+
+static const struct rcar_gen3_cpg_pll_config cpg_pll_configs[8] __initconst = {
+	/* EXTAL div	PLL1 mult	PLL3 mult */
+	{ 1,		192,		96,	},
+	{ 1,		192,		80,	},
+	{ 1,		160,		80,	},
+	{ 1,		160,		66,	},
+	{ 2,		236,		118,	},
+	{ 2,		236,		98,	},
+	{ 2,		192,		96,	},
+	{ 2,		192,		80,	},
+};
+
+static int __init r8a7797_cpg_mssr_init(struct device *dev)
+{
+	const struct rcar_gen3_cpg_pll_config *cpg_pll_config;
+	u32 cpg_mode;
+	int error;
+
+	error = rcar_rst_read_mode_pins(&cpg_mode);
+	if (error)
+		return error;
+
+	cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
+	if (!cpg_pll_config->extal_div) {
+		dev_err(dev, "Prohibited setting (cpg_mode=0x%x)\n", cpg_mode);
+		return -EINVAL;
+	}
+
+	return rcar_gen3_cpg_init(cpg_pll_config, CLK_EXTALR, cpg_mode);
+}
+
+const struct cpg_mssr_info r8a7797_cpg_mssr_info __initconst = {
+	/* Core Clocks */
+	.core_clks = r8a7797_core_clks,
+	.num_core_clks = ARRAY_SIZE(r8a7797_core_clks),
+	.last_dt_core_clk = LAST_DT_CORE_CLK,
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Module Clocks */
+	.mod_clks = r8a7797_mod_clks,
+	.num_mod_clks = ARRAY_SIZE(r8a7797_mod_clks),
+	.num_hw_mod_clks = 12 * 32,
+
+	/* Critical Module Clocks */
+	.crit_mod_clks = r8a7797_crit_mod_clks,
+	.num_crit_mod_clks = ARRAY_SIZE(r8a7797_crit_mod_clks),
+
+	/* Callbacks */
+	.init = r8a7797_cpg_mssr_init,
+	.cpg_clk_register = rcar_gen3_cpg_clk_register,
+};
Index: linux/drivers/clk/renesas/renesas-cpg-mssr.c
===================================================================
--- linux.orig/drivers/clk/renesas/renesas-cpg-mssr.c
+++ linux/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -680,6 +680,12 @@ static const struct of_device_id cpg_mss
 		.data = &r8a7796_cpg_mssr_info,
 	},
 #endif
+#ifdef CONFIG_CLK_R8A7797
+	{
+		.compatible = "renesas,r8a7797-cpg-mssr",
+		.data = &r8a7797_cpg_mssr_info,
+	},
+#endif
 	{ /* sentinel */ }
 };
 
Index: linux/drivers/clk/renesas/renesas-cpg-mssr.h
===================================================================
--- linux.orig/drivers/clk/renesas/renesas-cpg-mssr.h
+++ linux/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -138,6 +138,7 @@ extern const struct cpg_mssr_info r8a779
 extern const struct cpg_mssr_info r8a7794_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a7795_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a7796_cpg_mssr_info;
+extern const struct cpg_mssr_info r8a7797_cpg_mssr_info;
 
 
     /*

