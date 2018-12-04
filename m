From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 3/5] clk: meson: add dual divider clock driver
Date: Tue,  4 Dec 2018 17:53:08 +0100
Message-ID: <20181204165310.20806-4-jbrunet@baylibre.com>
References: <20181204165310.20806-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204165310.20806-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the dual divider driver. This special divider make a weighted
average between 2 dividers to reach fractional divider values.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/Makefile      |   1 +
 drivers/clk/meson/clk-dualdiv.c | 130 ++++++++++++++++++++++++++++++++
 drivers/clk/meson/clkc.h        |  19 +++++
 3 files changed, 150 insertions(+)
 create mode 100644 drivers/clk/meson/clk-dualdiv.c

diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index 0234767f6cfc..ae3fa2a127d5 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -3,6 +3,7 @@
 #
 
 obj-$(CONFIG_COMMON_CLK_AMLOGIC) += clk-pll.o clk-mpll.o clk-phase.o vid-pll-div.o
+obj-$(CONFIG_COMMON_CLK_AMLOGIC) += clk-dualdiv.o
 obj-$(CONFIG_COMMON_CLK_AMLOGIC_AUDIO)	+= clk-triphase.o sclk-div.o
 obj-$(CONFIG_COMMON_CLK_MESON_AO) += meson-aoclk.o
 obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o
diff --git a/drivers/clk/meson/clk-dualdiv.c b/drivers/clk/meson/clk-dualdiv.c
new file mode 100644
index 000000000000..4d9e161de627
--- /dev/null
+++ b/drivers/clk/meson/clk-dualdiv.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2017 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ */
+
+/*
+ * The AO Domain embeds a dual/divider to generate a more precise
+ * 32,768KHz clock for low-power suspend mode and CEC.
+ *     ______   ______
+ *    |      | |      |
+ *    | Div1 |-| Cnt1 |
+ *   /|______| |______|\
+ * -|  ______   ______  X--> Out
+ *   \|      | |      |/
+ *    | Div2 |-| Cnt2 |
+ *    |______| |______|
+ *
+ * The dividing can be switched to single or dual, with a counter
+ * for each divider to set when the switching is done.
+ */
+
+#include <linux/clk-provider.h>
+#include "clkc.h"
+
+static inline struct meson_clk_dualdiv_data *
+meson_clk_dualdiv_data(struct clk_regmap *clk)
+{
+	return (struct meson_clk_dualdiv_data *)clk->data;
+}
+
+static unsigned long
+__dualdiv_param_to_rate(unsigned long parent_rate,
+			const struct meson_clk_dualdiv_param *p)
+{
+	if (!p->dual)
+		return DIV_ROUND_CLOSEST(parent_rate, p->n1);
+
+	return DIV_ROUND_CLOSEST(parent_rate * (p->m1 + p->m2),
+				 p->n1 * p->m1 + p->n2 * p->m2);
+}
+
+static unsigned long meson_clk_dualdiv_recalc_rate(struct clk_hw *hw,
+						   unsigned long parent_rate)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_clk_dualdiv_data *dualdiv = meson_clk_dualdiv_data(clk);
+	struct meson_clk_dualdiv_param setting;
+
+	setting.dual = meson_parm_read(clk->map, &dualdiv->dual);
+	setting.n1 = meson_parm_read(clk->map, &dualdiv->n1) + 1;
+	setting.m1 = meson_parm_read(clk->map, &dualdiv->m1) + 1;
+	setting.n2 = meson_parm_read(clk->map, &dualdiv->n2) + 1;
+	setting.m2 = meson_parm_read(clk->map, &dualdiv->m2) + 1;
+
+	return __dualdiv_param_to_rate(parent_rate, &setting);
+}
+
+static const struct meson_clk_dualdiv_param *
+__dualdiv_get_setting(unsigned long rate, unsigned long parent_rate,
+		      struct meson_clk_dualdiv_data *dualdiv)
+{
+	const struct meson_clk_dualdiv_param *table = dualdiv->table;
+	unsigned long best = 0, now = 0;
+	unsigned int i, best_i = 0;
+
+	if (!table)
+		return NULL;
+
+	for (i = 0; table[i].n1; i++) {
+		now = __dualdiv_param_to_rate(parent_rate, &table[i]);
+
+		/* If we get an exact match, don't bother any further */
+		if (now == rate) {
+			return &table[i];
+		} else if (abs(now - rate) < abs(best - rate)) {
+			best = now;
+			best_i = i;
+		}
+	}
+
+	return (struct meson_clk_dualdiv_param *)&table[best_i];
+}
+
+static long meson_clk_dualdiv_round_rate(struct clk_hw *hw, unsigned long rate,
+					 unsigned long *parent_rate)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_clk_dualdiv_data *dualdiv = meson_clk_dualdiv_data(clk);
+	const struct meson_clk_dualdiv_param *setting =
+		__dualdiv_get_setting(rate, *parent_rate, dualdiv);
+
+	if (!setting)
+		return meson_clk_dualdiv_recalc_rate(hw, *parent_rate);
+
+	return __dualdiv_param_to_rate(*parent_rate, setting);
+}
+
+static int meson_clk_dualdiv_set_rate(struct clk_hw *hw, unsigned long rate,
+				      unsigned long parent_rate)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_clk_dualdiv_data *dualdiv = meson_clk_dualdiv_data(clk);
+	const struct meson_clk_dualdiv_param *setting =
+		__dualdiv_get_setting(rate, parent_rate, dualdiv);
+
+	if (!setting)
+		return -EINVAL;
+
+	meson_parm_write(clk->map, &dualdiv->dual, setting->dual);
+	meson_parm_write(clk->map, &dualdiv->n1, setting->n1 - 1);
+	meson_parm_write(clk->map, &dualdiv->m1, setting->m1 - 1);
+	meson_parm_write(clk->map, &dualdiv->n2, setting->n2 - 1);
+	meson_parm_write(clk->map, &dualdiv->m2, setting->m2 - 1);
+
+	return 0;
+}
+
+const struct clk_ops meson_clk_dualdiv_ops = {
+	.recalc_rate	= meson_clk_dualdiv_recalc_rate,
+	.round_rate	= meson_clk_dualdiv_round_rate,
+	.set_rate	= meson_clk_dualdiv_set_rate,
+};
+EXPORT_SYMBOL_GPL(meson_clk_dualdiv_ops);
+
+const struct clk_ops meson_clk_dualdiv_ro_ops = {
+	.recalc_rate	= meson_clk_dualdiv_recalc_rate,
+};
+EXPORT_SYMBOL_GPL(meson_clk_dualdiv_ro_ops);
diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index 91666055c75a..1efa6be9cfe4 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -110,6 +110,23 @@ struct clk_regmap _name = {						\
 	},								\
 };
 
+struct meson_clk_dualdiv_param {
+	unsigned int n1;
+	unsigned int n2;
+	unsigned int m1;
+	unsigned int m2;
+	unsigned int dual;
+};
+
+struct meson_clk_dualdiv_data {
+	struct parm n1;
+	struct parm n2;
+	struct parm m1;
+	struct parm m2;
+	struct parm dual;
+	const struct meson_clk_dualdiv_param *table;
+};
+
 /* clk_ops */
 extern const struct clk_ops meson_clk_pll_ro_ops;
 extern const struct clk_ops meson_clk_pll_ops;
@@ -118,5 +135,7 @@ extern const struct clk_ops meson_clk_mpll_ro_ops;
 extern const struct clk_ops meson_clk_mpll_ops;
 extern const struct clk_ops meson_clk_phase_ops;
 extern const struct clk_ops meson_vid_pll_div_ro_ops;
+extern const struct clk_ops meson_clk_dualdiv_ops;
+extern const struct clk_ops meson_clk_dualdiv_ro_ops;
 
 #endif /* __CLKC_H */
-- 
2.19.1
