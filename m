From: Antony Pavlov <antonynpavlov@gmail.com>
Subject: [RFC 08/10] MIPS: ath79: update devicetree support for AR9132
Date: Sun, 14 Feb 2016 00:58:15 +0300
Message-ID: <1455400697-29898-9-git-send-email-antonynpavlov@gmail.com>
References: <1455400697-29898-1-git-send-email-antonynpavlov@gmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1455400697-29898-1-git-send-email-antonynpavlov@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Alban Bedel <albeu@free.fr>, Marek Vasut <marex@denx.de>, Wills Wang <wills.wang@live.com>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>, Gabor Juhos <juhosg@openwrt.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Current ath79 clock.c code does not read reference clock and
pll setup from devicetree. E.g. you can set any clock rate value
in board DTS but it will have no effect on the real clk calculation.

This patch fixes some AR9132 devicetree clock support deffects:

  * clk initialization function ath79_clocks_init_dt_ng()
    is introduced; it actually gets reference clock
    and pll block base register address from devicetree;
  * pll register parsing code moved to the separate
    ar724x_clk_init() function; this function
    can be called from platform code or from devicetree code;
  * introduces include/dt-bindings/clock/ath79-clk.h,
    so we can use human-readable macro for clks naming;

The same approach can be used for adding AR9331 devicetree support.

Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
Cc: Gabor Juhos <juhosg@openwrt.org>
Cc: Alban Bedel <albeu@free.fr>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-mips@linux-mips.org
Cc: devicetree@vger.kernel.org
---
 arch/mips/ath79/clock.c               | 138 +++++++++++++++++++++++++++-------
 arch/mips/boot/dts/qca/ar9132.dtsi    |   8 +-
 include/dt-bindings/clock/ath79-clk.h |  20 +++++
 3 files changed, 134 insertions(+), 32 deletions(-)

diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index 618dfd7..58ba7d7 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -18,12 +18,16 @@
 #include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <dt-bindings/clock/ath79-clk.h>
 
 #include <asm/div64.h>
 
 #include <asm/mach-ath79/ath79.h>
 #include <asm/mach-ath79/ar71xx_regs.h>
 #include "common.h"
+#include "machtypes.h"
 
 #define AR71XX_BASE_FREQ	40000000
 #define AR724X_BASE_FREQ	40000000
@@ -86,37 +90,66 @@ static void __init ar71xx_clocks_init(void)
 	clk_add_alias("uart", NULL, "ahb", NULL);
 }
 
+static struct clk *clks_ng[ATH79_CLK_END];
+static struct clk_onecell_data clk_data_ng = {
+	.clks = clks_ng,
+	.clk_num = ARRAY_SIZE(clks_ng),
+};
+
+static struct clk * __init ath79_reg_ffclk(const char *name,
+		const char *parent_name, unsigned int mult, unsigned int div)
+{
+	struct clk *clk;
+	int err;
+
+	clk = clk_register_fixed_factor(NULL, name, parent_name, 0, mult, div);
+	if (!clk)
+		panic("failed to allocate %s clock structure", name);
+
+	/*
+	 * dt-enabled linux does not need clk_register_clkdev()
+	 * but it makes happy plat_time_init() from arch/mips/ath79/setup.c
+	 */
+	err = clk_register_clkdev(clk, name, NULL);
+	if (err)
+		panic("unable to register %s clock device", name);
+
+	return clk;
+}
+
+static struct clk_onecell_data * __init ar724x_clk_init(
+			struct clk *ref_clk, void __iomem *pll_base)
+{
+	u32 pll;
+	u32 mult, div, ddr_div, ahb_div;
+
+	pll = __raw_readl(pll_base + AR724X_PLL_REG_CPU_CONFIG);
+
+	mult = ((pll >> AR724X_PLL_FB_SHIFT) & AR724X_PLL_FB_MASK);
+	div = ((pll >> AR724X_PLL_REF_DIV_SHIFT) & AR724X_PLL_REF_DIV_MASK) * 2;
+
+	ddr_div = ((pll >> AR724X_DDR_DIV_SHIFT) & AR724X_DDR_DIV_MASK) + 1;
+	ahb_div = (((pll >> AR724X_AHB_DIV_SHIFT) & AR724X_AHB_DIV_MASK) + 1) * 2;
+
+	clks_ng[ATH79_CLK_REF] = ref_clk;
+	clks_ng[ATH79_CLK_CPU] = ath79_reg_ffclk("cpu", "ref", mult, div);
+	clks_ng[ATH79_CLK_DDR] = ath79_reg_ffclk("ddr", "ref", mult, div * ddr_div);
+	clks_ng[ATH79_CLK_AHB] = ath79_reg_ffclk("ahb", "ref", mult, div * ahb_div);
+
+	return &clk_data_ng;
+}
+
 static void __init ar724x_clocks_init(void)
 {
-	unsigned long ref_rate;
-	unsigned long cpu_rate;
-	unsigned long ddr_rate;
-	unsigned long ahb_rate;
-	u32 pll;
-	u32 freq;
-	u32 div;
+	struct clk *ref_clk;
+	struct clk_onecell_data *clk_data;
 
-	ref_rate = AR724X_BASE_FREQ;
-	pll = ath79_pll_rr(AR724X_PLL_REG_CPU_CONFIG);
+	ref_clk = ath79_add_sys_clkdev("ref", AR724X_BASE_FREQ);
 
-	div = ((pll >> AR724X_PLL_FB_SHIFT) & AR724X_PLL_FB_MASK);
-	freq = div * ref_rate;
+	clk_data = ar724x_clk_init(ref_clk, ath79_pll_base);
 
-	div = ((pll >> AR724X_PLL_REF_DIV_SHIFT) & AR724X_PLL_REF_DIV_MASK) * 2;
-	freq /= div;
-
-	cpu_rate = freq;
-
-	div = ((pll >> AR724X_DDR_DIV_SHIFT) & AR724X_DDR_DIV_MASK) + 1;
-	ddr_rate = freq / div;
-
-	div = (((pll >> AR724X_AHB_DIV_SHIFT) & AR724X_AHB_DIV_MASK) + 1) * 2;
-	ahb_rate = cpu_rate / div;
-
-	ath79_add_sys_clkdev("ref", ref_rate);
-	clks[0] = ath79_add_sys_clkdev("cpu", cpu_rate);
-	clks[1] = ath79_add_sys_clkdev("ddr", ddr_rate);
-	clks[2] = ath79_add_sys_clkdev("ahb", ahb_rate);
+	/* just make happy plat_time_init() from arch/mips/ath79/setup.c */
+	clk_register_clkdev(clk_data->clks[ATH79_CLK_REF], "ref", NULL);
 
 	clk_add_alias("wdt", NULL, "ahb", NULL);
 	clk_add_alias("uart", NULL, "ahb", NULL);
@@ -407,6 +440,11 @@ static void __init qca955x_clocks_init(void)
 
 void __init ath79_clocks_init(void)
 {
+	if (IS_ENABLED(CONFIG_OF) && mips_machtype == ATH79_MACH_GENERIC_OF) {
+		of_clk_init(NULL);
+		return;
+	}
+
 	if (soc_is_ar71xx())
 		ar71xx_clocks_init();
 	else if (soc_is_ar724x() || soc_is_ar913x())
@@ -419,8 +457,6 @@ void __init ath79_clocks_init(void)
 		qca955x_clocks_init();
 	else
 		BUG();
-
-	of_clk_init(NULL);
 }
 
 unsigned long __init
@@ -447,8 +483,52 @@ static void __init ath79_clocks_init_dt(struct device_node *np)
 
 CLK_OF_DECLARE(ar7100, "qca,ar7100-pll", ath79_clocks_init_dt);
 CLK_OF_DECLARE(ar7240, "qca,ar7240-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9130, "qca,ar9130-pll", ath79_clocks_init_dt);
 CLK_OF_DECLARE(ar9330, "qca,ar9330-pll", ath79_clocks_init_dt);
 CLK_OF_DECLARE(ar9340, "qca,ar9340-pll", ath79_clocks_init_dt);
 CLK_OF_DECLARE(ar9550, "qca,qca9550-pll", ath79_clocks_init_dt);
+
+static void __init ath79_clocks_init_dt_ng(struct device_node *np)
+{
+	struct clk *ref_clk;
+	void __iomem *pll_base;
+	struct clk_onecell_data *clk_data;
+
+	ref_clk = of_clk_get(np, 0);
+	if (IS_ERR(ref_clk)) {
+		pr_err("%s: of_clk_get failed\n", np->full_name);
+		goto err;
+	}
+
+	pll_base = of_iomap(np, 0);
+	if (!pll_base) {
+		pr_err("%s: can't map pll registers\n", np->full_name);
+		goto err_clk;
+	}
+
+	clk_data = ar724x_clk_init(ref_clk, pll_base);
+	if (!clk_data) {
+		pr_err("%s: clk_init failed\n", np->full_name);
+		goto err_clk;
+	}
+
+	if (of_clk_add_provider(np, of_clk_src_onecell_get, clk_data)) {
+		pr_err("%s: could not register clk provider\n", np->full_name);
+		goto err_clk;
+	}
+
+	/*
+	 * dt-enabled linux does not need clk_register_clkdev()
+	 * but it makes happy plat_time_init() from arch/mips/ath79/setup.c
+	 */
+	clk_register_clkdev(clk_data->clks[ATH79_CLK_REF], "ref", NULL);
+
+	return;
+
+err_clk:
+	clk_put(ref_clk);
+
+err:
+	return;
+}
+CLK_OF_DECLARE(ar9130_clk, "qca,ar9130-pll", ath79_clocks_init_dt_ng);
 #endif
diff --git a/arch/mips/boot/dts/qca/ar9132.dtsi b/arch/mips/boot/dts/qca/ar9132.dtsi
index 511cb4d..fb844b8 100644
--- a/arch/mips/boot/dts/qca/ar9132.dtsi
+++ b/arch/mips/boot/dts/qca/ar9132.dtsi
@@ -1,3 +1,5 @@
+#include <dt-bindings/clock/ath79-clk.h>
+
 / {
 	compatible = "qca,ar9132";
 
@@ -57,7 +59,7 @@
 				reg = <0x18020000 0x20>;
 				interrupts = <3>;
 
-				clocks = <&pll 2>;
+				clocks = <&pll ATH79_CLK_AHB>;
 				clock-names = "uart";
 
 				reg-io-width = <4>;
@@ -100,7 +102,7 @@
 
 				interrupts = <4>;
 
-				clocks = <&pll 2>;
+				clocks = <&pll ATH79_CLK_AHB>;
 				clock-names = "wdt";
 			};
 
@@ -144,7 +146,7 @@
 			compatible = "qca,ar9132-spi", "qca,ar7100-spi";
 			reg = <0x1f000000 0x10>;
 
-			clocks = <&pll 2>;
+			clocks = <&pll ATH79_CLK_AHB>;
 			clock-names = "ahb";
 
 			status = "disabled";
diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-bindings/clock/ath79-clk.h
new file mode 100644
index 0000000..af64e36
--- /dev/null
+++ b/include/dt-bindings/clock/ath79-clk.h
@@ -0,0 +1,20 @@
+/*
+ * Copyright (C) 2014, 2016 Antony Pavlov <antonynpavlov@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#ifndef __DT_BINDINGS_ATH79_CLK_H
+#define __DT_BINDINGS_ATH79_CLK_H
+
+#define ATH79_CLK_REF		0
+#define ATH79_CLK_CPU		1
+#define ATH79_CLK_DDR		2
+#define ATH79_CLK_AHB		3
+
+#define ATH79_CLK_END		4
+
+#endif /* __DT_BINDINGS_ATH79_CLK_H */
-- 
2.7.0

