From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH RFC 3/3] clk: berlin: add driver for BG2x simple PLLs
Date: Thu,  8 May 2014 22:16:52 +0200
Message-ID: <1399580212-30183-4-git-send-email-sebastian.hesselbarth@gmail.com>
References: <1399580212-30183-1-git-send-email-sebastian.hesselbarth@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399580212-30183-1-git-send-email-sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a clock driver for the simple PLLs found on Berlin SoCs.
With repect to PLL registers and features, BG2/BG2CD and BG2Q are
slightly different, e.g. different allowed VCO dividers and bit
shifts.

Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 drivers/clk/berlin/berlin2-pll.c | 104 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 drivers/clk/berlin/berlin2-pll.c

diff --git a/drivers/clk/berlin/berlin2-pll.c b/drivers/clk/berlin/berlin2-pll.c
new file mode 100644
index 000000000000..aef4ddd8db10
--- /dev/null
+++ b/drivers/clk/berlin/berlin2-pll.c
@@ -0,0 +1,104 @@
+/*
+ * Copyright (c) 2014 Marvell Technology Group Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <asm/div64.h>
+
+#include "common.h"
+
+struct berlin2_pll {
+	struct clk_hw hw;
+	void __iomem *base;
+	struct berlin2_pll_map map;
+};
+
+#define to_berlin2_pll(hw) container_of(hw, struct berlin2_pll, hw)
+
+#define SPLL_CTRL0	0x00
+#define SPLL_CTRL1	0x04
+#define SPLL_CTRL2	0x08
+#define SPLL_CTRL3	0x0c
+#define SPLL_CTRL4	0x10
+
+#define FBDIV_MASK	0x1ff
+#define RFDIV_MASK	0x1f
+#define DIVSEL_MASK	0xf
+
+/*
+ * The output frequency formula for the pll is:
+ * clkout = fbdiv / refdiv * parent / vcodiv
+ */
+static unsigned long
+berlin2_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct berlin2_pll *pll = to_berlin2_pll(hw);
+	struct berlin2_pll_map *map = &pll->map;
+	u32 val, fbdiv, rfdiv, vcodivsel, vcodiv;
+	u64 rate = parent_rate;
+
+	val = readl_relaxed(pll->base + SPLL_CTRL0);
+	fbdiv = (val >> map->fbdiv_shift) & FBDIV_MASK;
+	rfdiv = (val >> map->rfdiv_shift) & RFDIV_MASK;
+	if (rfdiv == 0) {
+		pr_warn("%s has zero rfdiv\n", __clk_get_name(hw->clk));
+		rfdiv = 1;
+	}
+
+	val = readl_relaxed(pll->base + SPLL_CTRL1);
+	vcodivsel = (val >> map->divsel_shift) & DIVSEL_MASK;
+	vcodiv = map->vcodiv[vcodivsel];
+	if (vcodiv == 0) {
+		pr_warn("%s has zero vcodiv (index %d)\n",
+			__clk_get_name(hw->clk), vcodivsel);
+		vcodiv = 1;
+	}
+
+	rate *= fbdiv * map->mult;
+	do_div(rate, rfdiv * vcodiv);
+
+	return (unsigned long)rate;
+}
+
+static const struct clk_ops berlin2_pll_ops = {
+	.recalc_rate	= berlin2_pll_recalc_rate,
+};
+
+struct clk * __init
+berlin2_pll_register(const struct berlin2_pll_map *map,
+		     void __iomem *base, const char *name,
+		     const char *parent_name, unsigned long flags)
+{
+	struct clk_init_data init;
+	struct berlin2_pll *pll;
+
+	pll = kzalloc(sizeof(*pll), GFP_KERNEL);
+	if (!pll)
+		return ERR_PTR(-ENOMEM);
+
+	/* copy pll_map to allow __initconst */
+	memcpy(&pll->map, map, sizeof(*map));
+	pll->base = base;
+	pll->hw.init = &init;
+	init.name = name;
+	init.ops = &berlin2_pll_ops;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+	init.flags = flags;
+
+	return clk_register(NULL, &pll->hw);
+}
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
