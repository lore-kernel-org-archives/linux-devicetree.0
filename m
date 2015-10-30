From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 02/19] clk: sunxi: Add PLL3 clock
Date: Fri, 30 Oct 2015 15:20:48 +0100
Message-ID: <1446214865-3972-3-git-send-email-maxime.ripard@free-electrons.com>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBVXZZWYQKGQE7ZGLWFA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1446214865-3972-1-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Wynter Woods <wynter-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The A10 SoCs and relatives have a PLL controller to drive the PLL3 and
PLL7, clocked from a 3MHz oscillator, that drives the display related
clocks (GPU, display engine, TCON, etc.)

Add a driver for it.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/clk/sunxi/Makefile         |  3 +-
 drivers/clk/sunxi/clk-sun4i-pll3.c | 84 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 86 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/sunxi/clk-sun4i-pll3.c

diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
index a9e1a5885846..40c32ffd912c 100644
--- a/drivers/clk/sunxi/Makefile
+++ b/drivers/clk/sunxi/Makefile
@@ -9,8 +9,9 @@ obj-y += clk-a10-mod1.o
 obj-y += clk-a10-pll2.o
 obj-y += clk-a20-gmac.o
 obj-y += clk-mod0.o
-obj-y += clk-sun4i-display.o
 obj-y += clk-simple-gates.o
+obj-y += clk-sun4i-display.o
+obj-y += clk-sun4i-pll3.o
 obj-y += clk-sun8i-mbus.o
 obj-y += clk-sun9i-core.o
 obj-y += clk-sun9i-mmc.o
diff --git a/drivers/clk/sunxi/clk-sun4i-pll3.c b/drivers/clk/sunxi/clk-sun4i-pll3.c
new file mode 100644
index 000000000000..7ea178bf19fa
--- /dev/null
+++ b/drivers/clk/sunxi/clk-sun4i-pll3.c
@@ -0,0 +1,84 @@
+/*
+ * Copyright 2015 Maxime Ripard
+ *
+ * Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/of_address.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#define SUN4I_A10_PLL3_GATE_BIT	31
+#define SUN4I_A10_PLL3_DIV_WIDTH	7
+#define SUN4I_A10_PLL3_DIV_SHIFT	0
+
+static DEFINE_SPINLOCK(sun4i_a10_pll3_lock);
+
+static void __init sun4i_a10_pll3_setup(struct device_node *node)
+{
+	const char *clk_name = node->name, *parent;
+	struct clk_factor *mult;
+	struct clk_gate *gate;
+	void __iomem *reg;
+	struct clk *clk;
+
+	of_property_read_string(node, "clock-output-names", &clk_name);
+	parent = of_clk_get_parent_name(node, 0);
+
+	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
+	if (IS_ERR(reg)) {
+		pr_err("%s: Could not map the clock registers\n", clk_name);
+		return;
+	}
+
+	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (!gate)
+		return;
+
+	gate->reg = reg;
+	gate->bit_idx = SUN4I_A10_PLL3_GATE_BIT;
+	gate->lock = &sun4i_a10_pll3_lock;
+
+	mult = kzalloc(sizeof(*mult), GFP_KERNEL);
+	if (!mult)
+		goto free_gate;
+
+	mult->reg = reg;
+	mult->shift = SUN4I_A10_PLL3_DIV_SHIFT;
+	mult->width = SUN4I_A10_PLL3_DIV_WIDTH;
+	mult->lock = &sun4i_a10_pll3_lock;
+
+	clk = clk_register_composite(NULL, clk_name,
+				     &parent, 1,
+				     NULL, NULL,
+				     &mult->hw, &clk_factor_ops,
+				     &gate->hw, &clk_gate_ops,
+				     0);
+	if (IS_ERR(clk)) {
+		pr_err("%s: Couldn't register the clock\n", clk_name);
+		goto free_mult;
+	}
+
+	of_clk_add_provider(node, of_clk_src_simple_get, clk);
+
+	return;
+
+free_mult:
+	kfree(mult);
+free_gate:
+	kfree(gate);
+}
+
+CLK_OF_DECLARE(sun4i_a10_pll3, "allwinner,sun4i-a10-pll3-clk",
+	       sun4i_a10_pll3_setup);
-- 
2.6.2
