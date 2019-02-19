From: Pascal PAILLET-LME <p.paillet@st.com>
Subject: [PATCH 2/8] regulator: stpmic1: Simplify regulators registration
Date: Tue, 19 Feb 2019 10:04:32 +0000
Message-ID: <1550570647-9555-3-git-send-email-p.paillet@st.com>
References: <1550570647-9555-1-git-send-email-p.paillet@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550570647-9555-1-git-send-email-p.paillet@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "axel.lin@ingics.com" <axel.lin@ingics.com>
Cc: Pascal PAILLET-LME <p.paillet@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>
List-Id: devicetree@vger.kernel.org

Stop using a regulator_init callback. This leads to a more simple regulator
registration code. This also permits to spuress struct stpmic1_regulator.
Also rename stpmic1_regulators_matches to stpmic1_matches.

Signed-off-by: pascal paillet <p.paillet@st.com>
---
 drivers/regulator/stpmic1_regulator.c | 168 +++++++++++-----------------------
 1 file changed, 52 insertions(+), 116 deletions(-)

diff --git a/drivers/regulator/stpmic1_regulator.c b/drivers/regulator/stpmic1_regulator.c
index c25f82f..f5c0e58 100644
--- a/drivers/regulator/stpmic1_regulator.c
+++ b/drivers/regulator/stpmic1_regulator.c
@@ -15,7 +15,7 @@
 #include <dt-bindings/mfd/st,stpmic1.h>
 
 /**
- * stpmic1 regulator description
+ * stpmic1 regulator description: this structure is used as driver data
  * @desc: regulator framework description
  * @mask_reset_reg: mask reset register address
  * @mask_reset_mask: mask rank and mask reset register mask
@@ -30,24 +30,9 @@ struct stpmic1_regulator_cfg {
 	u8 icc_mask;
 };
 
-/**
- * stpmic1 regulator data: this structure is used as driver data
- * @reg_node: DT node of regulator (unused on non-DT platforms)
- * @cfg: stpmic specific regulator description
- * @mask_reset: mask_reset bit value
- * @irq_curlim: current limit interrupt number
- */
-struct stpmic1_regulator {
-	struct device_node *reg_node;
-	const struct stpmic1_regulator_cfg *cfg;
-	u8 mask_reset;
-	int irq_curlim;
-};
-
 static int stpmic1_set_mode(struct regulator_dev *rdev, unsigned int mode);
 static unsigned int stpmic1_get_mode(struct regulator_dev *rdev);
 static int stpmic1_set_icc(struct regulator_dev *rdev);
-static int stpmic1_regulator_parse_dt(void *driver_data);
 static unsigned int stpmic1_map_mode(unsigned int mode);
 
 enum {
@@ -439,8 +424,9 @@ static unsigned int stpmic1_map_mode(unsigned int mode)
 static unsigned int stpmic1_get_mode(struct regulator_dev *rdev)
 {
 	int value;
+	struct regmap *regmap = rdev_get_regmap(rdev);
 
-	regmap_read(rdev->regmap, rdev->desc->enable_reg, &value);
+	regmap_read(regmap, rdev->desc->enable_reg, &value);
 
 	if (value & STPMIC1_BUCK_MODE_LP)
 		return REGULATOR_MODE_STANDBY;
@@ -451,6 +437,7 @@ static unsigned int stpmic1_get_mode(struct regulator_dev *rdev)
 static int stpmic1_set_mode(struct regulator_dev *rdev, unsigned int mode)
 {
 	int value;
+	struct regmap *regmap = rdev_get_regmap(rdev);
 
 	switch (mode) {
 	case REGULATOR_MODE_NORMAL:
@@ -463,18 +450,18 @@ static int stpmic1_set_mode(struct regulator_dev *rdev, unsigned int mode)
 		return -EINVAL;
 	}
 
-	return regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
+	return regmap_update_bits(regmap, rdev->desc->enable_reg,
 				  STPMIC1_BUCK_MODE_LP, value);
 }
 
 static int stpmic1_set_icc(struct regulator_dev *rdev)
 {
-	struct stpmic1_regulator *regul = rdev_get_drvdata(rdev);
+	struct stpmic1_regulator_cfg *cfg = rdev_get_drvdata(rdev);
 	struct regmap *regmap = rdev_get_regmap(rdev);
 
 	/* enable switch off in case of over current */
-	return regmap_update_bits(regmap, regul->cfg->icc_reg,
-				  regul->cfg->icc_mask, regul->cfg->icc_mask);
+	return regmap_update_bits(regmap, cfg->icc_reg, cfg->icc_mask,
+				  cfg->icc_mask);
 }
 
 static irqreturn_t stpmic1_curlim_irq_handler(int irq, void *data)
@@ -493,47 +480,13 @@ static irqreturn_t stpmic1_curlim_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int stpmic1_regulator_init(struct platform_device *pdev,
-				  struct regulator_dev *rdev)
-{
-	struct stpmic1_regulator *regul = rdev_get_drvdata(rdev);
-	struct regmap *regmap = rdev_get_regmap(rdev);
-	int ret = 0;
-
-	/* set mask reset */
-	if (regul->mask_reset && regul->cfg->mask_reset_reg != 0) {
-		ret = regmap_update_bits(regmap,
-					 regul->cfg->mask_reset_reg,
-					 regul->cfg->mask_reset_mask,
-					 regul->cfg->mask_reset_mask);
-		if (ret) {
-			dev_err(&pdev->dev, "set mask reset failed\n");
-			return ret;
-		}
-	}
-
-	/* setup an irq handler for over-current detection */
-	if (regul->irq_curlim > 0) {
-		ret = devm_request_threaded_irq(&pdev->dev,
-						regul->irq_curlim, NULL,
-						stpmic1_curlim_irq_handler,
-						IRQF_ONESHOT | IRQF_SHARED,
-						pdev->name, rdev);
-		if (ret) {
-			dev_err(&pdev->dev, "Request IRQ failed\n");
-			return ret;
-		}
-	}
-	return 0;
-}
-
 #define MATCH(_name, _id) \
 	[STPMIC1_##_id] = { \
 		.name = #_name, \
 		.desc = &stpmic1_regulator_cfgs[STPMIC1_##_id].desc, \
 	}
 
-static struct of_regulator_match stpmic1_regulators_matches[] = {
+static struct of_regulator_match stpmic1_matches[] = {
 	MATCH(buck1, BUCK1),
 	MATCH(buck2, BUCK2),
 	MATCH(buck3, BUCK3),
@@ -550,92 +503,75 @@ static int stpmic1_regulator_init(struct platform_device *pdev,
 	MATCH(pwr_sw2, SW_OUT),
 };
 
-static int stpmic1_regulator_parse_dt(void *driver_data)
-{
-	struct stpmic1_regulator *regul =
-		(struct stpmic1_regulator *)driver_data;
-
-	if (!regul)
-		return -EINVAL;
-
-	if (of_get_property(regul->reg_node, "st,mask-reset", NULL))
-		regul->mask_reset = 1;
-
-	regul->irq_curlim = of_irq_get(regul->reg_node, 0);
-
-	return 0;
-}
-
-static struct
-regulator_dev *stpmic1_regulator_register(struct platform_device *pdev, int id,
-					  struct regulator_init_data *init_data,
-					  struct stpmic1_regulator *regul)
+static int stpmic1_regulator_register(struct platform_device *pdev, int id,
+				      struct of_regulator_match *match,
+				      const struct stpmic1_regulator_cfg *cfg)
 {
 	struct stpmic1 *pmic_dev = dev_get_drvdata(pdev->dev.parent);
 	struct regulator_dev *rdev;
 	struct regulator_config config = {};
+	int ret = 0;
+	int irq;
 
 	config.dev = &pdev->dev;
-	config.init_data = init_data;
-	config.of_node = stpmic1_regulators_matches[id].of_node;
+	config.init_data = match->init_data;
+	config.of_node = match->of_node;
 	config.regmap = pmic_dev->regmap;
-	config.driver_data = regul;
-
-	regul->reg_node = config.of_node;
-	regul->cfg = &stpmic1_regulator_cfgs[id];
+	config.driver_data = (void *)cfg;
 
-	rdev = devm_regulator_register(&pdev->dev, &regul->cfg->desc, &config);
+	rdev = devm_regulator_register(&pdev->dev, &cfg->desc, &config);
 	if (IS_ERR(rdev)) {
 		dev_err(&pdev->dev, "failed to register %s regulator\n",
-			regul->cfg->desc.name);
+			cfg->desc.name);
+		return PTR_ERR(rdev);
 	}
 
-	return rdev;
+	/* set mask reset */
+	if (of_get_property(config.of_node, "st,mask-reset", NULL) &&
+	    cfg->mask_reset_reg != 0) {
+		ret = regmap_update_bits(pmic_dev->regmap,
+					 cfg->mask_reset_reg,
+					 cfg->mask_reset_mask,
+					 cfg->mask_reset_mask);
+		if (ret) {
+			dev_err(&pdev->dev, "set mask reset failed\n");
+			return ret;
+		}
+	}
+
+	/* setup an irq handler for over-current detection */
+	irq = of_irq_get(config.of_node, 0);
+	if (irq > 0) {
+		ret = devm_request_threaded_irq(&pdev->dev,
+						irq, NULL,
+						stpmic1_curlim_irq_handler,
+						IRQF_ONESHOT | IRQF_SHARED,
+						pdev->name, rdev);
+		if (ret) {
+			dev_err(&pdev->dev, "Request IRQ failed\n");
+			return ret;
+		}
+	}
+	return 0;
 }
 
 static int stpmic1_regulator_probe(struct platform_device *pdev)
 {
-	struct regulator_dev *rdev;
-	struct stpmic1_regulator *regul;
-	struct regulator_init_data *init_data;
-	struct device_node *np;
 	int i, ret;
 
-	np = pdev->dev.of_node;
-
-	ret = of_regulator_match(&pdev->dev, np,
-				 stpmic1_regulators_matches,
-				 ARRAY_SIZE(stpmic1_regulators_matches));
+	ret = of_regulator_match(&pdev->dev, pdev->dev.of_node, stpmic1_matches,
+				 ARRAY_SIZE(stpmic1_matches));
 	if (ret < 0) {
 		dev_err(&pdev->dev,
 			"Error in PMIC regulator device tree node");
 		return ret;
 	}
 
-	regul = devm_kzalloc(&pdev->dev, ARRAY_SIZE(stpmic1_regulator_cfgs) *
-			     sizeof(struct stpmic1_regulator),
-			     GFP_KERNEL);
-	if (!regul)
-		return -ENOMEM;
-
 	for (i = 0; i < ARRAY_SIZE(stpmic1_regulator_cfgs); i++) {
-		/* Parse DT & find regulators to register */
-		init_data = stpmic1_regulators_matches[i].init_data;
-		if (init_data)
-			init_data->regulator_init = &stpmic1_regulator_parse_dt;
-
-		rdev = stpmic1_regulator_register(pdev, i, init_data, regul);
-		if (IS_ERR(rdev))
-			return PTR_ERR(rdev);
-
-		ret = stpmic1_regulator_init(pdev, rdev);
-		if (ret) {
-			dev_err(&pdev->dev,
-				"failed to initialize regulator %d\n", ret);
+		ret = stpmic1_regulator_register(pdev, i, &stpmic1_matches[i],
+						 &stpmic1_regulator_cfgs[i]);
+		if (ret < 0)
 			return ret;
-		}
-
-		regul++;
 	}
 
 	dev_dbg(&pdev->dev, "stpmic1_regulator driver probed\n");
-- 
1.9.1
