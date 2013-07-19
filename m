From: Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>
Subject: [PATCH v2 5/5] iio: mxs-lradc: add write_raw function to modify scale
Date: Fri, 19 Jul 2013 11:13:28 +0200
Message-ID: <1374225208-28940-6-git-send-email-hector.palacios@digi.com>
References: <1374225208-28940-1-git-send-email-hector.palacios@digi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374225208-28940-1-git-send-email-hector.palacios-i7dp0qKlBMg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, hector.palacios-i7dp0qKlBMg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Added write_raw function to manipulate the optional divider_by_two
through the scaling attribute out of the available scales.

Signed-off-by: Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>
---
 drivers/staging/iio/adc/mxs-lradc.c | 55 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/adc/mxs-lradc.c b/drivers/staging/iio/adc/mxs-lradc.c
index c929733..286cde2 100644
--- a/drivers/staging/iio/adc/mxs-lradc.c
+++ b/drivers/staging/iio/adc/mxs-lradc.c
@@ -144,6 +144,7 @@ struct mxs_lradc {
 
 	uint32_t		vref_mv[LRADC_MAX_TOTAL_CHANS];
 	unsigned int		scale_avail[LRADC_MAX_TOTAL_CHANS][2][2];
+	unsigned int		is_divided[LRADC_MAX_TOTAL_CHANS];
 
 	/*
 	 * Touchscreen LRADC channels receives a private slot in the CTRL4
@@ -202,6 +203,7 @@ struct mxs_lradc {
 #define	LRADC_CTRL1_LRADC_IRQ_OFFSET		0
 
 #define	LRADC_CTRL2				0x20
+#define	LRADC_CTRL2_DIVIDE_BY_TWO_OFFSET	24
 #define	LRADC_CTRL2_TEMPSENSE_PWD		(1 << 15)
 
 #define	LRADC_STATUS				0x40
@@ -310,7 +312,8 @@ static int mxs_lradc_read_raw(struct iio_dev *iio_dev,
 		break;
 	case IIO_CHAN_INFO_SCALE:
 		*val = lradc->vref_mv[chan->channel];
-		*val2 = chan->scan_type.realbits;
+		*val2 = chan->scan_type.realbits -
+			lradc->is_divided[chan->channel];
 		ret = IIO_VAL_FRACTIONAL_LOG2;
 		break;
 	default:
@@ -323,6 +326,54 @@ static int mxs_lradc_read_raw(struct iio_dev *iio_dev,
 	return ret;
 }
 
+static int mxs_lradc_write_raw(struct iio_dev *iio_dev,
+			       const struct iio_chan_spec *chan,
+			       int val, int val2, long m)
+{
+	struct mxs_lradc *lradc = iio_priv(iio_dev);
+	int ret;
+
+	ret = mutex_trylock(&lradc->lock);
+	if (!ret)
+		return -EBUSY;
+
+	switch (m) {
+	case IIO_CHAN_INFO_SCALE:
+		ret = -EINVAL;
+		if (val == lradc->scale_avail[chan->channel][0][0] &&
+		    val2 == lradc->scale_avail[chan->channel][0][1]) {
+			/* [0] -> divider by two disabled */
+			writel(1 << LRADC_CTRL2_DIVIDE_BY_TWO_OFFSET,
+			       lradc->base + LRADC_CTRL2 + STMP_OFFSET_REG_CLR);
+			lradc->is_divided[chan->channel] = 0;
+			ret = 0;
+		} else if (val == lradc->scale_avail[chan->channel][1][0] &&
+			   val2 == lradc->scale_avail[chan->channel][1][1]) {
+			/* [1] -> divider by two enabled */
+			writel(1 << LRADC_CTRL2_DIVIDE_BY_TWO_OFFSET,
+			       lradc->base + LRADC_CTRL2 + STMP_OFFSET_REG_SET);
+			lradc->is_divided[chan->channel] = 1;
+			ret = 0;
+		}
+
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	mutex_unlock(&lradc->lock);
+
+	return ret;
+}
+
+static int mxs_lradc_write_raw_get_fmt(struct iio_dev *iio_dev,
+				       const struct iio_chan_spec *chan,
+				       long m)
+{
+	return IIO_VAL_INT_PLUS_NANO;
+}
+
 static ssize_t mxs_lradc_show_scale_available_ch(struct device *dev,
 		struct device_attribute *attr,
 		char *buf,
@@ -400,6 +451,8 @@ static const struct attribute_group mxs_lradc_attribute_group = {
 static const struct iio_info mxs_lradc_iio_info = {
 	.driver_module		= THIS_MODULE,
 	.read_raw		= mxs_lradc_read_raw,
+	.write_raw		= mxs_lradc_write_raw,
+	.write_raw_get_fmt	= &mxs_lradc_write_raw_get_fmt,
 	.attrs			= &mxs_lradc_attribute_group,
 };
 
