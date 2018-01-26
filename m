From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: core: Move of_find_regulator_by_node() to of_regulator.c" to the regulator tree
Date: Fri, 26 Jan 2018 17:35:48 +0000
Message-ID: <E1ef7um-0002dM-Ah@debutante>
References: <1512639975-22241-2-git-send-email-m.purski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1512639975-22241-2-git-send-email-m.purski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maciej Purski <m.purski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: core: Move of_find_regulator_by_node() to of_regulator.c

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 148096af0bf381c78afe253c07ef1c77778f0e68 Mon Sep 17 00:00:00 2001
From: Maciej Purski <m.purski@samsung.com>
Date: Mon, 22 Jan 2018 15:30:06 +0100
Subject: [PATCH] regulator: core: Move of_find_regulator_by_node() to
 of_regulator.c

As of_find_regulator_by_node() is an of function it should be moved from
core.c to of_regulator.c. It provides better separation of device tree
functions from the core and allows other of_functions in of_regulator.c
to resolve device_node to regulator_dev. This will be useful for
implementation of parsing coupled regulators properties.

Declare of_find_regulator_by_node() function in internal.h as well as
regulator_class and dev_to_rdev(), as they are needed by
of_find_regulator_by_node().

Signed-off-by: Maciej Purski <m.purski@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/core.c         | 23 +----------------------
 drivers/regulator/internal.h     |  9 +++++++++
 drivers/regulator/of_regulator.c | 14 ++++++++++++++
 3 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 365b32e3f505..5f7678292cef 100644
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
index 66a8ea0c8386..2f3218be5b8d 100644
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
index 14637a01ba2d..54e810ae93d6 100644
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
2.15.1
