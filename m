From: =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@bootlin.com>
Subject: [PATCH v1 2/3] iio: afe: rescale: Add support of CHAN_INFO_PROCESSED
Date: Tue, 11 Jun 2019 11:56:58 +0200
Message-ID: <20190611095659.29845-3-mylene.josserand@bootlin.com>
References: <20190611095659.29845-1-mylene.josserand@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190611095659.29845-1-mylene.josserand@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: peda@axentia.se, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, thomas.petazzoni@bootlin.com, mylene.josserand@bootlin.com
List-Id: devicetree@vger.kernel.org

Add the support of the CHAN_INFO_PROCESSED to have directly
the processed value (raw * scale). It will be exported as
in_voltage0_input in sysfs.

Signed-off-by: Mylène Josserand <mylene.josserand@bootlin.com>
---
 drivers/iio/afe/iio-rescale.c | 42 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/afe/iio-rescale.c b/drivers/iio/afe/iio-rescale.c
index 3e689d6eb501..2275571fff64 100644
--- a/drivers/iio/afe/iio-rescale.c
+++ b/drivers/iio/afe/iio-rescale.c
@@ -63,14 +63,54 @@ static int rescale_convert_scale(struct rescale *rescale, int *val, int *val2)
 	}
 }
 
+static int rescale_convert_processed(struct rescale *rescale, int raw,
+				     int *val, int *val2)
+{
+	unsigned long long tmp, scaled;
+	int ret;
+
+	ret = rescale_convert_scale(rescale, val, val2);
+	switch (ret) {
+	case IIO_VAL_FRACTIONAL:
+		tmp = div_s64((s64)*val * 1000000000LL, *val2);
+		scaled = tmp * raw;
+		*val = (int)div_s64_rem(scaled, 1000000000, val2);
+		return ret;
+	case IIO_VAL_INT:
+		return IIO_VAL_FRACTIONAL;
+	case IIO_VAL_FRACTIONAL_LOG2:
+		tmp = shift_right((s64)*val * 1000000000LL, *val2);
+		scaled = tmp * raw;
+		*val = (int)div_s64_rem(scaled, 1000000000LL, val2);
+		return ret;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static int rescale_read_raw(struct iio_dev *indio_dev,
 			    struct iio_chan_spec const *chan,
 			    int *val, int *val2, long mask)
 {
 	struct rescale *rescale = iio_priv(indio_dev);
+	unsigned int raw;
 	int ret;
 
 	switch (mask) {
+	case IIO_CHAN_INFO_PROCESSED:
+		/* Read the raw value and the scale */
+		ret = iio_read_channel_raw(rescale->source, &raw);
+		if (!ret)
+			return ret;
+		ret = iio_read_channel_scale(rescale->source, val, val2);
+		if (!ret)
+			return ret;
+		/* Process the correct value with raw * scale */
+		ret = rescale_convert_processed(rescale, raw, val, val2);
+		if (!ret)
+			return ret;
+		return IIO_VAL_INT;
+
 	case IIO_CHAN_INFO_RAW:
 		return iio_read_channel_raw(rescale->source, val);
 
@@ -145,7 +185,7 @@ static int rescale_configure_channel(struct device *dev,
 	}
 
 	chan->info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
-		BIT(IIO_CHAN_INFO_SCALE);
+		BIT(IIO_CHAN_INFO_SCALE) | BIT(IIO_CHAN_INFO_PROCESSED);
 
 	if (iio_channel_has_available(schan, IIO_CHAN_INFO_RAW))
 		chan->info_mask_separate_available |= BIT(IIO_CHAN_INFO_RAW);
-- 
2.11.0
