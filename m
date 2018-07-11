Return-Path: <SRS0=m83C=J3=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 1/2] clk: renesas: mstp: Add support for r7s9210
Date: Wed, 11 Jul 2018 12:03:12 -0500
Message-Id: <20180711170313.80321-2-chris.brandt@renesas.com>
In-Reply-To: <20180711170313.80321-1-chris.brandt@renesas.com>
References: <20180711170313.80321-1-chris.brandt@renesas.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add support for RZ/A2 series.
The clock HW is similar to RZ/A1, but with different dividers
and additional clocks sources.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/clk/renesas/Kconfig    |   5 ++
 drivers/clk/renesas/Makefile   |   1 +
 drivers/clk/renesas/clk-mstp.c |   3 +
 drivers/clk/renesas/clk-rz.c   | 155 ++++++++++++++++++++++++++++++++---------
 4 files changed, 130 insertions(+), 34 deletions(-)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 9022bbe1297e..b08d44b8a476 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -3,6 +3,7 @@ config CLK_RENESAS
 	default y if ARCH_RENESAS
 	select CLK_EMEV2 if ARCH_EMEV2
 	select CLK_RZA1 if ARCH_R7S72100
+	select CLK_RZA2 if ARCH_R7S9210
 	select CLK_R8A73A4 if ARCH_R8A73A4
 	select CLK_R8A7740 if ARCH_R8A7740
 	select CLK_R8A7743 if ARCH_R8A7743
@@ -45,6 +46,10 @@ config CLK_RZA1
 	bool "RZ/A1H clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSTP
 
+config CLK_RZA2
+	bool "RZ/A2 clock support" if COMPILE_TEST
+	select CLK_RENESAS_CPG_MSTP
+
 config CLK_R8A73A4
 	bool "R-Mobile APE6 clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSTP
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index e4aa3d6143d2..6159ee43f7ca 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -2,6 +2,7 @@
 # SoC
 obj-$(CONFIG_CLK_EMEV2)			+= clk-emev2.o
 obj-$(CONFIG_CLK_RZA1)			+= clk-rz.o
+obj-$(CONFIG_CLK_RZA2)			+= clk-rz.o
 obj-$(CONFIG_CLK_R8A73A4)		+= clk-r8a73a4.o
 obj-$(CONFIG_CLK_R8A7740)		+= clk-r8a7740.o
 obj-$(CONFIG_CLK_R8A7743)		+= r8a7743-cpg-mssr.o
diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index e82adcb16a52..9470ab8acc13 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -213,6 +213,9 @@ static void __init cpg_mstp_clocks_init(struct device_node *np)
 	if (of_device_is_compatible(np, "renesas,r7s72100-mstp-clocks"))
 		group->width_8bit = true;
 
+	if (of_device_is_compatible(np, "renesas,r7s9210-mstp-clocks"))
+		group->width_8bit = true;
+
 	for (i = 0; i < MSTP_MAX_CLOCKS; ++i)
 		clks[i] = ERR_PTR(-ENOENT);
 
diff --git a/drivers/clk/renesas/clk-rz.c b/drivers/clk/renesas/clk-rz.c
index ac2f86d626b6..199c6ae9704c 100644
--- a/drivers/clk/renesas/clk-rz.c
+++ b/drivers/clk/renesas/clk-rz.c
@@ -1,5 +1,5 @@
 /*
- * RZ/A1 Core CPG Clocks
+ * RZ/A Core CPG Clocks
  *
  * Copyright (C) 2013 Ideas On Board SPRL
  * Copyright (C) 2014 Wolfram Sang, Sang Engineering <wsa@sang-engineering.com>
@@ -24,44 +24,95 @@ struct rz_cpg {
 
 #define CPG_FRQCR	0x10
 #define CPG_FRQCR2	0x14
+#define SWRSTCR3	0xFCFE0468
 
+/* RZ/A1 */
 #define PPR0		0xFCFE3200
 #define PIBC0		0xFCFE7000
 
-#define MD_CLK(x)	((x >> 2) & 1)	/* P0_2 */
+/* RZ/A2 */
+#define PORTL_PIDR	0xFCFFE074
+
+#define RZA1 1
+#define RZA2 2
 
 /* -----------------------------------------------------------------------------
  * Initialization
  */
+int detect_rz(void)
+{
+	void __iomem *swrstcr3;
+	static int rz_device;
+
+	if (!rz_device) {
+		swrstcr3 = ioremap_nocache(SWRSTCR3, 1);
+		BUG_ON(!swrstcr3);
+		if (ioread8(swrstcr3))
+			rz_device = RZA1;
+		else
+			rz_device = RZA2;
+		iounmap(swrstcr3);
+	}
+	return rz_device;
+}
 
-static u16 __init rz_cpg_read_mode_pins(void)
+static u8 __init rz_cpg_read_mode_pin(void)
 {
-	void __iomem *ppr0, *pibc0;
-	u16 modes;
-
-	ppr0 = ioremap_nocache(PPR0, 2);
-	pibc0 = ioremap_nocache(PIBC0, 2);
-	BUG_ON(!ppr0 || !pibc0);
-	iowrite16(4, pibc0);	/* enable input buffer */
-	modes = ioread16(ppr0);
-	iounmap(ppr0);
-	iounmap(pibc0);
-
-	return modes;
+	void __iomem *ppr0, *pibc0, *pidr;
+	u8 mode;
+
+	if (detect_rz() == RZA1) {
+		/* RZ/A1 */
+		/* MD_CLK pin is P0_2 */
+		ppr0 = ioremap_nocache(PPR0, 2);
+		pibc0 = ioremap_nocache(PIBC0, 2);
+		BUG_ON(!ppr0 || !pibc0);
+		iowrite16(4, pibc0);	/* enable input buffer */
+		mode = (u8)((ioread16(ppr0) >> 2) & 1);
+		iounmap(ppr0);
+		iounmap(pibc0);
+	} else {
+		/* RZ/A2 */
+		/* MD_CLK pin is PL_1 */
+		pidr = ioremap_nocache(PORTL_PIDR, 1);
+		BUG_ON(!pidr);
+		mode = (ioread8(pidr) >> 1) & 1;
+		iounmap(pidr);
+	}
+
+	return mode;
 }
 
 static struct clk * __init
 rz_cpg_register_clock(struct device_node *np, struct rz_cpg *cpg, const char *name)
 {
 	u32 val;
-	unsigned mult;
-	static const unsigned frqcr_tab[4] = { 3, 2, 0, 1 };
+	unsigned int mult, div;
+	static const unsigned int rza1_frqcr_tab[4] = { 3, 2, 0, 1 };
+	static const unsigned int rza2_frqcr_tab[5][5] = {
+				/* I,  G,  B, P1, P0 */
+				{  2,  4,  8, 16, 32 },	/* FRQCR = 0x012 */
+				{  4,  4,  8, 16, 32 },	/* FRQCR = 0x112 */
+				{  8,  4,  8, 16, 32 },	/* FRQCR = 0x212 */
+				{ 16,  8, 16, 16, 32 },	/* FRQCR = 0x322 */
+				{ 16, 16, 32, 32, 32 },	/* FRQCR = 0x333 */
+				};
 
-	if (strcmp(name, "pll") == 0) {
-		unsigned int cpg_mode = MD_CLK(rz_cpg_read_mode_pins());
-		const char *parent_name = of_clk_get_parent_name(np, cpg_mode);
+	unsigned int cpg_mode = rz_cpg_read_mode_pin();
 
-		mult = cpg_mode ? (32 / 4) : 30;
+
+	if (strcmp(name, "pll") == 0) {
+		const char *parent_name;
+
+		if (detect_rz() == RZA1) {
+			/* RZ/A1 */
+			parent_name = of_clk_get_parent_name(np, cpg_mode);
+			mult = cpg_mode ? (32 / 4) : 30;
+		} else {
+			/* RZ/A2 */
+			parent_name = of_clk_get_parent_name(np, 0);
+			mult = 88;
+		}
 
 		return clk_register_fixed_factor(NULL, name, parent_name, 0, mult, 1);
 	}
@@ -70,19 +121,55 @@ rz_cpg_register_clock(struct device_node *np, struct rz_cpg *cpg, const char *na
 	if (!cpg->reg)
 		return ERR_PTR(-ENXIO);
 
-	/* FIXME:"i" and "g" are variable clocks with non-integer dividers (e.g. 2/3)
-	 * and the constraint that always g <= i. To get the rz platform started,
-	 * let them run at fixed current speed and implement the details later.
-	 */
-	if (strcmp(name, "i") == 0)
-		val = (readl(cpg->reg + CPG_FRQCR) >> 8) & 3;
-	else if (strcmp(name, "g") == 0)
-		val = readl(cpg->reg + CPG_FRQCR2) & 3;
-	else
-		return ERR_PTR(-EINVAL);
-
-	mult = frqcr_tab[val];
-	return clk_register_fixed_factor(NULL, name, "pll", 0, mult, 3);
+	if (detect_rz() == RZA1) {
+		/* FIXME:"i" and "g" are variable clocks with non-integer dividers (e.g. 2/3)
+		 * and the constraint that always g <= i. To get the rz platform started,
+		 * let them run at fixed current speed and implement the details later.
+		 */
+		if (strcmp(name, "i") == 0)
+			val = (readl(cpg->reg + CPG_FRQCR) >> 8) & 3;
+		else if (strcmp(name, "g") == 0)
+			val = readl(cpg->reg + CPG_FRQCR2) & 3;
+		else
+			return ERR_PTR(-EINVAL);
+		mult = rza1_frqcr_tab[val];
+		div = 3;
+	} else {
+		/* RZ/A2 */
+		val = clk_readl(cpg->reg + CPG_FRQCR) & 0xFFF;
+		if (val == 0x012)
+			val = 0;
+		else if (val == 0x112)
+			val = 1;
+		else if (val == 0x212)
+			val = 2;
+		else if (val == 0x322)
+			val = 3;
+		else if (val == 0x333)
+			val = 4;
+		else
+			BUG_ON(1);	/* Illegal FRQCR value */
+
+		if (strcmp(name, "i") == 0)
+			div = rza2_frqcr_tab[val][0];
+		else if (strcmp(name, "g") == 0)
+			div = rza2_frqcr_tab[val][1];
+		else if (strcmp(name, "b") == 0)
+			div = rza2_frqcr_tab[val][2];
+		else if ((strcmp(name, "p1") == 0) ||
+			 (strcmp(name, "p1c") == 0))
+			div = rza2_frqcr_tab[val][3];
+		else if (strcmp(name, "p0") == 0)
+			div = rza2_frqcr_tab[val][4];
+		else
+			return ERR_PTR(-EINVAL);
+
+		mult = 1;
+		if (cpg_mode)
+			div *= 2;	/* div 2 circuit before PLL */
+
+	}
+	return clk_register_fixed_factor(NULL, name, "pll", 0, mult, div);
 }
 
 static void __init rz_cpg_clocks_init(struct device_node *np)
-- 
2.16.1
