Return-Path: <SRS0=xn9O=GR=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  06/12] clk: renesas: cpg-mssr: Add r8a77470 support
Date: Tue, 27 Mar 2018 15:37:17 +0100
Message-Id: <1522161443-54428-7-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1522161443-54428-1-git-send-email-biju.das@bp.renesas.com>
References: <1522161443-54428-1-git-send-email-biju.das@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add RZ/G1C (R8A77470) Clock Pulse Generator / Module Standby and Software
Reset support.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   9 +-
 drivers/clk/renesas/Kconfig                        |   5 +
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r8a7747x-cpg-mssr.c            | 229 +++++++++++++++++++++
 drivers/clk/renesas/rcar-gen2-cpg.c                |  34 ++-
 drivers/clk/renesas/renesas-cpg-mssr.c             |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |   1 +
 7 files changed, 278 insertions(+), 7 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a7747x-cpg-mssr.c

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
index 773a522..c3473df 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
@@ -15,6 +15,7 @@ Required Properties:
   - compatible: Must be one of:
       - "renesas,r8a7743-cpg-mssr" for the r8a7743 SoC (RZ/G1M)
       - "renesas,r8a7745-cpg-mssr" for the r8a7745 SoC (RZ/G1E)
+      - "renesas,r8a77470-cpg-mssr" for the r8a77470 SoC (RZ/G1C)
       - "renesas,r8a7790-cpg-mssr" for the r8a7790 SoC (R-Car H2)
       - "renesas,r8a7791-cpg-mssr" for the r8a7791 SoC (R-Car M2-W)
       - "renesas,r8a7792-cpg-mssr" for the r8a7792 SoC (R-Car V2H)
@@ -33,10 +34,12 @@ Required Properties:
   - clocks: References to external parent clocks, one entry for each entry in
     clock-names
   - clock-names: List of external parent clock names. Valid names are:
-      - "extal" (r8a7743, r8a7745, r8a7790, r8a7791, r8a7792, r8a7793, r8a7794,
-		 r8a7795, r8a7796, r8a77965, r8a77970, r8a77980, r8a77995)
+      - "extal" (r8a7743, r8a7745, r8a77470, r8a7790, r8a7791, r8a7792,
+		 r8a7793, r8a7794, r8a7795, r8a7796, r8a77965, r8a77970,
+		 r8a77980, r8a77995)
       - "extalr" (r8a7795, r8a7796, r8a77965, r8a77970, r8a77980)
-      - "usb_extal" (r8a7743, r8a7745, r8a7790, r8a7791, r8a7793, r8a7794)
+      - "usb_extal" (r8a7743, r8a7745, r8a77470, r8a7790, r8a7791, r8a7793,
+		     r8a7794)
 
   - #clock-cells: Must be 2
       - For CPG core clocks, the two clock specifier cells must be "CPG_CORE"
diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index ef76c86..f32896fa 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -7,6 +7,7 @@ config CLK_RENESAS
 	select CLK_R8A7740 if ARCH_R8A7740
 	select CLK_R8A7743 if ARCH_R8A7743
 	select CLK_R8A7745 if ARCH_R8A7745
+	select CLK_R8A77470 if ARCH_R8A77470
 	select CLK_R8A7778 if ARCH_R8A7778
 	select CLK_R8A7779 if ARCH_R8A7779
 	select CLK_R8A7790 if ARCH_R8A7790
@@ -60,6 +61,10 @@ config CLK_R8A7745
 	bool "RZ/G1E clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN2_CPG
 
+config CLK_R8A77470
+	bool "RZ/G1C clock support" if COMPILE_TEST
+	select CLK_RCAR_GEN2_CPG
+
 config CLK_R8A7778
 	bool "R-Car M1A clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSTP
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index 6c0f196..59c65d0 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_CLK_R8A73A4)		+= clk-r8a73a4.o
 obj-$(CONFIG_CLK_R8A7740)		+= clk-r8a7740.o
 obj-$(CONFIG_CLK_R8A7743)		+= r8a7743-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A7745)		+= r8a7745-cpg-mssr.o
+obj-$(CONFIG_CLK_R8A77470)		+= r8a7747x-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A7778)		+= clk-r8a7778.o
 obj-$(CONFIG_CLK_R8A7779)		+= clk-r8a7779.o
 obj-$(CONFIG_CLK_R8A7790)		+= r8a7790-cpg-mssr.o
diff --git a/drivers/clk/renesas/r8a7747x-cpg-mssr.c b/drivers/clk/renesas/r8a7747x-cpg-mssr.c
new file mode 100644
index 0000000..b6ff95f
--- /dev/null
+++ b/drivers/clk/renesas/r8a7747x-cpg-mssr.c
@@ -0,0 +1,229 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * r8a7747 Clock Pulse Generator / Module Standby and Software Reset
+ *
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ */
+
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/soc/renesas/rcar-rst.h>
+
+#include <dt-bindings/clock/r8a7747x-cpg-mssr.h>
+
+#include "renesas-cpg-mssr.h"
+#include "rcar-gen2-cpg.h"
+
+enum clk_ids {
+	/* Core Clock Outputs exported to DT */
+	LAST_DT_CORE_CLK = R8A77470_CLK_OSC,
+
+	/* External Input Clocks */
+	CLK_EXTAL,
+	CLK_USB_EXTAL,
+
+	/* Internal Core Clocks */
+	CLK_MAIN,
+	CLK_PLL0,
+	CLK_PLL1,
+	CLK_PLL3,
+	CLK_PLL1_DIV2,
+
+	/* Module Clocks */
+	MOD_CLK_BASE
+};
+
+static const struct cpg_core_clk r8a77470_core_clks[] __initconst = {
+	/* External Clock Inputs */
+	DEF_INPUT("extal",	CLK_EXTAL),
+	DEF_INPUT("usb_extal",	CLK_USB_EXTAL),
+
+	/* Internal Core Clocks */
+	DEF_BASE(".main",	CLK_MAIN, CLK_TYPE_GEN2_MAIN, CLK_EXTAL),
+	DEF_BASE(".pll0",	CLK_PLL0, CLK_TYPE_GEN2_PLL0, CLK_MAIN),
+	DEF_BASE(".pll1",	CLK_PLL1, CLK_TYPE_GEN2_PLL1, CLK_MAIN),
+	DEF_BASE(".pll3",	CLK_PLL3, CLK_TYPE_GEN2_PLL3, CLK_MAIN),
+
+	DEF_FIXED(".pll1_div2",	CLK_PLL1_DIV2, CLK_PLL1, 2, 1),
+
+	/* Core Clock Outputs */
+	DEF_BASE("lb",   R8A77470_CLK_LB,   CLK_TYPE_GEN2_LB,	CLK_PLL1),
+	DEF_BASE("sdh",  R8A77470_CLK_SDH,  CLK_TYPE_GEN2_SDH,	CLK_PLL1),
+	DEF_BASE("sd0",  R8A77470_CLK_SD0,  CLK_TYPE_GEN2_SD0,	CLK_PLL1),
+	DEF_BASE("sd1",  R8A77470_CLK_SD1,  CLK_TYPE_GEN2_SD1,	CLK_PLL1),
+	DEF_BASE("qspi", R8A77470_CLK_QSPI, CLK_TYPE_GEN2_QSPI,	CLK_PLL1_DIV2),
+	DEF_BASE("rcan", R8A77470_CLK_RCAN, CLK_TYPE_GEN2_RCAN,	CLK_USB_EXTAL),
+
+	DEF_FIXED("z2",    R8A77470_CLK_Z2,	CLK_PLL0,	    1, 1),
+	DEF_FIXED("zx",    R8A77470_CLK_ZX,	CLK_PLL1,	    3, 1),
+	DEF_FIXED("zs",    R8A77470_CLK_ZS,	CLK_PLL1,	    6, 1),
+	DEF_FIXED("hp",    R8A77470_CLK_HP,	CLK_PLL1,	   12, 1),
+	DEF_FIXED("b",     R8A77470_CLK_B,	CLK_PLL1,	   12, 1),
+	DEF_FIXED("p",     R8A77470_CLK_P,	CLK_PLL1,	   24, 1),
+	DEF_FIXED("cl",    R8A77470_CLK_CL,	CLK_PLL1,	   48, 1),
+	DEF_FIXED("cp",    R8A77470_CLK_CP,	CLK_PLL1,	   48, 1),
+	DEF_FIXED("m2",    R8A77470_CLK_M2,	CLK_PLL1,	    8, 1),
+	DEF_FIXED("zb3",   R8A77470_CLK_ZB3,	CLK_PLL3,	    4, 1),
+	DEF_FIXED("mp",    R8A77470_CLK_MP,	CLK_PLL1_DIV2,	   15, 1),
+	DEF_FIXED("cpex",  R8A77470_CLK_CPEX,	CLK_EXTAL,	    2, 1),
+	DEF_FIXED("r",     R8A77470_CLK_R,	CLK_PLL1,	49152, 1),
+	DEF_FIXED("osc",   R8A77470_CLK_OSC,	CLK_PLL1,	12288, 1),
+
+	DEF_DIV6P1("sd2",  R8A77470_CLK_SD2,	CLK_PLL1_DIV2,	0x078),
+};
+
+static const struct mssr_mod_clk r8a77470_mod_clks[] __initconst = {
+	DEF_MOD("msiof0",		   0,	R8A77470_CLK_MP),
+	DEF_MOD("vcp0",			 101,	R8A77470_CLK_ZS),
+	DEF_MOD("vpc0",			 103,	R8A77470_CLK_ZS),
+	DEF_MOD("tmu1",			 111,	R8A77470_CLK_P),
+	DEF_MOD("3dg",			 112,	R8A77470_CLK_ZS),
+	DEF_MOD("2d-dmac",		 115,	R8A77470_CLK_ZS),
+	DEF_MOD("fdp1-0",		 119,	R8A77470_CLK_ZS),
+	DEF_MOD("tmu3",			 121,	R8A77470_CLK_P),
+	DEF_MOD("tmu2",			 122,	R8A77470_CLK_P),
+	DEF_MOD("cmt0",			 124,	R8A77470_CLK_R),
+	DEF_MOD("vsp1du0",		 128,	R8A77470_CLK_ZS),
+	DEF_MOD("vsp1-sy",		 131,	R8A77470_CLK_ZS),
+	DEF_MOD("msiof2",		 205,	R8A77470_CLK_MP),
+	DEF_MOD("msiof1",		 208,	R8A77470_CLK_MP),
+	DEF_MOD("sys-dmac1",		 218,	R8A77470_CLK_ZS),
+	DEF_MOD("sys-dmac0",		 219,	R8A77470_CLK_ZS),
+	DEF_MOD("sdhi2",		 312,	R8A77470_CLK_SD2),
+	DEF_MOD("sdhi1",		 313,	R8A77470_CLK_SD1),
+	DEF_MOD("sdhi0",		 314,	R8A77470_CLK_SD0),
+	DEF_MOD("usbhs-dmac0-ch1",	 326,	R8A77470_CLK_HP),
+	DEF_MOD("usbhs-dmac1-ch1",	 327,	R8A77470_CLK_HP),
+	DEF_MOD("cmt1",			 329,	R8A77470_CLK_R),
+	DEF_MOD("usbhs-dmac0-ch0",	 330,	R8A77470_CLK_HP),
+	DEF_MOD("usbhs-dmac1-ch0",	 331,	R8A77470_CLK_HP),
+	DEF_MOD("rwdt",			 402,	R8A77470_CLK_R),
+	DEF_MOD("irqc",			 407,	R8A77470_CLK_CP),
+	DEF_MOD("intc-sys",		 408,	R8A77470_CLK_ZS),
+	DEF_MOD("audio-dmac0",		 502,	R8A77470_CLK_HP),
+	DEF_MOD("pwm",			 523,	R8A77470_CLK_P),
+	DEF_MOD("usb-ehci-0",		 703,	R8A77470_CLK_MP),
+	DEF_MOD("usbhs-0",		 704,	R8A77470_CLK_HP),
+	DEF_MOD("usb-ehci-1",		 705,	R8A77470_CLK_MP),
+	DEF_MOD("usbhs-1",		 706,	R8A77470_CLK_HP),
+	DEF_MOD("hscif2",		 713,	R8A77470_CLK_ZS),
+	DEF_MOD("scif5",		 714,	R8A77470_CLK_P),
+	DEF_MOD("scif4",		 715,	R8A77470_CLK_P),
+	DEF_MOD("hscif1",		 716,	R8A77470_CLK_ZS),
+	DEF_MOD("hscif0",		 717,	R8A77470_CLK_ZS),
+	DEF_MOD("scif3",		 718,	R8A77470_CLK_P),
+	DEF_MOD("scif2",		 719,	R8A77470_CLK_P),
+	DEF_MOD("scif1",		 720,	R8A77470_CLK_P),
+	DEF_MOD("scif0",		 721,	R8A77470_CLK_P),
+	DEF_MOD("du1",			 723,	R8A77470_CLK_ZX),
+	DEF_MOD("du0",			 724,	R8A77470_CLK_ZX),
+	DEF_MOD("ipmmu-sgx",		 800,	R8A77470_CLK_ZX),
+	DEF_MOD("etheravb",		 812,	R8A77470_CLK_HP),
+	DEF_MOD("ether",		 813,	R8A77470_CLK_P),
+	DEF_MOD("gpio5",		 907,	R8A77470_CLK_CP),
+	DEF_MOD("gpio4",		 908,	R8A77470_CLK_CP),
+	DEF_MOD("gpio3",		 909,	R8A77470_CLK_CP),
+	DEF_MOD("gpio2",		 910,	R8A77470_CLK_CP),
+	DEF_MOD("gpio1",		 911,	R8A77470_CLK_CP),
+	DEF_MOD("gpio0",		 912,	R8A77470_CLK_CP),
+	DEF_MOD("can1",			 915,	R8A77470_CLK_P),
+	DEF_MOD("can0",			 916,	R8A77470_CLK_P),
+	DEF_MOD("qspi_mod-1",		 917,	R8A77470_CLK_QSPI),
+	DEF_MOD("qspi_mod-0",		 918,	R8A77470_CLK_QSPI),
+	DEF_MOD("i2c4",			 927,	R8A77470_CLK_HP),
+	DEF_MOD("i2c3",			 928,	R8A77470_CLK_HP),
+	DEF_MOD("i2c2",			 929,	R8A77470_CLK_HP),
+	DEF_MOD("i2c1",			 930,	R8A77470_CLK_HP),
+	DEF_MOD("i2c0",			 931,	R8A77470_CLK_HP),
+	DEF_MOD("ssi-all",		1005,	R8A77470_CLK_P),
+	DEF_MOD("ssi9",			1006,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi8",			1007,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi7",			1008,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi6",			1009,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi5",			1010,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi4",			1011,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi3",			1012,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi2",			1013,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi1",			1014,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi0",			1015,	MOD_CLK_ID(1005)),
+	DEF_MOD("scu-all",		1017,	R8A77470_CLK_P),
+	DEF_MOD("scu-dvc1",		1018,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-dvc0",		1019,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-ctu1-mix1",	1020,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-ctu0-mix0",	1021,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src6",		1025,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src5",		1026,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src4",		1027,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src3",		1028,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src2",		1029,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-src1",		1030,	MOD_CLK_ID(1017)),
+};
+
+static const unsigned int r8a77470_crit_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
+	MOD_CLK_ID(408),	/* INTC-SYS (GIC) */
+};
+
+/*
+ * CPG Clock Data
+ */
+
+/*
+ *    MD	EXTAL		PLL0	PLL1	PLL3
+ * 14 13	(MHz)		*1	*2
+ *---------------------------------------------------
+ * 0  0		20		x80/2	x78	x50
+ * 0  1		26		x60/2	x60	x56
+ * 1  0		Prohibitted setting
+ * 1  1		30		x52/2	x52	x50
+ *
+ * *1 :	Table 7.4 indicates VCO output (PLL0 = VCO/2)
+ * *2 :	Table 7.4 indicates VCO output (PLL1 = VCO)
+ */
+#define CPG_PLL_CONFIG_INDEX(md)	((((md) & BIT(14)) >> 13) | \
+					 (((md) & BIT(13)) >> 13))
+
+static const struct rcar_gen2_cpg_pll_config cpg_pll_configs[8] __initconst = {
+	/* EXTAL div	PLL1 mult	PLL3 mult */
+	{ 1,		78,		50,	},
+	{ 1,		60,		56,	},
+	{ /* Invalid*/				},
+	{ 1,		52,		50,	},
+};
+
+static int __init r8a7747x_cpg_mssr_init(struct device *dev)
+{
+	const struct rcar_gen2_cpg_pll_config *cpg_pll_config;
+	u32 cpg_mode;
+	int error;
+
+	error = rcar_rst_read_mode_pins(&cpg_mode);
+	if (error)
+		return error;
+
+	cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
+
+	return rcar_gen2_cpg_init(cpg_pll_config, 2, cpg_mode);
+}
+
+const struct cpg_mssr_info r8a77470_cpg_mssr_info __initconst = {
+	/* Core Clocks */
+	.core_clks = r8a77470_core_clks,
+	.num_core_clks = ARRAY_SIZE(r8a77470_core_clks),
+	.last_dt_core_clk = LAST_DT_CORE_CLK,
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Module Clocks */
+	.mod_clks = r8a77470_mod_clks,
+	.num_mod_clks = ARRAY_SIZE(r8a77470_mod_clks),
+	.num_hw_mod_clks = 12 * 32,
+
+	/* Critical Module Clocks */
+	.crit_mod_clks = r8a77470_crit_mod_clks,
+	.num_crit_mod_clks = ARRAY_SIZE(r8a77470_crit_mod_clks),
+
+	/* Callbacks */
+	.init = r8a7747x_cpg_mssr_init,
+	.cpg_clk_register = rcar_gen2_cpg_clk_register,
+};
diff --git a/drivers/clk/renesas/rcar-gen2-cpg.c b/drivers/clk/renesas/rcar-gen2-cpg.c
index feb1457..dcc2447 100644
--- a/drivers/clk/renesas/rcar-gen2-cpg.c
+++ b/drivers/clk/renesas/rcar-gen2-cpg.c
@@ -16,6 +16,7 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/slab.h>
+#include <linux/sys_soc.h>
 
 #include "renesas-cpg-mssr.h"
 #include "rcar-gen2-cpg.h"
@@ -257,10 +258,21 @@ static const struct clk_div_table cpg_sd01_div_table[] = {
 	{  0,  0 },
 };
 
+static const struct clk_div_table rz_g1c_cpg_sd01_div_table[] = {
+	{  5, 12 }, {  6, 16 }, {  7, 18 }, {  8, 24 },
+	{ 10, 36 }, { 11, 48 }, { 12, 10 }, {  0,  0 },
+};
+
+
 static const struct rcar_gen2_cpg_pll_config *cpg_pll_config __initdata;
 static unsigned int cpg_pll0_div __initdata;
 static u32 cpg_mode __initdata;
 
+static const struct soc_device_attribute r8a7747xes[] = {
+	{ .soc_id = "r8a77470", .revision = "ES2.*" },
+	{ /* sentinel */ }
+};
+
 struct clk * __init rcar_gen2_cpg_clk_register(struct device *dev,
 	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
 	struct clk **clks, void __iomem *base,
@@ -303,7 +315,10 @@ struct clk * __init rcar_gen2_cpg_clk_register(struct device *dev,
 		break;
 
 	case CLK_TYPE_GEN2_PLL1:
-		mult = cpg_pll_config->pll1_mult / 2;
+		if (soc_device_match(r8a7747xes))
+			mult = cpg_pll_config->pll1_mult;
+		else
+			mult = cpg_pll_config->pll1_mult / 2;
 		break;
 
 	case CLK_TYPE_GEN2_PLL3:
@@ -314,7 +329,10 @@ struct clk * __init rcar_gen2_cpg_clk_register(struct device *dev,
 		return cpg_z_clk_register(core->name, parent_name, base);
 
 	case CLK_TYPE_GEN2_LB:
-		div = cpg_mode & BIT(18) ? 36 : 24;
+		if (soc_device_match(r8a7747xes))
+			div = 24;
+		else
+			div = cpg_mode & BIT(18) ? 36 : 24;
 		break;
 
 	case CLK_TYPE_GEN2_ADSP:
@@ -326,12 +344,20 @@ struct clk * __init rcar_gen2_cpg_clk_register(struct device *dev,
 		break;
 
 	case CLK_TYPE_GEN2_SD0:
-		table = cpg_sd01_div_table;
+		if (soc_device_match(r8a7747xes))
+			table = rz_g1c_cpg_sd01_div_table;
+		else
+			table = cpg_sd01_div_table;
+
 		shift = 4;
 		break;
 
 	case CLK_TYPE_GEN2_SD1:
-		table = cpg_sd01_div_table;
+		if (soc_device_match(r8a7747xes))
+			table = rz_g1c_cpg_sd01_div_table;
+		else
+			table = cpg_sd01_div_table;
+
 		shift = 0;
 		break;
 
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 4e88e98..2c467f9 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -652,6 +652,12 @@ static const struct of_device_id cpg_mssr_match[] = {
 		.data = &r8a7745_cpg_mssr_info,
 	},
 #endif
+#ifdef CONFIG_CLK_R8A77470
+	{
+		.compatible = "renesas,r8a77470-cpg-mssr",
+		.data = &r8a77470_cpg_mssr_info,
+	},
+#endif
 #ifdef CONFIG_CLK_R8A7790
 	{
 		.compatible = "renesas,r8a7790-cpg-mssr",
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index 97ccb09..efe2a14 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -133,6 +133,7 @@ struct cpg_mssr_info {
 
 extern const struct cpg_mssr_info r8a7743_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a7745_cpg_mssr_info;
+extern const struct cpg_mssr_info r8a77470_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a7790_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a7791_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a7792_cpg_mssr_info;
-- 
2.7.4
