Return-Path: <SRS0=pAuD=GY=gmail.com=ykaneko0929@kernel.org>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH/RFT v3 1/3] thermal: rcar_thermal: add r8a77995 support
Date: Tue,  3 Apr 2018 21:43:03 +0900
Message-Id: <1522759385-17661-2-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1522759385-17661-1-git-send-email-ykaneko0929@gmail.com>
References: <1522759385-17661-1-git-send-email-ykaneko0929@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add support for R-Car D3 (r8a77995) thermal sensor.

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 drivers/thermal/rcar_thermal.c | 154 ++++++++++++++++++++++++++++++++---------
 1 file changed, 122 insertions(+), 32 deletions(-)

diff --git a/drivers/thermal/rcar_thermal.c b/drivers/thermal/rcar_thermal.c
index 73e5fee..5ec47a9 100644
--- a/drivers/thermal/rcar_thermal.c
+++ b/drivers/thermal/rcar_thermal.c
@@ -58,10 +58,43 @@ struct rcar_thermal_common {
 	spinlock_t lock;
 };
 
+struct rcar_thermal_chip {
+	unsigned int use_of_thermal : 1;
+	unsigned int has_filonoff : 1;
+	unsigned int irq_per_ch : 1;
+	unsigned int needs_suspend_resume : 1;
+	unsigned int nirqs;
+};
+
+static const struct rcar_thermal_chip rcar_thermal = {
+	.use_of_thermal = 0,
+	.has_filonoff = 1,
+	.irq_per_ch = 0,
+	.needs_suspend_resume = 0,
+	.nirqs = 1,
+};
+
+static const struct rcar_thermal_chip rcar_gen2_thermal = {
+	.use_of_thermal = 1,
+	.has_filonoff = 1,
+	.irq_per_ch = 0,
+	.needs_suspend_resume = 0,
+	.nirqs = 1,
+};
+
+static const struct rcar_thermal_chip rcar_gen3_thermal = {
+	.use_of_thermal = 1,
+	.has_filonoff = 0,
+	.irq_per_ch = 1,
+	.needs_suspend_resume = 1,
+	.nirqs = 2,
+};
+
 struct rcar_thermal_priv {
 	void __iomem *base;
 	struct rcar_thermal_common *common;
 	struct thermal_zone_device *zone;
+	const struct rcar_thermal_chip *chip;
 	struct delayed_work work;
 	struct mutex lock;
 	struct list_head list;
@@ -77,13 +110,20 @@ struct rcar_thermal_priv {
 #define rcar_priv_to_dev(priv)		((priv)->common->dev)
 #define rcar_has_irq_support(priv)	((priv)->common->base)
 #define rcar_id_to_shift(priv)		((priv)->id * 8)
-#define rcar_of_data(dev)		((unsigned long)of_device_get_match_data(dev))
-#define rcar_use_of_thermal(dev)	(rcar_of_data(dev) == USE_OF_THERMAL)
 
-#define USE_OF_THERMAL	1
 static const struct of_device_id rcar_thermal_dt_ids[] = {
-	{ .compatible = "renesas,rcar-thermal", },
-	{ .compatible = "renesas,rcar-gen2-thermal", .data = (void *)USE_OF_THERMAL },
+	{
+		.compatible = "renesas,rcar-thermal",
+		.data = &rcar_thermal,
+	},
+	{
+		.compatible = "renesas,rcar-gen2-thermal",
+		 .data = &rcar_gen2_thermal,
+	},
+	{
+		.compatible = "renesas,thermal-r8a77995",
+		.data = &rcar_gen3_thermal,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, rcar_thermal_dt_ids);
@@ -190,7 +230,8 @@ static int rcar_thermal_update_temp(struct rcar_thermal_priv *priv)
 	 * enable IRQ
 	 */
 	if (rcar_has_irq_support(priv)) {
-		rcar_thermal_write(priv, FILONOFF, 0);
+		if (priv->chip->has_filonoff)
+			rcar_thermal_write(priv, FILONOFF, 0);
 
 		/* enable Rising/Falling edge interrupt */
 		rcar_thermal_write(priv, POSNEG,  0x1);
@@ -420,7 +461,7 @@ static int rcar_thermal_remove(struct platform_device *pdev)
 
 	rcar_thermal_for_each_priv(priv, common) {
 		rcar_thermal_irq_disable(priv);
-		if (rcar_use_of_thermal(dev))
+		if (priv->chip->use_of_thermal)
 			thermal_remove_hwmon_sysfs(priv->zone);
 		else
 			thermal_zone_device_unregister(priv->zone);
@@ -438,6 +479,7 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 	struct rcar_thermal_priv *priv;
 	struct device *dev = &pdev->dev;
 	struct resource *res, *irq;
+	const struct rcar_thermal_chip *chip = of_device_get_match_data(dev);
 	int mres = 0;
 	int i;
 	int ret = -ENODEV;
@@ -457,19 +499,35 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
-	irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (irq) {
-		/*
-		 * platform has IRQ support.
-		 * Then, driver uses common registers
-		 * rcar_has_irq_support() will be enabled
-		 */
-		res = platform_get_resource(pdev, IORESOURCE_MEM, mres++);
-		common->base = devm_ioremap_resource(dev, res);
-		if (IS_ERR(common->base))
-			return PTR_ERR(common->base);
+	for (i = 0; i < chip->nirqs; i++) {
+		irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+		if (!irq)
+			continue;
+		if (!common->base) {
+			/*
+			 * platform has IRQ support.
+			 * Then, driver uses common registers
+			 * rcar_has_irq_support() will be enabled
+			 */
+			res = platform_get_resource(pdev, IORESOURCE_MEM,
+						    mres++);
+			common->base = devm_ioremap_resource(dev, res);
+			if (IS_ERR(common->base))
+				return PTR_ERR(common->base);
+
+			idle = 0; /* polling delay is not needed */
+		}
+
+		ret = devm_request_irq(dev, irq->start, rcar_thermal_irq,
+				       IRQF_SHARED, dev_name(dev), common);
+		if (ret) {
+			dev_err(dev, "irq request failed\n ");
+			goto error_unregister;
+		}
 
-		idle = 0; /* polling delay is not needed */
+		/* update ENR bits */
+		if (chip->irq_per_ch)
+			enr_bits |= 1 << i;
 	}
 
 	for (i = 0;; i++) {
@@ -491,6 +549,7 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 
 		priv->common = common;
 		priv->id = i;
+		priv->chip = chip;
 		mutex_init(&priv->lock);
 		INIT_LIST_HEAD(&priv->list);
 		INIT_DELAYED_WORK(&priv->work, rcar_thermal_work);
@@ -498,7 +557,7 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 		if (ret < 0)
 			goto error_unregister;
 
-		if (rcar_use_of_thermal(dev))
+		if (chip->use_of_thermal)
 			priv->zone = devm_thermal_zone_of_sensor_register(
 						dev, i, priv,
 						&rcar_thermal_zone_of_ops);
@@ -515,7 +574,7 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 			goto error_unregister;
 		}
 
-		if (rcar_use_of_thermal(dev)) {
+		if (chip->use_of_thermal) {
 			/*
 			 * thermal_zone doesn't enable hwmon as default,
 			 * but, enable it here to keep compatible
@@ -531,20 +590,12 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 		list_move_tail(&priv->list, &common->head);
 
 		/* update ENR bits */
-		enr_bits |= 3 << (i * 8);
+		if (!chip->irq_per_ch)
+			enr_bits |= 3 << (i * 8);
 	}
 
-	/* enable temperature comparation */
-	if (irq) {
-		ret = devm_request_irq(dev, irq->start, rcar_thermal_irq, 0,
-				       dev_name(dev), common);
-		if (ret) {
-			dev_err(dev, "irq request failed\n ");
-			goto error_unregister;
-		}
-
+	if (enr_bits)
 		rcar_thermal_common_write(common, ENR, enr_bits);
-	}
 
 	dev_info(dev, "%d sensor probed\n", i);
 
@@ -556,9 +607,48 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 	return ret;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int rcar_thermal_suspend(struct device *dev)
+{
+	struct rcar_thermal_common *common = dev_get_drvdata(dev);
+	struct rcar_thermal_priv *priv = list_first_entry(&common->head,
+							  typeof(*priv), list);
+
+	if (priv->chip->needs_suspend_resume) {
+		rcar_thermal_common_write(common, ENR, 0);
+		rcar_thermal_irq_disable(priv);
+		rcar_thermal_bset(priv, THSCR, CPCTL, 0);
+	}
+
+	return 0;
+}
+
+static int rcar_thermal_resume(struct device *dev)
+{
+	struct rcar_thermal_common *common = dev_get_drvdata(dev);
+	struct rcar_thermal_priv *priv = list_first_entry(&common->head,
+							  typeof(*priv), list);
+	int ret;
+
+	if (priv->chip->needs_suspend_resume) {
+		ret = rcar_thermal_update_temp(priv);
+		if (ret < 0)
+			return ret;
+		rcar_thermal_irq_enable(priv);
+		rcar_thermal_common_write(common, ENR, 0x03);
+	}
+
+	return 0;
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(rcar_thermal_pm_ops, rcar_thermal_suspend,
+			 rcar_thermal_resume);
+
 static struct platform_driver rcar_thermal_driver = {
 	.driver	= {
 		.name	= "rcar_thermal",
+		.pm = &rcar_thermal_pm_ops,
 		.of_match_table = rcar_thermal_dt_ids,
 	},
 	.probe		= rcar_thermal_probe,
-- 
1.9.1
