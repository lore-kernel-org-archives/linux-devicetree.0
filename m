From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 2/4] clk: arizona: Add clock driver for the Arizona devices
Date: Tue, 5 Jan 2016 15:41:40 +0000
Message-ID: <1452008502-3749-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1452008502-3749-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1452008502-3749-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-clk-owner@vger.kernel.org
To: mturquette@baylibre.com, cw00.choi@samsung.com, lee.jones@linaro.org
Cc: sboyd@codeaurora.org, myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Add an initial clock driver for the Arizona series audio CODECs.
Currently this driver only provides support for parsing the two input
clocks (mclk1, mclk2) and providing the internally consumed 32k clock.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 MAINTAINERS                       |   1 +
 drivers/clk/Kconfig               |   6 ++
 drivers/clk/Makefile              |   1 +
 drivers/clk/clk-arizona.c         | 192 ++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/arizona/pdata.h |   3 +
 5 files changed, 203 insertions(+)
 create mode 100644 drivers/clk/clk-arizona.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 233f834..29e161a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11681,6 +11681,7 @@ F:	Documentation/devicetree/bindings/regulator/arizona-regulator.txt
 F:	Documentation/devicetree/bindings/mfd/arizona.txt
 F:	arch/arm/mach-s3c64xx/mach-crag6410*
 F:	drivers/clk/clk-wm83*.c
+F:	drivers/clk/clk-arizona.c
 F:	drivers/extcon/extcon-arizona.c
 F:	drivers/leds/leds-wm83*.c
 F:	drivers/gpio/gpio-*wm*.c
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index c3e3a02..becd743 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -25,6 +25,12 @@ config COMMON_CLK
 menu "Common Clock Framework"
 	depends on COMMON_CLK
 
+config COMMON_CLK_ARIZONA
+	tristate "Clock driver for Arizona devices"
+	depends on MFD_ARIZONA
+	---help---
+	  This driver supports the clocking on the Arizona devices.
+
 config COMMON_CLK_WM831X
 	tristate "Clock driver for WM831x/2x PMICs"
 	depends on MFD_WM831X
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 820714c..11e3aaa 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -17,6 +17,7 @@ endif
 
 # hardware specific clock types
 # please keep this section sorted lexicographically by file/directory path name
+obj-$(CONFIG_COMMON_CLK_ARIZONA)	+= clk-arizona.o
 obj-$(CONFIG_MACH_ASM9260)		+= clk-asm9260.o
 obj-$(CONFIG_COMMON_CLK_AXI_CLKGEN)	+= clk-axi-clkgen.o
 obj-$(CONFIG_ARCH_AXXIA)		+= clk-axm5516.o
diff --git a/drivers/clk/clk-arizona.c b/drivers/clk/clk-arizona.c
new file mode 100644
index 0000000..1ab69ee
--- /dev/null
+++ b/drivers/clk/clk-arizona.c
@@ -0,0 +1,192 @@
+/*
+ * Arizona clock control
+ *
+ * Copyright 2016 Cirrus Logic, Inc.
+ *
+ * Author: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
+ *
+ *  This program is free software; you can redistribute  it and/or modify it
+ *  under  the terms of  the GNU General  Public License as published by the
+ *  Free Software Foundation;  either version 2 of the  License, or (at your
+ *  option) any later version.
+ */
+
+#include <linux/clkdev.h>
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <linux/mfd/arizona/core.h>
+#include <linux/mfd/arizona/pdata.h>
+#include <linux/mfd/arizona/registers.h>
+
+#define CLK32K_RATE 32768
+
+struct arizona_clk {
+	struct arizona *arizona;
+
+	struct clk_hw clk32k_hw;
+	struct clk *clk32k;
+};
+
+static inline struct arizona_clk *clk32k_to_arizona_clk(struct clk_hw *hw)
+{
+	return container_of(hw, struct arizona_clk, clk32k_hw);
+}
+
+static int arizona_32k_enable(struct clk_hw *hw)
+{
+	struct arizona_clk *clkdata = clk32k_to_arizona_clk(hw);
+	struct arizona *arizona = clkdata->arizona;
+	int ret;
+
+	switch (arizona->pdata.clk32k_src) {
+	case ARIZONA_32KZ_MCLK1:
+		ret = pm_runtime_get_sync(arizona->dev);
+		if (ret != 0)
+			goto out;
+		break;
+	}
+
+	ret = regmap_update_bits_async(arizona->regmap, ARIZONA_CLOCK_32K_1,
+				       ARIZONA_CLK_32K_ENA,
+				       ARIZONA_CLK_32K_ENA);
+
+out:
+	return ret;
+}
+
+static void arizona_32k_disable(struct clk_hw *hw)
+{
+	struct arizona_clk *clkdata = clk32k_to_arizona_clk(hw);
+	struct arizona *arizona = clkdata->arizona;
+
+	regmap_update_bits_async(arizona->regmap, ARIZONA_CLOCK_32K_1,
+				 ARIZONA_CLK_32K_ENA, 0);
+
+	switch (arizona->pdata.clk32k_src) {
+	case ARIZONA_32KZ_MCLK1:
+		pm_runtime_put_sync(arizona->dev);
+		break;
+	}
+}
+
+static const struct clk_ops arizona_32k_ops = {
+	.prepare = arizona_32k_enable,
+	.unprepare = arizona_32k_disable,
+};
+
+static int arizona_clk_of_get_pdata(struct arizona *arizona)
+{
+	const char * const pins[] = { "mclk1", "mclk2" };
+	struct clk *mclk;
+	int i;
+
+	if (!of_property_read_bool(arizona->dev->of_node, "clocks"))
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(pins); ++i) {
+		mclk = of_clk_get_by_name(arizona->dev->of_node, pins[i]);
+		if (IS_ERR(mclk))
+			return PTR_ERR(mclk);
+
+		if (clk_get_rate(mclk) == CLK32K_RATE) {
+			arizona->pdata.clk32k_src = ARIZONA_32KZ_MCLK1 + i;
+			arizona->pdata.clk32k_parent = __clk_get_name(mclk);
+		}
+
+		clk_put(mclk);
+	}
+
+	return 0;
+}
+
+static int arizona_clk_probe(struct platform_device *pdev)
+{
+	struct arizona *arizona = dev_get_drvdata(pdev->dev.parent);
+	struct arizona_clk *clkdata;
+	int ret;
+
+	struct clk_init_data clk32k_init = {
+		.name = "arizona-32k",
+		.ops = &arizona_32k_ops,
+	};
+
+	if (IS_ENABLED(CONFIG_OF) && !dev_get_platdata(arizona->dev)) {
+		ret = arizona_clk_of_get_pdata(arizona);
+		if (ret) {
+			dev_err(arizona->dev, "Failed parsing clock DT: %d\n",
+				ret);
+			return ret;
+		}
+	}
+
+	clkdata = devm_kzalloc(&pdev->dev, sizeof(*clkdata), GFP_KERNEL);
+	if (!clkdata)
+		return -ENOMEM;
+
+	clkdata->arizona = arizona;
+
+	switch (arizona->pdata.clk32k_src) {
+	case 0:
+		arizona->pdata.clk32k_src = ARIZONA_32KZ_MCLK2;
+		/* Fall through */
+	case ARIZONA_32KZ_MCLK1:
+	case ARIZONA_32KZ_MCLK2:
+	case ARIZONA_32KZ_NONE:
+		regmap_update_bits(arizona->regmap, ARIZONA_CLOCK_32K_1,
+				   ARIZONA_CLK_32K_SRC_MASK,
+				   arizona->pdata.clk32k_src - 1);
+		break;
+	default:
+		dev_err(arizona->dev, "Invalid 32kHz clock source: %d\n",
+			arizona->pdata.clk32k_src);
+		return -EINVAL;
+	}
+
+	if (arizona->pdata.clk32k_parent) {
+		clk32k_init.num_parents = 1;
+		clk32k_init.parent_names = &arizona->pdata.clk32k_parent;
+	} else {
+		clk32k_init.flags |= CLK_IS_ROOT;
+	}
+
+	clkdata->clk32k_hw.init = &clk32k_init;
+	clkdata->clk32k = devm_clk_register(&pdev->dev, &clkdata->clk32k_hw);
+	if (IS_ERR(clkdata->clk32k)) {
+		ret = PTR_ERR(clkdata->clk32k);
+		dev_err(arizona->dev, "Failed to register 32k clock: %d\n",
+			ret);
+		return ret;
+	}
+
+	ret = clk_register_clkdev(clkdata->clk32k, "arizona-32k",
+				  dev_name(arizona->dev));
+	if (ret) {
+		dev_err(arizona->dev, "Failed to register 32k clock dev: %d\n",
+			ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, clkdata);
+
+	return 0;
+}
+
+static struct platform_driver arizona_clk_driver = {
+	.probe = arizona_clk_probe,
+	.driver		= {
+		.name	= "arizona-clk",
+	},
+};
+
+module_platform_driver(arizona_clk_driver);
+
+/* Module information */
+MODULE_AUTHOR("Charles Keepax <ckeepax@opensource.wolfsonmicro.com>");
+MODULE_DESCRIPTION("Clock driver for Arizona devices");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:arizona-clk");
diff --git a/include/linux/mfd/arizona/pdata.h b/include/linux/mfd/arizona/pdata.h
index 57b45ca..ddeee17 100644
--- a/include/linux/mfd/arizona/pdata.h
+++ b/include/linux/mfd/arizona/pdata.h
@@ -87,6 +87,9 @@ struct arizona_pdata {
 	/** If a direct 32kHz clock is provided on an MCLK specify it here */
 	int clk32k_src;
 
+	/** Name of the parent clock for the 32k clock */
+	const char *clk32k_parent;
+
 	/** Mode for primary IRQ (defaults to active low) */
 	unsigned int irq_flags;
 
-- 
2.1.4

