From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 5/5] iio:adc:lpc32xx Add scale feature
Date: Fri,  8 Feb 2019 17:09:44 +0100
Message-ID: <20190208160944.13281-6-gregory.clement@bootlin.com>
References: <20190208160944.13281-1-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190208160944.13281-1-gregory.clement@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc: devicetree@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

Until now this driver only exposed the raw value of the channels. With
this patch, the scale value is also exposed.

It depends of a regulator supply, and unlike most of the other driver, do
not having this regulator won't prevent to use the driver. The reason for
it is to allow to continue to use this driver with an old device tree. If
there is no regulator supply then the scale won't be exposed.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 drivers/iio/adc/lpc32xx_adc.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/lpc32xx_adc.c b/drivers/iio/adc/lpc32xx_adc.c
index f391c1e10136..e36ca307f065 100644
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
@@ -77,6 +81,12 @@ static int lpc32xx_read_raw(struct iio_dev *indio_dev,
 		mutex_unlock(&indio_dev->mlock);
 
 		return IIO_VAL_INT;
+
+	case IIO_CHAN_INFO_SCALE:
+		*val = regulator_get_voltage(st->vref) / 1000;
+		*val2 =  chan->scan_type.realbits;
+
+		return IIO_VAL_FRACTIONAL_LOG2;
 	}
 
 	return -EINVAL;
@@ -93,9 +103,10 @@ static const struct iio_info lpc32xx_adc_iio_info = {
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),	\
 	.address = LPC32XXAD_IN * _index,		\
 	.scan_index = _index,				\
+	.scan_type.realbits = 10			\
 }
 
-static const struct iio_chan_spec lpc32xx_adc_iio_channels[] = {
+static struct iio_chan_spec lpc32xx_adc_iio_channels[] = {
 	LPC32XX_ADC_CHANNEL(0),
 	LPC32XX_ADC_CHANNEL(1),
 	LPC32XX_ADC_CHANNEL(2),
@@ -119,7 +130,7 @@ static int lpc32xx_adc_probe(struct platform_device *pdev)
 	struct resource *res;
 	int retval = -ENODEV;
 	struct iio_dev *iodev = NULL;
-	int irq;
+	int irq, i;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
@@ -159,6 +170,15 @@ static int lpc32xx_adc_probe(struct platform_device *pdev)
 		return retval;
 	}
 
+	st->vref = devm_regulator_get(&pdev->dev, "vref");
+	if (IS_ERR(st->vref))
+		dev_err(&pdev->dev,
+			"Missing vref regulator: No scaling available\n");
+	else
+		for (i = 0; i <  ARRAY_SIZE(lpc32xx_adc_iio_channels); i++)
+			lpc32xx_adc_iio_channels[i].info_mask_shared_by_type =
+				BIT(IIO_CHAN_INFO_SCALE);
+
 	platform_set_drvdata(pdev, iodev);
 
 	init_completion(&st->completion);
@@ -175,7 +195,6 @@ static int lpc32xx_adc_probe(struct platform_device *pdev)
 		return retval;
 
 	dev_info(&pdev->dev, "LPC32XX ADC driver loaded, IRQ %d\n", irq);
-
 	return 0;
 }
 
-- 
2.20.1
