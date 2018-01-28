From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 04/16] iio: adc: sun4i-gpadc-iio: rework:
 sampling start/end code readout reg
Date: Mon, 29 Jan 2018 00:29:07 +0100
Message-ID: <20180128232919.12639-5-embed3d@gmail.com>
References: <20180128232919.12639-1-embed3d@gmail.com>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD257DPK24NRBWVZXHJQKGQEQD7MF3I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

For adding newer sensor some basic rework of the code is necessary.

This commit reworks the code and allows the sampling start/end code and
the position of value readout register to be altered. Later the start/end
functions will be used to configure the ths and start/stop the
sampling.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/iio/adc/sun4i-gpadc-iio.c | 44 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index 03804ff9c006..db57d9fffe48 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -49,6 +49,15 @@ static unsigned int sun6i_gpadc_chan_select(unsigned int chan)
 	return SUN6I_GPADC_CTRL1_ADC_CHAN_SELECT(chan);
 }
 
+struct sun4i_gpadc_iio;
+
+/*
+ * Prototypes for these functions, which enable these functions to be
+ * referenced in gpadc_data structures.
+ */
+static int sun4i_gpadc_sample_start(struct sun4i_gpadc_iio *info);
+static int sun4i_gpadc_sample_end(struct sun4i_gpadc_iio *info);
+
 struct gpadc_data {
 	int		temp_offset;
 	int		temp_scale;
@@ -56,6 +65,9 @@ struct gpadc_data {
 	unsigned int	tp_adc_select;
 	unsigned int	(*adc_chan_select)(unsigned int chan);
 	unsigned int	adc_chan_mask;
+	unsigned int	temp_data;
+	int		(*sample_start)(struct sun4i_gpadc_iio *info);
+	int		(*sample_end)(struct sun4i_gpadc_iio *info);
 };
 
 static const struct gpadc_data sun4i_gpadc_data = {
@@ -65,6 +77,9 @@ static const struct gpadc_data sun4i_gpadc_data = {
 	.tp_adc_select = SUN4I_GPADC_CTRL1_TP_ADC_SELECT,
 	.adc_chan_select = &sun4i_gpadc_chan_select,
 	.adc_chan_mask = SUN4I_GPADC_CTRL1_ADC_CHAN_MASK,
+	.temp_data = SUN4I_GPADC_TEMP_DATA,
+	.sample_start = sun4i_gpadc_sample_start,
+	.sample_end = sun4i_gpadc_sample_end,
 };
 
 static const struct gpadc_data sun5i_gpadc_data = {
@@ -74,6 +89,9 @@ static const struct gpadc_data sun5i_gpadc_data = {
 	.tp_adc_select = SUN4I_GPADC_CTRL1_TP_ADC_SELECT,
 	.adc_chan_select = &sun4i_gpadc_chan_select,
 	.adc_chan_mask = SUN4I_GPADC_CTRL1_ADC_CHAN_MASK,
+	.temp_data = SUN4I_GPADC_TEMP_DATA,
+	.sample_start = sun4i_gpadc_sample_start,
+	.sample_end = sun4i_gpadc_sample_end,
 };
 
 static const struct gpadc_data sun6i_gpadc_data = {
@@ -83,12 +101,18 @@ static const struct gpadc_data sun6i_gpadc_data = {
 	.tp_adc_select = SUN6I_GPADC_CTRL1_TP_ADC_SELECT,
 	.adc_chan_select = &sun6i_gpadc_chan_select,
 	.adc_chan_mask = SUN6I_GPADC_CTRL1_ADC_CHAN_MASK,
+	.temp_data = SUN4I_GPADC_TEMP_DATA,
+	.sample_start = sun4i_gpadc_sample_start,
+	.sample_end = sun4i_gpadc_sample_end,
 };
 
 static const struct gpadc_data sun8i_a33_gpadc_data = {
 	.temp_offset = -1662,
 	.temp_scale = 162,
 	.tp_mode_en = SUN8I_A33_GPADC_CTRL1_CHOP_TEMP_EN,
+	.temp_data = SUN4I_GPADC_TEMP_DATA,
+	.sample_start = sun4i_gpadc_sample_start,
+	.sample_end = sun4i_gpadc_sample_end,
 };
 
 struct sun4i_gpadc_iio {
@@ -277,7 +301,7 @@ static int sun4i_gpadc_temp_read(struct iio_dev *indio_dev, int *val)
 	if (info->no_irq) {
 		pm_runtime_get_sync(indio_dev->dev.parent);
 
-		regmap_read(info->regmap, SUN4I_GPADC_TEMP_DATA, val);
+		regmap_read(info->regmap, info->data->temp_data, val);
 
 		pm_runtime_mark_last_busy(indio_dev->dev.parent);
 		pm_runtime_put_autosuspend(indio_dev->dev.parent);
@@ -382,10 +406,8 @@ static irqreturn_t sun4i_gpadc_fifo_data_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int sun4i_gpadc_runtime_suspend(struct device *dev)
+static int sun4i_gpadc_sample_end(struct sun4i_gpadc_iio *info)
 {
-	struct sun4i_gpadc_iio *info = iio_priv(dev_get_drvdata(dev));
-
 	/* Disable the ADC on IP */
 	regmap_write(info->regmap, SUN4I_GPADC_CTRL1, 0);
 	/* Disable temperature sensor on IP */
@@ -394,10 +416,15 @@ static int sun4i_gpadc_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int sun4i_gpadc_runtime_resume(struct device *dev)
+static int sun4i_gpadc_runtime_suspend(struct device *dev)
 {
 	struct sun4i_gpadc_iio *info = iio_priv(dev_get_drvdata(dev));
 
+	return info->data->sample_end(info);
+}
+
+static int sun4i_gpadc_sample_start(struct sun4i_gpadc_iio *info)
+{
 	/* clkin = 6MHz */
 	regmap_write(info->regmap, SUN4I_GPADC_CTRL0,
 		     SUN4I_GPADC_CTRL0_ADC_CLK_DIVIDER(2) |
@@ -415,6 +442,13 @@ static int sun4i_gpadc_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int sun4i_gpadc_runtime_resume(struct device *dev)
+{
+	struct sun4i_gpadc_iio *info = iio_priv(dev_get_drvdata(dev));
+
+	return info->data->sample_start(info);
+}
+
 static int sun4i_gpadc_get_temp(void *data, int *temp)
 {
 	struct sun4i_gpadc_iio *info = data;
-- 
2.11.0
