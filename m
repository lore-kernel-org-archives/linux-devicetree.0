From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 2/2] iio: adc: Add driver for the TI ADS8344 A/DC chips
Date: Fri, 15 Mar 2019 16:11:51 +0100
Message-ID: <20190315151152.30467-3-gregory.clement@bootlin.com>
References: <20190315151152.30467-1-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190315151152.30467-1-gregory.clement@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This adds support for the Texas Instruments ADS8344 ADC chip. This chip
has a 16-bit 8-Channel ADC and is access directly through SPI.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 drivers/iio/adc/Kconfig      |  10 ++
 drivers/iio/adc/Makefile     |   1 +
 drivers/iio/adc/ti-ads8344.c | 216 +++++++++++++++++++++++++++++++++++
 3 files changed, 227 insertions(+)
 create mode 100644 drivers/iio/adc/ti-ads8344.c

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 76db6e5cc296..447d3a871746 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -967,6 +967,16 @@ config TI_ADS7950
 	  To compile this driver as a module, choose M here: the
 	  module will be called ti-ads7950.
 
+config TI_ADS8344
+	tristate "Texas Instruments ADS8344"
+	depends on SPI && OF
+	help
+	  If you say yes here you get support for Texas Instruments ADS8344
+	  ADC chips
+
+	  This driver can also be built as a module. If so, the module will be
+	  called ti-ads8344.
+
 config TI_ADS8688
 	tristate "Texas Instruments ADS8688"
 	depends on SPI && OF
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index 6fcebd167524..1f3ae934111d 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -87,6 +87,7 @@ obj-$(CONFIG_TI_ADC128S052) += ti-adc128s052.o
 obj-$(CONFIG_TI_ADC161S626) += ti-adc161s626.o
 obj-$(CONFIG_TI_ADS1015) += ti-ads1015.o
 obj-$(CONFIG_TI_ADS7950) += ti-ads7950.o
+obj-$(CONFIG_TI_ADS8344) += ti-ads8344.o
 obj-$(CONFIG_TI_ADS8688) += ti-ads8688.o
 obj-$(CONFIG_TI_ADS124S08) += ti-ads124s08.o
 obj-$(CONFIG_TI_AM335X_ADC) += ti_am335x_adc.o
diff --git a/drivers/iio/adc/ti-ads8344.c b/drivers/iio/adc/ti-ads8344.c
new file mode 100644
index 000000000000..6159d8518871
--- /dev/null
+++ b/drivers/iio/adc/ti-ads8344.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * ADS8344 16-bit 8-Channel ADC driver
+ *
+ * Author: Gregory CLEMENT <gregory.clement@bootlin.com>
+ *
+ * Datasheet: http://www.ti.com/lit/ds/symlink/ads8344.pdf
+ */
+
+#include <linux/delay.h>
+#include <linux/iio/buffer.h>
+#include <linux/iio/iio.h>
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
+#include <linux/spi/spi.h>
+
+struct ads8344 {
+	struct spi_device *spi;
+	struct regulator *reg;
+	struct mutex lock;
+
+	u8 tx_buf ____cacheline_aligned;
+	u16 rx_buf;
+};
+
+#define ADS8344_VOLTAGE_CHANNEL(chan, si)				\
+	{								\
+		.type = IIO_VOLTAGE,					\
+		.indexed = 1,						\
+		.channel = chan,					\
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
+		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
+		.scan_index = si,					\
+		.scan_type = {						\
+			.sign = 'u',					\
+			.realbits = 16,					\
+			.storagebits = 16,				\
+		},							\
+	}
+
+#define ADS8344_VOLTAGE_CHANNEL_DIFF(chan1, chan2, si)			\
+	{								\
+		.type = IIO_VOLTAGE,					\
+		.indexed = 1,						\
+		.channel = (chan1),					\
+		.channel2 = (chan2),					\
+		.differential = 1,					\
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
+		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
+		.scan_index = si,					\
+		.scan_type = {						\
+			.sign = 'u',					\
+			.realbits = 16,					\
+			.storagebits = 16,				\
+		},							\
+	}
+
+static const struct iio_chan_spec ads8344_channels[] = {
+	ADS8344_VOLTAGE_CHANNEL(0, 0),
+	ADS8344_VOLTAGE_CHANNEL(1, 4),
+	ADS8344_VOLTAGE_CHANNEL(2, 1),
+	ADS8344_VOLTAGE_CHANNEL(3, 5),
+	ADS8344_VOLTAGE_CHANNEL(4, 2),
+	ADS8344_VOLTAGE_CHANNEL(5, 6),
+	ADS8344_VOLTAGE_CHANNEL(6, 3),
+	ADS8344_VOLTAGE_CHANNEL(7, 7),
+	ADS8344_VOLTAGE_CHANNEL_DIFF(0, 1, 8),
+	ADS8344_VOLTAGE_CHANNEL_DIFF(2, 3, 9),
+	ADS8344_VOLTAGE_CHANNEL_DIFF(4, 5, 10),
+	ADS8344_VOLTAGE_CHANNEL_DIFF(6, 7, 11),
+	ADS8344_VOLTAGE_CHANNEL_DIFF(1, 0, 12),
+	ADS8344_VOLTAGE_CHANNEL_DIFF(3, 2, 13),
+	ADS8344_VOLTAGE_CHANNEL_DIFF(5, 4, 14),
+	ADS8344_VOLTAGE_CHANNEL_DIFF(7, 6, 15),
+};
+
+static int ads8344_adc_conversion(struct ads8344 *adc, int channel,
+				  bool differential)
+{
+	struct spi_device *spi = adc->spi;
+	int ret;
+
+	/* start bit */
+	adc->tx_buf = BIT(7);
+	/* single-ended or differential */
+	adc->tx_buf |= differential ? 0 : BIT(2);
+	/* select channel(s) */
+	adc->tx_buf |= channel << 4;
+	/* internal clock mode */
+	adc->tx_buf |= 0x2;
+
+	ret = spi_write(spi, &adc->tx_buf, 1);
+	if (ret)
+		return ret;
+
+	udelay(9);
+
+	ret = spi_read(spi, &adc->rx_buf, 2);
+	if (ret)
+		return ret;
+
+	return adc->rx_buf;
+}
+
+static int ads8344_read_raw(struct iio_dev *iio,
+			    struct iio_chan_spec const *channel, int *value,
+			    int *shift, long mask)
+{
+	struct ads8344 *adc = iio_priv(iio);
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		mutex_lock(&adc->lock);
+		*value = ads8344_adc_conversion(adc, channel->scan_index,
+						channel->differential);
+		mutex_unlock(&adc->lock);
+		if (*value < 0)
+			return *value;
+
+		return IIO_VAL_INT;
+	case IIO_CHAN_INFO_SCALE:
+		*value = regulator_get_voltage(adc->reg);
+		if (*value < 0)
+			return *value;
+
+		/* convert regulator output voltage to mV */
+		*value /= 1000;
+		*shift = 16;
+
+		return IIO_VAL_FRACTIONAL_LOG2;
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct iio_info ads8344_info = {
+	.read_raw = ads8344_read_raw,
+};
+
+static int ads8344_probe(struct spi_device *spi)
+{
+	struct iio_dev *indio_dev;
+	struct ads8344 *adc;
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*adc));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	adc = iio_priv(indio_dev);
+	adc->spi = spi;
+	mutex_init(&adc->lock);
+
+	indio_dev->name = dev_name(&spi->dev);
+	indio_dev->dev.parent = &spi->dev;
+	indio_dev->dev.of_node = spi->dev.of_node;
+	indio_dev->info = &ads8344_info;
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->channels = ads8344_channels;
+	indio_dev->num_channels = ARRAY_SIZE(ads8344_channels);
+
+	adc->reg = devm_regulator_get(&spi->dev, "vref");
+	if (IS_ERR(adc->reg))
+		return PTR_ERR(adc->reg);
+
+	ret = regulator_enable(adc->reg);
+	if (ret)
+		return ret;
+
+	spi_set_drvdata(spi, indio_dev);
+
+	ret = iio_device_register(indio_dev);
+	if (ret)
+		goto err_buffer_cleanup;
+
+	return 0;
+err_buffer_cleanup:
+	regulator_disable(adc->reg);
+
+	return ret;
+}
+
+static int ads8344_remove(struct spi_device *spi)
+{
+	struct iio_dev *indio_dev = spi_get_drvdata(spi);
+	struct ads8344 *adc = iio_priv(indio_dev);
+
+	iio_device_unregister(indio_dev);
+	regulator_disable(adc->reg);
+
+	return 0;
+}
+
+#ifdef CONFIG_OF
+
+static const struct of_device_id ads8344_dt_ids[] = {
+	{ .compatible = "ti,ads8344", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, ads8344_dt_ids);
+
+#endif
+
+static struct spi_driver ads8344_driver = {
+	.driver = {
+		.name = "ads8344",
+		.of_match_table = of_match_ptr(ads8344_dt_ids),
+	},
+	.probe = ads8344_probe,
+	.remove = ads8344_remove,
+};
+module_spi_driver(ads8344_driver);
+
+MODULE_AUTHOR("Gregory CLEMENT <gregory.clement@bootlin.com>");
+MODULE_DESCRIPTION("ADS8344 driver");
+MODULE_LICENSE("GPL v2");
-- 
2.20.1
