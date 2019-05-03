From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 6/7] iio: adc: sun4i-gpadc-iio: add support for H6 thermal sensor
Date: Fri,  3 May 2019 03:28:12 -0400
Message-ID: <20190503072813.2719-7-tiny.windzz@gmail.com>
References: <20190503072813.2719-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190503072813.2719-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch adds support for the H6 ths sensor.

TODO: calibrate thermal sensor by using information from sid.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/iio/adc/sun4i-gpadc-iio.c | 65 +++++++++++++++++++++++++++++++
 include/linux/mfd/sun4i-gpadc.h   |  9 +++++
 2 files changed, 74 insertions(+)

diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index f24eb76d65c0..9b6fc592f54c 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -120,6 +120,20 @@ static const struct gpadc_data sun8i_a33_gpadc_data = {
 	.temp_data_base = SUN4I_GPADC_TEMP_DATA,
 };
 
+static int sun50i_gpadc_disable(struct sun4i_gpadc_iio *info);
+static int sun50i_gpadc_enable(struct sun4i_gpadc_iio *info);
+
+static const struct gpadc_data sun50i_h6_gpadc_data = {
+	.temp_offset = -2809,
+	.temp_scale = -67,
+	.has_bus_clk = true,
+	.has_bus_rst = true,
+	.gpadc_enable = sun50i_gpadc_enable,
+	.gpadc_disable = sun50i_gpadc_disable,
+	.sensor_count = 2,
+	.temp_data_base = SUN50I_H6_GPADC_TEMP_DATA,
+};
+
 struct sun4i_sensor_tzd {
 	struct sun4i_gpadc_iio          *info;
 	struct thermal_zone_device      *tzd;
@@ -452,6 +466,53 @@ static int sun4i_gpadc_enable(struct sun4i_gpadc_iio *info)
 	return 0;
 }
 
+static int sun50i_gpadc_enable(struct sun4i_gpadc_iio *info)
+{
+	int ret, val;
+
+	ret = reset_control_deassert(info->reset);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(info->bus_clk);
+	if (ret)
+		goto assert_reset;
+
+	/*
+	 * clkin = 24MHz
+	 * T acquire = clkin / (SUN50I_GPADC_CTRL0_T_ACQ + 1)
+	 *           = 20us
+	 */
+	regmap_write(info->regmap, SUN4I_GPADC_CTRL0,
+		     SUN50I_GPADC_CTRL0_T_ACQ(479));
+	/* average over 4 samples */
+	regmap_write(info->regmap, SUN50I_H6_GPADC_CTRL3,
+		     SUN4I_GPADC_CTRL3_FILTER_EN |
+		     SUN4I_GPADC_CTRL3_FILTER_TYPE(1));
+	/* period = (SUN50I_GPADC_TPR_TEMP_PERIOD + 1) * 4096 / clkin; ~10ms */
+	regmap_write(info->regmap, SUN50I_GPADC_TPR,
+		     SUN50I_GPADC_TPR_TEMP_PERIOD(58));
+	/* TODO: calibrate ths */
+	/* enable sensor */
+	val = GENMASK(info->data->sensor_count - 1, 0);
+	regmap_write(info->regmap, SUN4I_GPADC_CTRL1, val);
+
+	return 0;
+
+assert_reset:
+	reset_control_assert(info->reset);
+
+	return ret;
+}
+
+static int sun50i_gpadc_disable(struct sun4i_gpadc_iio *info)
+{
+	clk_disable_unprepare(info->bus_clk);
+	reset_control_assert(info->reset);
+
+	return 0;
+}
+
 static int sun4i_gpadc_runtime_suspend(struct device *dev)
 {
 	struct sun4i_gpadc_iio *info = iio_priv(dev_get_drvdata(dev));
@@ -546,6 +607,10 @@ static const struct of_device_id sun4i_gpadc_of_id[] = {
 		.compatible = "allwinner,sun8i-a33-ths",
 		.data = &sun8i_a33_gpadc_data,
 	},
+	{
+		.compatible = "allwinner,sun50i-h6-ths",
+		.data = &sun50i_h6_gpadc_data,
+	},
 	{ /* sentinel */ }
 };
 
diff --git a/include/linux/mfd/sun4i-gpadc.h b/include/linux/mfd/sun4i-gpadc.h
index 139872c2e0fe..f505013e9c0d 100644
--- a/include/linux/mfd/sun4i-gpadc.h
+++ b/include/linux/mfd/sun4i-gpadc.h
@@ -19,6 +19,9 @@
 #define SUN4I_GPADC_CTRL0_FS_DIV(x)			((GENMASK(3, 0) & (x)) << 16)
 #define SUN4I_GPADC_CTRL0_T_ACQ(x)			(GENMASK(15, 0) & (x))
 
+/* TP_CTRL0 bits for sun50i SOCs */
+#define SUN50I_GPADC_CTRL0_T_ACQ(x)			((GENMASK(15, 0) & (x)) << 16)
+
 #define SUN4I_GPADC_CTRL1				0x04
 
 #define SUN4I_GPADC_CTRL1_STYLUS_UP_DEBOUNCE(x)		((GENMASK(7, 0) & (x)) << 12)
@@ -49,6 +52,9 @@
 #define SUN4I_GPADC_CTRL2_PRE_MEA_EN			BIT(24)
 #define SUN4I_GPADC_CTRL2_PRE_MEA_THRE_CNT(x)		(GENMASK(23, 0) & (x))
 
+#define SUN50I_GPADC_TPR				0x08
+#define SUN50I_GPADC_TPR_TEMP_PERIOD(x)			((GENMASK(19, 0) & (x)) << 12)
+
 #define SUN4I_GPADC_CTRL3				0x0c
 
 #define SUN4I_GPADC_CTRL3_FILTER_EN			BIT(2)
@@ -84,6 +90,9 @@
 #define SUN4I_GPADC_TEMP_DATA				0x20
 #define SUN4I_GPADC_DATA				0x24
 
+#define SUN50I_H6_GPADC_CTRL3				0x30
+#define SUN50I_H6_GPADC_TEMP_DATA			0xc0
+
 #define SUN4I_GPADC_IRQ_FIFO_DATA			0
 #define SUN4I_GPADC_IRQ_TEMP_DATA			1
 
-- 
2.17.1
