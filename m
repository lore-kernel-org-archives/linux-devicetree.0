From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/4] clk: renesas: cpg-mssr: Add R8A77995 support
Date: Thu, 20 Jul 2017 14:40:09 +0200
Message-ID: <1500554409-22423-5-git-send-email-geert+renesas@glider.be>
References: <1500554409-22423-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1500554409-22423-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add R-Car D3 (R8A77995) Clock Pulse Generator / Module Standby and
Software Reset support, using the CPG/MSSR driver core and the common
R-Car Gen3 CPG code.

Based on the R-Car Series, 3rd Generation Hardware User's Manual, Rev.
0.55, Jun. 30, 2017.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org
---
Notes:
  - I couldn't verify the parent clocks of all module clocks.
    For e.g. SYS-DMAC and some multimedia devices, I looked at how
    related clocks were changed among R-Car H3, M3-W, and D3.
  - For now, R clock handling is hardwired to internal RCLK.
---
 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   3 +-
 drivers/clk/renesas/Kconfig                        |   5 +
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r8a77995-cpg-mssr.c            | 236 +++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c             |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |   1 +
 6 files changed, 251 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/renesas/r8a77995-cpg-mssr.c

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
index 0cd894f987a38e81..27cec325853852fc 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
@@ -22,6 +22,7 @@ Required Properties:
       - "renesas,r8a7794-cpg-mssr" for the r8a7794 SoC (R-Car E2)
       - "renesas,r8a7795-cpg-mssr" for the r8a7795 SoC (R-Car H3)
       - "renesas,r8a7796-cpg-mssr" for the r8a7796 SoC (R-Car M3-W)
+      - "renesas,r8a77995-cpg-mssr" for the r8a77995 SoC (R-Car D3)
 
   - reg: Base address and length of the memory resource used by the CPG/MSSR
     block
@@ -30,7 +31,7 @@ Required Properties:
     clock-names
   - clock-names: List of external parent clock names. Valid names are:
       - "extal" (r8a7743, r8a7745, r8a7790, r8a7791, r8a7792, r8a7793, r8a7794,
-		 r8a7795, r8a7796)
+		 r8a7795, r8a7796, r8a77995)
       - "extalr" (r8a7795, r8a7796)
       - "usb_extal" (r8a7743, r8a7745, r8a7790, r8a7791, r8a7793, r8a7794)
 
diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 85526ca3920229c8..eee076deb739c500 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -15,6 +15,7 @@ config CLK_RENESAS
 	select CLK_R8A7794 if ARCH_R8A7794
 	select CLK_R8A7795 if ARCH_R8A7795
 	select CLK_R8A7796 if ARCH_R8A7796
+	select CLK_R8A77995 if ARCH_R8A77995
 	select CLK_SH73A0 if ARCH_SH73A0
 
 if CLK_RENESAS
@@ -94,6 +95,10 @@ config CLK_R8A7796
 	bool "R-Car M3-W clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN3_CPG
 
+config CLK_R8A77995
+	bool "R-Car D3 clock support" if COMPILE_TEST
+	select CLK_RCAR_GEN3_CPG
+
 config CLK_SH73A0
 	bool "SH-Mobile AG5 clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSTP
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index 02d04124371f717a..a3bb1fadf1a6f9e7 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_CLK_R8A7792)		+= r8a7792-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A7794)		+= r8a7794-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A7795)		+= r8a7795-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A7796)		+= r8a7796-cpg-mssr.o
+obj-$(CONFIG_CLK_R8A77995)		+= r8a77995-cpg-mssr.o
 obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
 
 # Family
diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
new file mode 100644
index 0000000000000000..e594cf8ee63b64e0
--- /dev/null
+++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
@@ -0,0 +1,236 @@
+/*
+ * r8a77995 Clock Pulse Generator / Module Standby and Software Reset
+ *
+ * Copyright (C) 2017 Glider bvba
+ *
+ * Based on r8a7795-cpg-mssr.c
+ *
+ * Copyright (C) 2015 Glider bvba
+ * Copyright (C) 2015 Renesas Electronics Corp.
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
+#include <dt-bindings/clock/r8a77995-cpg-mssr.h>
+
+#include "renesas-cpg-mssr.h"
+#include "rcar-gen3-cpg.h"
+
+enum clk_ids {
+	/* Core Clock Outputs exported to DT */
+	LAST_DT_CORE_CLK = R8A77995_CLK_CP,
+
+	/* External Input Clocks */
+	CLK_EXTAL,
+
+	/* Internal Core Clocks */
+	CLK_MAIN,
+	CLK_PLL0,
+	CLK_PLL1,
+	CLK_PLL3,
+	CLK_PLL0D2,
+	CLK_PLL0D3,
+	CLK_PLL0D5,
+	CLK_PLL1D2,
+	CLK_PE,
+	CLK_S0,
+	CLK_S1,
+	CLK_S2,
+	CLK_S3,
+	CLK_SDSRC,
+	CLK_SSPSRC,
+
+	/* Module Clocks */
+	MOD_CLK_BASE
+};
+
+static const struct cpg_core_clk r8a77995_core_clks[] __initconst = {
+	/* External Clock Inputs */
+	DEF_INPUT("extal",     CLK_EXTAL),
+
+	/* Internal Core Clocks */
+	DEF_BASE(".main",      CLK_MAIN, CLK_TYPE_GEN3_MAIN,       CLK_EXTAL),
+	DEF_BASE(".pll1",      CLK_PLL1, CLK_TYPE_GEN3_PLL1,       CLK_MAIN),
+	DEF_BASE(".pll3",      CLK_PLL3, CLK_TYPE_GEN3_PLL3,       CLK_MAIN),
+
+	DEF_FIXED(".pll0",     CLK_PLL0,           CLK_MAIN,	   4, 250),
+	DEF_FIXED(".pll0d2",   CLK_PLL0D2,         CLK_PLL0,       2, 1),
+	DEF_FIXED(".pll0d3",   CLK_PLL0D3,         CLK_PLL0,       3, 1),
+	DEF_FIXED(".pll0d5",   CLK_PLL0D5,         CLK_PLL0,       5, 1),
+	DEF_FIXED(".pll1d2",   CLK_PLL1D2,         CLK_PLL1,       2, 1),
+	DEF_FIXED(".pe",       CLK_PE,             CLK_PLL0D3,     4, 1),
+	DEF_FIXED(".s0",       CLK_S0,             CLK_PLL1,       2, 1),
+	DEF_FIXED(".s1",       CLK_S1,             CLK_PLL1,       3, 1),
+	DEF_FIXED(".s2",       CLK_S2,             CLK_PLL1,       4, 1),
+	DEF_FIXED(".s3",       CLK_S3,             CLK_PLL1,       6, 1),
+	DEF_FIXED(".sdsrc",    CLK_SDSRC,          CLK_PLL1,       2, 1),
+
+	/* Core Clock Outputs */
+	DEF_FIXED("z2",        R8A77995_CLK_Z2,    CLK_PLL0D3,     1, 1),
+	DEF_FIXED("ztr",       R8A77995_CLK_ZTR,   CLK_PLL1,       6, 1),
+	DEF_FIXED("zt",        R8A77995_CLK_ZT,    CLK_PLL1,       4, 1),
+	DEF_FIXED("zx",        R8A77995_CLK_ZX,    CLK_PLL1,       3, 1),
+	DEF_FIXED("s0d1",      R8A77995_CLK_S0D1,  CLK_S0,         1, 1),
+	DEF_FIXED("s1d1",      R8A77995_CLK_S1D1,  CLK_S1,         1, 1),
+	DEF_FIXED("s1d2",      R8A77995_CLK_S1D2,  CLK_S1,         2, 1),
+	DEF_FIXED("s1d4",      R8A77995_CLK_S1D4,  CLK_S1,         4, 1),
+	DEF_FIXED("s2d1",      R8A77995_CLK_S2D1,  CLK_S2,         1, 1),
+	DEF_FIXED("s2d2",      R8A77995_CLK_S2D2,  CLK_S2,         2, 1),
+	DEF_FIXED("s2d4",      R8A77995_CLK_S2D4,  CLK_S2,         4, 1),
+	DEF_FIXED("s3d1",      R8A77995_CLK_S3D1,  CLK_S3,         1, 1),
+	DEF_FIXED("s3d2",      R8A77995_CLK_S3D2,  CLK_S3,         2, 1),
+	DEF_FIXED("s3d4",      R8A77995_CLK_S3D4,  CLK_S3,         4, 1),
+
+	DEF_FIXED("cl",        R8A77995_CLK_CL,    CLK_PLL1,      48, 1),
+	DEF_FIXED("cp",        R8A77995_CLK_CP,    CLK_EXTAL,      2, 1),
+	DEF_FIXED("osc",       R8A77995_CLK_OSC,   CLK_EXTAL,    384, 1),
+	DEF_FIXED("r",         R8A77995_CLK_R,     CLK_EXTAL,   1536, 1),
+
+	DEF_GEN3_PE("s1d4c",   R8A77995_CLK_S1D4C, CLK_S1, 4, CLK_PE, 2),
+	DEF_GEN3_PE("s3d1c",   R8A77995_CLK_S3D1C, CLK_S3, 1, CLK_PE, 1),
+	DEF_GEN3_PE("s3d2c",   R8A77995_CLK_S3D2C, CLK_S3, 2, CLK_PE, 2),
+	DEF_GEN3_PE("s3d4c",   R8A77995_CLK_S3D4C, CLK_S3, 4, CLK_PE, 4),
+
+	DEF_GEN3_SD("sd0",     R8A77995_CLK_SD0,   CLK_SDSRC,     0x268),
+
+	DEF_DIV6P1("canfd",    R8A77995_CLK_CANFD, CLK_PLL0D3,    0x244),
+	DEF_DIV6P1("mso",      R8A77995_CLK_MSO,   CLK_PLL1D2,    0x014),
+};
+
+static const struct mssr_mod_clk r8a77995_mod_clks[] __initconst = {
+	DEF_MOD("scif5",		 202,	R8A77995_CLK_S3D4C),
+	DEF_MOD("scif4",		 203,	R8A77995_CLK_S3D4C),
+	DEF_MOD("scif3",		 204,	R8A77995_CLK_S3D4C),
+	DEF_MOD("scif1",		 206,	R8A77995_CLK_S3D4C),
+	DEF_MOD("scif0",		 207,	R8A77995_CLK_S3D4C),
+	DEF_MOD("msiof3",		 208,	R8A77995_CLK_MSO),
+	DEF_MOD("msiof2",		 209,	R8A77995_CLK_MSO),
+	DEF_MOD("msiof1",		 210,	R8A77995_CLK_MSO),
+	DEF_MOD("msiof0",		 211,	R8A77995_CLK_MSO),
+	DEF_MOD("sys-dmac2",		 217,	R8A77995_CLK_S3D1),
+	DEF_MOD("sys-dmac1",		 218,	R8A77995_CLK_S3D1),
+	DEF_MOD("sys-dmac0",		 219,	R8A77995_CLK_S3D1),
+	DEF_MOD("cmt3",			 300,	R8A77995_CLK_R),
+	DEF_MOD("cmt2",			 301,	R8A77995_CLK_R),
+	DEF_MOD("cmt1",			 302,	R8A77995_CLK_R),
+	DEF_MOD("cmt0",			 303,	R8A77995_CLK_R),
+	DEF_MOD("scif2",		 310,	R8A77995_CLK_S3D4C),
+	DEF_MOD("emmc0",		 312,	R8A77995_CLK_SD0),
+	DEF_MOD("usb-dmac0",		 330,	R8A77995_CLK_S3D1),
+	DEF_MOD("usb-dmac1",		 331,	R8A77995_CLK_S3D1),
+	DEF_MOD("rwdt",			 402,	R8A77995_CLK_R),
+	DEF_MOD("intc-ex",		 407,	R8A77995_CLK_CP),
+	DEF_MOD("intc-ap",		 408,	R8A77995_CLK_S3D1),
+	DEF_MOD("audmac0",		 502,	R8A77995_CLK_S3D1),
+	DEF_MOD("hscif3",		 517,	R8A77995_CLK_S3D1C),
+	DEF_MOD("hscif0",		 520,	R8A77995_CLK_S3D1C),
+	DEF_MOD("thermal",		 522,	R8A77995_CLK_CP),
+	DEF_MOD("pwm",			 523,	R8A77995_CLK_S3D4C),
+	DEF_MOD("fcpvd1",		 602,	R8A77995_CLK_S1D2),
+	DEF_MOD("fcpvd0",		 603,	R8A77995_CLK_S1D2),
+	DEF_MOD("fcpvbs",		 607,	R8A77995_CLK_S0D1),
+	DEF_MOD("vspd1",		 622,	R8A77995_CLK_S1D2),
+	DEF_MOD("vspd0",		 623,	R8A77995_CLK_S1D2),
+	DEF_MOD("vspbs",		 627,	R8A77995_CLK_S0D1),
+	DEF_MOD("ehci0",		 703,	R8A77995_CLK_S3D2),
+	DEF_MOD("hsusb",		 704,	R8A77995_CLK_S3D2),
+	DEF_MOD("du1",			 723,	R8A77995_CLK_S2D1),
+	DEF_MOD("du0",			 724,	R8A77995_CLK_S2D1),
+	DEF_MOD("lvds",			 727,	R8A77995_CLK_S2D1),
+	DEF_MOD("vin7",			 804,	R8A77995_CLK_S1D2),
+	DEF_MOD("vin6",			 805,	R8A77995_CLK_S1D2),
+	DEF_MOD("vin5",			 806,	R8A77995_CLK_S1D2),
+	DEF_MOD("vin4",			 807,	R8A77995_CLK_S1D2),
+	DEF_MOD("etheravb",		 812,	R8A77995_CLK_S3D2),
+	DEF_MOD("imr0",			 823,	R8A77995_CLK_S1D2),
+	DEF_MOD("gpio6",		 906,	R8A77995_CLK_S3D4),
+	DEF_MOD("gpio5",		 907,	R8A77995_CLK_S3D4),
+	DEF_MOD("gpio4",		 908,	R8A77995_CLK_S3D4),
+	DEF_MOD("gpio3",		 909,	R8A77995_CLK_S3D4),
+	DEF_MOD("gpio2",		 910,	R8A77995_CLK_S3D4),
+	DEF_MOD("gpio1",		 911,	R8A77995_CLK_S3D4),
+	DEF_MOD("gpio0",		 912,	R8A77995_CLK_S3D4),
+	DEF_MOD("can-fd",		 914,	R8A77995_CLK_S3D2),
+	DEF_MOD("can-if1",		 915,	R8A77995_CLK_S3D4),
+	DEF_MOD("can-if0",		 916,	R8A77995_CLK_S3D4),
+	DEF_MOD("i2c3",			 928,	R8A77995_CLK_S3D2),
+	DEF_MOD("i2c2",			 929,	R8A77995_CLK_S3D2),
+	DEF_MOD("i2c1",			 930,	R8A77995_CLK_S3D2),
+	DEF_MOD("i2c0",			 931,	R8A77995_CLK_S3D2),
+	DEF_MOD("ssi-all",		1005,	R8A77995_CLK_S3D4),
+	DEF_MOD("ssi4",			1011,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi3",			1012,	MOD_CLK_ID(1005)),
+	DEF_MOD("scu-all",		1017,	R8A77995_CLK_S3D4),
+	DEF_MOD("scu-dvc1",		1018,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-dvc0",		1019,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-ctu1-mix1",	1020,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-ctu0-mix0",	1021,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src6",		1025,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src5",		1026,	MOD_CLK_ID(1017)),
+};
+
+static const unsigned int r8a77995_crit_mod_clks[] __initconst = {
+	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
+};
+
+
+/*
+ * CPG Clock Data
+ */
+
+/*
+ * MD19		EXTAL (MHz)	PLL0		PLL1		PLL3
+ *--------------------------------------------------------------------
+ * 0		48 x 1		x250/4		x100/3		x100/3
+ * 1		48 x 1		x250/4		x100/3		x116/6
+ */
+#define CPG_PLL_CONFIG_INDEX(md)	(((md) & BIT(19)) >> 19)
+
+static const struct rcar_gen3_cpg_pll_config cpg_pll_configs[2] __initconst = {
+	/* EXTAL div	PLL1 mult/div	PLL3 mult/div */
+	{ 1,		100,	3,	100,	3,	},
+	{ 1,		100,	3,	116,	6,	},
+};
+
+static int __init r8a77995_cpg_mssr_init(struct device *dev)
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
+
+	return rcar_gen3_cpg_init(cpg_pll_config, 0, cpg_mode);
+}
+
+const struct cpg_mssr_info r8a77995_cpg_mssr_info __initconst = {
+	/* Core Clocks */
+	.core_clks = r8a77995_core_clks,
+	.num_core_clks = ARRAY_SIZE(r8a77995_core_clks),
+	.last_dt_core_clk = LAST_DT_CORE_CLK,
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Module Clocks */
+	.mod_clks = r8a77995_mod_clks,
+	.num_mod_clks = ARRAY_SIZE(r8a77995_mod_clks),
+	.num_hw_mod_clks = 12 * 32,
+
+	/* Critical Module Clocks */
+	.crit_mod_clks = r8a77995_crit_mod_clks,
+	.num_crit_mod_clks = ARRAY_SIZE(r8a77995_crit_mod_clks),
+
+	/* Callbacks */
+	.init = r8a77995_cpg_mssr_init,
+	.cpg_clk_register = rcar_gen3_cpg_clk_register,
+};
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 1f607c806f9b9ec3..e580a5e6346c2533 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -680,6 +680,12 @@ static const struct of_device_id cpg_mssr_match[] = {
 		.data = &r8a7796_cpg_mssr_info,
 	},
 #endif
+#ifdef CONFIG_CLK_R8A77995
+	{
+		.compatible = "renesas,r8a77995-cpg-mssr",
+		.data = &r8a77995_cpg_mssr_info,
+	},
+#endif
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index 43d7c7f6832df0b2..94b9071d1061ab16 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -138,6 +138,7 @@ extern const struct cpg_mssr_info r8a7792_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a7794_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a7795_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a7796_cpg_mssr_info;
+extern const struct cpg_mssr_info r8a77995_cpg_mssr_info;
 
 
     /*
-- 
2.7.4
