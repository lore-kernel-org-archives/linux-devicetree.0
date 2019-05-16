From: Beniamin Bia <beniamin.bia@analog.com>
Subject: [PATCH 4/5] iio: adc: ad7606: Add support for software mode for ad7616
Date: Thu, 16 May 2019 17:32:07 +0300
Message-ID: <20190516143208.19294-4-beniamin.bia@analog.com>
References: <20190516143208.19294-1-beniamin.bia@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190516143208.19294-1-beniamin.bia@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, knaack.h@gmx.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, biabeniamin@outlook.com, Beniamin Bia <beniamin.bia@analog.com>
List-Id: devicetree@vger.kernel.org

Support for ad7616 running in software was added. In order
to activate the software mode, HW_RNGSEL pins must be pulled low.
Oversampling and input ranges are now configured in corresponding
registers. Ad7616 has multiple scale options when it is configured
in software mode.

Signed-off-by: Beniamin Bia <beniamin.bia@analog.com>
---
 drivers/iio/adc/ad7606.c | 111 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 103 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
index 6df81117cacc..f77df3efe43f 100644
--- a/drivers/iio/adc/ad7606.c
+++ b/drivers/iio/adc/ad7606.c
@@ -29,6 +29,20 @@
 
 #include "ad7606.h"
 
+#define AD7606_RANGE_CH_ADDR(ch)	(0x03 + ((ch) >> 1))
+#define AD7606_OS_MODE			0x08
+
+#define AD7616_CONFIGURATION_REGISTER	0x02
+#define AD7616_OS_MASK			GENMASK(4,  2)
+#define AD7616_BURST_MODE		BIT(6)
+#define AD7616_SEQEN_MODE		BIT(5)
+#define AD7616_RANGE_CH_ADDR_OFF	0x04
+#define AD7616_RANGE_CH_ADDR(ch)	((((ch) & 0x1) << 1) + ((ch) >> 3))
+#define AD7616_RANGE_CH_MSK(ch)		(GENMASK(1, 0) << ((ch) & 0x6))
+#define AD7616_RANGE_CH_MODE(ch, mode)	((mode) << (ch & GENMASK(2, 1)))
+
+static int ad7616_sw_mode_config(struct iio_dev *indio_dev);
+
 /*
  * Scales are computed as 5000/32768 and 10000/32768 respectively,
  * so that when applied to the raw values they provide mV values
@@ -37,6 +51,11 @@ static const unsigned int ad7606_scale_avail[2] = {
 	152588, 305176
 };
 
+
+static const unsigned int ad7616_sw_scale_avail[3] = {
+	76293, 152588, 305176
+};
+
 static const unsigned int ad7606_oversampling_avail[7] = {
 	1, 2, 4, 8, 16, 32, 64,
 };
@@ -282,6 +301,26 @@ static int ad7606_write_os_hw(struct iio_dev *indio_dev, int val)
 	return 0;
 }
 
+static int ad7616_write_scale_sw(struct iio_dev *indio_dev, int ch, int val)
+{
+	struct ad7606_state *st = iio_priv(indio_dev);
+	unsigned int ch_addr, mode;
+
+	ch_addr = AD7616_RANGE_CH_ADDR_OFF + AD7616_RANGE_CH_ADDR(ch);
+	mode = AD7616_RANGE_CH_MODE(ch, ((val + 1) & 0x3));
+
+	return ad7606_spi_write_mask(st, ch_addr, AD7616_RANGE_CH_MSK(ch),
+				     mode);
+}
+
+static int ad7616_write_os_sw(struct iio_dev *indio_dev, int val)
+{
+	struct ad7606_state *st = iio_priv(indio_dev);
+
+	return ad7606_spi_write_mask(st, AD7616_CONFIGURATION_REGISTER,
+				     AD7616_OS_MASK, val << 2);
+}
+
 static int ad7606_write_raw(struct iio_dev *indio_dev,
 			    struct iio_chan_spec const *chan,
 			    int val,
@@ -368,14 +407,14 @@ static const struct attribute_group ad7606_attribute_group_range = {
 	.attrs = ad7606_attributes_range,
 };
 
-#define AD760X_CHANNEL(num, mask) {				\
+#define AD760X_CHANNEL(num, mask_sep, mask_type, mask_all) {	\
 		.type = IIO_VOLTAGE,				\
 		.indexed = 1,					\
 		.channel = num,					\
 		.address = num,					\
-		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),	\
-		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),\
-		.info_mask_shared_by_all = mask,		\
+		.info_mask_separate = mask_sep,			\
+		.info_mask_shared_by_type = mask_type,		\
+		.info_mask_shared_by_all = mask_all,		\
 		.scan_index = num,				\
 		.scan_type = {					\
 			.sign = 's',				\
@@ -385,11 +424,18 @@ static const struct attribute_group ad7606_attribute_group_range = {
 		},						\
 }
 
-#define AD7605_CHANNEL(num)	\
-	AD760X_CHANNEL(num, 0)
+#define AD7605_CHANNEL(num)				\
+	AD760X_CHANNEL(num, BIT(IIO_CHAN_INFO_RAW),	\
+		BIT(IIO_CHAN_INFO_SCALE), 0)
+
+#define AD7606_CHANNEL(num)				\
+	AD760X_CHANNEL(num, BIT(IIO_CHAN_INFO_RAW),	\
+		BIT(IIO_CHAN_INFO_SCALE),		\
+		BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO))
 
-#define AD7606_CHANNEL(num)	\
-	AD760X_CHANNEL(num, BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO))
+#define AD7616_CHANNEL(num)	\
+	AD760X_CHANNEL(num, BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_SCALE),\
+		0, BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO))
 
 static const struct iio_chan_spec ad7605_channels[] = {
 	IIO_CHAN_SOFT_TIMESTAMP(4),
@@ -441,6 +487,26 @@ static const struct iio_chan_spec ad7616_channels[] = {
 	AD7606_CHANNEL(15),
 };
 
+static const struct iio_chan_spec ad7616_sw_channels[] = {
+	IIO_CHAN_SOFT_TIMESTAMP(16),
+	AD7616_CHANNEL(0),
+	AD7616_CHANNEL(1),
+	AD7616_CHANNEL(2),
+	AD7616_CHANNEL(3),
+	AD7616_CHANNEL(4),
+	AD7616_CHANNEL(5),
+	AD7616_CHANNEL(6),
+	AD7616_CHANNEL(7),
+	AD7616_CHANNEL(8),
+	AD7616_CHANNEL(9),
+	AD7616_CHANNEL(10),
+	AD7616_CHANNEL(11),
+	AD7616_CHANNEL(12),
+	AD7616_CHANNEL(13),
+	AD7616_CHANNEL(14),
+	AD7616_CHANNEL(15),
+};
+
 static const struct ad7606_chip_info ad7606_chip_info_tbl[] = {
 	/* More devices added in future */
 	[ID_AD7605_4] = {
@@ -468,9 +534,13 @@ static const struct ad7606_chip_info ad7606_chip_info_tbl[] = {
 	[ID_AD7616] = {
 		.channels = ad7616_channels,
 		.num_channels = 17,
+		.sw_mode_config = ad7616_sw_mode_config,
 		.oversampling_avail = ad7616_oversampling_avail,
 		.oversampling_num = ARRAY_SIZE(ad7616_oversampling_avail),
 		.os_req_reset = true,
+		.spi_rd_wr_cmd = ad7616_spi_rd_wr_cmd,
+		.write_scale_sw = ad7616_write_scale_sw,
+		.write_os_sw = ad7616_write_os_sw,
 	},
 };
 
@@ -604,6 +674,23 @@ static void ad7606_regulator_disable(void *data)
 	regulator_disable(st->reg);
 }
 
+static int ad7616_sw_mode_config(struct iio_dev *indio_dev)
+{
+	struct ad7606_state *st = iio_priv(indio_dev);
+
+	/*
+	 * Scale can be configured individually for each channel
+	 * in software mode.
+	 */
+	indio_dev->channels = ad7616_sw_channels;
+
+	/* Activate Burst mode and SEQEN MODE */
+	return ad7606_spi_write_mask(st,
+			      AD7616_CONFIGURATION_REGISTER,
+			      AD7616_BURST_MODE | AD7616_SEQEN_MODE,
+			      AD7616_BURST_MODE | AD7616_SEQEN_MODE);
+}
+
 int ad7606_probe(struct device *dev, int irq, void __iomem *base_address,
 		 const char *name, unsigned int id,
 		 const struct ad7606_bus_ops *bops)
@@ -677,6 +764,10 @@ int ad7606_probe(struct device *dev, int irq, void __iomem *base_address,
 	if (ret)
 		dev_warn(st->dev, "failed to RESET: no RESET GPIO specified\n");
 
+	/* AD7616 requires al least 15ms to reconfigure after a reset */
+	if (msleep_interruptible(15))
+		return -ERESTARTSYS;
+
 	st->write_scale = ad7606_write_scale_hw;
 	st->write_os = ad7606_write_os_hw;
 
@@ -685,6 +776,10 @@ int ad7606_probe(struct device *dev, int irq, void __iomem *base_address,
 							 "adi,sw-mode");
 
 	if (st->sw_mode_en) {
+		/* Scale of 0.076293 is only available in sw mode */
+		st->scale_avail = ad7616_sw_scale_avail;
+		st->num_scales = ARRAY_SIZE(ad7616_sw_scale_avail);
+
 		/* After reset, in software mode, ±10 V is set by default */
 		memset32(st->range, 2, ARRAY_SIZE(st->range));
 		indio_dev->info = &ad7606_info_os_and_range;
-- 
2.17.1
