From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v5 1/3] reset: imx7: Add plubming to support multiple IP variants
Date: Mon, 21 Jan 2019 18:10:41 -0800
Message-ID: <20190122021043.25449-2-andrew.smirnov@gmail.com>
References: <20190122021043.25449-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122021043.25449-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, cphealy@gmail.com, l.stach@pengutronix.de, Leonard Crestez <leonard.crestez@nxp.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In order to enable supporting i.MX8MQ with this driver, convert it to
expect variant specific bits to be passed via driver data.

Cc: p.zabel@pengutronix.de
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: cphealy@gmail.com
Cc: l.stach@pengutronix.de
Cc: Leonard Crestez <leonard.crestez@nxp.com>
Cc: "A.s. Dong" <aisheng.dong@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-imx@nxp.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/reset/reset-imx7.c | 50 +++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 14 deletions(-)

diff --git a/drivers/reset/reset-imx7.c b/drivers/reset/reset-imx7.c
index 77911fa8f31d..cb6e3bc4acc1 100644
--- a/drivers/reset/reset-imx7.c
+++ b/drivers/reset/reset-imx7.c
@@ -17,14 +17,26 @@
 
 #include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/regmap.h>
 #include <dt-bindings/reset/imx7-reset.h>
 
+struct imx7_src_signal {
+	unsigned int offset, bit;
+};
+
+struct imx7_src_variant {
+	const struct imx7_src_signal *signals;
+	unsigned int signals_num;
+	struct reset_control_ops ops;
+};
+
 struct imx7_src {
 	struct reset_controller_dev rcdev;
 	struct regmap *regmap;
+	const struct imx7_src_signal *signals;
 };
 
 enum imx7_src_registers {
@@ -39,9 +51,14 @@ enum imx7_src_registers {
 	SRC_DDRC_RCR		= 0x1000,
 };
 
-struct imx7_src_signal {
-	unsigned int offset, bit;
-};
+static int imx7_reset_update(struct imx7_src *imx7src,
+			     unsigned long id, unsigned int value)
+{
+	const struct imx7_src_signal *signal = &imx7src->signals[id];
+
+	return regmap_update_bits(imx7src->regmap,
+				  signal->offset, signal->bit, value);
+}
 
 static const struct imx7_src_signal imx7_src_signals[IMX7_RESET_NUM] = {
 	[IMX7_RESET_A7_CORE_POR_RESET0] = { SRC_A7RCR0, BIT(0) },
@@ -81,8 +98,8 @@ static int imx7_reset_set(struct reset_controller_dev *rcdev,
 			  unsigned long id, bool assert)
 {
 	struct imx7_src *imx7src = to_imx7_src(rcdev);
-	const struct imx7_src_signal *signal = &imx7_src_signals[id];
-	unsigned int value = assert ? signal->bit : 0;
+	const unsigned int bit = imx7src->signals[id].bit;
+	unsigned int value = assert ? bit : 0;
 
 	switch (id) {
 	case IMX7_RESET_PCIEPHY:
@@ -95,12 +112,11 @@ static int imx7_reset_set(struct reset_controller_dev *rcdev,
 		break;
 
 	case IMX7_RESET_PCIE_CTRL_APPS_EN:
-		value = (assert) ? 0 : signal->bit;
+		value = assert ? 0 : bit;
 		break;
 	}
 
-	return regmap_update_bits(imx7src->regmap,
-				  signal->offset, signal->bit, value);
+	return imx7_reset_update(imx7src, id, value);
 }
 
 static int imx7_reset_assert(struct reset_controller_dev *rcdev,
@@ -115,9 +131,13 @@ static int imx7_reset_deassert(struct reset_controller_dev *rcdev,
 	return imx7_reset_set(rcdev, id, false);
 }
 
-static const struct reset_control_ops imx7_reset_ops = {
-	.assert		= imx7_reset_assert,
-	.deassert	= imx7_reset_deassert,
+static const struct imx7_src_variant variant_imx7 = {
+	.signals = imx7_src_signals,
+	.signals_num = ARRAY_SIZE(imx7_src_signals),
+	.ops = {
+		.assert   = imx7_reset_assert,
+		.deassert = imx7_reset_deassert,
+	},
 };
 
 static int imx7_reset_probe(struct platform_device *pdev)
@@ -125,11 +145,13 @@ static int imx7_reset_probe(struct platform_device *pdev)
 	struct imx7_src *imx7src;
 	struct device *dev = &pdev->dev;
 	struct regmap_config config = { .name = "src" };
+	const struct imx7_src_variant *variant = of_device_get_match_data(dev);
 
 	imx7src = devm_kzalloc(dev, sizeof(*imx7src), GFP_KERNEL);
 	if (!imx7src)
 		return -ENOMEM;
 
+	imx7src->signals = variant->signals;
 	imx7src->regmap = syscon_node_to_regmap(dev->of_node);
 	if (IS_ERR(imx7src->regmap)) {
 		dev_err(dev, "Unable to get imx7-src regmap");
@@ -138,15 +160,15 @@ static int imx7_reset_probe(struct platform_device *pdev)
 	regmap_attach_dev(dev, imx7src->regmap, &config);
 
 	imx7src->rcdev.owner     = THIS_MODULE;
-	imx7src->rcdev.nr_resets = IMX7_RESET_NUM;
-	imx7src->rcdev.ops       = &imx7_reset_ops;
+	imx7src->rcdev.nr_resets = variant->signals_num;
+	imx7src->rcdev.ops       = &variant->ops;
 	imx7src->rcdev.of_node   = dev->of_node;
 
 	return devm_reset_controller_register(dev, &imx7src->rcdev);
 }
 
 static const struct of_device_id imx7_reset_dt_ids[] = {
-	{ .compatible = "fsl,imx7d-src", },
+	{ .compatible = "fsl,imx7d-src", .data = &variant_imx7 },
 	{ /* sentinel */ },
 };
 
-- 
2.20.1
