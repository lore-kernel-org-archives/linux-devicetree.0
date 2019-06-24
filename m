From: Mircea Caprioru <mircea.caprioru@analog.com>
Subject: [PATCH V3 2/5] iio: adc: ad7124: Add buffered input support
Date: Mon, 24 Jun 2019 11:08:42 +0300
Message-ID: <20190624080845.18537-2-mircea.caprioru@analog.com>
References: <20190624080845.18537-1-mircea.caprioru@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190624080845.18537-1-mircea.caprioru@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org
Cc: Michael.Hennerich@analog.com, stefan.popa@analog.com, lars@metafoo.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, Mircea Caprioru <mircea.caprioru@analog.com>
List-Id: devicetree@vger.kernel.org

This patch adds the option to enable the buffered mode for positive and
negative inputs. Each option can be enabled independently.

In buffered mode, the input channel feeds into a high impedance input stage
of the buffer amplifier. Therefore, the input can tolerate significant
source impedances and is tailored for direct connection to external
resistive type sensors such as strain gages or RTDs.

Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
---

Changelog v2:
- nothing changed here

Changelog v3:
- nothing changed here

 drivers/iio/adc/ad7124.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ad7124.c b/drivers/iio/adc/ad7124.c
index 810234db9c0d..ab52c5e9ecb1 100644
--- a/drivers/iio/adc/ad7124.c
+++ b/drivers/iio/adc/ad7124.c
@@ -61,6 +61,8 @@
 #define AD7124_CONFIG_REF_SEL(x)	FIELD_PREP(AD7124_CONFIG_REF_SEL_MSK, x)
 #define AD7124_CONFIG_PGA_MSK		GENMASK(2, 0)
 #define AD7124_CONFIG_PGA(x)		FIELD_PREP(AD7124_CONFIG_PGA_MSK, x)
+#define AD7124_CONFIG_IN_BUFF_MSK	GENMASK(7, 6)
+#define AD7124_CONFIG_IN_BUFF(x)	FIELD_PREP(AD7124_CONFIG_IN_BUFF_MSK, x)
 
 /* AD7124_FILTER_X */
 #define AD7124_FILTER_FS_MSK		GENMASK(10, 0)
@@ -108,6 +110,8 @@ struct ad7124_chip_info {
 struct ad7124_channel_config {
 	enum ad7124_ref_sel refsel;
 	bool bipolar;
+	bool buf_positive;
+	bool buf_negative;
 	unsigned int ain;
 	unsigned int vref_mv;
 	unsigned int pga_bits;
@@ -473,6 +477,11 @@ static int ad7124_of_parse_channel_config(struct iio_dev *indio_dev,
 		else
 			st->channel_config[channel].refsel = tmp;
 
+		st->channel_config[channel].buf_positive =
+			of_property_read_bool(child, "adi,buffered-positive");
+		st->channel_config[channel].buf_negative =
+			of_property_read_bool(child, "adi,buffered-negative");
+
 		*chan = ad7124_channel_template;
 		chan->address = channel;
 		chan->scan_index = channel;
@@ -492,7 +501,7 @@ static int ad7124_of_parse_channel_config(struct iio_dev *indio_dev,
 static int ad7124_setup(struct ad7124_state *st)
 {
 	unsigned int val, fclk, power_mode;
-	int i, ret;
+	int i, ret, tmp;
 
 	fclk = clk_get_rate(st->mclk);
 	if (!fclk)
@@ -525,8 +534,12 @@ static int ad7124_setup(struct ad7124_state *st)
 		if (ret < 0)
 			return ret;
 
+		tmp = (st->channel_config[i].buf_positive << 1)  +
+			st->channel_config[i].buf_negative;
+
 		val = AD7124_CONFIG_BIPOLAR(st->channel_config[i].bipolar) |
-		      AD7124_CONFIG_REF_SEL(st->channel_config[i].refsel);
+		      AD7124_CONFIG_REF_SEL(st->channel_config[i].refsel) |
+		      AD7124_CONFIG_IN_BUFF(tmp);
 		ret = ad_sd_write_reg(&st->sd, AD7124_CONFIG(i), 2, val);
 		if (ret < 0)
 			return ret;
-- 
2.17.1
