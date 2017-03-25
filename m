From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 2/2] iio: adc: meson-saradc: add Meson8b SoC compatibility
Date: Sat, 25 Mar 2017 17:29:38 +0100
Message-ID: <20170325162938.28659-3-martin.blumenstingl@googlemail.com>
References: <20170325162938.28659-1-martin.blumenstingl@googlemail.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170325162938.28659-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Meson GX SoCs however use some magic bits to prevent simultaneous (=
conflicting, because only consumer should use the FIFO buffer with the
ADC results) usage by the Linux kernel and the bootloader (the BL30
bootloader uses the SAR ADC to read the CPU temperature).
This patch changes guards all BL30 functionality so it is skipped on
SoCs which don't have it. Since the hardware itself doesn't know whether
BL30 is available the internal meson_sar_adc_data is extended so this
information can be provided per of_device_id.data inside the driver.

Additionally the clocks "adc_clk" and "adc_sel" are not provided by the
clock-controller itself. "adc_sel" is not available at all. "adc_clk"
is provided by the SAR ADC IP block itself on Meson8b (and earlier).
This is already supported by the meson_saradc driver.

Finally a new of_device_id for the Meson8b SoC is added so it can be
wired up in the corresponding DT.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 drivers/iio/adc/meson_saradc.c | 70 +++++++++++++++++++++++++++---------------
 1 file changed, 46 insertions(+), 24 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index dd4190b50df6..f78fe66e0ec8 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -220,6 +220,7 @@ enum meson_sar_adc_chan7_mux_sel {
 };
 
 struct meson_sar_adc_data {
+	char					has_bl30_integration;
 	unsigned int				resolution;
 	const char				*name;
 };
@@ -437,19 +438,24 @@ static int meson_sar_adc_lock(struct iio_dev *indio_dev)
 
 	mutex_lock(&indio_dev->mlock);
 
-	/* prevent BL30 from using the SAR ADC while we are using it */
-	regmap_update_bits(priv->regmap, MESON_SAR_ADC_DELAY,
-			   MESON_SAR_ADC_DELAY_KERNEL_BUSY,
-			   MESON_SAR_ADC_DELAY_KERNEL_BUSY);
-
-	/* wait until BL30 releases it's lock (so we can use the SAR ADC) */
-	do {
-		udelay(1);
-		regmap_read(priv->regmap, MESON_SAR_ADC_DELAY, &val);
-	} while (val & MESON_SAR_ADC_DELAY_BL30_BUSY && timeout--);
-
-	if (timeout < 0)
-		return -ETIMEDOUT;
+	if (priv->data->has_bl30_integration) {
+		/* prevent BL30 from using the SAR ADC while we are using it */
+		regmap_update_bits(priv->regmap, MESON_SAR_ADC_DELAY,
+				MESON_SAR_ADC_DELAY_KERNEL_BUSY,
+				MESON_SAR_ADC_DELAY_KERNEL_BUSY);
+
+		/*
+		 * wait until BL30 releases it's lock (so we can use the SAR
+		 * ADC)
+		 */
+		do {
+			udelay(1);
+			regmap_read(priv->regmap, MESON_SAR_ADC_DELAY, &val);
+		} while (val & MESON_SAR_ADC_DELAY_BL30_BUSY && timeout--);
+
+		if (timeout < 0)
+			return -ETIMEDOUT;
+	}
 
 	return 0;
 }
@@ -458,9 +464,10 @@ static void meson_sar_adc_unlock(struct iio_dev *indio_dev)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
 
-	/* allow BL30 to use the SAR ADC again */
-	regmap_update_bits(priv->regmap, MESON_SAR_ADC_DELAY,
-			   MESON_SAR_ADC_DELAY_KERNEL_BUSY, 0);
+	if (priv->data->has_bl30_integration)
+		/* allow BL30 to use the SAR ADC again */
+		regmap_update_bits(priv->regmap, MESON_SAR_ADC_DELAY,
+				MESON_SAR_ADC_DELAY_KERNEL_BUSY, 0);
 
 	mutex_unlock(&indio_dev->mlock);
 }
@@ -614,14 +621,16 @@ static int meson_sar_adc_init(struct iio_dev *indio_dev)
 	 */
 	meson_sar_adc_set_chan7_mux(indio_dev, CHAN7_MUX_CH7_INPUT);
 
-	/*
-	 * leave sampling delay and the input clocks as configured by BL30 to
-	 * make sure BL30 gets the values it expects when reading the
-	 * temperature sensor.
-	 */
-	regmap_read(priv->regmap, MESON_SAR_ADC_REG3, &regval);
-	if (regval & MESON_SAR_ADC_REG3_BL30_INITIALIZED)
-		return 0;
+	if (priv->data->has_bl30_integration) {
+		/*
+		 * leave sampling delay and the input clocks as configured by
+		 * BL30 to make sure BL30 gets the values it expects when
+		 * reading the temperature sensor.
+		 */
+		regmap_read(priv->regmap, MESON_SAR_ADC_REG3, &regval);
+		if (regval & MESON_SAR_ADC_REG3_BL30_INITIALIZED)
+			return 0;
+	}
 
 	meson_sar_adc_stop_sample_engine(indio_dev);
 
@@ -834,23 +843,36 @@ static const struct iio_info meson_sar_adc_iio_info = {
 	.driver_module = THIS_MODULE,
 };
 
+struct meson_sar_adc_data meson_sar_adc_meson8b_data = {
+	.has_bl30_integration = 0,
+	.resolution = 10,
+	.name = "meson-meson8b-saradc",
+};
+
 struct meson_sar_adc_data meson_sar_adc_gxbb_data = {
+	.has_bl30_integration = 1,
 	.resolution = 10,
 	.name = "meson-gxbb-saradc",
 };
 
 struct meson_sar_adc_data meson_sar_adc_gxl_data = {
+	.has_bl30_integration = 1,
 	.resolution = 12,
 	.name = "meson-gxl-saradc",
 };
 
 struct meson_sar_adc_data meson_sar_adc_gxm_data = {
+	.has_bl30_integration = 1,
 	.resolution = 12,
 	.name = "meson-gxm-saradc",
 };
 
 static const struct of_device_id meson_sar_adc_of_match[] = {
 	{
+		.compatible = "amlogic,meson8b-saradc",
+		.data = &meson_sar_adc_meson8b_data,
+	},
+	{
 		.compatible = "amlogic,meson-gxbb-saradc",
 		.data = &meson_sar_adc_gxbb_data,
 	}, {
-- 
2.12.1
