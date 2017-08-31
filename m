Return-Path: <SRS0=VjFt=AB=gmail.com=s.abhisit@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170830181715.9092-1-s.abhisit@gmail.com>
References: <20170830181715.9092-1-s.abhisit@gmail.com>
From: Abhisit Sangjan <s.abhisit@gmail.com>
Date: Thu, 31 Aug 2017 13:29:45 +0700
Message-ID: <CAMV_pUZqd9xCY+ve33kHPJwN_6PsUOdFZEaxFxyqChmVkAN-5w@mail.gmail.com>
Subject: Fwd: [PATCH 3/5] lmp92001: mfd: iio: dac: Add support LMP92001
Content-Type: multipart/alternative; boundary="001a1140ddb43fc4a3055806c54d"
To: Lee Jones <lee.jones@linaro.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, jmondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: knaack.h@gmx.de, lars@metafoo.de, fabrice.gasnier@st.com, Rob Herring <robh@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>, marek.vasut+renesas@gmail.com, jacopo+renesas@jmondi.org, mike.looijmans@topic.nl, peda@axentia.se, =?UTF-8?Q?Jean=2DFran=C3=A7ois_Dagenais?= <jeff.dagenais@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, lukas@wunner.de, Adriana Reus <adi.reus@gmail.com>, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--001a1140ddb43fc4a3055806c54d
Content-Type: text/plain; charset="UTF-8"

Send all parts to all cc'd people to save your time tracking down all
patches of this.

---------- Forwarded message ----------
From: <s.abhisit@gmail.com>
Date: Thu, Aug 31, 2017 at 1:17 AM
Subject: [PATCH 3/5] lmp92001: mfd: iio: dac: Add support LMP92001
To: pmeerw@pmeerw.net
Cc: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de,
fabrice.gasnier@st.com, mike.looijmans@topic.nl, peda@axentia.se,
jeff.dagenais@gmail.com, linux-kernel@vger.kernel.org,
linux-iio@vger.kernel.org, Abhisit Sangjan <s.abhisit@gmail.com>


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
 drivers/iio/dac/Kconfig        |   9 ++
 drivers/iio/dac/Makefile       |   1 +
 drivers/iio/dac/lmp92001-dac.c | 337 ++++++++++++++++++++++++++++++
+++++++++++
 3 files changed, 347 insertions(+)
 create mode 100644 drivers/iio/dac/lmp92001-dac.c

diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
index 25bed2d7d2b9..3e0d81606927 100644
--- a/drivers/iio/dac/Kconfig
+++ b/drivers/iio/dac/Kconfig
@@ -221,6 +221,15 @@ config DPOT_DAC
          To compile this driver as a module, choose M here: the module
will be
          called dpot-dac.

+config LMP92001_DAC
+        tristate "TI LMP92001 DAC Driver"
+        depends on MFD_LMP92001
+        help
+          If you say yes here you get support for TI LMP92001 DACs.
+
+          This driver can also be built as a module. If so, the module will
+          be called lmp92001_dac.
+
 config LPC18XX_DAC
        tristate "NXP LPC18xx DAC driver"
        depends on ARCH_LPC18XX || COMPILE_TEST
diff --git a/drivers/iio/dac/Makefile b/drivers/iio/dac/Makefile
index 603587cc2f07..516d2beced7b 100644
--- a/drivers/iio/dac/Makefile
+++ b/drivers/iio/dac/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_AD7303) += ad7303.o
 obj-$(CONFIG_AD8801) += ad8801.o
 obj-$(CONFIG_CIO_DAC) += cio-dac.o
 obj-$(CONFIG_DPOT_DAC) += dpot-dac.o
+obj-$(CONFIG_LMP92001_DAC) += lmp92001-dac.o
 obj-$(CONFIG_LPC18XX_DAC) += lpc18xx_dac.o
 obj-$(CONFIG_LTC2632) += ltc2632.o
 obj-$(CONFIG_M62332) += m62332.o
diff --git a/drivers/iio/dac/lmp92001-dac.c b/drivers/iio/dac/lmp92001-dac.c
new file mode 100644
index 000000000000..072026e9895c
--- /dev/null
+++ b/drivers/iio/dac/lmp92001-dac.c
@@ -0,0 +1,337 @@
+/*
+ * lmp92001-dac.c - Support for TI LMP92001 DACs
+ *
+ * Copyright 2016-2017 Celestica Ltd.
+ *
+ * Author: Abhisit Sangjan <s.abhisit@gmail.com>
+ *
+ * Inspired by wm831x driver.
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
+       int ret;
+
+       switch (mask) {
+       case IIO_CHAN_INFO_RAW:
+               switch (channel->type) {
+               case IIO_VOLTAGE:
+                       mutex_lock(&lmp92001->dac_lock);
+
+                       ret = regmap_read(lmp92001->regmap,
+                                       0x7F + channel->channel, val);
+
+                       mutex_unlock(&lmp92001->dac_lock);
+
+                       if (ret < 0)
+                               return ret;
+
+                       return IIO_VAL_INT;
+               default:
+                       return -EINVAL;
+               }
+               break;
+       default:
+               return -EINVAL;
+       }
+}
+
+static int lmp92001_write_raw(struct iio_dev *indio_dev,
+       struct iio_chan_spec const *channel, int val, int val2, long mask)
+{
+       struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
+       int ret;
+
+       if (val < 0 || val > 4095)
+               return -EINVAL;
+
+       switch (mask) {
+       case IIO_CHAN_INFO_RAW:
+               switch (channel->type) {
+               case IIO_VOLTAGE:
+                       mutex_lock(&lmp92001->dac_lock);
+
+                       ret = regmap_write(lmp92001->regmap,
+                                       0x7F + channel->channel, val);
+
+                       mutex_unlock(&lmp92001->dac_lock);
+
+                       if (ret < 0)
+                               return ret;
+
+                       return 0;
+               default:
+                       return -EINVAL;
+               }
+               break;
+       default:
+               return -EINVAL;
+       }
+}
+
+static const struct iio_info lmp92001_info = {
+       .read_raw = lmp92001_read_raw,
+       .write_raw = lmp92001_write_raw,
+       .driver_module = THIS_MODULE,
+};
+
+static ssize_t lmp92001_dvref_read(struct iio_dev *indio_dev,
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
+       return sprintf(buf, "%s\n", cref & CREF_DEXT ? "external" :
"internal");
+}
+
+static ssize_t lmp92001_dvref_write(struct iio_dev *indio_dev,
+       uintptr_t private, struct iio_chan_spec const *channel, const char
*buf,
+       size_t len)
+{
+       struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
+       unsigned int cref;
+       int ret;
+
+       if (strncmp("external", buf, 8) == 0)
+               cref = 1;
+       else if (strncmp("internal", buf, 8) == 0)
+               cref = 0;
+       else
+               return -EINVAL;
+
+       ret = regmap_update_bits(lmp92001->regmap, LMP92001_CREF, CREF_DEXT,
+                                       cref);
+       if (ret < 0)
+               return ret;
+
+       return len;
+}
+
+static ssize_t lmp92001_outx_read(struct iio_dev *indio_dev,
+       uintptr_t private, struct iio_chan_spec const *channel, char *buf)
+{
+       struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
+       unsigned int cdac;
+       const char *outx;
+       int ret;
+
+       ret = regmap_read(lmp92001->regmap, LMP92001_CDAC, &cdac);
+       if (ret < 0)
+               return ret;
+
+       if (cdac & CDAC_OFF)
+               outx = "hiz";
+       else {
+               if (cdac & CDAC_OLVL)
+                       outx = "1 or dac";
+               else
+                       outx = "0 or dac";
+       }
+
+       return sprintf(buf, "%s\n", outx);
+}
+
+static ssize_t lmp92001_outx_write(struct iio_dev *indio_dev,
+       uintptr_t private, struct iio_chan_spec const *channel,
+       const char *buf, size_t len)
+{
+       struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
+       unsigned int cdac, mask;
+       int ret;
+
+       if (strncmp("hiz", buf, 3) == 0) {
+               cdac = CDAC_OFF;
+               mask = CDAC_OFF;
+       } else if (strncmp("dac", buf, 3) == 0) {
+               cdac = ~CDAC_OFF;
+               mask = CDAC_OFF;
+       } else if (strncmp("0", buf, 1) == 0) {
+               cdac = ~(CDAC_OLVL | CDAC_OFF);
+               mask = CDAC_OLVL | CDAC_OFF;
+       } else if (strncmp("1", buf, 1) == 0) {
+               cdac = CDAC_OLVL;
+               mask = CDAC_OLVL | CDAC_OFF;
+       } else
+               return -EINVAL;
+
+       ret = regmap_update_bits(lmp92001->regmap, LMP92001_CDAC, mask,
cdac);
+       if (ret < 0)
+               return ret;
+
+       return len;
+}
+
+static ssize_t lmp92001_gang_read(struct iio_dev *indio_dev,
+       uintptr_t private, struct iio_chan_spec const *channel, char *buf)
+{
+       struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
+       unsigned int cdac;
+       int ret;
+
+       ret = regmap_read(lmp92001->regmap, LMP92001_CDAC, &cdac);
+       if (ret < 0)
+               return ret;
+
+       return sprintf(buf, "%s\n", cdac & CDAC_GANG ? "1" : "0");
+}
+
+static ssize_t lmp92001_gang_write(struct iio_dev *indio_dev,
+       uintptr_t private, struct iio_chan_spec const *channel,
+       const char *buf, size_t len)
+{
+       struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
+       unsigned int cdac = 0;
+       int ret;
+
+       if (strncmp("0", buf, 1) == 0)
+               cdac = ~CDAC_GANG;
+       else if (strncmp("1", buf, 1) == 0)
+               cdac = CDAC_GANG;
+       else
+               return -EINVAL;
+
+       ret = regmap_update_bits(lmp92001->regmap, LMP92001_CDAC, CDAC_GANG,
+                                       cdac);
+       if (ret < 0)
+               return ret;
+
+       return len;
+}
+
+static const struct iio_chan_spec_ext_info lmp92001_ext_info[] = {
+       {
+               .name = "vref",
+               .read = lmp92001_dvref_read,
+               .write = lmp92001_dvref_write,
+               .shared = IIO_SHARED_BY_ALL,
+       }, {
+               .name = "outx",
+               .read = lmp92001_outx_read,
+               .write = lmp92001_outx_write,
+               .shared = IIO_SHARED_BY_ALL,
+       }, {
+               .name = "gang",
+               .read = lmp92001_gang_read,
+               .write = lmp92001_gang_write,
+               .shared = IIO_SHARED_BY_ALL,
+       }, { },
+};
+
+#define LMP92001_CHAN_SPEC(_ch) \
+{ \
+       .channel = _ch, \
+       .type = IIO_VOLTAGE, \
+       .indexed = 1, \
+       .info_mask_separate = BIT(IIO_CHAN_INFO_RAW) | \
+               BIT(IIO_CHAN_INFO_SCALE), \
+       .ext_info = lmp92001_ext_info, \
+       .output = 1, \
+}
+
+static const struct iio_chan_spec lmp92001_dac_channels[] = {
+       LMP92001_CHAN_SPEC(1),
+       LMP92001_CHAN_SPEC(2),
+       LMP92001_CHAN_SPEC(3),
+       LMP92001_CHAN_SPEC(4),
+       LMP92001_CHAN_SPEC(5),
+       LMP92001_CHAN_SPEC(6),
+       LMP92001_CHAN_SPEC(7),
+       LMP92001_CHAN_SPEC(8),
+       LMP92001_CHAN_SPEC(9),
+       LMP92001_CHAN_SPEC(10),
+       LMP92001_CHAN_SPEC(11),
+       LMP92001_CHAN_SPEC(12),
+};
+
+static int lmp92001_dac_probe(struct platform_device *pdev)
+{
+       struct lmp92001 *lmp92001 = dev_get_drvdata(pdev->dev.parent);
+       struct iio_dev *indio_dev;
+       struct device_node *np = pdev->dev.of_node;
+       u8 gang = 0, outx = 0, hiz = 0;
+       unsigned int cdac = 0;
+       int ret;
+
+       indio_dev = devm_iio_device_alloc(&pdev->dev, 0);
+       if (!indio_dev)
+               return -ENOMEM;
+
+       iio_device_set_drvdata(indio_dev, lmp92001);
+
+       mutex_init(&lmp92001->dac_lock);
+
+       indio_dev->name = pdev->name;
+       indio_dev->modes = INDIO_DIRECT_MODE;
+       indio_dev->info = &lmp92001_info;
+       indio_dev->channels = lmp92001_dac_channels;
+       indio_dev->num_channels = ARRAY_SIZE(lmp92001_dac_channels);
+
+       of_property_read_u8(np, "ti,lmp92001-dac-hiz", &hiz);
+       cdac = hiz;
+
+       of_property_read_u8(np, "ti,lmp92001-dac-outx", &outx);
+       cdac |= outx << 1;
+
+       of_property_read_u8(np, "ti,lmp92001-dac-gang", &gang);
+       cdac |= gang << 2;
+
+       ret = regmap_update_bits(lmp92001->regmap, LMP92001_CDAC,
+                                       CDAC_GANG | CDAC_OLVL | CDAC_OFF,
cdac);
+       if (ret < 0)
+               return ret;
+
+       return devm_iio_device_register(&pdev->dev, indio_dev);
+}
+
+static int lmp92001_dac_remove(struct platform_device *pdev)
+{
+       return 0;
+}
+
+static struct platform_driver lmp92001_dac_driver = {
+       .driver.name    = "lmp92001-dac",
+       .probe          = lmp92001_dac_probe,
+       .remove         = lmp92001_dac_remove,
+};
+
+static int __init lmp92001_dac_init(void)
+{
+       return platform_driver_register(&lmp92001_dac_driver);
+}
+subsys_initcall(lmp92001_dac_init);
+
+static void __exit lmp92001_dac_exit(void)
+{
+       platform_driver_unregister(&lmp92001_dac_driver);
+}
+module_exit(lmp92001_dac_exit);
+
+MODULE_AUTHOR("Abhisit Sangjan <s.abhisit@gmail.com>");
+MODULE_DESCRIPTION("IIO DAC interface for TI LMP92001");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:lmp92001-dac");
--
2.13.0

--001a1140ddb43fc4a3055806c54d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size:12.8px">Send all parts to all cc&=
#39;d people to save your time=C2=A0</span><span style=3D"font-size:12.8px"=
>tracking down all patches of this.</span><div><span style=3D"font-size:12.=
8px"><br></span><div class=3D"gmail_quote">---------- Forwarded message ---=
-------<br>From: <b class=3D"gmail_sendername"></b> <span dir=3D"ltr">&lt;<=
a href=3D"mailto:s.abhisit@gmail.com">s.abhisit@gmail.com</a>&gt;</span><br=
>Date: Thu, Aug 31, 2017 at 1:17 AM<br>Subject: [PATCH 3/5] lmp92001: mfd: =
iio: dac: Add support LMP92001<br>To: <a href=3D"mailto:pmeerw@pmeerw.net">=
pmeerw@pmeerw.net</a><br>Cc: <a href=3D"mailto:jic23@kernel.org">jic23@kern=
el.org</a>, <a href=3D"mailto:knaack.h@gmx.de">knaack.h@gmx.de</a>, <a href=
=3D"mailto:lars@metafoo.de">lars@metafoo.de</a>, <a href=3D"mailto:fabrice.=
gasnier@st.com">fabrice.gasnier@st.com</a>, <a href=3D"mailto:mike.looijman=
s@topic.nl">mike.looijmans@topic.nl</a>, <a href=3D"mailto:peda@axentia.se"=
>peda@axentia.se</a>, <a href=3D"mailto:jeff.dagenais@gmail.com">jeff.dagen=
ais@gmail.com</a>, <a href=3D"mailto:linux-kernel@vger.kernel.org">linux-ke=
rnel@vger.kernel.org</a>, <a href=3D"mailto:linux-iio@vger.kernel.org">linu=
x-iio@vger.kernel.org</a>, Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@=
gmail.com">s.abhisit@gmail.com</a>&gt;<br><br><br>From: Abhisit Sangjan &lt=
;<a href=3D"mailto:s.abhisit@gmail.com">s.abhisit@gmail.com</a>&gt;<br>
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
=C2=A0drivers/iio/dac/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 ++=
<br>
=C2=A0drivers/iio/dac/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<=
br>
=C2=A0drivers/iio/dac/lmp92001-dac.c | 337 ++++++++++++++++++++++++++++++<w=
br>+++++++++++<br>
=C2=A03 files changed, 347 insertions(+)<br>
=C2=A0create mode 100644 drivers/iio/dac/lmp92001-dac.c<br>
<br>
diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig<br>
index 25bed2d7d2b9..3e0d81606927 100644<br>
--- a/drivers/iio/dac/Kconfig<br>
+++ b/drivers/iio/dac/Kconfig<br>
@@ -221,6 +221,15 @@ config DPOT_DAC<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 To compile this driver as a module, choo=
se M here: the module will be<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 called dpot-dac.<br>
<br>
+config LMP92001_DAC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tristate &quot;TI LMP92001 DAC Driver&quot;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on MFD_LMP92001<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 If you say yes here you get support for=
 TI LMP92001 DACs.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This driver can also be built as a modu=
le. If so, the module will<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 be called lmp92001_dac.<br>
+<br>
=C2=A0config LPC18XX_DAC<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tristate &quot;NXP LPC18xx DAC driver&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on ARCH_LPC18XX || COMPILE_TEST<br>
diff --git a/drivers/iio/dac/Makefile b/drivers/iio/dac/Makefile<br>
index 603587cc2f07..516d2beced7b 100644<br>
--- a/drivers/iio/dac/Makefile<br>
+++ b/drivers/iio/dac/Makefile<br>
@@ -23,6 +23,7 @@ obj-$(CONFIG_AD7303) +=3D ad7303.o<br>
=C2=A0obj-$(CONFIG_AD8801) +=3D ad8801.o<br>
=C2=A0obj-$(CONFIG_CIO_DAC) +=3D cio-dac.o<br>
=C2=A0obj-$(CONFIG_DPOT_DAC) +=3D dpot-dac.o<br>
+obj-$(CONFIG_LMP92001_DAC) +=3D lmp92001-dac.o<br>
=C2=A0obj-$(CONFIG_LPC18XX_DAC) +=3D lpc18xx_dac.o<br>
=C2=A0obj-$(CONFIG_LTC2632) +=3D ltc2632.o<br>
=C2=A0obj-$(CONFIG_M62332) +=3D m62332.o<br>
diff --git a/drivers/iio/dac/lmp92001-<wbr>dac.c b/drivers/iio/dac/lmp92001=
-<wbr>dac.c<br>
new file mode 100644<br>
index 000000000000..072026e9895c<br>
--- /dev/null<br>
+++ b/drivers/iio/dac/lmp92001-<wbr>dac.c<br>
@@ -0,0 +1,337 @@<br>
+/*<br>
+ * lmp92001-dac.c - Support for TI LMP92001 DACs<br>
+ *<br>
+ * Copyright 2016-2017 Celestica Ltd.<br>
+ *<br>
+ * Author: Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@gmail.com">s.ab=
hisit@gmail.com</a>&gt;<br>
+ *<br>
+ * Inspired by wm831x driver.<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (mask) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case IIO_CHAN_INFO_RAW:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (channel-&gt=
;type) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case IIO_VOLTAGE:<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mutex_lock(&amp;lmp92001-&gt;dac_<wbr>lock);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x7F + ch=
annel-&gt;channel, val);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mutex_unlock(&amp;lmp92001-&gt;dac_<wbr>lock);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return IIO_VAL_INT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
+<br>
+static int lmp92001_write_raw(struct iio_dev *indio_dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct iio_chan_spec const *channel, int val, i=
nt val2, long mask)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_dr=
vdata(indio_<wbr>dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (val &lt; 0 || val &gt; 4095)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (mask) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case IIO_CHAN_INFO_RAW:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (channel-&gt=
;type) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case IIO_VOLTAGE:<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mutex_lock(&amp;lmp92001-&gt;dac_<wbr>lock);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D regmap_write(lmp92001-&gt;regmap,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x7F + ch=
annel-&gt;channel, val);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mutex_unlock(&amp;lmp92001-&gt;dac_<wbr>lock);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
+<br>
+static const struct iio_info lmp92001_info =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.read_raw =3D lmp92001_read_raw,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.write_raw =3D lmp92001_write_raw,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver_module =3D THIS_MODULE,<br>
+};<br>
+<br>
+static ssize_t lmp92001_dvref_read(struct iio_dev *indio_dev,<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%s\n&quot;, cref &amp=
; CREF_DEXT ? &quot;external&quot; : &quot;internal&quot;);<br>
+}<br>
+<br>
+static ssize_t lmp92001_dvref_write(struct iio_dev *indio_dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t private, struct iio_chan_spec const *=
channel, const char *buf,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t len)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_dr=
vdata(indio_<wbr>dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int cref;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (strncmp(&quot;external&quot;, buf, 8) =3D=
=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cref =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (strncmp(&quot;internal&quot;, buf, 8) =
=3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cref =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>re=
gmap, LMP92001_CREF, CREF_DEXT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cref);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return len;<br>
+}<br>
+<br>
+static ssize_t lmp92001_outx_read(struct iio_dev *indio_dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t private, struct iio_chan_spec const *=
channel, char *buf)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_dr=
vdata(indio_<wbr>dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int cdac;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *outx;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap, LMP920=
01_CDAC, &amp;cdac);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (cdac &amp; CDAC_OFF)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0outx =3D &quot;hiz&=
quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cdac &amp; CDAC=
_OLVL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0outx =3D &quot;1 or dac&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0outx =3D &quot;0 or dac&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%s\n&quot;, outx);<br=
>
+}<br>
+<br>
+static ssize_t lmp92001_outx_write(struct iio_dev *indio_dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t private, struct iio_chan_spec const *=
channel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *buf, size_t len)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_dr=
vdata(indio_<wbr>dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int cdac, mask;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (strncmp(&quot;hiz&quot;, buf, 3) =3D=3D 0) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cdac =3D CDAC_OFF;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mask =3D CDAC_OFF;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (strncmp(&quot;dac&quot;, buf, 3) =3D=
=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cdac =3D ~CDAC_OFF;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mask =3D CDAC_OFF;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (strncmp(&quot;0&quot;, buf, 1) =3D=
=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cdac =3D ~(CDAC_OLV=
L | CDAC_OFF);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mask =3D CDAC_OLVL =
| CDAC_OFF;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (strncmp(&quot;1&quot;, buf, 1) =3D=
=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cdac =3D CDAC_OLVL;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mask =3D CDAC_OLVL =
| CDAC_OFF;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>re=
gmap, LMP92001_CDAC, mask, cdac);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return len;<br>
+}<br>
+<br>
+static ssize_t lmp92001_gang_read(struct iio_dev *indio_dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t private, struct iio_chan_spec const *=
channel, char *buf)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_dr=
vdata(indio_<wbr>dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int cdac;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap, LMP920=
01_CDAC, &amp;cdac);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%s\n&quot;, cdac &amp=
; CDAC_GANG ? &quot;1&quot; : &quot;0&quot;);<br>
+}<br>
+<br>
+static ssize_t lmp92001_gang_write(struct iio_dev *indio_dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t private, struct iio_chan_spec const *=
channel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *buf, size_t len)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_dr=
vdata(indio_<wbr>dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int cdac =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (strncmp(&quot;0&quot;, buf, 1) =3D=3D 0)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cdac =3D ~CDAC_GANG=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (strncmp(&quot;1&quot;, buf, 1) =3D=3D =
0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cdac =3D CDAC_GANG;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>re=
gmap, LMP92001_CDAC, CDAC_GANG,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cdac);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return len;<br>
+}<br>
+<br>
+static const struct iio_chan_spec_ext_info lmp92001_ext_info[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;vre=
f&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.read =3D lmp92001_=
dvref_read,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.write =3D lmp92001=
_dvref_write,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.shared =3D IIO_SHA=
RED_BY_ALL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;out=
x&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.read =3D lmp92001_=
outx_read,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.write =3D lmp92001=
_outx_write,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.shared =3D IIO_SHA=
RED_BY_ALL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;gan=
g&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.read =3D lmp92001_=
gang_read,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.write =3D lmp92001=
_gang_write,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.shared =3D IIO_SHA=
RED_BY_ALL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}, { },<br>
+};<br>
+<br>
+#define LMP92001_CHAN_SPEC(_ch) \<br>
+{ \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.channel =3D _ch, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D IIO_VOLTAGE, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.indexed =3D 1, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) =
| \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(IIO_CHAN_INFO_S=
CALE), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.ext_info =3D lmp92001_ext_info, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.output =3D 1, \<br>
+}<br>
+<br>
+static const struct iio_chan_spec lmp92001_dac_channels[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(1),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(2),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(3),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(4),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(5),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(6),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(7),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(8),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(9),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(10),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(11),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(12),<br>
+};<br>
+<br>
+static int lmp92001_dac_probe(struct platform_device *pdev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D dev_get_drvdata(p=
dev-&gt;dev.<wbr>parent);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct iio_dev *indio_dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *np =3D pdev-&gt;dev.of_node=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 gang =3D 0, outx =3D 0, hiz =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int cdac =3D 0;<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_init(&amp;lmp92001-&gt;dac_<wbr>lock);<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0indio_dev-&gt;name =3D pdev-&gt;name;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0indio_dev-&gt;modes =3D INDIO_DIRECT_MODE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0indio_dev-&gt;info =3D &amp;lmp92001_info;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0indio_dev-&gt;channels =3D lmp92001_dac_channel=
s;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0indio_dev-&gt;num_channels =3D ARRAY_SIZE(lmp92=
001_dac_<wbr>channels);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0of_property_read_u8(np, &quot;ti,lmp92001-dac-h=
iz&quot;, &amp;hiz);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cdac =3D hiz;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0of_property_read_u8(np, &quot;ti,lmp92001-dac-o=
utx&quot;, &amp;outx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cdac |=3D outx &lt;&lt; 1;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0of_property_read_u8(np, &quot;ti,lmp92001-dac-g=
ang&quot;, &amp;gang);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cdac |=3D gang &lt;&lt; 2;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>re=
gmap, LMP92001_CDAC,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CDAC_GANG=
 | CDAC_OLVL | CDAC_OFF, cdac);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return devm_iio_device_register(&amp;<wbr>pdev-=
&gt;dev, indio_dev);<br>
+}<br>
+<br>
+static int lmp92001_dac_remove(struct platform_device *pdev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static struct platform_driver lmp92001_dac_driver =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.<a href=3D"http://driver.name" rel=3D"noreferr=
er" target=3D"_blank">driver.name</a>=C2=A0 =C2=A0 =3D &quot;lmp92001-dac&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D lm=
p92001_dac_probe,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D lm=
p92001_dac_remove,<br>
+};<br>
+<br>
+static int __init lmp92001_dac_init(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return platform_driver_register(&amp;<wbr>lmp92=
001_dac_driver);<br>
+}<br>
+subsys_initcall(lmp92001_dac_<wbr>init);<br>
+<br>
+static void __exit lmp92001_dac_exit(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0platform_driver_unregister(&amp;<wbr>lmp92001_d=
ac_driver);<br>
+}<br>
+module_exit(lmp92001_dac_<wbr>exit);<br>
+<br>
+MODULE_AUTHOR(&quot;Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@gmail.=
com">s.abhisit@gmail.com</a>&gt;&quot;);<br>
+MODULE_DESCRIPTION(&quot;IIO DAC interface for TI LMP92001&quot;);<br>
+MODULE_LICENSE(&quot;GPL&quot;);<br>
+MODULE_ALIAS(&quot;platform:<wbr>lmp92001-dac&quot;);<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
2.13.0<br>
<br>
</font></span></div><br></div></div>

--001a1140ddb43fc4a3055806c54d--
