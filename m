From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 07/16] iio: adc: sun4i-gpadc-iio: rework:
 support nvmem calibration data
Date: Mon, 29 Jan 2018 00:29:10 +0100
Message-ID: <20180128232919.12639-8-embed3d@gmail.com>
References: <20180128232919.12639-1-embed3d@gmail.com>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD257DPK24NRBYFZXHJQKGQEF2KHSPA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180128232919.12639-1-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
the nvmem.

Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/iio/adc/sun4i-gpadc-iio.c | 44 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index ac9ad2f8232f..74eeb5cd5218 100644
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
@@ -74,6 +75,7 @@ struct gpadc_data {
 	bool		has_bus_rst;
 	bool		has_mod_clk;
 	int		sensor_count;
+	bool		supports_nvmem;
 };
 
 static const struct gpadc_data sun4i_gpadc_data = {
@@ -87,6 +89,7 @@ static const struct gpadc_data sun4i_gpadc_data = {
 	.sample_start = sun4i_gpadc_sample_start,
 	.sample_end = sun4i_gpadc_sample_end,
 	.sensor_count = 1,
+	.supports_nvmem = false,
 };
 
 static const struct gpadc_data sun5i_gpadc_data = {
@@ -100,6 +103,7 @@ static const struct gpadc_data sun5i_gpadc_data = {
 	.sample_start = sun4i_gpadc_sample_start,
 	.sample_end = sun4i_gpadc_sample_end,
 	.sensor_count = 1,
+	.supports_nvmem = false,
 };
 
 static const struct gpadc_data sun6i_gpadc_data = {
@@ -113,6 +117,7 @@ static const struct gpadc_data sun6i_gpadc_data = {
 	.sample_start = sun4i_gpadc_sample_start,
 	.sample_end = sun4i_gpadc_sample_end,
 	.sensor_count = 1,
+	.supports_nvmem = false,
 };
 
 static const struct gpadc_data sun8i_a33_gpadc_data = {
@@ -123,6 +128,7 @@ static const struct gpadc_data sun8i_a33_gpadc_data = {
 	.sample_start = sun4i_gpadc_sample_start,
 	.sample_end = sun4i_gpadc_sample_end,
 	.sensor_count = 1,
+	.supports_nvmem = false,
 };
 
 struct sun4i_gpadc_iio {
@@ -141,6 +147,8 @@ struct sun4i_gpadc_iio {
 	struct clk			*mod_clk;
 	struct reset_control		*reset;
 	int				sensor_id;
+	u32				calibration_data[2];
+	bool				has_calibration_data[2];
 	/* prevents concurrent reads of temperature and ADC */
 	struct mutex			mutex;
 	struct thermal_zone_device	*tzd;
@@ -561,6 +569,9 @@ static int sun4i_gpadc_probe_dt(struct platform_device *pdev,
 	struct resource *mem;
 	void __iomem *base;
 	int ret;
+	struct nvmem_cell *cell;
+	ssize_t cell_size;
+	u64 *cell_data;
 
 	info->data = of_device_get_match_data(&pdev->dev);
 	if (!info->data)
@@ -575,6 +586,39 @@ static int sun4i_gpadc_probe_dt(struct platform_device *pdev,
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	info->has_calibration_data[0] = false;
+	info->has_calibration_data[1] = false;
+
+	if (!info->data->supports_nvmem)
+		goto no_nvmem;
+
+	cell = nvmem_cell_get(&pdev->dev, "calibration");
+	if (IS_ERR(cell)) {
+		if (PTR_ERR(cell) == -EPROBE_DEFER)
+			return PTR_ERR(cell);
+		goto no_nvmem;
+	}
+
+	cell_data = (u64 *)nvmem_cell_read(cell, &cell_size);
+	nvmem_cell_put(cell);
+	switch (cell_size) {
+		case 8:
+		case 6:
+			info->has_calibration_data[1] = true;
+			info->calibration_data[1] = be32_to_cpu(
+					upper_32_bits(cell_data[0]));
+		case 4:
+		case 2:
+			info->has_calibration_data[0] = true;
+			info->calibration_data[0] = be32_to_cpu(
+					lower_32_bits(cell_data[0]));
+			break;
+		default:
+			break;
+	}
+
+no_nvmem:
+
 	info->regmap = devm_regmap_init_mmio(&pdev->dev, base,
 					     &sun4i_gpadc_regmap_config);
 	if (IS_ERR(info->regmap)) {
-- 
2.11.0
