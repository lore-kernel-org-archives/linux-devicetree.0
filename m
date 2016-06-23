From: megous@megous.com
Subject: [PATCH 02/14] ARM: clk: sunxi: Add driver for the H3 THS clock
Date: Thu, 23 Jun 2016 21:20:52 +0200
Message-ID: <20160623192104.18720-3-megous@megous.com>
References: <20160623192104.18720-1-megous@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160623192104.18720-1-megous@megous.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dev@linux-sunxi.org
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Josef Gajdusek <atx@atx.name>, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, open list <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Josef Gajdusek <atx@atx.name>

This patch adds a driver for the THS clock which is present on the
Allwinner H3.

Signed-off-by: Josef Gajdusek <atx@atx.name>
---
 Documentation/devicetree/bindings/clock/sunxi.txt |  1 +
 drivers/clk/sunxi/Makefile                        |  1 +
 drivers/clk/sunxi/clk-h3-ths.c                    | 98 +++++++++++++++++++++++
 3 files changed, 100 insertions(+)
 create mode 100644 drivers/clk/sunxi/clk-h3-ths.c

diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Documentation/devicetree/bindings/clock/sunxi.txt
index 8f7619d..5faae05 100644
--- a/Documentation/devicetree/bindings/clock/sunxi.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi.txt
@@ -87,6 +87,7 @@ Required properties:
 	"allwinner,sun9i-a80-usb-phy-clk" - for usb phy gates + resets on A80
 	"allwinner,sun4i-a10-ve-clk" - for the Video Engine clock
 	"allwinner,sun6i-a31-display-clk" - for the display clocks
+	"allwinner,sun8i-h3-ths-clk" - for THS on H3
 
 Required properties for all clocks:
 - reg : shall be the control register address for the clock.
diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
index 39d2044..8e245e3 100644
--- a/drivers/clk/sunxi/Makefile
+++ b/drivers/clk/sunxi/Makefile
@@ -9,6 +9,7 @@ obj-y += clk-a10-mod1.o
 obj-y += clk-a10-pll2.o
 obj-y += clk-a10-ve.o
 obj-y += clk-a20-gmac.o
+obj-y += clk-h3-ths.o
 obj-y += clk-mod0.o
 obj-y += clk-simple-gates.o
 obj-y += clk-sun4i-display.o
diff --git a/drivers/clk/sunxi/clk-h3-ths.c b/drivers/clk/sunxi/clk-h3-ths.c
new file mode 100644
index 0000000..c1d6d32
--- /dev/null
+++ b/drivers/clk/sunxi/clk-h3-ths.c
@@ -0,0 +1,98 @@
+/*
+ * sun8i THS clock driver
+ *
+ * Copyright (C) 2015 Josef Gajdusek
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/of_address.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#define SUN8I_H3_THS_CLK_ENABLE				31
+#define SUN8I_H3_THS_CLK_DIVIDER_SHIFT		0
+#define SUN8I_H3_THS_CLK_DIVIDER_WIDTH		2
+
+static DEFINE_SPINLOCK(sun8i_h3_ths_clk_lock);
+
+static const struct clk_div_table sun8i_h3_ths_clk_table[] __initconst = {
+	{ .val = 0, .div = 1 },
+	{ .val = 1, .div = 2 },
+	{ .val = 2, .div = 4 },
+	{ .val = 3, .div = 6 },
+	{ } /* sentinel */
+};
+
+static void __init sun8i_h3_ths_clk_setup(struct device_node *node)
+{
+	struct clk *clk;
+	struct clk_gate *gate;
+	struct clk_divider *div;
+	const char *parent;
+	const char *clk_name = node->name;
+	void __iomem *reg;
+	int err;
+
+	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
+
+	if (IS_ERR(reg))
+		return;
+
+	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (!gate)
+		goto err_unmap;
+
+	div = kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (!div)
+		goto err_gate_free;
+
+	of_property_read_string(node, "clock-output-names", &clk_name);
+	parent = of_clk_get_parent_name(node, 0);
+
+	gate->reg = reg;
+	gate->bit_idx = SUN8I_H3_THS_CLK_ENABLE;
+	gate->lock = &sun8i_h3_ths_clk_lock;
+
+	div->reg = reg;
+	div->shift = SUN8I_H3_THS_CLK_DIVIDER_SHIFT;
+	div->width = SUN8I_H3_THS_CLK_DIVIDER_WIDTH;
+	div->table = sun8i_h3_ths_clk_table;
+	div->lock = &sun8i_h3_ths_clk_lock;
+
+	clk = clk_register_composite(NULL, clk_name, &parent, 1,
+								 NULL, NULL,
+								 &div->hw, &clk_divider_ops,
+								 &gate->hw, &clk_gate_ops,
+								 CLK_SET_RATE_PARENT);
+
+	if (IS_ERR(clk))
+		goto err_div_free;
+
+	err = of_clk_add_provider(node, of_clk_src_simple_get, clk);
+	if (err)
+		goto err_unregister_clk;
+
+	return;
+
+err_unregister_clk:
+	clk_unregister(clk);
+err_gate_free:
+	kfree(gate);
+err_div_free:
+	kfree(div);
+err_unmap:
+	iounmap(reg);
+}
+
+CLK_OF_DECLARE(sun8i_h3_ths_clk, "allwinner,sun8i-h3-ths-clk",
+			   sun8i_h3_ths_clk_setup);
-- 
2.9.0
