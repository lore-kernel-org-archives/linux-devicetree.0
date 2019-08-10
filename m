From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v5 11/18] thermal: sun8i: add thermal driver for h3
Date: Sat, 10 Aug 2019 05:28:22 +0000
Message-ID: <20190810052829.6032-12-tiny.windzz@gmail.com>
References: <20190810052829.6032-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190810052829.6032-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, mchehab+samsung@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com, nicolas.ferre@microchip.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch adds the support for allwinner h3 thermal sensor.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 91 +++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 47c20c4c69e7..41ce8cdc0546 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -27,6 +27,14 @@
 #define TEMP_TO_REG				672
 #define CALIBRATE_DEFAULT			0x800
 
+#define SUN8I_THS_CTRL0				0x00
+#define SUN8I_THS_CTRL2				0x40
+#define SUN8I_THS_IC				0x44
+#define SUN8I_THS_IS				0x48
+#define SUN8I_THS_MFC				0x70
+#define SUN8I_THS_TEMP_CALIB			0x74
+#define SUN8I_THS_TEMP_DATA			0x80
+
 #define SUN50I_THS_CTRL0			0x00
 #define SUN50I_H6_THS_ENABLE			0x04
 #define SUN50I_H6_THS_PC			0x08
@@ -36,6 +44,10 @@
 #define SUN50I_H6_THS_TEMP_CALIB		0xa0
 #define SUN50I_H6_THS_TEMP_DATA			0xc0
 
+#define SUN8I_THS_CTRL0_T_ACQ0(x)		(GENMASK(15, 0) & (x))
+#define SUN8I_THS_CTRL2_T_ACQ1(x)		((GENMASK(15, 0) & (x)) << 16)
+#define SUN8I_THS_DATA_IRQ_STS(x)		BIT(x + 8)
+
 #define SUN50I_THS_CTRL0_T_ACQ(x)		((GENMASK(15, 0) & (x)) << 16)
 #define SUN50I_THS_FILTER_EN			BIT(2)
 #define SUN50I_THS_FILTER_TYPE(x)		(GENMASK(1, 0) & (x))
@@ -121,6 +133,23 @@ static const struct regmap_config config = {
 	.fast_io = true,
 };
 
+static int sun8i_h3_irq_ack(struct ths_device *tmdev)
+{
+	int i, state, ret = 0;
+
+	regmap_read(tmdev->regmap, SUN8I_THS_IS, &state);
+
+	for (i = 0; i < tmdev->chip->sensor_num; i++) {
+		if (state & SUN8I_THS_DATA_IRQ_STS(i)) {
+			regmap_write(tmdev->regmap, SUN8I_THS_IS,
+				     SUN8I_THS_DATA_IRQ_STS(i));
+			ret |= BIT(i);
+		}
+	}
+
+	return ret;
+}
+
 static int sun50i_h6_irq_ack(struct ths_device *tmdev)
 {
 	int i, state, ret = 0;
@@ -154,6 +183,26 @@ static irqreturn_t sun8i_irq_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int sun8i_h3_ths_calibrate(struct ths_device *tmdev,
+				  u16 *caldata, int callen)
+{
+	int i;
+
+	if (!caldata[0] || callen < 2 * tmdev->chip->sensor_num)
+		return -EINVAL;
+
+	for (i = 0; i < tmdev->chip->sensor_num; i++) {
+		int offset = (i % 2) << 4;
+
+		regmap_update_bits(tmdev->regmap,
+				   SUN8I_THS_TEMP_CALIB + (4 * (i >> 1)),
+				   0xfff << offset,
+				   caldata[i] << offset);
+	}
+
+	return 0;
+}
+
 static int sun50i_h6_ths_calibrate(struct ths_device *tmdev,
 				   u16 *caldata, int callen)
 {
@@ -319,6 +368,36 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
 	return ret;
 }
 
+static int sun8i_h3_thermal_init(struct ths_device *tmdev)
+{
+	int val;
+
+	/* average over 4 samples */
+	regmap_write(tmdev->regmap, SUN8I_THS_MFC,
+		     SUN50I_THS_FILTER_EN |
+		     SUN50I_THS_FILTER_TYPE(1));
+	/*
+	 * period = (x + 1) * 4096 / clkin; ~10ms
+	 * enable data interrupt
+	 */
+	val = GENMASK(7 + tmdev->chip->sensor_num, 8);
+	regmap_write(tmdev->regmap, SUN8I_THS_IC,
+		     SUN50I_H6_THS_PC_TEMP_PERIOD(58) | val);
+	/*
+	 * clkin = 24MHz
+	 * T acquire = clkin / (x + 1)
+	 *           = 20us
+	 * enable sensor
+	 */
+	regmap_write(tmdev->regmap, SUN8I_THS_CTRL0,
+		     SUN8I_THS_CTRL0_T_ACQ0(479));
+	val = GENMASK(tmdev->chip->sensor_num - 1, 0);
+	regmap_write(tmdev->regmap, SUN8I_THS_CTRL2,
+		     SUN8I_THS_CTRL2_T_ACQ1(479) | val);
+
+	return 0;
+}
+
 static int sun50i_h6_thermal_init(struct ths_device *tmdev)
 {
 	int val;
@@ -425,6 +504,17 @@ static int sun8i_ths_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct ths_thermal_chip sun8i_h3_ths = {
+	.sensor_num = 1,
+	.offset = -1794,
+	.scale = -121,
+	.has_mod_clk = true,
+	.temp_data_base = SUN8I_THS_TEMP_DATA,
+	.calibrate = sun8i_h3_ths_calibrate,
+	.init = sun8i_h3_thermal_init,
+	.irq_ack = sun8i_h3_irq_ack,
+};
+
 static const struct ths_thermal_chip sun50i_h6_ths = {
 	.sensor_num = 2,
 	.offset = -2794,
@@ -437,6 +527,7 @@ static const struct ths_thermal_chip sun50i_h6_ths = {
 };
 
 static const struct of_device_id of_ths_match[] = {
+	{ .compatible = "allwinner,sun8i-h3-ths", .data = &sun8i_h3_ths },
 	{ .compatible = "allwinner,sun50i-h6-ths", .data = &sun50i_h6_ths },
 	{ /* sentinel */ },
 };
-- 
2.17.1
