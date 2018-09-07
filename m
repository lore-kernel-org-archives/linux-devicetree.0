Return-Path: <SRS0=SOkh=LV=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v4] clk: renesas: cpg-mssr: Add R7S9210 support
Date: Fri,  7 Sep 2018 11:58:49 -0500
Message-Id: <20180907165849.106182-1-chris.brandt@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add support for the R7S9210 (RZ/A2) Clock Pulse Generator and Module
Standby.

The Module Standby HW in the RZ/A series is very close to R-Car HW, except
for how the registers are laid out.
The MSTP registers are only 8-bits wide, there is no status registers
(MSTPSR), and the register offsets are a little different. Since the RZ/A
hardware manuals refer to these registers as the Standby Control Registers,
we'll use that name to distinguish the RZ/A type from the R-Car type.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v4:
 * Preserved sort order of SoC listings
 * Removed R7S9210_CLK_PLL from dt-binding since it's an internal clock
 * ratio_tab is now a struct making it look a little nicer
 * Removed CLK_I,...CLK_P0 because they are already defined in dt-bindings
 * Sorted mod_clks by ascending MSTP number
 * Removed cast from clk_get_rate(parent)
 * Corrected register index of stbcr[1]
 * Don't use MOD_CLK_PACK_10 for non priv->stbyctrl devices (bug fix)
v3:
 * Use actual register bit names and numbers from manual for both DT and
   tables ("36" instead of "306")
 * Do not register reset controller for stbyctrl (RZ/A) SoCs
 * Changed SPDX from "GPL-2.0+" to "GPL-2.0"
v2:
 * num_hw_mod_clks was wrong
 * added ethernet clocks
---
 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   5 +-
 drivers/clk/renesas/Kconfig                        |   5 +
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r7s9210-cpg-mssr.c             | 189 +++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c             |  81 +++++++--
 drivers/clk/renesas/renesas-cpg-mssr.h             |  13 ++
 include/dt-bindings/clock/r7s9210-cpg-mssr.h       |  20 +++
 7 files changed, 300 insertions(+), 14 deletions(-)
 create mode 100644 drivers/clk/renesas/r7s9210-cpg-mssr.c
 create mode 100644 include/dt-bindings/clock/r7s9210-cpg-mssr.h

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
index 42d0f83d812b..5e46e6be789b 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
@@ -13,6 +13,7 @@ They provide the following functionalities:
 
 Required Properties:
   - compatible: Must be one of:
+      - "renesas,r7s9210-cpg-mssr" for the r7s9210 SoC (RZ/A2)
       - "renesas,r8a7743-cpg-mssr" for the r8a7743 SoC (RZ/G1M)
       - "renesas,r8a7745-cpg-mssr" for the r8a7745 SoC (RZ/G1E)
       - "renesas,r8a77470-cpg-mssr" for the r8a77470 SoC (RZ/G1C)
@@ -36,8 +37,8 @@ Required Properties:
   - clocks: References to external parent clocks, one entry for each entry in
     clock-names
   - clock-names: List of external parent clock names. Valid names are:
-      - "extal" (r8a7743, r8a7745, r8a77470, r8a774a1, r8a7790, r8a7791,
-		 r8a7792, r8a7793, r8a7794, r8a7795, r8a7796, r8a77965,
+      - "extal" (r7s9210, r8a7743, r8a7745, r8a77470, r8a774a1, r8a7790,
+		 r8a7791, r8a7792, r8a7793, r8a7794, r8a7795, r8a7796, r8a77965,
 		 r8a77970, r8a77980, r8a77990, r8a77995)
       - "extalr" (r8a774a1, r8a7795, r8a7796, r8a77965, r8a77970, r8a77980)
       - "usb_extal" (r8a7743, r8a7745, r8a77470, r8a7790, r8a7791, r8a7793,
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
index 000000000000..bd1dd4ff2051
--- /dev/null
+++ b/drivers/clk/renesas/r7s9210-cpg-mssr.c
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * R7S9210 Clock Pulse Generator / Module Standby
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
+
+static u8 cpg_mode;
+
+/* Internal Clock ratio table */
+static const struct {
+	unsigned int i;
+	unsigned int g;
+	unsigned int b;
+	unsigned int p1;
+	/* p0 is always 32 */;
+} ratio_tab[5] = {	/* I,  G,  B, P1 */
+			{  2,  4,  8, 16},	/* FRQCR = 0x012 */
+			{  4,  4,  8, 16},	/* FRQCR = 0x112 */
+			{  8,  4,  8, 16},	/* FRQCR = 0x212 */
+			{ 16,  8, 16, 16},	/* FRQCR = 0x322 */
+			{ 16, 16, 32, 32},	/* FRQCR = 0x333 */
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
+	DEF_MOD_STB("ostm2",	 34,	R7S9210_CLK_P1C),
+	DEF_MOD_STB("ostm1",	 35,	R7S9210_CLK_P1C),
+	DEF_MOD_STB("ostm0",	 36,	R7S9210_CLK_P1C),
+
+	DEF_MOD_STB("scif4",	 43,	R7S9210_CLK_P1C),
+	DEF_MOD_STB("scif3",	 44,	R7S9210_CLK_P1C),
+	DEF_MOD_STB("scif2",	 45,	R7S9210_CLK_P1C),
+	DEF_MOD_STB("scif1",	 46,	R7S9210_CLK_P1C),
+	DEF_MOD_STB("scif0",	 47,	R7S9210_CLK_P1C),
+
+	DEF_MOD_STB("ether1",	 64,	R7S9210_CLK_B),
+	DEF_MOD_STB("ether0",	 65,	R7S9210_CLK_B),
+
+	DEF_MOD_STB("i2c3",	 84,	R7S9210_CLK_P1),
+	DEF_MOD_STB("i2c2",	 85,	R7S9210_CLK_P1),
+	DEF_MOD_STB("i2c1",	 86,	R7S9210_CLK_P1),
+	DEF_MOD_STB("i2c0",	 87,	R7S9210_CLK_P1),
+
+};
+
+struct clk * __init rza2_cpg_clk_register(struct device *dev,
+	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
+	struct clk **clks, void __iomem *base,
+	struct raw_notifier_head *notifiers)
+{
+	struct clk *parent;
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
+		if (clk_get_rate(parent) > 12000000)
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
+				r7s9210_core_clks[i].div = ratio_tab[index].i;
+				break;
+			case R7S9210_CLK_G:
+				r7s9210_core_clks[i].div = ratio_tab[index].g;
+				break;
+			case R7S9210_CLK_B:
+				r7s9210_core_clks[i].div = ratio_tab[index].b;
+				break;
+			case R7S9210_CLK_P1:
+			case R7S9210_CLK_P1C:
+				r7s9210_core_clks[i].div = ratio_tab[index].p1;
+				break;
+			case R7S9210_CLK_P0:
+				r7s9210_core_clks[i].div = 32;
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
+	.num_hw_mod_clks = 11 * 32, /* includes STBCR0 which doesn't exist */
+
+	/* Callbacks */
+	.cpg_clk_register = rza2_cpg_clk_register,
+
+	/* RZ/A2 has Standby Control Registers */
+	.stbyctrl = true,
+};
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index f90b0d0ba46a..b97e0e3ff0b1 100644
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
+	0xFFFF/*dummy*/, 0x010, 0x014, 0x410, 0x414, 0x418, 0x41C, 0x420,
+	0x424, 0x428, 0x42C,
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
@@ -226,6 +255,7 @@ struct clk *cpg_mssr_clk_src_twocell_get(struct of_phandle_args *clkspec,
 	unsigned int idx;
 	const char *type;
 	struct clk *clk;
+	int range_check;
 
 	switch (clkspec->args[0]) {
 	case CPG_CORE:
@@ -240,8 +270,14 @@ struct clk *cpg_mssr_clk_src_twocell_get(struct of_phandle_args *clkspec,
 
 	case CPG_MOD:
 		type = "module";
-		idx = MOD_CLK_PACK(clkidx);
-		if (clkidx % 100 > 31 || idx >= priv->num_mod_clks) {
+		if (priv->stbyctrl) {
+			idx = MOD_CLK_PACK_10(clkidx);
+			range_check = 7 - (clkidx % 10);
+		} else {
+			idx = MOD_CLK_PACK(clkidx);
+			range_check = 31 - (clkidx % 100);
+		}
+		if (range_check < 0 || idx >= priv->num_mod_clks) {
 			dev_err(dev, "Invalid %s clock index %u\n", type,
 				clkidx);
 			return ERR_PTR(-EINVAL);
@@ -646,6 +682,12 @@ static inline int cpg_mssr_reset_controller_register(struct cpg_mssr_priv *priv)
 
 
 static const struct of_device_id cpg_mssr_match[] = {
+#ifdef CONFIG_CLK_R7S9210
+	{
+		.compatible = "renesas,r7s9210-cpg-mssr",
+		.data = &r7s9210_cpg_mssr_info,
+	},
+#endif
 #ifdef CONFIG_CLK_R8A7743
 	{
 		.compatible = "renesas,r8a7743-cpg-mssr",
@@ -791,13 +833,23 @@ static int cpg_mssr_resume_noirq(struct device *dev)
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
@@ -869,6 +921,7 @@ static int __init cpg_mssr_probe(struct platform_device *pdev)
 	priv->num_mod_clks = info->num_hw_mod_clks;
 	priv->last_dt_core_clk = info->last_dt_core_clk;
 	RAW_INIT_NOTIFIER_HEAD(&priv->notifiers);
+	priv->stbyctrl = info->stbyctrl;
 
 	for (i = 0; i < nclks; i++)
 		clks[i] = ERR_PTR(-ENOENT);
@@ -894,6 +947,10 @@ static int __init cpg_mssr_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
+	/* Reset Controller not supported for Standby Control SoCs */
+	if (info->stbyctrl)
+		return 0;
+
 	error = cpg_mssr_reset_controller_register(priv);
 	if (error)
 		return error;
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index 2e1730bc5ef2..35f60b3d0e09 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -78,6 +78,13 @@ struct mssr_mod_clk {
 #define DEF_MOD(_name, _mod, _parent...)	\
 	{ .name = _name, .id = MOD_CLK_ID(_mod), .parent = _parent }
 
+/* Convert from sparse base-10 to packed index space */
+#define MOD_CLK_PACK_10(x)	((x / 10) * 32 + (x % 10))
+
+#define MOD_CLK_ID_10(x)	(MOD_CLK_BASE + MOD_CLK_PACK_10(x))
+
+#define DEF_MOD_STB(_name, _mod, _parent...)	\
+	{ .name = _name, .id = MOD_CLK_ID_10(_mod), .parent = _parent }
 
 struct device_node;
 
@@ -103,6 +110,10 @@ struct device_node;
      *
      * @init: Optional callback to perform SoC-specific initialization
      * @cpg_clk_register: Optional callback to handle special Core Clock types
+     *
+     * @stbyctrl: This device has Standby Control Registers which are 8-bits
+     *            wide, no status registers (MSTPSR) and have different address
+     *            offsets.
      */
 
 struct cpg_mssr_info {
@@ -111,6 +122,7 @@ struct cpg_mssr_info {
 	unsigned int num_core_clks;
 	unsigned int last_dt_core_clk;
 	unsigned int num_total_core_clks;
+	bool stbyctrl;
 
 	/* Module Clocks */
 	const struct mssr_mod_clk *mod_clks;
@@ -134,6 +146,7 @@ struct cpg_mssr_info {
 					struct raw_notifier_head *notifiers);
 };
 
+extern const struct cpg_mssr_info r7s9210_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a7743_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a7745_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a77470_cpg_mssr_info;
diff --git a/include/dt-bindings/clock/r7s9210-cpg-mssr.h b/include/dt-bindings/clock/r7s9210-cpg-mssr.h
new file mode 100644
index 000000000000..b6f85ca149aa
--- /dev/null
+++ b/include/dt-bindings/clock/r7s9210-cpg-mssr.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0
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
+#define R7S9210_CLK_I			0
+#define R7S9210_CLK_G			1
+#define R7S9210_CLK_B			2
+#define R7S9210_CLK_P1			3
+#define R7S9210_CLK_P1C			4
+#define R7S9210_CLK_P0			5
+
+#endif /* __DT_BINDINGS_CLOCK_R7S9210_CPG_MSSR_H__ */
-- 
2.16.1
