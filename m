From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 4/7] iio: adc: sun4i-gpadc-iio: support clocks and reset
Date: Fri,  3 May 2019 03:28:10 -0400
Message-ID: <20190503072813.2719-5-tiny.windzz@gmail.com>
References: <20190503072813.2719-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190503072813.2719-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

H6 has bus clock and a reset, so introduce something in
gpadc_data/sun4i_gpadc_iio and adds the process of the
clocks and resets.

This is pre-work for supprt it.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/iio/adc/sun4i-gpadc-iio.c | 32 +++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index de6b8556a549..f24eb76d65c0 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -22,6 +22,7 @@
  * shutdown for not being used.
  */
 
+#include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -31,6 +32,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <linux/thermal.h>
 #include <linux/delay.h>
 
@@ -52,6 +54,8 @@ static unsigned int sun6i_gpadc_chan_select(unsigned int chan)
 struct sun4i_gpadc_iio;
 
 struct gpadc_data {
+	bool            has_bus_clk;
+	bool            has_bus_rst;
 	int		temp_offset;
 	int		temp_scale;
 	unsigned int	tp_mode_en;
@@ -140,6 +144,8 @@ struct sun4i_gpadc_iio {
 	struct mutex			mutex;
 	struct sun4i_sensor_tzd         tzds[MAX_SENSOR_COUNT];
 	struct device			*sensor_device;
+	struct clk                      *bus_clk;
+	struct reset_control            *reset;
 };
 
 #define SUN4I_GPADC_ADC_CHANNEL(_channel, _name) {		\
@@ -564,14 +570,36 @@ static int sun4i_gpadc_probe_dt(struct platform_device *pdev,
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	info->regmap = devm_regmap_init_mmio(&pdev->dev, base,
-					     &sun4i_gpadc_regmap_config);
+	if (info->data->has_bus_clk)
+		info->regmap = devm_regmap_init_mmio_clk(&pdev->dev, "bus",
+							 base,
+						&sun4i_gpadc_regmap_config);
+	else
+		info->regmap = devm_regmap_init_mmio(&pdev->dev, base,
+						&sun4i_gpadc_regmap_config);
+
 	if (IS_ERR(info->regmap)) {
 		ret = PTR_ERR(info->regmap);
 		dev_err(&pdev->dev, "failed to init regmap: %d\n", ret);
 		return ret;
 	}
 
+	if (info->data->has_bus_rst) {
+		info->reset = devm_reset_control_get(&pdev->dev, "bus");
+		if (IS_ERR(info->reset)) {
+			ret = PTR_ERR(info->reset);
+			return ret;
+		}
+	}
+
+	if (info->data->has_bus_clk) {
+		info->bus_clk = devm_clk_get(&pdev->dev, "bus");
+		if (IS_ERR(info->bus_clk)) {
+			ret = PTR_ERR(info->bus_clk);
+			return ret;
+		}
+	}
+
 	if (IS_ENABLED(CONFIG_THERMAL_OF))
 		info->sensor_device = &pdev->dev;
 
-- 
2.17.1
