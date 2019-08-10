From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v5 07/18] thermal: sun8i: rework for ths irq handler func
Date: Sat, 10 Aug 2019 05:28:18 +0000
Message-ID: <20190810052829.6032-8-tiny.windzz@gmail.com>
References: <20190810052829.6032-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190810052829.6032-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, mchehab+samsung@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com, nicolas.ferre@microchip.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

Here, we do something to prepare for the subsequent
support of multiple platforms.

1) rename sun50i_h6_irq_thread to sun8i_irq_thread, because
   this function should be suitable for all platforms.

2) introduce irq_ack callback to mask interrupt register
   differences.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index ad877b54f58e..b934bc81eba7 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -60,6 +60,7 @@ struct ths_thermal_chip {
 	int		ft_deviation;
 	int		temp_data_base;
 	int		(*init)(struct ths_device *tmdev);
+	int             (*irq_ack)(struct ths_device *tmdev);
 };
 
 struct ths_device {
@@ -116,23 +117,34 @@ static const struct regmap_config config = {
 	.fast_io = true,
 };
 
-static irqreturn_t sun50i_h6_irq_thread(int irq, void *data)
+static int sun50i_h6_irq_ack(struct ths_device *tmdev)
 {
-	struct ths_device *tmdev = data;
-	int i, state;
+	int i, state, ret = 0;
 
 	regmap_read(tmdev->regmap, SUN50I_H6_THS_DIS, &state);
 
 	for (i = 0; i < tmdev->chip->sensor_num; i++) {
-
 		if (state & SUN50I_H6_THS_DATA_IRQ_STS(i)) {
-			/* clear data irq pending */
 			regmap_write(tmdev->regmap, SUN50I_H6_THS_DIS,
 				     SUN50I_H6_THS_DATA_IRQ_STS(i));
+			ret |= BIT(i);
+		}
+	}
+
+	return ret;
+}
 
+static irqreturn_t sun8i_irq_thread(int irq, void *data)
+{
+	struct ths_device *tmdev = data;
+	int i, state;
+
+	state = tmdev->chip->irq_ack(tmdev);
+
+	for (i = 0; i < tmdev->chip->sensor_num; i++) {
+		if (state & BIT(i))
 			thermal_zone_device_update(tmdev->sensor[i].tzd,
 						   THERMAL_EVENT_UNSPECIFIED);
-		}
 	}
 
 	return IRQ_HANDLED;
@@ -371,7 +383,7 @@ static int sun8i_ths_probe(struct platform_device *pdev)
 	 * the end.
 	 */
 	ret = devm_request_threaded_irq(dev, irq, NULL,
-					sun50i_h6_irq_thread,
+					sun8i_irq_thread,
 					IRQF_ONESHOT, "ths", tmdev);
 	if (ret)
 		return ret;
@@ -396,6 +408,7 @@ static const struct ths_thermal_chip sun50i_h6_ths = {
 	.ft_deviation = SUN50I_H6_FT_DEVIATION,
 	.temp_data_base = SUN50I_H6_THS_TEMP_DATA,
 	.init = sun50i_h6_thermal_init,
+	.irq_ack = sun50i_h6_irq_ack,
 };
 
 static const struct of_device_id of_ths_match[] = {
-- 
2.17.1
