From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v2 1/3] mfd: wm831x: Add basic device tree binding
Date: Mon, 13 Feb 2017 11:15:12 +0000
Message-ID: <1486984514-29749-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, gnurou@gmail.com, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Add the basic ability to register the device through device tree, more
work is needed to get each individual sub-driver functioning correctly
but this is enough to get the device to probe from device tree.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---

Changes since v1:
 - Moved MAINTAINERS update to the binding patch
 - Fixed a warning on 64-bit architectures

 drivers/mfd/wm831x-core.c       | 32 +++++++++++++++++++++++++++++++-
 drivers/mfd/wm831x-i2c.c        |  9 ++++++++-
 drivers/mfd/wm831x-irq.c        |  6 +++---
 drivers/mfd/wm831x-spi.c        |  6 +++++-
 include/linux/mfd/wm831x/core.h | 15 +++++++++++++++
 5 files changed, 62 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/wm831x-core.c b/drivers/mfd/wm831x-core.c
index 3e0e99e..21d3cdd 100644
--- a/drivers/mfd/wm831x-core.c
+++ b/drivers/mfd/wm831x-core.c
@@ -19,6 +19,8 @@
 #include <linux/mfd/core.h>
 #include <linux/slab.h>
 #include <linux/err.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 
 #include <linux/mfd/wm831x/core.h>
 #include <linux/mfd/wm831x/pdata.h>
@@ -1613,6 +1615,31 @@ struct regmap_config wm831x_regmap_config = {
 };
 EXPORT_SYMBOL_GPL(wm831x_regmap_config);
 
+#ifdef CONFIG_OF
+const struct of_device_id wm831x_of_match[] = {
+	{ .compatible = "wlf,wm8310", .data = (void *)WM8310 },
+	{ .compatible = "wlf,wm8311", .data = (void *)WM8311 },
+	{ .compatible = "wlf,wm8312", .data = (void *)WM8312 },
+	{ .compatible = "wlf,wm8320", .data = (void *)WM8320 },
+	{ .compatible = "wlf,wm8321", .data = (void *)WM8321 },
+	{ .compatible = "wlf,wm8325", .data = (void *)WM8325 },
+	{ .compatible = "wlf,wm8326", .data = (void *)WM8326 },
+	{ },
+};
+EXPORT_SYMBOL_GPL(wm831x_of_match);
+
+int wm831x_of_get_type(struct device *dev)
+{
+	const struct of_device_id *id = of_match_device(wm831x_of_match, dev);
+
+	if (id)
+		return (unsigned long)id->data;
+	else
+		return 0;
+}
+EXPORT_SYMBOL_GPL(wm831x_of_get_type);
+#endif
+
 /*
  * Instantiate the generic non-control parts of the device.
  */
@@ -1628,7 +1655,10 @@ int wm831x_device_init(struct wm831x *wm831x, unsigned long id, int irq)
 	dev_set_drvdata(wm831x->dev, wm831x);
 
 	if (pdata)
-		wm831x->soft_shutdown = pdata->soft_shutdown;
+		memcpy(&wm831x->pdata, pdata, sizeof(*pdata));
+	pdata = &wm831x->pdata;
+
+	wm831x->soft_shutdown = pdata->soft_shutdown;
 
 	ret = wm831x_reg_read(wm831x, WM831X_PARENT_ID);
 	if (ret < 0) {
diff --git a/drivers/mfd/wm831x-i2c.c b/drivers/mfd/wm831x-i2c.c
index 824bcba..b2acd92 100644
--- a/drivers/mfd/wm831x-i2c.c
+++ b/drivers/mfd/wm831x-i2c.c
@@ -28,8 +28,14 @@ static int wm831x_i2c_probe(struct i2c_client *i2c,
 			    const struct i2c_device_id *id)
 {
 	struct wm831x *wm831x;
+	enum wm831x_parent type;
 	int ret;
 
+	if (i2c->dev.of_node)
+		type = (enum wm831x_parent)wm831x_of_get_type(&i2c->dev);
+	else
+		type = (enum wm831x_parent)id->driver_data;
+
 	wm831x = devm_kzalloc(&i2c->dev, sizeof(struct wm831x), GFP_KERNEL);
 	if (wm831x == NULL)
 		return -ENOMEM;
@@ -45,7 +51,7 @@ static int wm831x_i2c_probe(struct i2c_client *i2c,
 		return ret;
 	}
 
-	return wm831x_device_init(wm831x, id->driver_data, i2c->irq);
+	return wm831x_device_init(wm831x, type, i2c->irq);
 }
 
 static int wm831x_i2c_remove(struct i2c_client *i2c)
@@ -94,6 +100,7 @@ static struct i2c_driver wm831x_i2c_driver = {
 	.driver = {
 		.name = "wm831x",
 		.pm = &wm831x_pm_ops,
+		.of_match_table = of_match_ptr(wm831x_of_match),
 	},
 	.probe = wm831x_i2c_probe,
 	.remove = wm831x_i2c_remove,
diff --git a/drivers/mfd/wm831x-irq.c b/drivers/mfd/wm831x-irq.c
index dfea8b9..c01239a 100644
--- a/drivers/mfd/wm831x-irq.c
+++ b/drivers/mfd/wm831x-irq.c
@@ -564,7 +564,7 @@ static const struct irq_domain_ops wm831x_irq_domain_ops = {
 
 int wm831x_irq_init(struct wm831x *wm831x, int irq)
 {
-	struct wm831x_pdata *pdata = dev_get_platdata(wm831x->dev);
+	struct wm831x_pdata *pdata = &wm831x->pdata;
 	struct irq_domain *domain;
 	int i, ret, irq_base;
 
@@ -579,7 +579,7 @@ int wm831x_irq_init(struct wm831x *wm831x, int irq)
 	}
 
 	/* Try to dynamically allocate IRQs if no base is specified */
-	if (pdata && pdata->irq_base) {
+	if (pdata->irq_base) {
 		irq_base = irq_alloc_descs(pdata->irq_base, 0,
 					   WM831X_NUM_IRQS, 0);
 		if (irq_base < 0) {
@@ -608,7 +608,7 @@ int wm831x_irq_init(struct wm831x *wm831x, int irq)
 		return -EINVAL;
 	}
 
-	if (pdata && pdata->irq_cmos)
+	if (pdata->irq_cmos)
 		i = 0;
 	else
 		i = WM831X_IRQ_OD;
diff --git a/drivers/mfd/wm831x-spi.c b/drivers/mfd/wm831x-spi.c
index 80482ae..44c6eec 100644
--- a/drivers/mfd/wm831x-spi.c
+++ b/drivers/mfd/wm831x-spi.c
@@ -28,7 +28,10 @@ static int wm831x_spi_probe(struct spi_device *spi)
 	enum wm831x_parent type;
 	int ret;
 
-	type = (enum wm831x_parent)id->driver_data;
+	if (spi->dev.of_node)
+		type = (enum wm831x_parent)wm831x_of_get_type(&spi->dev);
+	else
+		type = (enum wm831x_parent)id->driver_data;
 
 	wm831x = devm_kzalloc(&spi->dev, sizeof(struct wm831x), GFP_KERNEL);
 	if (wm831x == NULL)
@@ -97,6 +100,7 @@ static struct spi_driver wm831x_spi_driver = {
 	.driver = {
 		.name	= "wm831x",
 		.pm	= &wm831x_spi_pm,
+		.of_match_table = of_match_ptr(wm831x_of_match),
 	},
 	.id_table	= wm831x_spi_ids,
 	.probe		= wm831x_spi_probe,
diff --git a/include/linux/mfd/wm831x/core.h b/include/linux/mfd/wm831x/core.h
index 76c2264..752a722 100644
--- a/include/linux/mfd/wm831x/core.h
+++ b/include/linux/mfd/wm831x/core.h
@@ -21,6 +21,8 @@
 #include <linux/list.h>
 #include <linux/regmap.h>
 #include <linux/mfd/wm831x/auxadc.h>
+#include <linux/mfd/wm831x/pdata.h>
+#include <linux/of.h>
 
 /*
  * Register values.
@@ -367,6 +369,8 @@ struct wm831x {
 
 	struct regmap *regmap;
 
+	struct wm831x_pdata pdata;
+
 	int irq;  /* Our chip IRQ */
 	struct mutex irq_lock;
 	struct irq_domain *irq_domain;
@@ -427,4 +431,15 @@ static inline int wm831x_irq(struct wm831x *wm831x, int irq)
 
 extern struct regmap_config wm831x_regmap_config;
 
+extern const struct of_device_id wm831x_of_match[];
+
+#ifdef CONFIG_OF
+int wm831x_of_get_type(struct device *dev);
+#else
+static inline int wm831x_of_get_type(struct device *dev)
+{
+	return 0;
+}
+#endif
+
 #endif
-- 
2.1.4
