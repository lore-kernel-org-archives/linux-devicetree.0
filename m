Return-Path: <SRS0=VjFt=AB=gmail.com=s.abhisit@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170830181409.8903-1-s.abhisit@gmail.com>
References: <20170830181409.8903-1-s.abhisit@gmail.com>
From: Abhisit Sangjan <s.abhisit@gmail.com>
Date: Thu, 31 Aug 2017 13:28:54 +0700
Message-ID: <CAMV_pUZA7EFLpKrts0ik0Puy6aGGNqt40w3BFak7vVM=Y5uDAw@mail.gmail.com>
Subject: Fwd: [PATCH 2/5] lmp92001: mfd: iio: adc: Add support LMP92001
Content-Type: multipart/alternative; boundary="001a1140221e3a8569055806c22e"
To: Lee Jones <lee.jones@linaro.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, jmondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: knaack.h@gmx.de, lars@metafoo.de, fabrice.gasnier@st.com, Rob Herring <robh@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>, marek.vasut+renesas@gmail.com, jacopo+renesas@jmondi.org, mike.looijmans@topic.nl, peda@axentia.se, =?UTF-8?Q?Jean=2DFran=C3=A7ois_Dagenais?= <jeff.dagenais@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, lukas@wunner.de, Adriana Reus <adi.reus@gmail.com>, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--001a1140221e3a8569055806c22e
Content-Type: text/plain; charset="UTF-8"

Send all parts to all cc'd people to save your time tracking down all
patches of this.

---------- Forwarded message ----------
From: <s.abhisit@gmail.com>
Date: Thu, Aug 31, 2017 at 1:14 AM
Subject: [PATCH 2/5] lmp92001: mfd: iio: adc: Add support LMP92001
To: Jonathan.Cameron@huawei.com, pmeerw@pmeerw.net, jacopo@jmondi.org
Cc: knaack.h@gmx.de, lars@metafoo.de, fabrice.gasnier@st.com,
lee.jones@linaro.org, robh@kernel.org, akinobu.mita@gmail.com,
marek.vasut+renesas@gmail.com, jacopo+renesas@jmondi.org,
linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, lukas@wunner.de,
adi.reus@gmail.com, Abhisit Sangjan <s.abhisit@gmail.com>


From: Abhisit Sangjan <s.abhisit@gmail.com>

TI LMP92001 Analog System Monitor and Controller

8-bit GPIOs.
12 DACs with 12-bit resolution.

The GPIOs and DACs are shared port function with Cy function pin to
take control the pin suddenly from external hardware.
DAC's referance voltage selectable for Internal/External.

16 + 1 ADCs with 12-bit resolution.

Built-in internal Temperature Sensor on channel 17.
Window Comparator Function is supported on channel 1-3 and 9-11 for
monitoring with interrupt signal (pending to implement for interrupt).
ADC's referance voltage selectable for Internal/External.

Signed-off-by: Abhisit Sangjan <s.abhisit@gmail.com>
---
 drivers/iio/adc/Kconfig        |  10 +
 drivers/iio/adc/Makefile       |   1 +
 drivers/iio/adc/lmp92001-adc.c | 476 ++++++++++++++++++++++++++++++
+++++++++++
 3 files changed, 487 insertions(+)
 create mode 100644 drivers/iio/adc/lmp92001-adc.c

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 614fa41559b1..2adeba543ac7 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -331,6 +331,16 @@ config IMX7D_ADC
          This driver can also be built as a module. If so, the module will
be
          called imx7d_adc.

+config LMP92001_ADC
+       tristate "TI LMP92001 ADC Driver"
+       depends on MFD_LMP92001
+       help
+         If you say yes here you get support for TI LMP92001 ADCs
+         conversion.
+
+         This driver can also be built as a module. If so, the module will
+         be called lmp92001_adc.
+
 config LP8788_ADC
        tristate "LP8788 ADC driver"
        depends on MFD_LP8788
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index b546736a5541..2ed89862090b 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_HI8435) += hi8435.o
 obj-$(CONFIG_HX711) += hx711.o
 obj-$(CONFIG_IMX7D_ADC) += imx7d_adc.o
 obj-$(CONFIG_INA2XX_ADC) += ina2xx-adc.o
+obj-$(CONFIG_LMP92001_ADC) += lmp92001-adc.o
 obj-$(CONFIG_LP8788_ADC) += lp8788_adc.o
 obj-$(CONFIG_LPC18XX_ADC) += lpc18xx_adc.o
 obj-$(CONFIG_LPC32XX_ADC) += lpc32xx_adc.o
diff --git a/drivers/iio/adc/lmp92001-adc.c b/drivers/iio/adc/lmp92001-adc.c
new file mode 100644
index 000000000000..f706a364337d
--- /dev/null
+++ b/drivers/iio/adc/lmp92001-adc.c
@@ -0,0 +1,476 @@
+/*
+ * lmp92001-adc.c - Support for TI LMP92001 ADCs
+ *
+ * Copyright 2016-2017 Celestica Ltd.
+ *
+ * Author: Abhisit Sangjan <s.abhisit@gmail.com>
+ *
+ * Inspired by wm831x and ad5064 drivers.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/iio/iio.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include <linux/mfd/lmp92001/core.h>
+
+static int lmp92001_read_raw(struct iio_dev *indio_dev,
+       struct iio_chan_spec const *channel, int *val, int *val2, long mask)
+{
+       struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
+       unsigned int code, cgen, sgen, try;
+       int ret;
+
+       mutex_lock(&lmp92001->adc_lock);
+
+       ret = regmap_read(lmp92001->regmap, LMP92001_CGEN, &cgen);
+       if (ret < 0)
+               goto exit;
+
+       /*
+        * Is not continuous conversion?
+        * Lock the HW registers (if needed).
+        * Triggering single-short conversion.
+        * Waiting for conversion successful.
+        */
+       if (!(cgen & CGEN_STRT)) {
+               if (!(cgen & CGEN_LCK)) {
+                       ret = regmap_update_bits(lmp92001->regmap,
+                                       LMP92001_CGEN, CGEN_LCK, CGEN_LCK);
+                       if (ret < 0)
+                               goto exit;
+               }
+
+               /* Writing any value to trigger Single-Shot conversion. */
+               ret = regmap_write(lmp92001->regmap, LMP92001_CTRIG, 1);
+               if (ret < 0)
+                       goto exit;
+
+               /* In case of conversion is in-progress, repeat for 10
times. */
+               try = 10;
+               do {
+                       ret = regmap_read(lmp92001->regmap,
+                                               LMP92001_SGEN, &sgen);
+                       if (ret < 0)
+                               goto exit;
+               } while ((sgen & CGEN_RST) && (--try > 0));
+
+               if (!try) {
+                       ret = -ETIME;
+                       goto exit;
+               }
+       }
+
+       ret = regmap_read(lmp92001->regmap, 0x1F + channel->channel, &code);
+       if (ret < 0)
+               goto exit;
+
+       switch (mask) {
+       case IIO_CHAN_INFO_RAW:
+               switch (channel->type) {
+               case IIO_VOLTAGE:
+               case IIO_TEMP:
+                       *val = code;
+                       ret = IIO_VAL_INT;
+                       goto exit;
+               default:
+                       break;
+               }
+               break;
+       default:
+               break;
+       }
+
+       /* In case of no match channel info/type is return here. */
+       ret = -EINVAL;
+
+exit:
+       mutex_unlock(&lmp92001->adc_lock);
+
+       return ret;
+}
+
+static const struct iio_info lmp92001_info = {
+       .read_raw = lmp92001_read_raw,
+       .driver_module = THIS_MODULE,
+};
+
+static ssize_t lmp92001_avref_read(struct iio_dev *indio_dev,
+       uintptr_t private, struct iio_chan_spec const *channel, char *buf)
+{
+       struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
+       unsigned int cref;
+       int ret;
+
+       ret = regmap_read(lmp92001->regmap, LMP92001_CREF, &cref);
+       if (ret < 0)
+               return ret;
+
+       return sprintf(buf, "%s\n", (cref & CREF_AEXT) ? "external" :
"internal");
+}
+
+static ssize_t lmp92001_avref_write(struct iio_dev *indio_dev,
+       uintptr_t private, struct iio_chan_spec const *channel,
+       const char *buf, size_t len)
+{
+       struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
+       unsigned int cref;
+       int ret;
+
+       if (strncmp("external", buf, 8) == 0)
+               cref = 2;
+       else if (strncmp("internal", buf, 8) == 0)
+               cref = 0;
+       else
+               return -EINVAL;
+
+       ret = regmap_update_bits(lmp92001->regmap, LMP92001_CREF, CREF_AEXT,
+                                       cref);
+       if (ret < 0)
+               return ret;
+
+       return len;
+}
+
+static ssize_t lmp92001_enable_read(struct iio_dev *indio_dev,
+       uintptr_t private, struct iio_chan_spec const *channel, char *buf)
+{
+       struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
+       unsigned int reg, cad;
+       int ret;
+
+       switch (channel->channel) {
+       case 1 ... 8:
+               reg = LMP92001_CAD1;
+               break;
+       case 9 ... 16:
+               reg = LMP92001_CAD2;
+               break;
+       case 17:
+               reg = LMP92001_CAD3;
+               break;
+       default:
+               return -EINVAL;
+       }
+
+       ret = regmap_read(lmp92001->regmap, reg, &cad);
+       if (ret < 0)
+               return ret;
+
+       if (channel->channel <= 8)
+               cad >>= channel->channel - 1;
+       else if (channel->channel > 8)
+               cad >>= channel->channel - 9;
+       else if (channel->channel > 16)
+               cad >>= channel->channel - 17;
+       else
+               return -EINVAL;
+
+       return sprintf(buf, "%s\n", cad & BIT(0) ? "enable" : "disable");
+}
+
+static ssize_t lmp92001_enable_write(struct iio_dev *indio_dev,
+       uintptr_t private, struct iio_chan_spec const *channel,
+       const char *buf, size_t len)
+{
+       struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
+       unsigned int reg, enable, shif, mask;
+       int ret;
+
+       switch (channel->channel) {
+       case 1 ... 8:
+               reg = LMP92001_CAD1;
+               shif = (channel->channel - 1);
+               break;
+       case 9 ... 16:
+               reg = LMP92001_CAD2;
+               shif = (channel->channel - 9);
+               break;
+       case 17:
+               reg = LMP92001_CAD3;
+               shif = (channel->channel - 17);
+               break;
+       default:
+               return -EINVAL;
+       }
+
+       if (strncmp("enable", buf, 6) == 0)
+               enable = 1;
+       else if (strncmp("disable", buf, 7) == 0)
+               enable = 0;
+       else
+               return -EINVAL;
+
+       enable <<= shif;
+       mask = 1 << shif;
+
+       ret = regmap_update_bits(lmp92001->regmap, reg, mask, enable);
+       if (ret < 0)
+               return ret;
+
+       return len;
+}
+
+static ssize_t lmp92001_mode_read(struct iio_dev *indio_dev,
+       uintptr_t private, struct iio_chan_spec const *channel, char *buf)
+{
+       struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
+       unsigned int cgen;
+       int ret;
+
+       ret = regmap_read(lmp92001->regmap, LMP92001_CGEN, &cgen);
+       if (ret < 0)
+               return ret;
+
+       return sprintf(buf, "%s\n",
+                       cgen & BIT(0) ? "continuous" : "single-shot");
+}
+
+static ssize_t lmp92001_mode_write(struct iio_dev *indio_dev,
+       uintptr_t private, struct iio_chan_spec const *channel,
+       const char *buf, size_t len)
+{
+       struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
+       unsigned int cgen;
+       int ret;
+
+       if (strncmp("continuous", buf, 10) == 0)
+               cgen = 1;
+       else if (strncmp("single-shot", buf, 11) == 0)
+               cgen = 0;
+       else
+               return -EINVAL;
+
+       mutex_lock(&lmp92001->adc_lock);
+
+       /*
+        * Unlock the HW registers.
+        * Set conversion mode.
+        * Lock the HW registers.
+        */
+       ret = regmap_update_bits(lmp92001->regmap, LMP92001_CGEN, CGEN_LCK,
0);
+       if (ret < 0)
+               goto exit;
+
+       ret = regmap_update_bits(lmp92001->regmap, LMP92001_CGEN, CGEN_STRT,
+                                       cgen);
+       if (ret < 0)
+               goto exit;
+
+       ret = regmap_update_bits(lmp92001->regmap, LMP92001_CGEN, CGEN_LCK,
+                                       CGEN_LCK);
+       if (ret < 0)
+               goto exit;
+
+       return len;
+
+exit:
+       mutex_unlock(&lmp92001->adc_lock);
+
+       return ret;
+}
+
+static const struct iio_chan_spec_ext_info lmp92001_ext_info[] = {
+       {
+               .name = "vref",
+               .read = lmp92001_avref_read,
+               .write = lmp92001_avref_write,
+               .shared = IIO_SHARED_BY_ALL,
+       }, {
+               .name = "en",
+               .read = lmp92001_enable_read,
+               .write = lmp92001_enable_write,
+               .shared = IIO_SEPARATE,
+       }, {
+               .name = "mode",
+               .read = lmp92001_mode_read,
+               .write = lmp92001_mode_write,
+               .shared = IIO_SHARED_BY_ALL,
+       }, { },
+};
+
+static const struct iio_event_spec lmp92001_events[] = {
+       {
+               .type = IIO_EV_TYPE_THRESH,
+               .dir = IIO_EV_DIR_RISING,
+               .mask_separate = BIT(IIO_EV_INFO_ENABLE) |
+                       BIT(IIO_EV_INFO_VALUE),
+       }, {
+               .type = IIO_EV_TYPE_THRESH,
+               .dir = IIO_EV_DIR_FALLING,
+               .mask_separate = BIT(IIO_EV_INFO_ENABLE) |
+                       BIT(IIO_EV_INFO_VALUE),
+       }, { },
+};
+
+#define LMP92001_CHAN_SPEC(_ch, _type, _event, _nevent) \
+{ \
+       .channel = _ch, \
+       .type = _type, \
+       .indexed = 1, \
+       .info_mask_separate = BIT(IIO_CHAN_INFO_RAW) | \
+               BIT(IIO_CHAN_INFO_SCALE), \
+       .event_spec = _event, \
+       .num_event_specs = _nevent, \
+       .ext_info = lmp92001_ext_info, \
+}
+
+static const struct iio_chan_spec lmp92001_adc_channels[] = {
+       LMP92001_CHAN_SPEC(1, IIO_VOLTAGE, lmp92001_events,
+                       ARRAY_SIZE(lmp92001_events)),
+       LMP92001_CHAN_SPEC(2, IIO_VOLTAGE, lmp92001_events,
+                       ARRAY_SIZE(lmp92001_events)),
+       LMP92001_CHAN_SPEC(3, IIO_VOLTAGE, lmp92001_events,
+                       ARRAY_SIZE(lmp92001_events)),
+       LMP92001_CHAN_SPEC(4, IIO_VOLTAGE, NULL, 0),
+       LMP92001_CHAN_SPEC(5, IIO_VOLTAGE, NULL, 0),
+       LMP92001_CHAN_SPEC(6, IIO_VOLTAGE, NULL, 0),
+       LMP92001_CHAN_SPEC(7, IIO_VOLTAGE, NULL, 0),
+       LMP92001_CHAN_SPEC(8, IIO_VOLTAGE, NULL, 0),
+       LMP92001_CHAN_SPEC(9, IIO_VOLTAGE, lmp92001_events,
+                       ARRAY_SIZE(lmp92001_events)),
+       LMP92001_CHAN_SPEC(10, IIO_VOLTAGE, lmp92001_events,
+                       ARRAY_SIZE(lmp92001_events)),
+       LMP92001_CHAN_SPEC(11, IIO_VOLTAGE, lmp92001_events,
+                       ARRAY_SIZE(lmp92001_events)),
+       LMP92001_CHAN_SPEC(12, IIO_VOLTAGE, NULL, 0),
+       LMP92001_CHAN_SPEC(13, IIO_VOLTAGE, NULL, 0),
+       LMP92001_CHAN_SPEC(14, IIO_VOLTAGE, NULL, 0),
+       LMP92001_CHAN_SPEC(15, IIO_VOLTAGE, NULL, 0),
+       LMP92001_CHAN_SPEC(16, IIO_VOLTAGE, NULL, 0),
+       LMP92001_CHAN_SPEC(17,    IIO_TEMP, NULL, 0),
+};
+
+static int lmp92001_adc_probe(struct platform_device *pdev)
+{
+       struct lmp92001 *lmp92001 = dev_get_drvdata(pdev->dev.parent);
+       struct iio_dev *indio_dev;
+       struct device_node *np = pdev->dev.of_node;
+       unsigned int cgen = 0, cad1, cad2, cad3;
+       u32 mask;
+       int ret;
+
+       indio_dev = devm_iio_device_alloc(&pdev->dev, 0);
+       if (!indio_dev)
+               return -ENOMEM;
+
+       iio_device_set_drvdata(indio_dev, lmp92001);
+
+       mutex_init(&lmp92001->adc_lock);
+
+       indio_dev->name = pdev->name;
+       indio_dev->dev.parent = &pdev->dev;
+       indio_dev->modes = INDIO_DIRECT_MODE;
+       indio_dev->info = &lmp92001_info;
+       indio_dev->channels = lmp92001_adc_channels;
+       indio_dev->num_channels = ARRAY_SIZE(lmp92001_adc_channels);
+
+       ret = regmap_update_bits(lmp92001->regmap, LMP92001_CGEN,
+                                       CGEN_RST, CGEN_RST);
+       if (ret < 0) {
+               dev_err(&pdev->dev, "failed to self reset all registers\n");
+               return ret;
+       }
+
+       /*
+        * Turn on all of them, if you are pretty sure they are must be
+        * real-time update or specify which channel is needed to be used to
+        * save conversion time for a cycle.
+        */
+       ret = of_property_read_u32(np, "ti,lmp92001-adc-mask", &mask);
+       if (ret < 0) {
+               cad1 = cad2 = cad3 = 0xFF;
+               dev_info(&pdev->dev, "turn on all of channels by
default\n");
+       } else {
+               cad1 = mask & 0xFF;
+               cad2 = (mask >> 8) & 0xFF;
+               cad3 = (mask >> 16) & 0xFF;
+       }
+
+       ret = regmap_update_bits(lmp92001->regmap, LMP92001_CAD1, 0xFF,
cad1);
+       if (ret < 0) {
+               dev_err(&pdev->dev, "failed to enable/disable channels
1-8\n");
+               return ret;
+       }
+
+       ret = regmap_update_bits(lmp92001->regmap, LMP92001_CAD2, 0xFF,
cad2);
+       if (ret < 0) {
+               dev_err(&pdev->dev, "failed to enable/disable channels
9-16\n");
+               return ret;
+       }
+
+       ret = regmap_update_bits(lmp92001->regmap, LMP92001_CAD3, BIT(0),
cad3);
+       if (ret < 0) {
+               dev_err(&pdev->dev,
+                       "failed to enable/disable channel 17
(temperature)\n");
+               return ret;
+       }
+
+       cgen |= 1; /* Continuous conversion is default. */
+
+       /* Lock the HW registers and set conversion mode. */
+       ret = regmap_update_bits(lmp92001->regmap,
+                                       LMP92001_CGEN, CGEN_LCK | CGEN_STRT,
+                                       cgen | CGEN_LCK);
+       if (ret < 0)
+               return ret;
+
+       platform_set_drvdata(pdev, indio_dev);
+
+       return devm_iio_device_register(&pdev->dev, indio_dev);
+}
+
+static int lmp92001_adc_remove(struct platform_device *pdev)
+{
+       struct iio_dev *indio_dev = platform_get_drvdata(pdev);
+       struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
+
+       /*
+        * To stop ADC conversion to save power
+        *
+        * Unlock the HW registers.
+        * Set conversion mode to single-shot.
+        * Lock the HW registers.
+        */
+       regmap_update_bits(lmp92001->regmap, LMP92001_CGEN, CGEN_LCK, 0);
+       regmap_update_bits(lmp92001->regmap, LMP92001_CGEN, CGEN_STRT, 0);
+       regmap_update_bits(lmp92001->regmap, LMP92001_CGEN, CGEN_LCK,
CGEN_LCK);
+
+       return 0;
+}
+
+static struct platform_driver lmp92001_adc_driver = {
+       .driver.name    = "lmp92001-adc",
+       .probe          = lmp92001_adc_probe,
+       .remove         = lmp92001_adc_remove,
+};
+
+static int __init lmp92001_adc_init(void)
+{
+       return platform_driver_register(&lmp92001_adc_driver);
+}
+subsys_initcall(lmp92001_adc_init);
+
+static void __exit lmp92001_adc_exit(void)
+{
+       platform_driver_unregister(&lmp92001_adc_driver);
+}
+module_exit(lmp92001_adc_exit);
+
+MODULE_AUTHOR("Abhisit Sangjan <s.abhisit@gmail.com>");
+MODULE_DESCRIPTION("IIO ADC interface for TI LMP92001");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:lmp92001-adc");
--
2.13.0

--001a1140221e3a8569055806c22e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size:12.8px">Send all parts to all cc&=
#39;d people to save your time=C2=A0</span><span style=3D"font-size:12.8px"=
>tracking down all patches of this.</span><div><span style=3D"font-size:12.=
8px"><br></span><div class=3D"gmail_quote">---------- Forwarded message ---=
-------<br>From: <b class=3D"gmail_sendername"></b> <span dir=3D"ltr">&lt;<=
a href=3D"mailto:s.abhisit@gmail.com">s.abhisit@gmail.com</a>&gt;</span><br=
>Date: Thu, Aug 31, 2017 at 1:14 AM<br>Subject: [PATCH 2/5] lmp92001: mfd: =
iio: adc: Add support LMP92001<br>To: <a href=3D"mailto:Jonathan.Cameron@hu=
awei.com">Jonathan.Cameron@huawei.com</a>, <a href=3D"mailto:pmeerw@pmeerw.=
net">pmeerw@pmeerw.net</a>, <a href=3D"mailto:jacopo@jmondi.org">jacopo@jmo=
ndi.org</a><br>Cc: <a href=3D"mailto:knaack.h@gmx.de">knaack.h@gmx.de</a>, =
<a href=3D"mailto:lars@metafoo.de">lars@metafoo.de</a>, <a href=3D"mailto:f=
abrice.gasnier@st.com">fabrice.gasnier@st.com</a>, <a href=3D"mailto:lee.jo=
nes@linaro.org">lee.jones@linaro.org</a>, <a href=3D"mailto:robh@kernel.org=
">robh@kernel.org</a>, <a href=3D"mailto:akinobu.mita@gmail.com">akinobu.mi=
ta@gmail.com</a>, <a href=3D"mailto:marek.vasut%2Brenesas@gmail.com">marek.=
vasut+renesas@gmail.com</a>, <a href=3D"mailto:jacopo%2Brenesas@jmondi.org"=
>jacopo+renesas@jmondi.org</a>, <a href=3D"mailto:linux-kernel@vger.kernel.=
org">linux-kernel@vger.kernel.org</a>, <a href=3D"mailto:linux-iio@vger.ker=
nel.org">linux-iio@vger.kernel.org</a>, <a href=3D"mailto:lukas@wunner.de">=
lukas@wunner.de</a>, <a href=3D"mailto:adi.reus@gmail.com">adi.reus@gmail.c=
om</a>, Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@gmail.com">s.abhisi=
t@gmail.com</a>&gt;<br><br><br>From: Abhisit Sangjan &lt;<a href=3D"mailto:=
s.abhisit@gmail.com">s.abhisit@gmail.com</a>&gt;<br>
<br>
TI LMP92001 Analog System Monitor and Controller<br>
<br>
8-bit GPIOs.<br>
12 DACs with 12-bit resolution.<br>
<br>
The GPIOs and DACs are shared port function with Cy function pin to<br>
take control the pin suddenly from external hardware.<br>
DAC&#39;s referance voltage selectable for Internal/External.<br>
<br>
16 + 1 ADCs with 12-bit resolution.<br>
<br>
Built-in internal Temperature Sensor on channel 17.<br>
Window Comparator Function is supported on channel 1-3 and 9-11 for<br>
monitoring with interrupt signal (pending to implement for interrupt).<br>
ADC&#39;s referance voltage selectable for Internal/External.<br>
<br>
Signed-off-by: Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@gmail.com">s=
.abhisit@gmail.com</a>&gt;<br>
---<br>
=C2=A0drivers/iio/adc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +<br>
=C2=A0drivers/iio/adc/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<=
br>
=C2=A0drivers/iio/adc/lmp92001-adc.c | 476 ++++++++++++++++++++++++++++++<w=
br>+++++++++++<br>
=C2=A03 files changed, 487 insertions(+)<br>
=C2=A0create mode 100644 drivers/iio/adc/lmp92001-adc.c<br>
<br>
diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig<br>
index 614fa41559b1..2adeba543ac7 100644<br>
--- a/drivers/iio/adc/Kconfig<br>
+++ b/drivers/iio/adc/Kconfig<br>
@@ -331,6 +331,16 @@ config IMX7D_ADC<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This driver can also be built as a modul=
e. If so, the module will be<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 called imx7d_adc.<br>
<br>
+config LMP92001_ADC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;TI LMP92001 ADC Driver&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on MFD_LMP92001<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If you say yes here you get support for =
TI LMP92001 ADCs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0conversion.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This driver can also be built as a modul=
e. If so, the module will<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0be called lmp92001_adc.<br>
+<br>
=C2=A0config LP8788_ADC<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tristate &quot;LP8788 ADC driver&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on MFD_LP8788<br>
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile<br>
index b546736a5541..2ed89862090b 100644<br>
--- a/drivers/iio/adc/Makefile<br>
+++ b/drivers/iio/adc/Makefile<br>
@@ -31,6 +31,7 @@ obj-$(CONFIG_HI8435) +=3D hi8435.o<br>
=C2=A0obj-$(CONFIG_HX711) +=3D hx711.o<br>
=C2=A0obj-$(CONFIG_IMX7D_ADC) +=3D imx7d_adc.o<br>
=C2=A0obj-$(CONFIG_INA2XX_ADC) +=3D ina2xx-adc.o<br>
+obj-$(CONFIG_LMP92001_ADC) +=3D lmp92001-adc.o<br>
=C2=A0obj-$(CONFIG_LP8788_ADC) +=3D lp8788_adc.o<br>
=C2=A0obj-$(CONFIG_LPC18XX_ADC) +=3D lpc18xx_adc.o<br>
=C2=A0obj-$(CONFIG_LPC32XX_ADC) +=3D lpc32xx_adc.o<br>
diff --git a/drivers/iio/adc/lmp92001-<wbr>adc.c b/drivers/iio/adc/lmp92001=
-<wbr>adc.c<br>
new file mode 100644<br>
index 000000000000..f706a364337d<br>
--- /dev/null<br>
+++ b/drivers/iio/adc/lmp92001-<wbr>adc.c<br>
@@ -0,0 +1,476 @@<br>
+/*<br>
+ * lmp92001-adc.c - Support for TI LMP92001 ADCs<br>
+ *<br>
+ * Copyright 2016-2017 Celestica Ltd.<br>
+ *<br>
+ * Author: Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@gmail.com">s.ab=
hisit@gmail.com</a>&gt;<br>
+ *<br>
+ * Inspired by wm831x and ad5064 drivers.<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify<br=
>
+ * it under the terms of the GNU General Public License as published by<br=
>
+ * the Free Software Foundation; either version 2 of the License, or<br>
+ * (at your option) any later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful,<br>
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<br>
+ * GNU General Public License for more details.<br>
+ */<br>
+<br>
+#include &lt;linux/iio/iio.h&gt;<br>
+#include &lt;linux/interrupt.h&gt;<br>
+#include &lt;linux/kernel.h&gt;<br>
+#include &lt;linux/mfd/core.h&gt;<br>
+#include &lt;linux/module.h&gt;<br>
+#include &lt;linux/platform_device.h&gt;<br>
+<br>
+#include &lt;linux/mfd/lmp92001/core.h&gt;<br>
+<br>
+static int lmp92001_read_raw(struct iio_dev *indio_dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct iio_chan_spec const *channel, int *val, =
int *val2, long mask)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_dr=
vdata(indio_<wbr>dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int code, cgen, sgen, try;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;lmp92001-&gt;adc_<wbr>lock);<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap, LMP920=
01_CGEN, &amp;cgen);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Is not continuous conversion?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Lock the HW registers (if needed).<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Triggering single-short conversion.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Waiting for conversion successful.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(cgen &amp; CGEN_STRT)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(cgen &amp; CG=
EN_LCK)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>regmap,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_=
CGEN, CGEN_LCK, CGEN_LCK);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Writing any valu=
e to trigger Single-Shot conversion. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_writ=
e(lmp92001-&gt;regmap, LMP92001_CTRIG, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto exit;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* In case of conve=
rsion is in-progress, repeat for 10 times. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try =3D 10;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0LMP92001_SGEN, &amp;sgen);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} while ((sgen &amp=
; CGEN_RST) &amp;&amp; (--try &gt; 0));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!try) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D -ETIME;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto exit;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap, 0x1F +=
 channel-&gt;channel, &amp;code);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (mask) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case IIO_CHAN_INFO_RAW:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (channel-&gt=
;type) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case IIO_VOLTAGE:<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case IIO_TEMP:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*val =3D code;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D IIO_VAL_INT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto exit;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* In case of no match channel info/type is ret=
urn here. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EINVAL;<br>
+<br>
+exit:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;lmp92001-&gt;adc_<wbr>lock);<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
+<br>
+static const struct iio_info lmp92001_info =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.read_raw =3D lmp92001_read_raw,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver_module =3D THIS_MODULE,<br>
+};<br>
+<br>
+static ssize_t lmp92001_avref_read(struct iio_dev *indio_dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t private, struct iio_chan_spec const *=
channel, char *buf)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_dr=
vdata(indio_<wbr>dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int cref;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap, LMP920=
01_CREF, &amp;cref);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%s\n&quot;, (cref &am=
p; CREF_AEXT) ? &quot;external&quot; : &quot;internal&quot;);<br>
+}<br>
+<br>
+static ssize_t lmp92001_avref_write(struct iio_dev *indio_dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t private, struct iio_chan_spec const *=
channel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *buf, size_t len)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_dr=
vdata(indio_<wbr>dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int cref;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (strncmp(&quot;external&quot;, buf, 8) =3D=
=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cref =3D 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (strncmp(&quot;internal&quot;, buf, 8) =
=3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cref =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>re=
gmap, LMP92001_CREF, CREF_AEXT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cref);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return len;<br>
+}<br>
+<br>
+static ssize_t lmp92001_enable_read(struct iio_dev *indio_dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t private, struct iio_chan_spec const *=
channel, char *buf)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_dr=
vdata(indio_<wbr>dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int reg, cad;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (channel-&gt;channel) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case 1 ... 8:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D LMP92001_CA=
D1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case 9 ... 16:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D LMP92001_CA=
D2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case 17:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D LMP92001_CA=
D3;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap, reg, &=
amp;cad);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (channel-&gt;channel &lt;=3D 8)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cad &gt;&gt;=3D cha=
nnel-&gt;channel - 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (channel-&gt;channel &gt; 8)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cad &gt;&gt;=3D cha=
nnel-&gt;channel - 9;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (channel-&gt;channel &gt; 16)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cad &gt;&gt;=3D cha=
nnel-&gt;channel - 17;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%s\n&quot;, cad &amp;=
 BIT(0) ? &quot;enable&quot; : &quot;disable&quot;);<br>
+}<br>
+<br>
+static ssize_t lmp92001_enable_write(struct iio_dev *indio_dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t private, struct iio_chan_spec const *=
channel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *buf, size_t len)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_dr=
vdata(indio_<wbr>dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int reg, enable, shif, mask;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (channel-&gt;channel) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case 1 ... 8:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D LMP92001_CA=
D1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shif =3D (channel-&=
gt;channel - 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case 9 ... 16:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D LMP92001_CA=
D2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shif =3D (channel-&=
gt;channel - 9);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case 17:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D LMP92001_CA=
D3;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shif =3D (channel-&=
gt;channel - 17);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (strncmp(&quot;enable&quot;, buf, 6) =3D=3D =
0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enable =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (strncmp(&quot;disable&quot;, buf, 7) =
=3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enable =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0enable &lt;&lt;=3D shif;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mask =3D 1 &lt;&lt; shif;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>re=
gmap, reg, mask, enable);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return len;<br>
+}<br>
+<br>
+static ssize_t lmp92001_mode_read(struct iio_dev *indio_dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t private, struct iio_chan_spec const *=
channel, char *buf)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_dr=
vdata(indio_<wbr>dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int cgen;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap, LMP920=
01_CGEN, &amp;cgen);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%s\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cgen &amp; BIT(0) ? &quot;continuous&quot; : &quot;single-shot&qu=
ot;);<br>
+}<br>
+<br>
+static ssize_t lmp92001_mode_write(struct iio_dev *indio_dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t private, struct iio_chan_spec const *=
channel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *buf, size_t len)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_dr=
vdata(indio_<wbr>dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int cgen;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (strncmp(&quot;continuous&quot;, buf, 10) =
=3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cgen =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (strncmp(&quot;single-shot&quot;, buf, =
11) =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cgen =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;lmp92001-&gt;adc_<wbr>lock);<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Unlock the HW registers.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Set conversion mode.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Lock the HW registers.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>re=
gmap, LMP92001_CGEN, CGEN_LCK, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>re=
gmap, LMP92001_CGEN, CGEN_STRT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cgen);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>re=
gmap, LMP92001_CGEN, CGEN_LCK,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CGEN_LCK)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return len;<br>
+<br>
+exit:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;lmp92001-&gt;adc_<wbr>lock);<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
+<br>
+static const struct iio_chan_spec_ext_info lmp92001_ext_info[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;vre=
f&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.read =3D lmp92001_=
avref_read,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.write =3D lmp92001=
_avref_write,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.shared =3D IIO_SHA=
RED_BY_ALL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;en&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.read =3D lmp92001_=
enable_read,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.write =3D lmp92001=
_enable_write,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.shared =3D IIO_SEP=
ARATE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;mod=
e&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.read =3D lmp92001_=
mode_read,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.write =3D lmp92001=
_mode_write,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.shared =3D IIO_SHA=
RED_BY_ALL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}, { },<br>
+};<br>
+<br>
+static const struct iio_event_spec lmp92001_events[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D IIO_EV_TY=
PE_THRESH,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.dir =3D IIO_EV_DIR=
_RISING,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mask_separate =3D =
BIT(IIO_EV_INFO_ENABLE) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0BIT(IIO_EV_INFO_VALUE),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D IIO_EV_TY=
PE_THRESH,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.dir =3D IIO_EV_DIR=
_FALLING,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mask_separate =3D =
BIT(IIO_EV_INFO_ENABLE) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0BIT(IIO_EV_INFO_VALUE),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}, { },<br>
+};<br>
+<br>
+#define LMP92001_CHAN_SPEC(_ch, _type, _event, _nevent) \<br>
+{ \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.channel =3D _ch, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D _type, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.indexed =3D 1, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) =
| \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(IIO_CHAN_INFO_S=
CALE), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.event_spec =3D _event, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.num_event_specs =3D _nevent, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.ext_info =3D lmp92001_ext_info, \<br>
+}<br>
+<br>
+static const struct iio_chan_spec lmp92001_adc_channels[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(1, IIO_VOLTAGE, lmp92001_eve=
nts,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ARRAY_SIZE(lmp92001_events)),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(2, IIO_VOLTAGE, lmp92001_eve=
nts,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ARRAY_SIZE(lmp92001_events)),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(3, IIO_VOLTAGE, lmp92001_eve=
nts,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ARRAY_SIZE(lmp92001_events)),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(4, IIO_VOLTAGE, NULL, 0),<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(5, IIO_VOLTAGE, NULL, 0),<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(6, IIO_VOLTAGE, NULL, 0),<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(7, IIO_VOLTAGE, NULL, 0),<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(8, IIO_VOLTAGE, NULL, 0),<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(9, IIO_VOLTAGE, lmp92001_eve=
nts,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ARRAY_SIZE(lmp92001_events)),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(10, IIO_VOLTAGE, lmp92001_ev=
ents,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ARRAY_SIZE(lmp92001_events)),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(11, IIO_VOLTAGE, lmp92001_ev=
ents,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ARRAY_SIZE(lmp92001_events)),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(12, IIO_VOLTAGE, NULL, 0),<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(13, IIO_VOLTAGE, NULL, 0),<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(14, IIO_VOLTAGE, NULL, 0),<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(15, IIO_VOLTAGE, NULL, 0),<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(16, IIO_VOLTAGE, NULL, 0),<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(17,=C2=A0 =C2=A0 IIO_TEMP, N=
ULL, 0),<br>
+};<br>
+<br>
+static int lmp92001_adc_probe(struct platform_device *pdev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D dev_get_drvdata(p=
dev-&gt;dev.<wbr>parent);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct iio_dev *indio_dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *np =3D pdev-&gt;dev.of_node=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int cgen =3D 0, cad1, cad2, cad3;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0indio_dev =3D devm_iio_device_alloc(&amp;pdev-&=
gt;<wbr>dev, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!indio_dev)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0iio_device_set_drvdata(indio_<wbr>dev, lmp92001=
);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_init(&amp;lmp92001-&gt;adc_<wbr>lock);<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0indio_dev-&gt;name =3D pdev-&gt;name;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0indio_dev-&gt;dev.parent =3D &amp;pdev-&gt;dev;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0indio_dev-&gt;modes =3D INDIO_DIRECT_MODE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0indio_dev-&gt;info =3D &amp;lmp92001_info;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0indio_dev-&gt;channels =3D lmp92001_adc_channel=
s;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0indio_dev-&gt;num_channels =3D ARRAY_SIZE(lmp92=
001_adc_<wbr>channels);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>re=
gmap, LMP92001_CGEN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CGEN_RST,=
 CGEN_RST);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&=
gt;dev, &quot;failed to self reset all registers\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Turn on all of them, if you are pretty sure =
they are must be<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * real-time update or specify which channel is=
 needed to be used to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * save conversion time for a cycle.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_u32(np, &quot;ti,lmp92=
001-adc-mask&quot;, &amp;mask);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cad1 =3D cad2 =3D c=
ad3 =3D 0xFF;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info(&amp;pdev-=
&gt;dev, &quot;turn on all of channels by default\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cad1 =3D mask &amp;=
 0xFF;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cad2 =3D (mask &gt;=
&gt; 8) &amp; 0xFF;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cad3 =3D (mask &gt;=
&gt; 16) &amp; 0xFF;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>re=
gmap, LMP92001_CAD1, 0xFF, cad1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&=
gt;dev, &quot;failed to enable/disable channels 1-8\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>re=
gmap, LMP92001_CAD2, 0xFF, cad2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&=
gt;dev, &quot;failed to enable/disable channels 9-16\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>re=
gmap, LMP92001_CAD3, BIT(0), cad3);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&=
gt;dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;failed to enable/disable channel 17 (temperature)\n&quot;);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cgen |=3D 1; /* Continuous conversion is defaul=
t. */<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Lock the HW registers and set conversion mod=
e. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>re=
gmap,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_=
CGEN, CGEN_LCK | CGEN_STRT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cgen | CG=
EN_LCK);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, indio_dev);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return devm_iio_device_register(&amp;<wbr>pdev-=
&gt;dev, indio_dev);<br>
+}<br>
+<br>
+static int lmp92001_adc_remove(struct platform_device *pdev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct iio_dev *indio_dev =3D platform_get_drvd=
ata(pdev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_dr=
vdata(indio_<wbr>dev);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * To stop ADC conversion to save power<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Unlock the HW registers.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Set conversion mode to single-shot.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Lock the HW registers.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(lmp92001-&gt;<wbr>regmap, LM=
P92001_CGEN, CGEN_LCK, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(lmp92001-&gt;<wbr>regmap, LM=
P92001_CGEN, CGEN_STRT, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(lmp92001-&gt;<wbr>regmap, LM=
P92001_CGEN, CGEN_LCK, CGEN_LCK);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static struct platform_driver lmp92001_adc_driver =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.<a href=3D"http://driver.name" rel=3D"noreferr=
er" target=3D"_blank">driver.name</a>=C2=A0 =C2=A0 =3D &quot;lmp92001-adc&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D lm=
p92001_adc_probe,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D lm=
p92001_adc_remove,<br>
+};<br>
+<br>
+static int __init lmp92001_adc_init(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return platform_driver_register(&amp;<wbr>lmp92=
001_adc_driver);<br>
+}<br>
+subsys_initcall(lmp92001_adc_<wbr>init);<br>
+<br>
+static void __exit lmp92001_adc_exit(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0platform_driver_unregister(&amp;<wbr>lmp92001_a=
dc_driver);<br>
+}<br>
+module_exit(lmp92001_adc_<wbr>exit);<br>
+<br>
+MODULE_AUTHOR(&quot;Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@gmail.=
com">s.abhisit@gmail.com</a>&gt;&quot;);<br>
+MODULE_DESCRIPTION(&quot;IIO ADC interface for TI LMP92001&quot;);<br>
+MODULE_LICENSE(&quot;GPL&quot;);<br>
+MODULE_ALIAS(&quot;platform:<wbr>lmp92001-adc&quot;);<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
2.13.0<br>
<br>
</font></span></div><br></div></div>

--001a1140221e3a8569055806c22e--
