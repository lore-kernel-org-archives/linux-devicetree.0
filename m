From: Jan Kotas <jank@cadence.com>
Subject: [PATCH v2 2/2] clk: Add Fixed MMIO clock driver
Date: Thu, 13 Dec 2018 12:49:29 +0000
Message-ID: <20181213124929.32736-3-jank@cadence.com>
References: <20181213124929.32736-1-jank@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181213124929.32736-1-jank@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kotas <jank@cadence.com>
List-Id: devicetree@vger.kernel.org

This patch adds a driver for Fixed MMIO clock.
The driver reads a clock frequency value from a single 32-bit memory
mapped register and registers it as a fixed rate clock.

It can be enabled with COMMON_CLK_FIXED_MMIO Kconfig option.

Signed-off-by: Jan Kotas <jank@cadence.com>
---
 drivers/clk/Kconfig          |   6 +++
 drivers/clk/Makefile         |   1 +
 drivers/clk/clk-fixed-mmio.c | 109 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 116 insertions(+)
 create mode 100644 drivers/clk/clk-fixed-mmio.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 81cdb4eac..69c7fb859 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -283,6 +283,12 @@ config COMMON_CLK_STM32H7
 	---help---
 	  Support for stm32h7 SoC family clocks
 
+config COMMON_CLK_FIXED_MMIO
+	bool "Clock driver for Memory Mapped Fixed values"
+	depends on COMMON_CLK && OF
+	help
+	  Support for Memory Mapped IO Fixed clocks
+
 source "drivers/clk/actions/Kconfig"
 source "drivers/clk/bcm/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 72be7a38c..4e61961dc 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_COMMON_CLK_CDCE925)	+= clk-cdce925.o
 obj-$(CONFIG_ARCH_CLPS711X)		+= clk-clps711x.o
 obj-$(CONFIG_COMMON_CLK_CS2000_CP)	+= clk-cs2000-cp.o
 obj-$(CONFIG_ARCH_EFM32)		+= clk-efm32gg.o
+obj-$(CONFIG_COMMON_CLK_FIXED_MMIO)	+= clk-fixed-mmio.o
 obj-$(CONFIG_COMMON_CLK_GEMINI)		+= clk-gemini.o
 obj-$(CONFIG_COMMON_CLK_ASPEED)		+= clk-aspeed.o
 obj-$(CONFIG_ARCH_HIGHBANK)		+= clk-highbank.o
diff --git a/drivers/clk/clk-fixed-mmio.c b/drivers/clk/clk-fixed-mmio.c
new file mode 100644
index 000000000..84e202d07
--- /dev/null
+++ b/drivers/clk/clk-fixed-mmio.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Memory Mapped IO Fixed clock driver
+ *
+ * Copyright (C) 2018 Cadence Design Systems, Inc.
+ *
+ * Authors:
+ *	Jan Kotas <jank@cadence.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/of_address.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+static struct clk *fixed_mmio_clk_setup(struct device_node *node)
+{
+	struct clk *clk;
+	const char *clk_name = node->name;
+	void __iomem *base;
+	u32 freq;
+	int ret;
+
+	base = of_iomap(node, 0);
+	if (!base) {
+		pr_err("%pOFn: failed to map address\n", node);
+		return ERR_PTR(-EIO);
+	}
+
+	freq = readl(base);
+	iounmap(base);
+	of_property_read_string(node, "clock-output-names", &clk_name);
+
+	clk = clk_register_fixed_rate(NULL, clk_name, NULL, 0, freq);
+	if (IS_ERR(clk)) {
+		pr_err("%pOFn: failed to register fixed rate clock\n", node);
+		return clk;
+	}
+
+	ret = of_clk_add_provider(node, of_clk_src_simple_get, clk);
+	if (ret) {
+		pr_err("%pOFn: failed to add clock provider\n", node);
+		clk_unregister(clk);
+		return ERR_PTR(ret);
+	}
+
+	return clk;
+}
+
+/**
+ * Setup function for fixed mmio clock
+ */
+void __init of_fixed_mmio_clk_setup(struct device_node *node)
+{
+	fixed_mmio_clk_setup(node);
+}
+CLK_OF_DECLARE(fixed_mmio_clk, "fixed-mmio-clock", of_fixed_mmio_clk_setup);
+
+
+/**
+ * Platform driver probe
+ * It is not executed when of_fixed_mmio_clk_setup succeeded.
+ */
+static int of_fixed_mmio_clk_probe(struct platform_device *pdev)
+{
+	struct clk *clk;
+
+	clk = fixed_mmio_clk_setup(pdev->dev.of_node);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	platform_set_drvdata(pdev, clk);
+
+	return 0;
+}
+
+/**
+ * Platform driver remove
+ */
+static int of_fixed_mmio_clk_remove(struct platform_device *pdev)
+{
+	struct clk *clk = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(pdev->dev.of_node);
+	clk_unregister_fixed_rate(clk);
+
+	return 0;
+}
+
+static const struct of_device_id of_fixed_mmio_clk_ids[] = {
+	{ .compatible = "fixed-mmio-clock" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, of_fixed_mmio_clk_ids);
+
+static struct platform_driver of_fixed_mmio_clk_driver = {
+	.driver = {
+		.name = "of_fixed_mmio_clk",
+		.of_match_table = of_fixed_mmio_clk_ids,
+	},
+	.probe = of_fixed_mmio_clk_probe,
+	.remove = of_fixed_mmio_clk_remove,
+};
+module_platform_driver(of_fixed_mmio_clk_driver);
+
+MODULE_AUTHOR("Jan Kotas <jank@cadence.com>");
+MODULE_DESCRIPTION("Memory Mapped IO Fixed clock driver");
+MODULE_LICENSE("GPL v2");
-- 
2.15.0
