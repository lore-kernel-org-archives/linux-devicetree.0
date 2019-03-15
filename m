From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v2 3/4] iio: adc: lpc32xx: Add scale feature
Date: Fri, 15 Mar 2019 10:52:30 +0100
Message-ID: <20190315095231.17001-4-gregory.clement@bootlin.com>
References: <20190315095231.17001-1-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190315095231.17001-1-gregory.clement@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org
Cc: devicetree@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, Vladimir Zapolskiy <vz@mleia.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Until now this driver only exposed the raw value of the channels. With
this patch, the scale value is also exposed.

It depends of a regulator supply, and unlike most of the other driver, do
not having this regulator won't prevent to use the driver. The reason for
it is to allow to continue to use this driver with an old device tree. If
there is no regulator supply then the scale won't be exposed.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 drivers/iio/adc/lpc32xx_adc.c | 44 ++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/lpc32xx_adc.c b/drivers/iio/adc/lpc32xx_adc.c
index f391c1e10136..5d1c76e3aad8 100644
--- a/drivers/iio/adc/lpc32xx_adc.c
+++ b/drivers/iio/adc/lpc32xx_adc.c
@@ -14,6 +14,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
 
 /*
  * LPC32XX registers definitions
@@ -45,6 +46,7 @@ struct lpc32xx_adc_state {
 	void __iomem *adc_base;
 	struct clk *clk;
 	struct completion completion;
+	struct regulator *vref;
 
 	u32 value;
 };
@@ -57,7 +59,9 @@ static int lpc32xx_read_raw(struct iio_dev *indio_dev,
 {
 	struct lpc32xx_adc_state *st = iio_priv(indio_dev);
 	int ret;
-	if (mask == IIO_CHAN_INFO_RAW) {
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
 		mutex_lock(&indio_dev->mlock);
 		ret = clk_prepare_enable(st->clk);
 		if (ret) {
@@ -77,22 +81,36 @@ static int lpc32xx_read_raw(struct iio_dev *indio_dev,
 		mutex_unlock(&indio_dev->mlock);
 
 		return IIO_VAL_INT;
-	}
 
-	return -EINVAL;
+	case IIO_CHAN_INFO_SCALE:
+		*val = regulator_get_voltage(st->vref) / 1000;
+		*val2 =  10;
+
+		return IIO_VAL_FRACTIONAL_LOG2;
+	default:
+		return -EINVAL;
+	}
 }
 
 static const struct iio_info lpc32xx_adc_iio_info = {
 	.read_raw = &lpc32xx_read_raw,
 };
 
-#define LPC32XX_ADC_CHANNEL(_index) {			\
+#define LPC32XX_ADC_CHANNEL_BASE(_index)		\
 	.type = IIO_VOLTAGE,				\
 	.indexed = 1,					\
 	.channel = _index,				\
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),	\
 	.address = LPC32XXAD_IN * _index,		\
-	.scan_index = _index,				\
+	.scan_index = _index,
+
+#define LPC32XX_ADC_CHANNEL(_index) {		\
+	LPC32XX_ADC_CHANNEL_BASE(_index)	\
+}
+
+#define LPC32XX_ADC_SCALE_CHANNEL(_index) {			\
+	LPC32XX_ADC_CHANNEL_BASE(_index)			\
+	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE)	\
 }
 
 static const struct iio_chan_spec lpc32xx_adc_iio_channels[] = {
@@ -101,6 +119,12 @@ static const struct iio_chan_spec lpc32xx_adc_iio_channels[] = {
 	LPC32XX_ADC_CHANNEL(2),
 };
 
+static const struct iio_chan_spec lpc32xx_adc_iio_scale_channels[] = {
+	LPC32XX_ADC_SCALE_CHANNEL(0),
+	LPC32XX_ADC_SCALE_CHANNEL(1),
+	LPC32XX_ADC_SCALE_CHANNEL(2),
+};
+
 static irqreturn_t lpc32xx_adc_isr(int irq, void *dev_id)
 {
 	struct lpc32xx_adc_state *st = dev_id;
@@ -159,6 +183,15 @@ static int lpc32xx_adc_probe(struct platform_device *pdev)
 		return retval;
 	}
 
+	st->vref = devm_regulator_get(&pdev->dev, "vref");
+	if (IS_ERR(st->vref)) {
+		iodev->channels = lpc32xx_adc_iio_channels;
+		dev_err(&pdev->dev,
+			"Missing vref regulator: No scaling available\n");
+	} else {
+		iodev->channels = lpc32xx_adc_iio_scale_channels;
+	}
+
 	platform_set_drvdata(pdev, iodev);
 
 	init_completion(&st->completion);
@@ -167,7 +200,6 @@ static int lpc32xx_adc_probe(struct platform_device *pdev)
 	iodev->dev.parent = &pdev->dev;
 	iodev->info = &lpc32xx_adc_iio_info;
 	iodev->modes = INDIO_DIRECT_MODE;
-	iodev->channels = lpc32xx_adc_iio_channels;
 	iodev->num_channels = ARRAY_SIZE(lpc32xx_adc_iio_channels);
 
 	retval = devm_iio_device_register(&pdev->dev, iodev);
-- 
2.20.1
