From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v4 04/11] thermal: sun8i: get ths sensor number from device compatible
Date: Sun, 23 Jun 2019 12:41:59 -0400
Message-ID: <20190623164206.7467-5-tiny.windzz@gmail.com>
References: <20190623164206.7467-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190623164206.7467-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, davem@davemloft.net, gregkh@linuxfoundation.org, mchehab+samsung@kernel.org, linus.walleij@linaro.org, nicolas.ferre@microchip.com, paulmck@linux.ibm.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

For different socs, the number of ths sensors is different.
So we need to do some work in order to support more soc.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index d6918c62682b..c37e1c51a543 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -22,7 +22,6 @@
 
 #define MAX_SENSOR_NUM	4
 
-#define SUN50I_H6_SENSOR_NUM	2
 #define SUN50I_H6_OFFSET	-2794
 #define SUN50I_H6_SCALE		-67
 
@@ -57,7 +56,12 @@ struct tsensor {
 	int				id;
 };
 
+struct ths_thermal_chip {
+	int		sensor_num;
+};
+
 struct ths_device {
+	const struct ths_thermal_chip		*chip;
 	struct device				*dev;
 	struct regmap				*regmap;
 	struct reset_control			*reset;
@@ -117,7 +121,7 @@ static irqreturn_t sun50i_h6_irq_thread(int irq, void *data)
 
 	regmap_read(tmdev->regmap, SUN50I_H6_THS_DIS, &state);
 
-	for (i = 0; i < SUN50I_H6_SENSOR_NUM; i++) {
+	for (i = 0; i < tmdev->chip->sensor_num; i++) {
 
 		if (state & SUN50I_H6_THS_DATA_IRQ_STS(i)) {
 			/* clear data irq pending */
@@ -167,7 +171,7 @@ static int sun50i_ths_calibrate(struct ths_device *tmdev)
 		goto out;
 	}
 
-	if (!caldata[0] || callen < 2 + 2 * SUN50I_H6_SENSOR_NUM) {
+	if (!caldata[0] || callen < 2 + 2 * tmdev->chip->sensor_num) {
 		ret = -EINVAL;
 		goto out_free;
 	}
@@ -190,7 +194,7 @@ static int sun50i_ths_calibrate(struct ths_device *tmdev)
 	 */
 	ft_temp = caldata[0] & FT_TEMP_MASK;
 
-	for (i = 0; i < SUN50I_H6_SENSOR_NUM; i++) {
+	for (i = 0; i < tmdev->chip->sensor_num; i++) {
 		int reg = (int)caldata[i + 1];
 		int sensor_temp = sun8i_ths_reg2temp(tmdev, reg);
 		int delta, cdata, calib_offest;
@@ -303,10 +307,10 @@ static int sun50i_thermal_init(struct ths_device *tmdev)
 	regmap_write(tmdev->regmap, SUN50I_H6_THS_PC,
 		     SUN50I_H6_THS_PC_TEMP_PERIOD(58));
 	/* enable sensor */
-	val = GENMASK(SUN50I_H6_SENSOR_NUM - 1, 0);
+	val = GENMASK(tmdev->chip->sensor_num - 1, 0);
 	regmap_write(tmdev->regmap, SUN50I_H6_THS_ENABLE, val);
 	/* thermal data interrupt enable */
-	val = GENMASK(SUN50I_H6_SENSOR_NUM - 1, 0);
+	val = GENMASK(tmdev->chip->sensor_num - 1, 0);
 	regmap_write(tmdev->regmap, SUN50I_H6_THS_DIC, val);
 
 	return 0;
@@ -317,7 +321,7 @@ static int sun8i_ths_register(struct ths_device *tmdev)
 	struct thermal_zone_device *tzd;
 	int i;
 
-	for (i = 0; i < SUN50I_H6_SENSOR_NUM; i++) {
+	for (i = 0; i < tmdev->chip->sensor_num; i++) {
 		tmdev->sensor[i].tmdev = tmdev;
 		tmdev->sensor[i].id = i;
 		tmdev->sensor[i].tzd =
@@ -343,6 +347,10 @@ static int sun8i_ths_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	tmdev->dev = dev;
+	tmdev->chip = of_device_get_match_data(&pdev->dev);
+	if (!tmdev->chip)
+		return -EINVAL;
+
 	platform_set_drvdata(pdev, tmdev);
 
 	ret = sun8i_ths_resource_init(tmdev);
@@ -385,8 +393,12 @@ static int sun8i_ths_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct ths_thermal_chip sun50i_h6_ths = {
+	.sensor_num = 2,
+};
+
 static const struct of_device_id of_ths_match[] = {
-	{ .compatible = "allwinner,sun50i-h6-ths"},
+	{ .compatible = "allwinner,sun50i-h6-ths", .data = &sun50i_h6_ths },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, of_ths_match);
-- 
2.17.1
