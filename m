From: Qing Xu <qingx@marvell.com>
Subject: [PATCH 5/7] mfd: max8925: support dt for regulator
Date: Tue,  6 Nov 2012 15:44:52 +0800
Message-ID: <1352187892-9940-1-git-send-email-qingx@marvell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: qingx@marvell.com, lrg@ti.com, broonie@opensource.wolfsonmicro.com, sameo@linux.intel.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, haojian.zhuang@gmail.com, cxie4@marvell.com, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Qing Xu <qingx@marvell.com>

Signed-off-by: Qing Xu <qingx@marvell.com>
---
 drivers/regulator/max8925-regulator.c |   35 ++++++++++++++++++++++++++++++++-
 1 files changed, 34 insertions(+), 1 deletions(-)

diff --git a/drivers/regulator/max8925-regulator.c b/drivers/regulator/max8925-regulator.c
index 9bb0be3..16d9457 100644
--- a/drivers/regulator/max8925-regulator.c
+++ b/drivers/regulator/max8925-regulator.c
@@ -17,6 +17,8 @@
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/mfd/max8925.h>
+#include <linux/of.h>
+#include <linux/regulator/of_regulator.h>
 
 #define SD1_DVM_VMIN		850000
 #define SD1_DVM_VMAX		1000000
@@ -214,6 +216,34 @@ static struct max8925_regulator_info max8925_regulator_info[] = {
 	MAX8925_LDO(20, 750, 3900, 50),
 };
 
+#ifdef CONFIG_OF
+static int max8925_regulator_dt_init(struct platform_device *pdev,
+				    struct max8925_regulator_info *info,
+				    struct regulator_config *config)
+{
+	struct device_node *nproot, *np;
+	nproot = pdev->dev.parent->of_node;
+	if (!nproot)
+		return -ENODEV;
+	nproot = of_find_node_by_name(nproot, "regulators");
+	if (!nproot) {
+		dev_err(&pdev->dev, "failed to find regulators node\n");
+		return -ENODEV;
+	}
+	for_each_child_of_node(nproot, np) {
+		if (!of_node_cmp(np->name, info->desc.name)) {
+			config->init_data =
+				of_get_regulator_init_data(&pdev->dev, np);
+			config->of_node = np;
+			break;
+		}
+	}
+	return 0;
+}
+#else
+#define max8925_regulator_dt_init(x, y, z)	(-1)
+#endif
+
 static int __devinit max8925_regulator_probe(struct platform_device *pdev)
 {
 	struct max8925_chip *chip = dev_get_drvdata(pdev->dev.parent);
@@ -243,9 +273,12 @@ static int __devinit max8925_regulator_probe(struct platform_device *pdev)
 	ri->chip = chip;
 
 	config.dev = &pdev->dev;
-	config.init_data = pdata;
 	config.driver_data = ri;
 
+	if (max8925_regulator_dt_init(pdev, ri, &config))
+		if (pdata)
+			config.init_data = pdata;
+
 	rdev = regulator_register(&ri->desc, &config);
 	if (IS_ERR(rdev)) {
 		dev_err(&pdev->dev, "failed to register regulator %s\n",
-- 
1.7.0.4
