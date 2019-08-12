From: Mircea Caprioru <mircea.caprioru@analog.com>
Subject: [PATCH 3/4] staging: iio: adc: ad7192: Add system calibration support
Date: Mon, 12 Aug 2019 12:03:40 +0300
Message-ID: <20190812090341.27183-3-mircea.caprioru@analog.com>
References: <20190812090341.27183-1-mircea.caprioru@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812090341.27183-1-mircea.caprioru@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org
Cc: Michael.Hennerich@analog.com, stefan.popa@analog.com, lars@metafoo.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, Mircea Caprioru <mircea.caprioru@analog.com>
List-Id: devicetree@vger.kernel.org

This patch will add a system calibration attribute for each channel. Using
this option the user will have the ability to calibrate each channel for
zero scale and full scale. It uses the iio_chan_spec_ext_info and IIO_ENUM
to implement the functionality.

Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
---
 drivers/staging/iio/adc/ad7192.c | 55 +++++++++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/adc/ad7192.c b/drivers/staging/iio/adc/ad7192.c
index d58ce08f3693..731072830f30 100644
--- a/drivers/staging/iio/adc/ad7192.c
+++ b/drivers/staging/iio/adc/ad7192.c
@@ -155,6 +155,11 @@
  * The DOUT/RDY output must also be wired to an interrupt capable GPIO.
  */
 
+enum {
+   AD7192_SYSCALIB_ZERO_SCALE,
+   AD7192_SYSCALIB_FULL_SCALE,
+};
+
 struct ad7192_state {
 	struct regulator		*avdd;
 	struct regulator		*dvdd;
@@ -169,10 +174,56 @@ struct ad7192_state {
 	u8				devid;
 	u8				clock_sel;
 	struct mutex			lock;	/* protect sensor state */
+	u8				syscalib_mode[8];
 
 	struct ad_sigma_delta		sd;
 };
 
+static const char * const ad7192_syscalib_modes[] = {
+	[AD7192_SYSCALIB_ZERO_SCALE] = "zero_scale",
+	[AD7192_SYSCALIB_FULL_SCALE] = "full_scale",
+};
+
+static int ad7192_set_syscalib_mode(struct iio_dev *indio_dev,
+				    const struct iio_chan_spec *chan,
+				    unsigned int mode)
+{
+	struct ad7192_state *st = iio_priv(indio_dev);
+	int ret;
+
+	st->syscalib_mode[chan->channel] = mode;
+
+	if (mode == AD7192_SYSCALIB_ZERO_SCALE)
+		ret = ad_sd_calibrate(&st->sd, AD7192_MODE_CAL_SYS_ZERO,
+				      chan->address);
+	else
+		ret = ad_sd_calibrate(&st->sd, AD7192_MODE_CAL_SYS_FULL,
+				      chan->address);
+
+	return ret;
+}
+
+static int ad7192_get_syscalib_mode(struct iio_dev *indio_dev,
+				    const struct iio_chan_spec *chan)
+{
+	struct ad7192_state *st = iio_priv(indio_dev);
+
+	return st->syscalib_mode[chan->channel];
+}
+
+static const struct iio_enum ad7192_syscalib_mode_enum = {
+	.items = ad7192_syscalib_modes,
+	.num_items = ARRAY_SIZE(ad7192_syscalib_modes),
+	.set = ad7192_set_syscalib_mode,
+	.get = ad7192_get_syscalib_mode
+};
+
+static const struct iio_chan_spec_ext_info ad7192_calibsys_ext_info[] = {
+	IIO_ENUM("system_calibration", IIO_SEPARATE, &ad7192_syscalib_mode_enum),
+	IIO_ENUM_AVAILABLE("system_calibration", &ad7192_syscalib_mode_enum),
+	{}
+};
+
 static struct ad7192_state *ad_sigma_delta_to_ad7192(struct ad_sigma_delta *sd)
 {
 	return container_of(sd, struct ad7192_state, sd);
@@ -769,9 +820,11 @@ static int ad7192_channels_config(struct iio_dev *indio_dev)
 		*chan = channels[i];
 		chan->info_mask_shared_by_all |=
 			BIT(IIO_CHAN_INFO_LOW_PASS_FILTER_3DB_FREQUENCY);
-		if (chan->type != IIO_TEMP)
+		if (chan->type != IIO_TEMP) {
 			chan->info_mask_shared_by_type_available |=
 				BIT(IIO_CHAN_INFO_SCALE);
+			chan->ext_info = ad7192_calibsys_ext_info;
+		}
 		chan++;
 	}
 
-- 
2.17.1
