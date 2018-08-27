Return-Path: <SRS0=Jnje=LK=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2] clk: renesas: cpg-mssr: Add R7S9210 support
Date: Mon, 27 Aug 2018 11:21:39 -0500
Message-Id: <20180827162139.76196-1-chris.brandt@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add support for the R7S9210 (RZ/A2) Clock Pulse Generator and Module
Standby.

The Module Standby HW in the RZ/A series is very close to R-Car HW, except
for how the registers are laid out.
The MSTP registers are only 8-bits wide, there is no status registers
(MSTPST), and the register offsets are a little different. Since the RZ/A
hardware manuals refer to these registers as the Standby Control Registers,
we'll use that name to distinguish the RZ/A type for the R-Car type.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v2:
 * num_hw_mod_clks was wrong
 * added ethernet clocks
---
 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   3 +-
 drivers/clk/renesas/Kconfig                        |   5 +
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r7s9210-cpg-mssr.c             | 192 +++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c             |  66 +++++--
 drivers/clk/renesas/renesas-cpg-mssr.h             |   6 +
 include/dt-bindings/clock/r7s9210-cpg-mssr.h       |  21 +++
 7 files changed, 283 insertions(+), 11 deletions(-)
 create mode 100644 drivers/clk/renesas/r7s9210-cpg-mssr.c
 create mode 100644 include/dt-bindings/clock/r7s9210-cpg-mssr.h

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
index 42d0f83d812b..012416b33d2d 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
@@ -13,6 +13,7 @@ They provide the following functionalities:
 
 Required Properties:
   - compatible: Must be one of:
+      - "renesas,r7s9210-cpg-mssr" for the r7s9210 SoC (RZ/A2)
       - "renesas,r8a7743-cpg-mssr" for the r8a7743 SoC (RZ/G1M)
       - "renesas,r8a7745-cpg-mssr" for the r8a7745 SoC (RZ/G1E)
       - "renesas,r8a77470-cpg-mssr" for the r8a77470 SoC (RZ/G1C)
@@ -38,7 +39,7 @@ Required Properties:
   - clock-names: List of external parent clock names. Valid names are:
       - "extal" (r8a7743, r8a7745, r8a77470, r8a774a1, r8a7790, r8a7791,
 		 r8a7792, r8a7793, r8a7794, r8a7795, r8a7796, r8a77965,
-		 r8a77970, r8a77980, r8a77990, r8a77995)
+		 r8a77970, r8a77980, r8a77990, r8a77995, r7s9210)
       - "extalr" (r8a774a1, r8a7795, r8a7796, r8a77965, r8a77970, r8a77980)
       - "usb_extal" (r8a7743, r8a7745, r8a77470, r8a7790, r8a7791, r8a7793,
 		     r8a7794)
diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index f998a7333acb..2edcb1bdb487 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -3,6 +3,7 @@ config CLK_RENESAS
 	default y if ARCH_RENESAS
 	select CLK_EMEV2 if ARCH_EMEV2
 	select CLK_RZA1 if ARCH_R7S72100
+	select CLK_R7S9210 if ARCH_R7S9210
 	select CLK_R8A73A4 if ARCH_R8A73A4
 	select CLK_R8A7740 if ARCH_R8A7740
 	select CLK_R8A7743 if ARCH_R8A7743
@@ -46,6 +47,10 @@ config CLK_RZA1
 	bool "RZ/A1H clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSTP
 
+config CLK_R7S9210
+	bool "RZ/A2 clock support" if COMPILE_TEST
+	select CLK_RENESAS_CPG_MSSR
+
 config CLK_R8A73A4
 	bool "R-Mobile APE6 clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSTP
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index 71d4cafe15c0..dbbfd0b0742b 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -2,6 +2,7 @@
 # SoC
 obj-$(CONFIG_CLK_EMEV2)			+= clk-emev2.o
 obj-$(CONFIG_CLK_RZA1)			+= clk-rz.o
+obj-$(CONFIG_CLK_R7S9210)		+= r7s9210-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A73A4)		+= clk-r8a73a4.o
 obj-$(CONFIG_CLK_R8A7740)		+= clk-r8a7740.o
 obj-$(CONFIG_CLK_R8A7743)		+= r8a7743-cpg-mssr.o
diff --git a/drivers/clk/renesas/r7s9210-cpg-mssr.c b/drivers/clk/renesas/r7s9210-cpg-mssr.c
new file mode 100644
index 000000000000..e63bc634d252
--- /dev/null
+++ b/drivers/clk/renesas/r7s9210-cpg-mssr.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * r7s9210 Clock Pulse Generator / Module Standby and Software Reset
+ *
+ * Based on r8a7795-cpg-mssr.c
+ *
+ * Copyright (C) 2018 Chris Brandt
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <dt-bindings/clock/r7s9210-cpg-mssr.h>
+#include "renesas-cpg-mssr.h"
+
+#define CPG_FRQCR	0x00
+#define CPG_CKIOSEL	0xF0
+#define CPG_SCLKSEL	0xF4
+
+#define PORTL_PIDR	0xFCFFE074
+static u8 cpg_mode;
+
+/* Internal Clock ratio table */
+static const unsigned int ratio_tab[5][5] = {
+			/* I,  G,  B, P1, P0 */
+			{  2,  4,  8, 16, 32 },	/* FRQCR = 0x012 */
+			{  4,  4,  8, 16, 32 },	/* FRQCR = 0x112 */
+			{  8,  4,  8, 16, 32 },	/* FRQCR = 0x212 */
+			{ 16,  8, 16, 16, 32 },	/* FRQCR = 0x322 */
+			{ 16, 16, 32, 32, 32 },	/* FRQCR = 0x333 */
+			};
+
+enum rz_clk_types {
+	CLK_TYPE_RZA_MAIN = CLK_TYPE_CUSTOM,
+	CLK_TYPE_RZA_PLL,
+};
+
+enum clk_ids {
+	/* Core Clock Outputs exported to DT */
+	LAST_DT_CORE_CLK = R7S9210_CLK_P0,
+
+	/* External Input Clocks */
+	CLK_EXTAL,
+
+	/* Internal Core Clocks */
+	CLK_MAIN,
+	CLK_PLL,
+	CLK_I,
+	CLK_G,
+	CLK_B,
+	CLK_P1,
+	CLK_P1C,
+	CLK_P0,
+
+	/* Module Clocks */
+	MOD_CLK_BASE
+};
+
+static struct cpg_core_clk r7s9210_core_clks[] = {
+	/* External Clock Inputs */
+	DEF_INPUT("extal",     CLK_EXTAL),
+
+	/* Internal Core Clocks */
+	DEF_BASE(".main",       CLK_MAIN, CLK_TYPE_RZA_MAIN, CLK_EXTAL),
+	DEF_BASE(".pll",       CLK_PLL, CLK_TYPE_RZA_PLL, CLK_MAIN),
+
+	/* Core Clock Outputs */
+	DEF_FIXED("i",      R7S9210_CLK_I,     CLK_PLL,          2, 1),
+	DEF_FIXED("g",      R7S9210_CLK_G,     CLK_PLL,          4, 1),
+	DEF_FIXED("b",      R7S9210_CLK_B,     CLK_PLL,          8, 1),
+	DEF_FIXED("p1",     R7S9210_CLK_P1,    CLK_PLL,         16, 1),
+	DEF_FIXED("p1c",    R7S9210_CLK_P1C,   CLK_PLL,         16, 1),
+	DEF_FIXED("p0",     R7S9210_CLK_P0,    CLK_PLL,         32, 1),
+};
+
+static const struct mssr_mod_clk r7s9210_mod_clks[] __initconst = {
+	DEF_MOD("ostm0",	 306,	R7S9210_CLK_P1C),
+	DEF_MOD("ostm1",	 305,	R7S9210_CLK_P1C),
+	DEF_MOD("ostm2",	 304,	R7S9210_CLK_P1C),
+
+	DEF_MOD("scif0",	 407,	R7S9210_CLK_P1C),
+	DEF_MOD("scif1",	 406,	R7S9210_CLK_P1C),
+	DEF_MOD("scif2",	 405,	R7S9210_CLK_P1C),
+	DEF_MOD("scif3",	 404,	R7S9210_CLK_P1C),
+	DEF_MOD("scif4",	 403,	R7S9210_CLK_P1C),
+
+	DEF_MOD("ether0",	 605,	R7S9210_CLK_B),
+	DEF_MOD("ether1",	 604,	R7S9210_CLK_B),
+
+	DEF_MOD("i2c0",		 807,	R7S9210_CLK_P1),
+	DEF_MOD("i2c1",		 806,	R7S9210_CLK_P1),
+	DEF_MOD("i2c2",		 805,	R7S9210_CLK_P1),
+	DEF_MOD("i2c3",		 804,	R7S9210_CLK_P1),
+};
+
+struct clk * __init rza2_cpg_clk_register(struct device *dev,
+	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
+	struct clk **clks, void __iomem *base,
+	struct raw_notifier_head *notifiers)
+{
+	const struct clk *parent;
+	unsigned int mult = 1;
+	unsigned int div = 1;
+	u16 frqcr;
+	u8 index;
+	int i;
+
+	parent = clks[core->parent];
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	switch (core->id) {
+	case CLK_MAIN:
+		break;
+
+	case CLK_PLL:
+		if (cpg_mode)
+			mult = 44;	/* Divider 1 is 1/2 */
+		else
+			mult = 88;	/* Divider 1 is 1 */
+		break;
+
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+
+	/* Adjust the dividers based on the current FRQCR setting */
+	if (core->id == CLK_MAIN) {
+
+		/* If EXTAL is above 12MHz, then we know it is Mode 1 */
+		if (clk_get_rate((struct clk *)parent) > 12000000)
+			cpg_mode = 1;
+
+		frqcr = clk_readl(base + CPG_FRQCR) & 0xFFF;
+		if (frqcr == 0x012)
+			index = 0;
+		else if (frqcr == 0x112)
+			index = 1;
+		else if (frqcr == 0x212)
+			index = 2;
+		else if (frqcr == 0x322)
+			index = 3;
+		else if (frqcr == 0x333)
+			index = 4;
+		else
+			BUG_ON(1);	/* Illegal FRQCR value */
+
+		for (i = 0; i < ARRAY_SIZE(r7s9210_core_clks); i++) {
+			switch (r7s9210_core_clks[i].id) {
+			case R7S9210_CLK_I:
+				r7s9210_core_clks[i].div = ratio_tab[index][0];
+				break;
+			case R7S9210_CLK_G:
+				r7s9210_core_clks[i].div = ratio_tab[index][1];
+				break;
+			case R7S9210_CLK_B:
+				r7s9210_core_clks[i].div = ratio_tab[index][2];
+				break;
+			case R7S9210_CLK_P1:
+			case R7S9210_CLK_P1C:
+				r7s9210_core_clks[i].div = ratio_tab[index][3];
+				break;
+			case R7S9210_CLK_P0:
+				r7s9210_core_clks[i].div = ratio_tab[index][4];
+				break;
+			}
+		}
+	}
+
+	return clk_register_fixed_factor(NULL, core->name,
+					 __clk_get_name(parent), 0, mult, div);
+}
+
+const struct cpg_mssr_info r7s9210_cpg_mssr_info __initconst = {
+	/* Core Clocks */
+	.core_clks = r7s9210_core_clks,
+	.num_core_clks = ARRAY_SIZE(r7s9210_core_clks),
+	.last_dt_core_clk = LAST_DT_CORE_CLK,
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Module Clocks */
+	.mod_clks = r7s9210_mod_clks,
+	.num_mod_clks = ARRAY_SIZE(r7s9210_mod_clks),
+	.num_hw_mod_clks = 11 * 32, /* includes STBCR0/1/2 which don't exist */
+
+	/* Callbacks */
+	.cpg_clk_register = rza2_cpg_clk_register,
+
+	/* RZ/A2 has Standby Control Registers */
+	.stbyctrl = true,
+};
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index f90b0d0ba46a..72615a3aab6b 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -73,6 +73,17 @@ static const u16 smstpcr[] = {
 
 #define	SMSTPCR(i)	smstpcr[i]
 
+/*
+ * Standby Control Register offsets (RZ/A)
+ * Base address is FRQCR register
+ */
+
+static const u16 stbcr[] = {
+	0x000, 0x000, 0x014, 0x410, 0x414, 0x418, 0x41C, 0x420,
+	0x424, 0x428, 0x42C, 0x430, 0x434, 0x460,
+};
+
+#define	STBCR(i)	stbcr[i]
 
 /*
  * Software Reset Register offsets
@@ -110,6 +121,7 @@ static const u16 srcr[] = {
  * @notifiers: Notifier chain to save/restore clock state for system resume
  * @smstpcr_saved[].mask: Mask of SMSTPCR[] bits under our control
  * @smstpcr_saved[].val: Saved values of SMSTPCR[]
+ * @stbyctrl: This device has Standby Control Registers
  */
 struct cpg_mssr_priv {
 #ifdef CONFIG_RESET_CONTROLLER
@@ -123,6 +135,7 @@ struct cpg_mssr_priv {
 	unsigned int num_core_clks;
 	unsigned int num_mod_clks;
 	unsigned int last_dt_core_clk;
+	bool stbyctrl;
 
 	struct raw_notifier_head notifiers;
 	struct {
@@ -162,16 +175,29 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 		enable ? "ON" : "OFF");
 	spin_lock_irqsave(&priv->rmw_lock, flags);
 
-	value = readl(priv->base + SMSTPCR(reg));
-	if (enable)
-		value &= ~bitmask;
-	else
-		value |= bitmask;
-	writel(value, priv->base + SMSTPCR(reg));
+	if (priv->stbyctrl) {
+		value = readb(priv->base + STBCR(reg));
+		if (enable)
+			value &= ~bitmask;
+		else
+			value |= bitmask;
+		writeb(value, priv->base + STBCR(reg));
+
+		/* dummy read to ensure write has completed */
+		readb(priv->base + STBCR(reg));
+		barrier_data(priv->base + STBCR(reg));
+	} else {
+		value = readl(priv->base + SMSTPCR(reg));
+		if (enable)
+			value &= ~bitmask;
+		else
+			value |= bitmask;
+		writel(value, priv->base + SMSTPCR(reg));
+	}
 
 	spin_unlock_irqrestore(&priv->rmw_lock, flags);
 
-	if (!enable)
+	if (!enable || priv->stbyctrl)
 		return 0;
 
 	for (i = 1000; i > 0; --i) {
@@ -205,7 +231,10 @@ static int cpg_mstp_clock_is_enabled(struct clk_hw *hw)
 	struct cpg_mssr_priv *priv = clock->priv;
 	u32 value;
 
-	value = readl(priv->base + MSTPSR(clock->index / 32));
+	if (priv->stbyctrl)
+		value = readb(priv->base + STBCR(clock->index / 32));
+	else
+		value = readl(priv->base + MSTPSR(clock->index / 32));
 
 	return !(value & BIT(clock->index % 32));
 }
@@ -740,6 +769,12 @@ static const struct of_device_id cpg_mssr_match[] = {
 		.compatible = "renesas,r8a77995-cpg-mssr",
 		.data = &r8a77995_cpg_mssr_info,
 	},
+#endif
+#ifdef CONFIG_CLK_R7S9210
+	{
+		.compatible = "renesas,r7s9210-cpg-mssr",
+		.data = &r7s9210_cpg_mssr_info,
+	},
 #endif
 	{ /* sentinel */ }
 };
@@ -791,13 +826,23 @@ static int cpg_mssr_resume_noirq(struct device *dev)
 		if (!mask)
 			continue;
 
-		oldval = readl(priv->base + SMSTPCR(reg));
+		if (priv->stbyctrl)
+			oldval = readb(priv->base + STBCR(reg));
+		else
+			oldval = readl(priv->base + SMSTPCR(reg));
 		newval = oldval & ~mask;
 		newval |= priv->smstpcr_saved[reg].val & mask;
 		if (newval == oldval)
 			continue;
 
-		writel(newval, priv->base + SMSTPCR(reg));
+		if (priv->stbyctrl) {
+			writeb(newval, priv->base + STBCR(reg));
+			/* dummy read to ensure write has completed */
+			readb(priv->base + STBCR(reg));
+			barrier_data(priv->base + STBCR(reg));
+			continue;
+		} else
+			writel(newval, priv->base + SMSTPCR(reg));
 
 		/* Wait until enabled clocks are really enabled */
 		mask &= ~priv->smstpcr_saved[reg].val;
@@ -869,6 +914,7 @@ static int __init cpg_mssr_probe(struct platform_device *pdev)
 	priv->num_mod_clks = info->num_hw_mod_clks;
 	priv->last_dt_core_clk = info->last_dt_core_clk;
 	RAW_INIT_NOTIFIER_HEAD(&priv->notifiers);
+	priv->stbyctrl = info->stbyctrl;
 
 	for (i = 0; i < nclks; i++)
 		clks[i] = ERR_PTR(-ENOENT);
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index 2e1730bc5ef2..6df42d9f5d05 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -103,6 +103,10 @@ struct device_node;
      *
      * @init: Optional callback to perform SoC-specific initialization
      * @cpg_clk_register: Optional callback to handle special Core Clock types
+     *
+     * @stbyctrl: This device has Standby Control Registers which are 8-bits
+     *            wide, no status registers (MSTPSR) and have different address
+     *            offsets.
      */
 
 struct cpg_mssr_info {
@@ -111,6 +115,7 @@ struct cpg_mssr_info {
 	unsigned int num_core_clks;
 	unsigned int last_dt_core_clk;
 	unsigned int num_total_core_clks;
+	bool stbyctrl;
 
 	/* Module Clocks */
 	const struct mssr_mod_clk *mod_clks;
@@ -149,6 +154,7 @@ extern const struct cpg_mssr_info r8a77970_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a77980_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a77990_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a77995_cpg_mssr_info;
+extern const struct cpg_mssr_info r7s9210_cpg_mssr_info;
 
 
     /*
diff --git a/include/dt-bindings/clock/r7s9210-cpg-mssr.h b/include/dt-bindings/clock/r7s9210-cpg-mssr.h
new file mode 100644
index 000000000000..b124bb65e9fc
--- /dev/null
+++ b/include/dt-bindings/clock/r7s9210-cpg-mssr.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0+
+ *
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ *
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_R7S9210_CPG_MSSR_H__
+#define __DT_BINDINGS_CLOCK_R7S9210_CPG_MSSR_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* R7S9210 CPG Core Clocks */
+#define R7S9210_CLK_PLL			0
+#define R7S9210_CLK_I			1
+#define R7S9210_CLK_G			2
+#define R7S9210_CLK_B			3
+#define R7S9210_CLK_P1			4
+#define R7S9210_CLK_P1C			5
+#define R7S9210_CLK_P0			6
+
+#endif /* __DT_BINDINGS_CLOCK_R7S9210_CPG_MSSR_H__ */
-- 
2.16.1
