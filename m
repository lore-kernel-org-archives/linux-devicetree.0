From: Alban Bedel <alban.bedel@avionic-design.de>
Subject: [PATCH 4/4] regulator: add a regulator group driver
Date: Mon, 24 Nov 2014 14:02:03 +0100
Message-ID: <1416834123-23139-4-git-send-email-alban.bedel@avionic-design.de>
References: <1416834123-23139-1-git-send-email-alban.bedel@avionic-design.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1416834123-23139-1-git-send-email-alban.bedel@avionic-design.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Alban Bedel <alban.bedel@avionic-design.de>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

This driver allow using simple driver that expect a single regulator
on hardware that need to enable several regulators. Optionally the
driver can enforce the enable and disable order to provide a simple
power sequencing.

Signed-off-by: Alban Bedel <alban.bedel@avionic-design.de>
---
 drivers/regulator/Kconfig  |   8 +++
 drivers/regulator/Makefile |   1 +
 drivers/regulator/group.c  | 161 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 170 insertions(+)
 create mode 100644 drivers/regulator/group.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index ebfd9a7..895adc6 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -62,6 +62,14 @@ config REGULATOR_CONSTRAINED_SUPPLY
 	  This is mostly useful to use drivers that don't explicitly set a
 	  voltage on boards that use variable regulators.
 
+config REGULATOR_GROUP
+	tristate "Regulator group"
+	depends on OF
+	help
+	  This driver allow grouping regulators to use simple drivers that
+	  expect a single regulator on hardware where several regulator
+	  are required.
+
 config REGULATOR_88PM800
 	tristate "Marvell 88PM800 Power regulators"
 	depends on MFD_88PM800
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 99c7979..263ce6a 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_REGULATOR_FIXED_VOLTAGE) += fixed.o
 obj-$(CONFIG_REGULATOR_VIRTUAL_CONSUMER) += virtual.o
 obj-$(CONFIG_REGULATOR_USERSPACE_CONSUMER) += userspace-consumer.o
 obj-$(CONFIG_REGULATOR_CONSTRAINED_SUPPLY) += constrained-supply.o
+obj-$(CONFIG_REGULATOR_GROUP) += group.o
 
 obj-$(CONFIG_REGULATOR_88PM800) += 88pm800.o
 obj-$(CONFIG_REGULATOR_88PM8607) += 88pm8607.o
diff --git a/drivers/regulator/group.c b/drivers/regulator/group.c
new file mode 100644
index 0000000..8373430
--- /dev/null
+++ b/drivers/regulator/group.c
@@ -0,0 +1,161 @@
+/*
+ * Regulator driver that group several supplies together
+ *
+ * Copyright (C) 2014 - Alban Bedel
+ *
+ * Author: Alban Bedel <alban.bedel@avionic-design.de>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/err.h>
+#include <linux/of_device.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/of_regulator.h>
+
+struct regulator_group {
+	bool ordered;
+	unsigned int supply_count;
+	struct regulator_bulk_data supply[];
+};
+
+static int regulator_group_enable(struct regulator_dev *rdev)
+{
+	struct regulator_group *group = rdev_get_drvdata(rdev);
+	int i, err = 0;
+
+	/* If no ordering is needed just use bulk enable */
+	if (!group->ordered)
+		return regulator_bulk_enable(
+			group->supply_count, group->supply);
+
+	/* Otherwise do it ourself */
+	for (i = 0; !err && i < group->supply_count; i++)
+		err = regulator_enable(group->supply[i].consumer);
+
+	/* Rollback in case of error */
+	if (err)
+		for (i--; i >= 0; i--)
+			regulator_disable(group->supply[i].consumer);
+
+	return err;
+}
+
+static int regulator_group_disable(struct regulator_dev *rdev)
+{
+	struct regulator_group *group = rdev_get_drvdata(rdev);
+	int i, r, err = 0;
+
+	/* If no ordering is needed just use bulk disable */
+	if (!group->ordered)
+		return regulator_bulk_disable(
+			group->supply_count, group->supply);
+
+	/* Otherwise do it ourself */
+	for (i = group->supply_count - 1; i >= 0; i--)
+		regulator_disable(group->supply[i].consumer);
+
+	/* Rollback in case of error */
+	if (err)
+		for (i++; i < group->supply_count; i++) {
+			r = regulator_enable(group->supply[i].consumer);
+			if (r)
+				dev_err(&rdev->dev,
+					"Failed to reenable suplly %s: %d\n",
+					group->supply[i].supply, r);
+		}
+
+	return err;
+}
+
+static int regulator_group_is_enabled(struct regulator_dev *rdev)
+{
+	return rdev->use_count > 0;
+}
+
+static struct regulator_ops regulator_group_ops = {
+	.enable		= regulator_group_enable,
+	.disable	= regulator_group_disable,
+	.is_enabled	= regulator_group_is_enabled,
+};
+
+static const struct regulator_desc regulator_group_desc = {
+	.name		= "group",
+	.ops		= &regulator_group_ops,
+	.type		= REGULATOR_VOLTAGE,
+	.owner		= THIS_MODULE,
+};
+
+static int regulator_group_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct regulator_config config = {};
+	struct regulator_dev *regulator;
+	struct regulator_group *group;
+	int i, count, err;
+
+	if (!np)
+		return -EINVAL;
+
+	count = of_property_count_strings(np, "regulator-supplies");
+	if (count < 0)
+		return count;
+
+	config.init_data = of_get_regulator_init_data(&pdev->dev, np);
+	if (!config.init_data)
+		return -ENOMEM;
+
+	group = devm_kzalloc(&pdev->dev,
+		sizeof(*group) + count * sizeof(*group->supply), GFP_KERNEL);
+	if (!group)
+		return -ENOMEM;
+
+	for (i = 0; i < count; i++) {
+		err = of_property_read_string_index(
+			np, "regulator-supplies", i,
+			&group->supply[i].supply);
+		if (err)
+			return err;
+		group->supply_count++;
+	}
+
+	group->ordered = of_property_read_bool(np, "ordered-supplies");
+
+	err = devm_regulator_bulk_get(
+		&pdev->dev, group->supply_count, group->supply);
+	if (err)
+		return err;
+
+	config.of_node = np;
+	config.dev = &pdev->dev;
+	config.driver_data = group;
+
+	regulator = devm_regulator_register(
+		&pdev->dev, &regulator_group_desc, &config);
+	return IS_ERR(regulator) ? PTR_ERR(regulator) : 0;
+}
+
+static const struct of_device_id regulator_group_of_match[] = {
+	{ .compatible = "regulator-group" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, regulator_group_of_match);
+
+static struct platform_driver regulator_group_driver = {
+	.driver = {
+		.name		= "group-regulator",
+		.owner		= THIS_MODULE,
+		.of_match_table = of_match_ptr(regulator_group_of_match),
+	},
+	.probe = regulator_group_probe,
+};
+module_platform_driver(regulator_group_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Alban Bedel <alban.bedel@avionic-design.de>");
+MODULE_DESCRIPTION("Regulator Group Driver");
+MODULE_ALIAS("platform:group-regulator");
-- 
2.1.3
