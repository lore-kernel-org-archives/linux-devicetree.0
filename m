From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 2/2] clk: keystone: Add new driver to handle syscon based clock
Date: Tue, 12 Mar 2019 14:35:18 +0530
Message-ID: <20190312090518.28666-3-vigneshr@ti.com>
References: <20190312090518.28666-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190312090518.28666-1-vigneshr@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vigneshr@ti.com, Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On TI's K2 and K3 SoCs, certain clocks can be gated/ungated by setting a
single bit in SoC's System Control Module registers. Sometime more than
one clock control can be in the same register.
Add driver to support such clocks. Registers that control clocks will be
grouped into a syscon regmap. Each clock node will be child of the
syscon node.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/clk/keystone/Kconfig      |   8 ++
 drivers/clk/keystone/Makefile     |   1 +
 drivers/clk/keystone/syscon-clk.c | 143 ++++++++++++++++++++++++++++++
 3 files changed, 152 insertions(+)
 create mode 100644 drivers/clk/keystone/syscon-clk.c

diff --git a/drivers/clk/keystone/Kconfig b/drivers/clk/keystone/Kconfig
index b04927d06cd1..6a7b80ee62c9 100644
--- a/drivers/clk/keystone/Kconfig
+++ b/drivers/clk/keystone/Kconfig
@@ -14,3 +14,11 @@ config TI_SCI_CLK
 	  This adds the clock driver support over TI System Control Interface.
 	  If you wish to use clock resources from the PMMC firmware, say Y.
 	  Otherwise, say N.
+
+config TI_SYSCON_CLK
+	tristate "Syscon based clock driver for K2/K3 SoCs"
+	depends on (ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST) && OF
+	default (ARCH_KEYSTONE || ARCH_K3)
+	help
+	  This adds clock driver support for syscon based gate
+	  clocks on TI's K2 and K3 SoCs.
diff --git a/drivers/clk/keystone/Makefile b/drivers/clk/keystone/Makefile
index c12593966f9b..30e481386316 100644
--- a/drivers/clk/keystone/Makefile
+++ b/drivers/clk/keystone/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_COMMON_CLK_KEYSTONE)	+= pll.o gate.o
 obj-$(CONFIG_TI_SCI_CLK)		+= sci-clk.o
+obj-$(CONFIG_TI_SYSCON_CLK)		+= syscon-clk.o
diff --git a/drivers/clk/keystone/syscon-clk.c b/drivers/clk/keystone/syscon-clk.c
new file mode 100644
index 000000000000..063a8e5df324
--- /dev/null
+++ b/drivers/clk/keystone/syscon-clk.c
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+//
+
+#include <linux/clk-provider.h>
+#include <linux/clk.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+struct ti_syscon_gate_clk_priv {
+	struct clk_hw hw;
+	struct regmap *regmap;
+	u32 reg;
+	u32 idx;
+};
+
+static struct
+ti_syscon_gate_clk_priv *to_ti_syscon_gate_clk_priv(struct clk_hw *hw)
+{
+	return container_of(hw, struct ti_syscon_gate_clk_priv, hw);
+}
+
+static int ti_syscon_gate_clk_enable(struct clk_hw *hw)
+{
+	struct ti_syscon_gate_clk_priv *priv = to_ti_syscon_gate_clk_priv(hw);
+
+	return regmap_write_bits(priv->regmap, priv->reg, priv->idx,
+				 priv->idx);
+}
+
+static void ti_syscon_gate_clk_disable(struct clk_hw *hw)
+{
+	struct ti_syscon_gate_clk_priv *priv = to_ti_syscon_gate_clk_priv(hw);
+
+	regmap_write_bits(priv->regmap, priv->reg, priv->idx, 0);
+}
+
+static int ti_syscon_gate_clk_is_enabled(struct clk_hw *hw)
+{
+	unsigned int val;
+	struct ti_syscon_gate_clk_priv *priv = to_ti_syscon_gate_clk_priv(hw);
+
+	regmap_read(priv->regmap, priv->reg, &val);
+
+	return !!(val & priv->idx);
+}
+
+static const struct clk_ops ti_syscon_gate_clk_ops = {
+	.enable		= ti_syscon_gate_clk_enable,
+	.disable	= ti_syscon_gate_clk_disable,
+	.is_enabled	= ti_syscon_gate_clk_is_enabled,
+};
+
+static int ti_syscon_gate_clk_probe(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct ti_syscon_gate_clk_priv *priv;
+	struct device *dev = &pdev->dev;
+	struct clk_init_data init;
+	unsigned long flags = 0;
+	const char *parent_name;
+	struct clk *parent;
+	u32 idx;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->regmap = syscon_node_to_regmap(of_get_parent(node));
+	if (IS_ERR(priv->regmap)) {
+		if (PTR_ERR(priv->regmap) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		dev_err(dev, "failed to find parent regmap\n");
+		return PTR_ERR(priv->regmap);
+	}
+
+	if (of_property_read_u32(node, "reg", &priv->reg)) {
+		dev_err(dev, "missing reg property\n");
+		return -EINVAL;
+	}
+
+	if (of_property_read_u32(node, "ti,clock-bit-idx", &idx)) {
+		dev_err(dev, "missing ti,bit-shift property\n");
+		return -EINVAL;
+	}
+	priv->idx = BIT(idx);
+
+	if (of_clk_get_parent_count(node) != 1) {
+		dev_err(dev, "must have clk parent\n");
+		return -EINVAL;
+	}
+
+	parent = devm_clk_get(dev, NULL);
+	if (IS_ERR(parent)) {
+		if (PTR_ERR(priv->regmap) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		return PTR_ERR(parent);
+	}
+
+	parent_name = __clk_get_name(parent);
+
+	init.name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn:%04x:%d",
+				   node, priv->reg, idx);
+	init.ops = &ti_syscon_gate_clk_ops;
+	init.flags = flags;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	priv->hw.init = &init;
+	ret = devm_clk_hw_register(&pdev->dev, &priv->hw);
+	if (ret < 0) {
+		dev_err(dev, "failed to register clk err: %d\n", ret);
+		return ret;
+	}
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, priv);
+}
+
+static const struct of_device_id ti_syscon_gate_clk_ids[] = {
+	{ .compatible = "ti,syscon-gate-clock" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ti_syscon_gate_clk_ids);
+
+static struct platform_driver ti_syscon_gate_clk_driver = {
+	.probe = ti_syscon_gate_clk_probe,
+	.driver = {
+		.name = "ti-syscon-gate-clk",
+		.of_match_table = ti_syscon_gate_clk_ids,
+	},
+};
+
+module_platform_driver(ti_syscon_gate_clk_driver);
+
+MODULE_ALIAS("platform:ti-syscon-gate-clk");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Syscon backed gate-clock driver");
+MODULE_AUTHOR("Vignesh Raghavendra <vigneshr@ti.com>");
-- 
2.21.0
