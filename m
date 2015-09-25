From: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Subject: [PATCHv2 1/2] iio: adc: Add TI ADS868X
Date: Fri, 25 Sep 2015 08:29:39 +0200
Message-ID: <1443162580-28293-1-git-send-email-sean.nyekjaer@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds support for the Texas Intruments ADS868x ADC.

Signed-off-by: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Reviewed-by: Martin Hundeb=C3=B8ll <martin.hundeboll-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
---
Changes since v1:
- Now possible to read and write the actual offset and scale values
- Removed unused includes
- Removed unused buffer references

 drivers/iio/adc/Kconfig      |  10 +
 drivers/iio/adc/Makefile     |   1 +
 drivers/iio/adc/ti-ads868x.c | 456 +++++++++++++++++++++++++++++++++++=
++++++++
 3 files changed, 467 insertions(+)
 create mode 100644 drivers/iio/adc/ti-ads868x.c

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index deea62c..39924d5 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -322,6 +322,16 @@ config TI_ADC128S052
 	  This driver can also be built as a module. If so, the module will b=
e
 	  called ti-adc128s052.
=20
+config TI_ADS868X
+	tristate "Texas Instruments ADS8684/8"
+	depends on SPI && OF
+	help
+	  If you say yes here you get support for Texas Instruments ADS8684 a=
nd
+	  and ADS8688 ADC chips
+
+	  This driver can also be built as a module. If so, the module will b=
e
+	  called ti-ads868x.
+
 config TI_AM335X_ADC
 	tristate "TI's AM335X ADC driver"
 	depends on MFD_TI_AM335X_TSCADC
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index fa5723a..75170d2 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_QCOM_SPMI_VADC) +=3D qcom-spmi-vadc.o
 obj-$(CONFIG_ROCKCHIP_SARADC) +=3D rockchip_saradc.o
 obj-$(CONFIG_TI_ADC081C) +=3D ti-adc081c.o
 obj-$(CONFIG_TI_ADC128S052) +=3D ti-adc128s052.o
+obj-$(CONFIG_TI_ADS868X) +=3D ti-ads868x.o
 obj-$(CONFIG_TI_AM335X_ADC) +=3D ti_am335x_adc.o
 obj-$(CONFIG_TWL4030_MADC) +=3D twl4030-madc.o
 obj-$(CONFIG_TWL6030_GPADC) +=3D twl6030-gpadc.o
diff --git a/drivers/iio/adc/ti-ads868x.c b/drivers/iio/adc/ti-ads868x.=
c
new file mode 100644
index 0000000..66d9b64
--- /dev/null
+++ b/drivers/iio/adc/ti-ads868x.c
@@ -0,0 +1,456 @@
+/*
+ * Copyright (C) 2015 Prevas A/S
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+#include <linux/spi/spi.h>
+#include <linux/regulator/consumer.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/of.h>
+
+#include <linux/iio/iio.h>
+#include <linux/iio/sysfs.h>
+
+#define ADS868X_CMD_REG(x)		(x << 8)
+#define ADS868X_CMD_REG_NOOP		0x00
+#define ADS868X_CMD_REG_RST		0x85
+#define ADS868X_CMD_REG_MAN_CH(chan)	(0xC0 | (4 * chan))
+#define ADS868X_CMD_DONT_CARE_BITS	16
+
+#define ADS868X_PROG_REG(x)		(x << 9)
+#define ADS868X_PROG_REG_RANGE_CH(chan)	(0x05 + chan)
+#define ADS868X_PROG_WR_BIT		BIT(8)
+#define ADS868X_PROG_DONT_CARE_BITS	8
+
+#define ADS868X_VREF_MV			4096
+#define ADS868X_REALBITS		16
+
+struct ads868x_chip_info {
+	unsigned int id;
+	const struct iio_chan_spec *channels;
+	unsigned int num_channels;
+	unsigned int flags;
+	const struct iio_info *iio_info;
+};
+
+struct ads868x_state {
+	const struct ads868x_chip_info	*chip_info;
+	struct spi_device		*spi;
+	struct regulator		*reg;
+	unsigned int			vref_mv;
+	char				range[8];
+	union {
+		__be32 d32;
+		u8 d8[4];
+	} data[2] ____cacheline_aligned;
+};
+
+enum ads868x_id {
+	ID_ADS8684,
+	ID_ADS8688,
+};
+
+enum ads868x_range {
+	ADS868X_PLUSMINUS25VREF		=3D 0x00,
+	ADS868X_PLUSMINUS125VREF	=3D 0x01,
+	ADS868X_PLUSMINUS0625VREF	=3D 0x02,
+	ADS868X_PLUS25VREF		=3D 0x05,
+	ADS868X_PLUS125VREF		=3D 0x06,
+};
+
+struct ads868x_ranges {
+	enum ads868x_range range;
+	unsigned int scale;
+	int offset;
+};
+
+static struct ads868x_ranges ads868x_range_def[5] =3D {
+	{
+		.range =3D ADS868X_PLUSMINUS25VREF,
+		.scale =3D 76295,
+		.offset =3D -(1 << (ADS868X_REALBITS - 1)),
+	}, {
+		.range =3D ADS868X_PLUSMINUS125VREF,
+		.scale =3D 38148,
+		.offset =3D -(1 << (ADS868X_REALBITS - 1)),
+	}, {
+		.range =3D ADS868X_PLUSMINUS0625VREF,
+		.scale =3D 19074,
+		.offset =3D -(1 << (ADS868X_REALBITS - 1)),
+	}, {
+		.range =3D ADS868X_PLUS25VREF,
+		.scale =3D 38148,
+		.offset =3D 0,
+	}, {
+		.range =3D ADS868X_PLUS125VREF,
+		.scale =3D 19074,
+		.offset =3D 0,
+	}
+};
+
+static ssize_t ads868x_show_scales(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct ads868x_state *st =3D iio_priv(dev_to_iio_dev(dev));
+
+	return sprintf(buf, "0.%09u 0.%09u 0.%09u\n",
+		       ads868x_range_def[0].scale * st->vref_mv,
+		       ads868x_range_def[1].scale * st->vref_mv,
+		       ads868x_range_def[2].scale * st->vref_mv);
+}
+
+static ssize_t ads868x_show_offsets(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%d %d\n", ads868x_range_def[0].offset,
+		       ads868x_range_def[3].offset);
+}
+
+static IIO_DEVICE_ATTR(in_voltage_scale_available, S_IRUGO,
+		       ads868x_show_scales, NULL, 0);
+static IIO_DEVICE_ATTR(in_voltage_offset_available, S_IRUGO,
+		       ads868x_show_offsets, NULL, 0);
+
+static struct attribute *ads868x_attributes[] =3D {
+	&iio_dev_attr_in_voltage_scale_available.dev_attr.attr,
+	&iio_dev_attr_in_voltage_offset_available.dev_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group ads868x_attribute_group =3D {
+	.attrs =3D ads868x_attributes,
+};
+
+#define ADS868X_CHAN(index)					\
+{								\
+	.type =3D IIO_VOLTAGE,					\
+	.indexed =3D 1,						\
+	.channel =3D index,					\
+	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW)		\
+			      | BIT(IIO_CHAN_INFO_SCALE)	\
+			      | BIT(IIO_CHAN_INFO_OFFSET),	\
+}
+
+static const struct iio_chan_spec ads8684_channels[] =3D {
+	ADS868X_CHAN(0),
+	ADS868X_CHAN(1),
+	ADS868X_CHAN(2),
+	ADS868X_CHAN(3),
+};
+
+static const struct iio_chan_spec ads8688_channels[] =3D {
+	ADS868X_CHAN(0),
+	ADS868X_CHAN(1),
+	ADS868X_CHAN(2),
+	ADS868X_CHAN(3),
+	ADS868X_CHAN(4),
+	ADS868X_CHAN(5),
+	ADS868X_CHAN(6),
+	ADS868X_CHAN(7),
+};
+
+static int ads868x_prog_write(struct iio_dev *indio_dev, unsigned int =
addr,
+			      unsigned int val)
+{
+	struct ads868x_state *st =3D iio_priv(indio_dev);
+	unsigned int tmp;
+
+	tmp =3D ADS868X_PROG_REG(addr) | ADS868X_PROG_WR_BIT | val;
+	tmp <<=3D ADS868X_PROG_DONT_CARE_BITS;
+	st->data[0].d32 =3D cpu_to_be32(tmp);
+
+	return spi_write(st->spi, &st->data[0].d8[1], 3);
+}
+
+static int ads868x_reset(struct iio_dev *indio_dev)
+{
+	struct ads868x_state *st =3D iio_priv(indio_dev);
+	unsigned int tmp;
+
+	tmp =3D ADS868X_CMD_REG(ADS868X_CMD_REG_RST);
+	tmp <<=3D ADS868X_CMD_DONT_CARE_BITS;
+	st->data[0].d32 =3D cpu_to_be32(tmp);
+
+	return spi_write(st->spi, &st->data[0].d8[0], 4);
+}
+
+static int ads868x_read(struct iio_dev *indio_dev, unsigned int chan)
+{
+	struct ads868x_state *st =3D iio_priv(indio_dev);
+	int ret;
+	unsigned int tmp;
+	struct spi_transfer t[] =3D {
+		{
+			.tx_buf =3D &st->data[0].d8[0],
+			.len =3D 4,
+			.cs_change =3D 1,
+		}, {
+			.tx_buf =3D &st->data[1].d8[0],
+			.rx_buf =3D &st->data[1].d8[0],
+			.len =3D 4,
+		},
+	};
+
+	tmp =3D ADS868X_CMD_REG(ADS868X_CMD_REG_MAN_CH(chan));
+	tmp <<=3D ADS868X_CMD_DONT_CARE_BITS;
+	st->data[0].d32 =3D cpu_to_be32(tmp);
+
+	tmp =3D ADS868X_CMD_REG(ADS868X_CMD_REG_NOOP);
+	tmp <<=3D ADS868X_CMD_DONT_CARE_BITS;
+	st->data[1].d32 =3D cpu_to_be32(tmp);
+
+	ret =3D spi_sync_transfer(st->spi, t, ARRAY_SIZE(t));
+	if (ret < 0)
+		return ret;
+
+	return be32_to_cpu(st->data[1].d32) & 0xffff;
+}
+
+static int ads868x_read_raw(struct iio_dev *indio_dev,
+			    struct iio_chan_spec const *chan,
+			    int *val, int *val2, long m)
+{
+	int ret, offset, i;
+	unsigned long scale_mv;
+
+	struct ads868x_state *st =3D iio_priv(indio_dev);
+
+	switch (m) {
+	case IIO_CHAN_INFO_RAW:
+		mutex_lock(&indio_dev->mlock);
+		ret =3D ads868x_read(indio_dev, chan->channel);
+		mutex_unlock(&indio_dev->mlock);
+		if (ret < 0)
+			return ret;
+		*val =3D ret;
+		return IIO_VAL_INT;
+	case IIO_CHAN_INFO_SCALE:
+		scale_mv =3D st->vref_mv;
+		for (i =3D 0; i < ARRAY_SIZE(ads868x_range_def); i++) {
+			if (st->range[chan->channel] =3D=3D ads868x_range_def[i].range)
+				scale_mv *=3D ads868x_range_def[i].scale;
+		}
+		*val =3D 0;
+		*val2 =3D scale_mv;
+		return IIO_VAL_INT_PLUS_NANO;
+	case IIO_CHAN_INFO_OFFSET:
+		for (i =3D 0; i < ARRAY_SIZE(ads868x_range_def); i++) {
+			if (st->range[chan->channel] =3D=3D ads868x_range_def[i].range)
+				offset =3D ads868x_range_def[i].offset;
+		}
+		*val =3D offset;
+		return IIO_VAL_INT;
+	}
+
+	return -EINVAL;
+}
+
+static int ads868x_write_reg_range(struct iio_dev *indio_dev,
+				   struct iio_chan_spec const *chan,
+				   enum ads868x_range range)
+{
+	unsigned int tmp;
+	int ret;
+
+	tmp =3D ADS868X_PROG_REG_RANGE_CH(chan->channel);
+	mutex_lock(&indio_dev->mlock);
+	ret =3D ads868x_prog_write(indio_dev, tmp, range);
+	mutex_unlock(&indio_dev->mlock);
+
+	return ret;
+}
+
+static int ads868x_write_raw(struct iio_dev *indio_dev,
+			     struct iio_chan_spec const *chan,
+			     int val, int val2, long mask)
+{
+	struct ads868x_state *st =3D iio_priv(indio_dev);
+	unsigned int scale =3D 0;
+	int ret =3D -EINVAL, i, offset =3D 0;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_SCALE:
+		for (i =3D 0; i < ARRAY_SIZE(ads868x_range_def); i++)
+			if (st->range[chan->channel] =3D=3D
+			    ads868x_range_def[i].range) {
+				offset =3D ads868x_range_def[i].offset;
+				if (offset =3D=3D 0 &&
+				    val2 =3D=3D ads868x_range_def[0].scale *
+				    st->vref_mv / 1000)
+					return ret;
+				break;
+			}
+		for (i =3D 0; i < ARRAY_SIZE(ads868x_range_def); i++)
+			if (val2 =3D=3D
+			    ads868x_range_def[i].scale * st->vref_mv / 1000 &&
+			    offset =3D=3D ads868x_range_def[i].offset) {
+				ret =3D ads868x_write_reg_range(indio_dev, chan,
+					ads868x_range_def[i].range);
+			}
+		break;
+	case IIO_CHAN_INFO_OFFSET:
+		if (!(ads868x_range_def[0].offset =3D=3D val ||
+		    ads868x_range_def[3].offset =3D=3D val))
+			return ret;
+		if (0 =3D=3D val &&
+		    st->range[chan->channel] =3D=3D ADS868X_PLUSMINUS25VREF)
+			return ret;
+		for (i =3D 0; i < ARRAY_SIZE(ads868x_range_def); i++)
+			if (st->range[chan->channel] =3D=3D
+			    ads868x_range_def[i].range)
+				scale =3D ads868x_range_def[i].scale;
+		for (i =3D 0; i < ARRAY_SIZE(ads868x_range_def); i++)
+			if (val =3D=3D ads868x_range_def[i].offset &&
+			    scale =3D=3D ads868x_range_def[i].scale) {
+				ret =3D ads868x_write_reg_range(indio_dev, chan,
+					ads868x_range_def[i].range);
+			}
+		break;
+	default:
+		ret =3D -EINVAL;
+	}
+
+	if (!ret)
+		st->range[chan->channel] =3D ads868x_range_def[i].range;
+
+	return ret;
+}
+
+static const struct iio_info ads868x_info =3D {
+	.read_raw =3D &ads868x_read_raw,
+	.write_raw =3D &ads868x_write_raw,
+	.attrs =3D &ads868x_attribute_group,
+	.driver_module =3D THIS_MODULE,
+};
+
+static const struct ads868x_chip_info ads868x_chip_info_tbl[] =3D {
+	[ID_ADS8684] =3D {
+		.channels =3D ads8684_channels,
+		.num_channels =3D ARRAY_SIZE(ads8684_channels),
+		.iio_info =3D &ads868x_info,
+	},
+	[ID_ADS8688] =3D {
+		.channels =3D ads8688_channels,
+		.num_channels =3D ARRAY_SIZE(ads8688_channels),
+		.iio_info =3D &ads868x_info,
+	},
+};
+
+static int ads868x_probe(struct spi_device *spi)
+{
+	struct ads868x_state *st;
+	struct iio_dev *indio_dev;
+	bool ext_ref;
+	int ret;
+
+	indio_dev =3D devm_iio_device_alloc(&spi->dev, sizeof(*st));
+	if (indio_dev =3D=3D NULL)
+		return -ENOMEM;
+
+	st =3D iio_priv(indio_dev);
+
+	if (spi->dev.of_node)
+		ext_ref =3D of_property_read_bool(spi->dev.of_node,
+						"vref-supply");
+	else
+		ext_ref =3D false;
+
+	if (ext_ref) {
+		st->reg =3D devm_regulator_get(&spi->dev, "vref");
+		if (!IS_ERR(st->reg)) {
+			ret =3D regulator_enable(st->reg);
+			if (ret)
+				return ret;
+
+			ret =3D regulator_get_voltage(st->reg);
+			if (ret < 0)
+				goto error_out;
+		st->vref_mv =3D ret / 1000;
+		}
+	} else {
+		/* Use internal reference */
+		st->vref_mv =3D ADS868X_VREF_MV;
+	}
+
+	st->chip_info =3D	&ads868x_chip_info_tbl[spi_get_device_id(spi)->driv=
er_data];
+
+	spi->mode =3D SPI_MODE_1;
+
+	spi_set_drvdata(spi, indio_dev);
+
+	st->spi =3D spi;
+
+	indio_dev->name =3D spi_get_device_id(spi)->name;
+	indio_dev->dev.parent =3D &spi->dev;
+	indio_dev->modes =3D INDIO_DIRECT_MODE;
+	indio_dev->channels =3D st->chip_info->channels;
+	indio_dev->num_channels =3D st->chip_info->num_channels;
+	indio_dev->info =3D st->chip_info->iio_info;
+
+	/* Reset ADS868x */
+	mutex_lock(&indio_dev->mlock);
+	ads868x_reset(indio_dev);
+	mutex_unlock(&indio_dev->mlock);
+
+	ret =3D iio_device_register(indio_dev);
+	if (ret)
+		goto error_out;
+
+	return 0;
+
+error_out:
+	if (!IS_ERR_OR_NULL(st->reg))
+		regulator_disable(st->reg);
+
+	return ret;
+}
+
+static int ads868x_remove(struct spi_device *spi)
+{
+	struct iio_dev *indio_dev =3D spi_get_drvdata(spi);
+	struct ads868x_state *st =3D iio_priv(indio_dev);
+
+	iio_device_unregister(indio_dev);
+
+	if (!IS_ERR_OR_NULL(st->reg))
+		regulator_disable(st->reg);
+
+	return 0;
+}
+
+static const struct spi_device_id ads868x_id[] =3D {
+	{"ads8684", ID_ADS8684},
+	{"ads8688", ID_ADS8688},
+	{}
+};
+MODULE_DEVICE_TABLE(spi, ads868x_id);
+
+static const struct of_device_id ads868x_of_match[] =3D {
+	{ .compatible =3D "ti,ads8684" },
+	{ .compatible =3D "ti,ads8688" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ads868x_of_match);
+
+static struct spi_driver ads868x_driver =3D {
+	.driver =3D {
+		.name	=3D "ads868x",
+		.owner	=3D THIS_MODULE,
+	},
+	.probe		=3D ads868x_probe,
+	.remove		=3D ads868x_remove,
+	.id_table	=3D ads868x_id,
+};
+module_spi_driver(ads868x_driver);
+
+MODULE_AUTHOR("Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>");
+MODULE_DESCRIPTION("Texas Instruments ADS868x driver");
+MODULE_LICENSE("GPL v2");
--=20
2.5.3
