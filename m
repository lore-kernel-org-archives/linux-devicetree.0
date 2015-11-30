From: Simon Arlott <simon@fire.lp0.eu>
Subject: [PATCH 2/2] regulator: bcm63xx: Add BCM63xx fixed regulator device
Date: Mon, 30 Nov 2015 20:30:55 +0000
Message-ID: <565CB1FF.9090407@simon.arlott.org.uk>
References: <565A18DD.60108@simon.arlott.org.uk>
 <20151130121043.GX1929@sirena.org.uk> <565CB1CF.5040306@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <565CB1CF.5040306@simon.arlott.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Jonas Gorski <jogo@openwrt.org>
List-Id: devicetree@vger.kernel.org

The BCM63xx has one or more registers with bits that act as regulators
to enable/disable power to individual chip peripherals.

Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
---
 MAINTAINERS                           |   1 +
 drivers/regulator/Kconfig             |   9 +++
 drivers/regulator/Makefile            |   1 +
 drivers/regulator/bcm63xx-regulator.c | 125 ++++++++++++++++++++++++++++++++++
 4 files changed, 136 insertions(+)
 create mode 100644 drivers/regulator/bcm63xx-regulator.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a381176..29e0589 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2376,6 +2376,7 @@ F:	arch/mips/boot/dts/brcm/bcm*.dts*
 F:	drivers/irqchip/irq-bcm63*
 F:	drivers/irqchip/irq-bcm7*
 F:	drivers/irqchip/irq-brcmstb*
+F:	drivers/regulator/bcm63*
 F:	include/linux/bcm63xx_wdt.h
 
 BROADCOM TG3 GIGABIT ETHERNET DRIVER
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 8df0b0e..8a2d5db 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -146,6 +146,15 @@ config REGULATOR_AXP20X
 	  This driver provides support for the voltage regulators on the
 	  AXP20X PMIC.
 
+config REGULATOR_BCM63XX
+	tristate "Broadcom BCM63xx Regulators"
+	depends on OF
+	depends on MFD_SYSCON
+	depends on BMIPS_GENERIC
+	help
+	  This driver provides support for the fixed regulators on the
+	  BCM63xx SoCs.
+
 config REGULATOR_BCM590XX
 	tristate "Broadcom BCM590xx PMU Regulators"
 	depends on MFD_BCM590XX
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 0f81749..23e8a4b 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_REGULATOR_ARIZONA) += arizona-micsupp.o arizona-ldo1.o
 obj-$(CONFIG_REGULATOR_AS3711) += as3711-regulator.o
 obj-$(CONFIG_REGULATOR_AS3722) += as3722-regulator.o
 obj-$(CONFIG_REGULATOR_AXP20X) += axp20x-regulator.o
+obj-$(CONFIG_REGULATOR_BCM63XX) += bcm63xx-regulator.o
 obj-$(CONFIG_REGULATOR_BCM590XX) += bcm590xx-regulator.o
 obj-$(CONFIG_REGULATOR_DA903X)	+= da903x.o
 obj-$(CONFIG_REGULATOR_DA9052)	+= da9052-regulator.o
diff --git a/drivers/regulator/bcm63xx-regulator.c b/drivers/regulator/bcm63xx-regulator.c
new file mode 100644
index 0000000..7f9afad
--- /dev/null
+++ b/drivers/regulator/bcm63xx-regulator.c
@@ -0,0 +1,125 @@
+/*
+ * Copyright 2015 Simon Arlott
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of the
+ * License, or (at your option) any later version.
+ *
+ * Derived from fixed.c:
+ * Copyright 2008 Wolfson Microelectronics PLC.
+ *
+ * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
+ *
+ * Copyright (c) 2009 Nokia Corporation
+ * Roger Quadros <ext-roger.quadros@nokia.com>
+ */
+
+#include <linux/err.h>
+#include <linux/mutex.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/driver.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/regulator/of_regulator.h>
+#include <linux/regulator/machine.h>
+#include <linux/mfd/syscon.h>
+
+static struct regulator_ops bcm63xx_regulator_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+};
+
+static int __init bcm63xx_regulator_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct regulator_desc *desc;
+	struct regulator_init_data *init_data;
+	struct regulator_config cfg = { };
+	struct regulator_dev *reg_dev;
+	u32 val;
+	int ret;
+
+	desc = devm_kzalloc(dev, sizeof(*desc), GFP_KERNEL);
+	if (!desc)
+		return -ENOMEM;
+
+	init_data = of_get_regulator_init_data(dev, np, desc);
+	if (!init_data) {
+		dev_err(dev, "Failed to get regulator init data\n");
+		return -EINVAL;
+	}
+
+	/* Only status change is supported, regardless of DT init data */
+	init_data->valid_ops_mask &= ~REGULATOR_CHANGE_STATUS;
+
+	desc->name = devm_kstrdup(dev, init_data->constraints.name, GFP_KERNEL);
+	if (desc->name == NULL)
+		return -ENOMEM;
+	desc->type = REGULATOR_VOLTAGE;
+	desc->owner = THIS_MODULE;
+	desc->ops = &bcm63xx_regulator_ops;
+
+	/* Clearing a bit in the register enables power */
+	desc->enable_is_inverted = true;
+
+	cfg.dev = dev;
+	cfg.init_data = init_data;
+	cfg.of_node = np;
+
+	cfg.regmap = syscon_regmap_lookup_by_phandle(np, "regmap");
+	if (IS_ERR(cfg.regmap)) {
+		ret = PTR_ERR(cfg.regmap);
+		dev_err(dev, "Failed to get regmap for %s: %d\n",
+			desc->name, ret);
+		return ret;
+	}
+
+	if (of_property_read_u32(np, "offset", &val)) {
+		dev_err(dev, "Missing register offset for %s\n", desc->name);
+		return -EINVAL;
+	}
+	desc->enable_reg = val;
+
+	if (of_property_read_u32(np, "mask", &val)) {
+		dev_err(dev, "Missing register mask for %s\n", desc->name);
+		return -EINVAL;
+	}
+	desc->enable_mask = val;
+
+	if (!of_property_read_u32(np, "startup-delay-us", &val))
+		desc->enable_time = val;
+
+	reg_dev = devm_regulator_register(dev, desc, &cfg);
+	if (IS_ERR(reg_dev)) {
+		ret = PTR_ERR(reg_dev);
+		dev_err(dev, "Failed to register regulator %s: %d\n",
+			desc->name, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id bcm63xx_regulator_of_match[] __initconst = {
+	{ .compatible = "brcm,bcm63xx-regulator", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, bcm63xx_regulator_of_match);
+
+static struct platform_driver bcm63xx_regulator_driver __refdata = {
+	.probe		= bcm63xx_regulator_probe,
+	.driver		= {
+		.name		= "bcm63xx-regulator",
+		.of_match_table = bcm63xx_regulator_of_match,
+	},
+};
+
+module_platform_driver(bcm63xx_regulator_driver);
+
+MODULE_AUTHOR("Simon Arlott");
+MODULE_DESCRIPTION("BCM63xx regulator");
+MODULE_LICENSE("GPL");
-- 
2.1.4

-- 
Simon Arlott
