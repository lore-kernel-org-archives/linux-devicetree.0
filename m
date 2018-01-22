From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH v4 1/7] regulator: core: Move of_find_regulator_by_node() to
 of_regulator.c
Date: Mon, 22 Jan 2018 15:30:06 +0100
Message-ID: <1516631412-17542-2-git-send-email-m.purski@samsung.com>
References: <1516631412-17542-1-git-send-email-m.purski@samsung.com>
        <CGME20180122143029eucas1p284202b6e60a86b428b3aa1e6eef62bda@eucas1p2.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1516631412-17542-1-git-send-email-m.purski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Maciej Purski <m.purski@samsung.com>
List-Id: devicetree@vger.kernel.org

As of_find_regulator_by_node() is an of function it should be moved from
core.c to of_regulator.c. It provides better separation of device tree
functions from the core and allows other of_functions in of_regulator.c
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
index be767dd..ab6652e 100644
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
@@ -1418,20 +1411,6 @@ static void regulator_supply_alias(struct device **dev, const char **supply)
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
@@ -3923,7 +3902,7 @@ static void regulator_dev_release(struct device *dev)
 	kfree(rdev);
 }
 
-static struct class regulator_class = {
+struct class regulator_class = {
 	.name = "regulator",
 	.dev_release = regulator_dev_release,
 	.dev_groups = regulator_dev_groups,
diff --git a/drivers/regulator/internal.h b/drivers/regulator/internal.h
index aba8e414..abfd56e 100644
--- a/drivers/regulator/internal.h
+++ b/drivers/regulator/internal.h
@@ -49,6 +49,15 @@ struct regulator {
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
index 41dad42..caedd3d 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -378,3 +378,17 @@ struct regulator_init_data *regulator_of_get_init_data(struct device *dev,
 
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
