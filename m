From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH v2 2/2] reset: Add basic single-register reset driver
Date: Tue, 30 May 2017 15:38:51 +0930
Message-ID: <20170530060851.29923-3-joel@jms.id.au>
References: <20170530060851.29923-1-joel@jms.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170530060851.29923-1-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Andrew Jeffery <andrew@aj.id.au>
List-Id: devicetree@vger.kernel.org

This driver is a basic single-register reset controller driver that
supports clearing a single bit in a register.

Signed-off-by: Joel Stanley <joel@jms.id.au>

---
v2:
  - Support assert-on-clear dt property
  - Depend on OF and MFD_SYSCON

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/reset/Kconfig       |   7 +++
 drivers/reset/Makefile      |   1 +
 drivers/reset/reset-basic.c | 113 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 121 insertions(+)
 create mode 100644 drivers/reset/reset-basic.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d21c07ccc94e..8560e304905c 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -28,6 +28,13 @@ config RESET_ATH79
 	  This enables the ATH79 reset controller driver that supports the
 	  AR71xx SoC reset controller.
 
+config RESET_BASIC
+	bool "Basic Reset Driver"
+	depends on OF && MFD_SYSCON
+	help
+	  This enables a basic single-register reset controller driver that
+	  supports clearing a single bit in a register.
+
 config RESET_BERLIN
 	bool "Berlin Reset Driver" if COMPILE_TEST
 	default ARCH_BERLIN
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 02a74db94339..e8e8869e098d 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_ARCH_STI) += sti/
 obj-$(CONFIG_ARCH_TEGRA) += tegra/
 obj-$(CONFIG_RESET_A10SR) += reset-a10sr.o
 obj-$(CONFIG_RESET_ATH79) += reset-ath79.o
+obj-$(CONFIG_RESET_BASIC) += reset-basic.o
 obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
 obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
 obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
diff --git a/drivers/reset/reset-basic.c b/drivers/reset/reset-basic.c
new file mode 100644
index 000000000000..5afac408295a
--- /dev/null
+++ b/drivers/reset/reset-basic.c
@@ -0,0 +1,113 @@
+/*
+ * Copyright 2017 IBM Corperation
+ *
+ * Joel Stanley <joel@jms.id.au>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#include <linux/delay.h>
+#include <linux/init.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+#include <linux/reset-controller.h>
+
+#define to_basic_reset_priv(p)		\
+	container_of((p), struct basic_reset_priv, rcdev)
+
+struct basic_reset_priv {
+	struct regmap			*regmap;
+	struct reset_controller_dev	rcdev;
+	u32				reg;
+	bool				assert_on_clear;
+};
+
+static int basic_reset_assert(struct reset_controller_dev *rcdev,
+			      unsigned long id)
+{
+	struct basic_reset_priv *priv = to_basic_reset_priv(rcdev);
+	u32 value = priv->assert_on_clear ? 0 : BIT(id);
+
+	regmap_update_bits(priv->regmap, priv->reg, BIT(id), value);
+
+	return 0;
+}
+
+static int basic_reset_deassert(struct reset_controller_dev *rcdev,
+				unsigned long id)
+{
+	struct basic_reset_priv *priv = to_basic_reset_priv(rcdev);
+	u32 value = priv->assert_on_clear ? BIT(id) : 0;
+
+	regmap_update_bits(priv->regmap, priv->reg, BIT(id), value);
+
+	return 0;
+}
+
+static int basic_reset_status(struct reset_controller_dev *rcdev,
+			      unsigned long id)
+{
+	struct basic_reset_priv *priv = to_basic_reset_priv(rcdev);
+	u32 mask = BIT(id);
+	u32 val;
+
+	regmap_read(priv->regmap, priv->reg, &val);
+
+	return !!(val & mask);
+}
+
+static const struct reset_control_ops basic_reset_ops = {
+	.assert = basic_reset_assert,
+	.deassert = basic_reset_deassert,
+	.status = basic_reset_status,
+};
+
+static int basic_reset_probe(struct platform_device *pdev)
+{
+	struct device_node *parent_np = of_get_parent(pdev->dev.of_node);
+	struct basic_reset_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->regmap = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
+
+	ret = of_property_read_u32(pdev->dev.of_node, "reg", &priv->reg);
+	if (ret)
+		return ret;
+
+	priv->assert_on_clear = of_property_read_bool(pdev->dev.of_node,
+			"assert-on-clear");
+
+	priv->rcdev.owner = THIS_MODULE;
+	priv->rcdev.ops = &basic_reset_ops;
+	priv->rcdev.of_node = pdev->dev.of_node;
+	priv->rcdev.nr_resets = 32;
+
+	return reset_controller_register(&priv->rcdev);
+}
+
+static const struct of_device_id basic_reset_dt_match[] = {
+	{ .compatible = "reset-basic" },
+	{ },
+};
+
+static struct platform_driver basic_reset_driver = {
+	.probe	= basic_reset_probe,
+	.driver	= {
+		.name = "basic-reset",
+		.of_match_table = basic_reset_dt_match,
+	},
+};
+builtin_platform_driver(basic_reset_driver);
-- 
2.11.0
