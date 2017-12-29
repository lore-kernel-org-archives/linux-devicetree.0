From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 4/6] clk: ingenic: Add JZ47xx TCU clocks driver
Date: Fri, 29 Dec 2017 13:59:40 +0100
Message-ID: <20171229125942.27305-5-paul@crapouillou.net>
References: <20171229125942.27305-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171229125942.27305-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Lee Jones <lee.jones@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

The TCU (Timer Counter Unit) of the Ingenic JZ47xx SoCs features 8
channels, each one having its own clock, that can be started and
stopped, reparented, and reclocked.

This driver only modifies the bits of the registers of the TCU that are
related to clocks control. It provides one clock per TCU channel (plus
one for the watchdog and one for the OS timer) that can be used by other
drivers.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../bindings/clock/ingenic,tcu-clocks.txt          |  35 +++
 drivers/clk/ingenic/Makefile                       |   2 +-
 drivers/clk/ingenic/tcu.c                          | 341 +++++++++++++++++++++
 3 files changed, 377 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/ingenic,tcu-clocks.txt
 create mode 100644 drivers/clk/ingenic/tcu.c

diff --git a/Documentation/devicetree/bindings/clock/ingenic,tcu-clocks.txt b/Documentation/devicetree/bindings/clock/ingenic,tcu-clocks.txt
new file mode 100644
index 000000000000..ed1468a6aa27
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ingenic,tcu-clocks.txt
@@ -0,0 +1,35 @@
+Ingenic SoC TCU binding
+
+The TCU is the Timer/Counter Unit present in all Ingenic SoCs. It features 8
+channels, each one having its own clock, that can be started and stopped,
+reparented, and reclocked.
+
+Required properties:
+- compatible : One of:
+  * ingenic,jz4740-tcu-clocks,
+  * ingenic,jz4770-tcu-clocks,
+  * ingenic,jz4780-tcu-clocks.
+- clocks : List of phandle & clock specifiers for clocks external to the TCU.
+  The "pclk", "rtc" and "ext" clocks should be provided.
+- clock-names : List of name strings for the external clocks.
+- #clock-cells: Should be 1.
+  Clock consumers specify this argument to identify a clock. The valid values
+  may be found in <dt-bindings/clock/ingenic,tcu.h>.
+
+Example:
+
+/ {
+	regmap {
+		compatible = "simple-mfd", "syscon";
+		reg = <0x10002000 0x1000>;
+
+		tcu: clocks {
+			compatible = "ingenic,jz4740-tcu-clocks";
+
+			clocks = <&ext>, <&rtc>, <&pclk>;
+			clock-names = "ext", "rtc", "pclk";
+
+			#clock-cells = <1>;
+		};
+	};
+};
diff --git a/drivers/clk/ingenic/Makefile b/drivers/clk/ingenic/Makefile
index cd47b0664c2b..e373118a3726 100644
--- a/drivers/clk/ingenic/Makefile
+++ b/drivers/clk/ingenic/Makefile
@@ -1,3 +1,3 @@
-obj-y				+= cgu.o
+obj-y				+= cgu.o tcu.o
 obj-$(CONFIG_MACH_JZ4740)	+= jz4740-cgu.o
 obj-$(CONFIG_MACH_JZ4780)	+= jz4780-cgu.o
diff --git a/drivers/clk/ingenic/tcu.c b/drivers/clk/ingenic/tcu.c
new file mode 100644
index 000000000000..a1b189984d17
--- /dev/null
+++ b/drivers/clk/ingenic/tcu.c
@@ -0,0 +1,341 @@
+/*
+ * Ingenic JZ47xx SoC TCU clocks driver
+ *
+ * Copyright (C) 2016 Paul Cercueil <paul@crapouillou.net>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk-provider.h>
+#include <linux/clkdev.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mfd/syscon/ingenic-tcu.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/regmap.h>
+#include <linux/spinlock.h>
+
+#include <dt-bindings/clock/ingenic,tcu.h>
+
+enum ingenic_version {
+	ID_JZ4740,
+	ID_JZ4770,
+	ID_JZ4780,
+};
+
+struct ingenic_tcu {
+	struct device_node *np;
+	struct regmap *map;
+
+	struct clk_onecell_data clocks;
+};
+
+struct ingenic_tcu_clk_info {
+	struct clk_init_data init_data;
+	u8 gate_bit;
+	u8 tcsr_reg;
+};
+
+struct ingenic_tcu_clk {
+	struct clk_hw hw;
+
+	struct ingenic_tcu *tcu;
+	const struct ingenic_tcu_clk_info *info;
+
+	unsigned int idx;
+};
+
+#define to_tcu_clk(_hw) container_of(_hw, struct ingenic_tcu_clk, hw)
+
+static int ingenic_tcu_enable(struct clk_hw *hw)
+{
+	struct ingenic_tcu_clk *tcu_clk = to_tcu_clk(hw);
+	const struct ingenic_tcu_clk_info *info = tcu_clk->info;
+	struct ingenic_tcu *tcu = tcu_clk->tcu;
+
+	regmap_write(tcu->map, REG_TSCR, BIT(info->gate_bit));
+	return 0;
+}
+
+static void ingenic_tcu_disable(struct clk_hw *hw)
+{
+	struct ingenic_tcu_clk *tcu_clk = to_tcu_clk(hw);
+	struct ingenic_tcu *tcu = tcu_clk->tcu;
+	const struct ingenic_tcu_clk_info *info = tcu_clk->info;
+
+	regmap_write(tcu->map, REG_TSSR, BIT(info->gate_bit));
+}
+
+static int ingenic_tcu_is_enabled(struct clk_hw *hw)
+{
+	struct ingenic_tcu_clk *tcu_clk = to_tcu_clk(hw);
+	struct ingenic_tcu *tcu = tcu_clk->tcu;
+	const struct ingenic_tcu_clk_info *info = tcu_clk->info;
+	unsigned int value;
+
+	regmap_read(tcu->map, REG_TSR, &value);
+
+	return !(value & BIT(info->gate_bit));
+}
+
+static u8 ingenic_tcu_get_parent(struct clk_hw *hw)
+{
+	struct ingenic_tcu_clk *tcu_clk = to_tcu_clk(hw);
+	struct ingenic_tcu *tcu = tcu_clk->tcu;
+	const struct ingenic_tcu_clk_info *info = tcu_clk->info;
+	unsigned int val = 0;
+	int ret;
+
+	ret = regmap_read(tcu->map, info->tcsr_reg, &val);
+	WARN_ONCE(ret < 0, "Unable to read TCSR %i", tcu_clk->idx);
+
+	return (u8) ffs(val & TCSR_PARENT_CLOCK_MASK) - 1;
+}
+
+static int ingenic_tcu_set_parent(struct clk_hw *hw, u8 idx)
+{
+	struct ingenic_tcu_clk *tcu_clk = to_tcu_clk(hw);
+	struct ingenic_tcu *tcu = tcu_clk->tcu;
+	const struct ingenic_tcu_clk_info *info = tcu_clk->info;
+	int ret;
+
+	/*
+	 * Our clock provider has the CLK_SET_PARENT_GATE flag set, so we know
+	 * that the clk is in unprepared state. To be able to access TCSR
+	 * we must ungate the clock supply and we gate it again when done.
+	 */
+
+	regmap_write(tcu->map, REG_TSCR, BIT(info->gate_bit));
+
+	ret = regmap_update_bits(tcu->map, info->tcsr_reg,
+			TCSR_PARENT_CLOCK_MASK, BIT(idx));
+	WARN_ONCE(ret < 0, "Unable to update TCSR %i", tcu_clk->idx);
+
+	regmap_write(tcu->map, REG_TSSR, BIT(info->gate_bit));
+
+	return 0;
+}
+
+static unsigned long ingenic_tcu_recalc_rate(struct clk_hw *hw,
+		unsigned long parent_rate)
+{
+	struct ingenic_tcu_clk *tcu_clk = to_tcu_clk(hw);
+	struct ingenic_tcu *tcu = tcu_clk->tcu;
+	const struct ingenic_tcu_clk_info *info = tcu_clk->info;
+	unsigned int prescale;
+	int ret;
+
+	ret = regmap_read(tcu->map, info->tcsr_reg, &prescale);
+	WARN_ONCE(ret < 0, "Unable to read TCSR %i", tcu_clk->idx);
+
+	prescale = (prescale & TCSR_PRESCALE_MASK) >> TCSR_PRESCALE_LSB;
+
+	return parent_rate >> (prescale * 2);
+}
+
+static long ingenic_tcu_round_rate(struct clk_hw *hw, unsigned long req_rate,
+		unsigned long *parent_rate)
+{
+	long rate = (long) *parent_rate;
+	unsigned int shift;
+
+	if (req_rate > rate)
+		return -EINVAL;
+
+	for (shift = 0; shift < 10; shift += 2)
+		if ((rate >> shift) <= req_rate)
+			return rate >> shift;
+
+	return rate >> 10;
+}
+
+static int ingenic_tcu_set_rate(struct clk_hw *hw, unsigned long req_rate,
+		unsigned long parent_rate)
+{
+	struct ingenic_tcu_clk *tcu_clk = to_tcu_clk(hw);
+	const struct ingenic_tcu_clk_info *info = tcu_clk->info;
+	struct ingenic_tcu *tcu = tcu_clk->tcu;
+	u8 prescale = (ffs(parent_rate / req_rate) / 2) << TCSR_PRESCALE_LSB;
+	int ret;
+
+	/*
+	 * Our clock provider has the CLK_SET_RATE_GATE flag set, so we know
+	 * that the clk is in unprepared state. To be able to access TCSR
+	 * we must ungate the clock supply and we gate it again when done.
+	 */
+
+	regmap_write(tcu->map, REG_TSCR, BIT(info->gate_bit));
+
+	ret = regmap_update_bits(tcu->map, info->tcsr_reg,
+				TCSR_PRESCALE_MASK, prescale);
+	WARN_ONCE(ret < 0, "Unable to update TCSR %i", tcu_clk->idx);
+
+	regmap_write(tcu->map, REG_TSSR, BIT(info->gate_bit));
+
+	return 0;
+}
+
+static const struct clk_ops ingenic_tcu_clk_ops = {
+	.get_parent	= ingenic_tcu_get_parent,
+	.set_parent	= ingenic_tcu_set_parent,
+
+	.recalc_rate	= ingenic_tcu_recalc_rate,
+	.round_rate	= ingenic_tcu_round_rate,
+	.set_rate	= ingenic_tcu_set_rate,
+
+	.enable		= ingenic_tcu_enable,
+	.disable	= ingenic_tcu_disable,
+	.is_enabled	= ingenic_tcu_is_enabled,
+};
+
+static const char * const ingenic_tcu_timer_parents[] = {
+	"pclk",
+	"rtc",
+	"ext",
+};
+
+static const struct ingenic_tcu_clk_info ingenic_tcu_clk_info[] = {
+#define DEF_TIMER(_name, _gate_bit, _tcsr)				\
+	{								\
+		.init_data = {						\
+			.name = _name,					\
+			.parent_names = ingenic_tcu_timer_parents,	\
+			.num_parents = ARRAY_SIZE(ingenic_tcu_timer_parents),\
+			.ops = &ingenic_tcu_clk_ops,			\
+			.flags = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE,\
+		},							\
+		.gate_bit = _gate_bit,					\
+		.tcsr_reg = _tcsr,					\
+	}
+	[JZ4740_CLK_TIMER0] = DEF_TIMER("timer0", 0, REG_TCSRc(0)),
+	[JZ4740_CLK_TIMER1] = DEF_TIMER("timer1", 1, REG_TCSRc(1)),
+	[JZ4740_CLK_TIMER2] = DEF_TIMER("timer2", 2, REG_TCSRc(2)),
+	[JZ4740_CLK_TIMER3] = DEF_TIMER("timer3", 3, REG_TCSRc(3)),
+	[JZ4740_CLK_TIMER4] = DEF_TIMER("timer4", 4, REG_TCSRc(4)),
+	[JZ4740_CLK_TIMER5] = DEF_TIMER("timer5", 5, REG_TCSRc(5)),
+	[JZ4740_CLK_TIMER6] = DEF_TIMER("timer6", 6, REG_TCSRc(6)),
+	[JZ4740_CLK_TIMER7] = DEF_TIMER("timer7", 7, REG_TCSRc(7)),
+	[JZ4740_CLK_WDT]    = DEF_TIMER("wdt",   16, REG_WDT_TCSR),
+	[JZ4770_CLK_OST]    = DEF_TIMER("ost",   15, REG_OST_TCSR),
+#undef DEF_TIMER
+};
+
+static int ingenic_tcu_register_clock(struct ingenic_tcu *tcu, unsigned int idx,
+		const struct ingenic_tcu_clk_info *info)
+{
+	struct ingenic_tcu_clk *tcu_clk;
+	struct clk *clk;
+	int err;
+
+	tcu_clk = kzalloc(sizeof(*tcu_clk), GFP_KERNEL);
+	if (!tcu_clk)
+		return -ENOMEM;
+
+	tcu_clk->hw.init = &info->init_data;
+	tcu_clk->idx = idx;
+	tcu_clk->info = info;
+	tcu_clk->tcu = tcu;
+
+	/* Set EXT as the default parent clock */
+	ingenic_tcu_set_parent(&tcu_clk->hw, 2);
+
+	ingenic_tcu_disable(&tcu_clk->hw);
+
+	clk = clk_register(NULL, &tcu_clk->hw);
+	if (IS_ERR(clk)) {
+		err = PTR_ERR(clk);
+		goto err_free_tcu_clk;
+	}
+
+	err = clk_register_clkdev(clk, info->init_data.name, NULL);
+	if (err)
+		goto err_clk_unregister;
+
+	tcu->clocks.clks[idx] = clk;
+	return 0;
+
+err_clk_unregister:
+	clk_unregister(clk);
+err_free_tcu_clk:
+	kfree(tcu_clk);
+	return err;
+}
+
+static void __init ingenic_tcu_init(struct device_node *np,
+		enum ingenic_version id)
+{
+	struct ingenic_tcu *tcu;
+	size_t i, nb_clks;
+	int ret = -ENOMEM;
+
+	if (id >= ID_JZ4770)
+		nb_clks = (JZ4770_CLK_LAST - JZ4740_CLK_TIMER0) + 1;
+	else
+		nb_clks = (JZ4740_CLK_LAST - JZ4740_CLK_TIMER0) + 1;
+
+	tcu = kzalloc(sizeof(*tcu), GFP_KERNEL);
+	if (!tcu) {
+		pr_err("%s: cannot allocate memory\n", __func__);
+		return;
+	}
+
+	tcu->map = syscon_node_to_regmap(np->parent);
+	if (IS_ERR(tcu->map)) {
+		pr_err("%s: failed to map TCU registers\n", __func__);
+		goto err_free_tcu;
+	}
+
+	tcu->clocks.clk_num = nb_clks;
+	tcu->clocks.clks = kcalloc(nb_clocks, sizeof(struct clk *), GFP_KERNEL);
+	if (!tcu->clocks.clks) {
+		pr_err("%s: cannot allocate memory\n", __func__);
+		goto err_free_tcu;
+	}
+
+	for (i = 0; i < nb_clks; i++) {
+		ret = ingenic_tcu_register_clock(tcu, i,
+				&ingenic_tcu_clk_info[JZ4740_CLK_TIMER0 + i]);
+		if (ret) {
+			pr_err("%s: cannot register clocks\n", __func__);
+			goto err_unregister;
+		}
+	}
+
+	ret = of_clk_add_provider(np, of_clk_src_onecell_get, &tcu->clocks);
+	if (ret) {
+		pr_err("%s: cannot add OF clock provider\n", __func__);
+		goto err_unregister;
+	}
+
+	return;
+
+err_unregister:
+	for (i = 0; i < tcu->clocks.clk_num; i++)
+		if (tcu->clocks.clks[i])
+			clk_unregister(tcu->clocks.clks[i]);
+	kfree(tcu->clocks.clks);
+err_free_tcu:
+	kfree(tcu);
+}
+
+static void __init jz4740_tcu_init(struct device_node *np)
+{
+	ingenic_tcu_init(np, ID_JZ4740);
+}
+CLK_OF_DECLARE(ingenic_tcu, "ingenic,jz4740-tcu-clocks", jz4740_tcu_init);
+
+static void __init jz4770_tcu_init(struct device_node *np)
+{
+	ingenic_tcu_init(np, ID_JZ4770);
+}
+CLK_OF_DECLARE(jz4770_tcu, "ingenic,jz4770-tcu-clocks", jz4770_tcu_init);
+
+static void __init jz4780_tcu_init(struct device_node *np)
+{
+	ingenic_tcu_init(np, ID_JZ4780);
+}
+CLK_OF_DECLARE(jz4780_tcu, "ingenic,jz4780-tcu-clocks", jz4780_tcu_init);
-- 
2.11.0
