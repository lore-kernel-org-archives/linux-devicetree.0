From: Mircea Caprioru <mircea.caprioru@analog.com>
Subject: [PATCH V3 3/5] iio: adc: ad7124: Shift to dynamic allocation for channel configuration
Date: Mon, 24 Jun 2019 11:08:43 +0300
Message-ID: <20190624080845.18537-3-mircea.caprioru@analog.com>
References: <20190624080845.18537-1-mircea.caprioru@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190624080845.18537-1-mircea.caprioru@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org
Cc: Michael.Hennerich@analog.com, stefan.popa@analog.com, lars@metafoo.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, Mircea Caprioru <mircea.caprioru@analog.com>
List-Id: devicetree@vger.kernel.org

This patch changes the channel configuration member of the device
structure from a fixed size array to a dynamic allocated one with a size
equal to the number of channels specified in the device tree. This will
ensure a more flexibility for compatible devices.

Ex. ad7124-4 - can have 4 differential or 8 pseudo-differential channels
ad7124-8 - can have 8 differential or 16 pseudo-differential channels

Also the device can suspport any other combination of differential and
pseudo-differential channels base on the physical number of inputs
available.

Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
---

Changelog v2:
- nothing changed here

Changelog v3:
- nothing changed here

 drivers/iio/adc/ad7124.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ad7124.c b/drivers/iio/adc/ad7124.c
index ab52c5e9ecb1..edc6f1cc90b2 100644
--- a/drivers/iio/adc/ad7124.c
+++ b/drivers/iio/adc/ad7124.c
@@ -121,7 +121,7 @@ struct ad7124_channel_config {
 struct ad7124_state {
 	const struct ad7124_chip_info *chip_info;
 	struct ad_sigma_delta sd;
-	struct ad7124_channel_config channel_config[4];
+	struct ad7124_channel_config *channel_config;
 	struct regulator *vref[4];
 	struct clk *mclk;
 	unsigned int adc_control;
@@ -439,6 +439,7 @@ static int ad7124_of_parse_channel_config(struct iio_dev *indio_dev,
 	struct ad7124_state *st = iio_priv(indio_dev);
 	struct device_node *child;
 	struct iio_chan_spec *chan;
+	struct ad7124_channel_config *chan_config;
 	unsigned int ain[2], channel = 0, tmp;
 	int ret;
 
@@ -453,8 +454,14 @@ static int ad7124_of_parse_channel_config(struct iio_dev *indio_dev,
 	if (!chan)
 		return -ENOMEM;
 
+	chan_config = devm_kcalloc(indio_dev->dev.parent, st->num_channels,
+				   sizeof(*chan_config), GFP_KERNEL);
+	if (!chan_config)
+		return -ENOMEM;
+
 	indio_dev->channels = chan;
 	indio_dev->num_channels = st->num_channels;
+	st->channel_config = chan_config;
 
 	for_each_available_child_of_node(np, child) {
 		ret = of_property_read_u32(child, "reg", &channel);
-- 
2.17.1
