From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH v3 1/4] regulator: core: Move of_find_regulator_by_node() to
 of_regulator.c
Date: Thu, 07 Dec 2017 10:46:12 +0100
Message-ID: <1512639975-22241-2-git-send-email-m.purski@samsung.com>
References: <1512639975-22241-1-git-send-email-m.purski@samsung.com>
        <CGME20171207094751eucas1p1c10de599329e2c7ece77c8a5ed939401@eucas1p1.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1512639975-22241-1-git-send-email-m.purski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Maciej Purski <m.purski@samsung.com>
List-Id: devicetree@vger.kernel.org

As of_find_regulator_by_node() is an of function it should be moved from
core to of_regulator.c. It provides better separation of device tree
functions from the core and allows other of_functions in of_regulator
to resolve device_node to regulator_dev. This will be useful for
implementation of parsing coupled regulators properties.

Declare of_find_regulator_by_node() function in internal.h as well as
regulator_class and dev_to_rdev(), as they are needed by
of_find_regulator_by_node().

Signed-off-by: Maciej Purski <m.purski@samsung.com>
---
 drivers/regulator/core.c         | 23 +----------------------
 drivers/regulator/internal.h     |  9 +++++++++
 drivers/regulator/of_regulator.c | 14 ++++++++++++++
 3 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index b64b791..9662e54 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -58,8 +58,6 @@ static bool has_full_constraints;
 
 static struct dentry *debugfs_root;
 
-static struct class regulator_class;
-
 /*
  * struct regulator_map
  *
@@ -112,11 +110,6 @@ static struct regulator *create_regulator(struct regulator_dev *rdev,
 					  const char *supply_name);
 static void _regulator_put(struct regulator *regulator);
 
-static struct regulator_dev *dev_to_rdev(struct device *dev)
-{
-	return container_of(dev, struct regulator_dev, dev);
-}
-
 static const char *rdev_get_name(struct regulator_dev *rdev)
 {
 	if (rdev->constraints && rdev->constraints->name)
@@ -1417,20 +1410,6 @@ static void regulator_supply_alias(struct device **dev, const char **supply)
 	}
 }
 
-static int of_node_match(struct device *dev, const void *data)
-{
-	return dev->of_node == data;
-}
-
-static struct regulator_dev *of_find_regulator_by_node(struct device_node *np)
-{
-	struct device *dev;
-
-	dev = class_find_device(&regulator_class, NULL, np, of_node_match);
-
-	return dev ? dev_to_rdev(dev) : NULL;
-}
-
 static int regulator_match(struct device *dev, const void *data)
 {
 	struct regulator_dev *r = dev_to_rdev(dev);
@@ -3918,7 +3897,7 @@ static void regulator_dev_release(struct device *dev)
 	kfree(rdev);
 }
 
-static struct class regulator_class = {
+struct class regulator_class = {
 	.name = "regulator",
 	.dev_release = regulator_dev_release,
 	.dev_groups = regulator_dev_groups,
diff --git a/drivers/regulator/internal.h b/drivers/regulator/internal.h
index 66a8ea0..2f3218b 100644
--- a/drivers/regulator/internal.h
+++ b/drivers/regulator/internal.h
@@ -35,6 +35,15 @@ struct regulator {
 	struct dentry *debugfs;
 };
 
+extern struct class regulator_class;
+
+static inline struct regulator_dev *dev_to_rdev(struct device *dev)
+{
+	return container_of(dev, struct regulator_dev, dev);
+}
+
+struct regulator_dev *of_find_regulator_by_node(struct device_node *np);
+
 #ifdef CONFIG_OF
 struct regulator_init_data *regulator_of_get_init_data(struct device *dev,
 			         const struct regulator_desc *desc,
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 14637a0..54e810a 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -376,3 +376,17 @@ struct regulator_init_data *regulator_of_get_init_data(struct device *dev,
 
 	return init_data;
 }
+
+static int of_node_match(struct device *dev, const void *data)
+{
+	return dev->of_node == data;
+}
+
+struct regulator_dev *of_find_regulator_by_node(struct device_node *np)
+{
+	struct device *dev;
+
+	dev = class_find_device(&regulator_class, NULL, np, of_node_match);
+
+	return dev ? dev_to_rdev(dev) : NULL;
+}
-- 
2.7.4
