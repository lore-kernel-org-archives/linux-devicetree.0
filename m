From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 07/16] iio: adc: sun4i-gpadc-iio: rework:
 support nvmem calibration data
Date: Fri, 26 Jan 2018 16:19:32 +0100
Message-ID: <20180126151941.12183-8-embed3d@gmail.com>
References: <20180126151941.12183-1-embed3d@gmail.com>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD257DPK24NRBHUOVXJQKGQE54IBZXY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180126151941.12183-1-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, edu.molinas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, singhalsimran0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch reworks the driver to support nvmem calibration cells.
The driver checks if the nvmem calibration is supported and reads out
the nvmem. At the beginning of the startup process the calibration data
is written to the related registers.

Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/iio/adc/sun4i-gpadc-iio.c | 52 +++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/sun4i-gpadc.h   |  2 ++
 2 files changed, 54 insertions(+)

diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index bff06f2798e8..7b12666cdd9e 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -27,6 +27,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
@@ -81,6 +82,7 @@ struct gpadc_data {
 	bool		has_bus_rst;
 	bool		has_mod_clk;
 	int		sensor_count;
+	bool		supports_nvmem;
 };
 
 static const struct gpadc_data sun4i_gpadc_data = {
@@ -94,6 +96,7 @@ static const struct gpadc_data sun4i_gpadc_data = {
 	.sample_start = sun4i_gpadc_sample_start,
 	.sample_end = sun4i_gpadc_sample_end,
 	.sensor_count = 1,
+	.supports_nvmem = false,
 };
 
 static const struct gpadc_data sun5i_gpadc_data = {
@@ -107,6 +110,7 @@ static const struct gpadc_data sun5i_gpadc_data = {
 	.sample_start = sun4i_gpadc_sample_start,
 	.sample_end = sun4i_gpadc_sample_end,
 	.sensor_count = 1,
+	.supports_nvmem = false,
 };
 
 static const struct gpadc_data sun6i_gpadc_data = {
@@ -120,6 +124,7 @@ static const struct gpadc_data sun6i_gpadc_data = {
 	.sample_start = sun4i_gpadc_sample_start,
 	.sample_end = sun4i_gpadc_sample_end,
 	.sensor_count = 1,
+	.supports_nvmem = false,
 };
 
 static const struct gpadc_data sun8i_a33_gpadc_data = {
@@ -130,6 +135,7 @@ static const struct gpadc_data sun8i_a33_gpadc_data = {
 	.sample_start = sun4i_gpadc_sample_start,
 	.sample_end = sun4i_gpadc_sample_end,
 	.sensor_count = 1,
+	.supports_nvmem = false,
 };
 
 struct sun4i_gpadc_iio {
@@ -148,6 +154,8 @@ struct sun4i_gpadc_iio {
 	struct clk			*mod_clk;
 	struct reset_control		*reset;
 	int				sensor_id;
+	u32				calibration_data[2];
+	bool				has_calibration_data[2];
 	/* prevents concurrent reads of temperature and ADC */
 	struct mutex			mutex;
 	struct thermal_zone_device	*tzd;
@@ -459,6 +467,17 @@ static int sun4i_gpadc_runtime_suspend(struct device *dev)
 	return info->data->sample_end(info);
 }
 
+static void sunxi_calibrate(struct sun4i_gpadc_iio *info)
+{
+	if (info->has_calibration_data[0])
+		regmap_write(info->regmap, SUNXI_THS_CDATA_0_1,
+			info->calibration_data[0]);
+
+	if (info->has_calibration_data[1])
+		regmap_write(info->regmap, SUNXI_THS_CDATA_2_3,
+			info->calibration_data[1]);
+}
+
 static int sun4i_gpadc_sample_start(struct sun4i_gpadc_iio *info)
 {
 	/* clkin = 6MHz */
@@ -481,6 +500,7 @@ static int sun4i_gpadc_sample_start(struct sun4i_gpadc_iio *info)
 static int sunxi_ths_sample_start(struct sun4i_gpadc_iio *info)
 {
 	u32 value;
+	sunxi_calibrate(info);
 
 	if (info->data->ctrl0_map)
 		regmap_write(info->regmap, SUNXI_THS_CTRL0,
@@ -602,6 +622,9 @@ static int sun4i_gpadc_probe_dt(struct platform_device *pdev,
 	struct resource *mem;
 	void __iomem *base;
 	int ret;
+	struct nvmem_cell *cell;
+	ssize_t cell_size;
+	u64 *cell_data;
 
 	info->data = of_device_get_match_data(&pdev->dev);
 	if (!info->data)
@@ -616,6 +639,35 @@ static int sun4i_gpadc_probe_dt(struct platform_device *pdev,
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	info->has_calibration_data[0] = false;
+	info->has_calibration_data[1] = false;
+
+	if (!info->data->supports_nvmem)
+		goto no_nvmem;
+
+	cell = devm_nvmem_cell_get(&pdev->dev, "calibration");
+	if (IS_ERR(cell)) {
+		if (PTR_ERR(cell) == -EPROBE_DEFER)
+			return PTR_ERR(cell);
+	} else {
+		cell_data = (u64 *)nvmem_cell_read(cell, &cell_size);
+		devm_nvmem_cell_put(&pdev->dev, cell);
+		if (cell_size <= 4) {
+			info->has_calibration_data[0] = true;
+			info->calibration_data[0] = be32_to_cpu(cell_data[0] &
+					GENMASK(31, 0));
+		} else if (cell_size <= 8) {
+			info->has_calibration_data[0] = true;
+			info->calibration_data[0] = be32_to_cpu(cell_data[0] &
+					GENMASK(31, 0));
+			info->has_calibration_data[1] = true;
+			info->calibration_data[1] = be32_to_cpu(
+					(cell_data[0] >> 32) & GENMASK(31, 0));
+		}
+	}
+
+no_nvmem:
+
 	info->regmap = devm_regmap_init_mmio(&pdev->dev, base,
 					     &sun4i_gpadc_regmap_config);
 	if (IS_ERR(info->regmap)) {
diff --git a/include/linux/mfd/sun4i-gpadc.h b/include/linux/mfd/sun4i-gpadc.h
index 40b4dd9d2405..c251002431bd 100644
--- a/include/linux/mfd/sun4i-gpadc.h
+++ b/include/linux/mfd/sun4i-gpadc.h
@@ -90,6 +90,8 @@
 #define SUNXI_THS_CTRL0					0x00
 #define SUNXI_THS_CTRL2					0x40
 #define SUNXI_THS_FILTER				0x70
+#define SUNXI_THS_CDATA_0_1				0x74
+#define SUNXI_THS_CDATA_2_3				0x78
 #define SUNXI_THS_TDATA0				0x80
 #define SUNXI_THS_TDATA1				0x84
 #define SUNXI_THS_TDATA2				0x88
-- 
2.11.0
