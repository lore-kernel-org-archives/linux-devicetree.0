Return-Path: <SRS0=q+06=GB=gmail.com=ykaneko0929@kernel.org>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH/RFT 1/3] thermal: rcar_thermal: add r8a77995 support
Date: Mon, 12 Mar 2018 05:26:33 +0900
Message-Id: <1520799995-26347-2-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1520799995-26347-1-git-send-email-ykaneko0929@gmail.com>
References: <1520799995-26347-1-git-send-email-ykaneko0929@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add support for R-Car D3 (r8a77995) thermal sensor.

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 drivers/thermal/rcar_thermal.c | 141 ++++++++++++++++++++++++++++++++---------
 1 file changed, 112 insertions(+), 29 deletions(-)

diff --git a/drivers/thermal/rcar_thermal.c b/drivers/thermal/rcar_thermal.c
index 73e5fee..d517155 100644
--- a/drivers/thermal/rcar_thermal.c
+++ b/drivers/thermal/rcar_thermal.c
@@ -69,6 +69,30 @@ struct rcar_thermal_priv {
 	u32 ctemp;
 };
 
+enum rcar_thermal_type {
+	RCAR_THERMAL,
+	RCAR_GEN2_THERMAL,
+	RCAR_GEN3_THERMAL,
+};
+
+struct rcar_thermal_chip {
+	int use_of_thermal;
+	enum rcar_thermal_type type;
+};
+
+static const struct rcar_thermal_chip rcar_thermal = {
+	.use_of_thermal = 0,
+	.type = RCAR_THERMAL,
+};
+static const struct rcar_thermal_chip rcar_gen2_thermal = {
+	.use_of_thermal = 1,
+	.type = RCAR_GEN2_THERMAL,
+};
+static const struct rcar_thermal_chip rcar_gen3_thermal = {
+	.use_of_thermal = 1,
+	.type = RCAR_GEN3_THERMAL,
+};
+
 #define rcar_thermal_for_each_priv(pos, common)	\
 	list_for_each_entry(pos, &common->head, list)
 
@@ -77,13 +101,23 @@ struct rcar_thermal_priv {
 #define rcar_priv_to_dev(priv)		((priv)->common->dev)
 #define rcar_has_irq_support(priv)	((priv)->common->base)
 #define rcar_id_to_shift(priv)		((priv)->id * 8)
-#define rcar_of_data(dev)		((unsigned long)of_device_get_match_data(dev))
-#define rcar_use_of_thermal(dev)	(rcar_of_data(dev) == USE_OF_THERMAL)
+#define rcar_of_data(dev) \
+	((struct rcar_thermal_chip *)of_device_get_match_data(dev))
+#define rcar_use_of_thermal(dev)	(rcar_of_data(dev)->use_of_thermal)
 
-#define USE_OF_THERMAL	1
 static const struct of_device_id rcar_thermal_dt_ids[] = {
-	{ .compatible = "renesas,rcar-thermal", },
-	{ .compatible = "renesas,rcar-gen2-thermal", .data = (void *)USE_OF_THERMAL },
+	{
+		.compatible = "renesas,rcar-thermal",
+		.data = (void *)&rcar_thermal,
+	},
+	{
+		.compatible = "renesas,rcar-gen2-thermal",
+		 .data = (void *)&rcar_gen2_thermal,
+	},
+	{
+		.compatible = "renesas,thermal-r8a77995",
+		.data = (void *)&rcar_gen3_thermal,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, rcar_thermal_dt_ids);
@@ -190,7 +224,8 @@ static int rcar_thermal_update_temp(struct rcar_thermal_priv *priv)
 	 * enable IRQ
 	 */
 	if (rcar_has_irq_support(priv)) {
-		rcar_thermal_write(priv, FILONOFF, 0);
+		if (rcar_of_data(dev)->type != RCAR_GEN3_THERMAL)
+			rcar_thermal_write(priv, FILONOFF, 0);
 
 		/* enable Rising/Falling edge interrupt */
 		rcar_thermal_write(priv, POSNEG,  0x1);
@@ -438,6 +473,7 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 	struct rcar_thermal_priv *priv;
 	struct device *dev = &pdev->dev;
 	struct resource *res, *irq;
+	int nirq = rcar_of_data(dev)->type == RCAR_GEN3_THERMAL ? 2 : 1;
 	int mres = 0;
 	int i;
 	int ret = -ENODEV;
@@ -457,19 +493,35 @@ static int rcar_thermal_probe(struct platform_device *pdev)
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
+	for (i = 0; i < nirq; i++) {
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
 
-		idle = 0; /* polling delay is not needed */
+			idle = 0; /* polling delay is not needed */
+		}
+
+		ret = devm_request_irq(dev, irq->start, rcar_thermal_irq,
+				       IRQF_SHARED, dev_name(dev), common);
+		if (ret) {
+			dev_err(dev, "irq request failed\n ");
+			goto error_unregister;
+		}
+
+		/* update ENR bits */
+		if (rcar_of_data(dev)->type == RCAR_GEN3_THERMAL)
+			enr_bits |= 1 << i;
 	}
 
 	for (i = 0;; i++) {
@@ -531,20 +583,12 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 		list_move_tail(&priv->list, &common->head);
 
 		/* update ENR bits */
-		enr_bits |= 3 << (i * 8);
+		if (rcar_of_data(dev)->type != RCAR_GEN3_THERMAL)
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
 
@@ -556,9 +600,48 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 	return ret;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int rcar_thermal_suspend(struct device *dev)
+{
+	struct rcar_thermal_common *common = dev_get_drvdata(dev);
+	struct rcar_thermal_priv *priv;
+
+	if (rcar_of_data(dev)->type == RCAR_GEN3_THERMAL) {
+		rcar_thermal_common_write(common, ENR, 0);
+		priv = list_first_entry(&common->head, typeof(*priv), list);
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
+	struct rcar_thermal_priv *priv;
+	int ret;
+
+	if (rcar_of_data(dev)->type == RCAR_GEN3_THERMAL) {
+		priv = list_first_entry(&common->head, typeof(*priv), list);
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
