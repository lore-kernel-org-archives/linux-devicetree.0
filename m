Return-Path: <SRS0=VjFt=AB=gmail.com=s.abhisit@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170830182100.9311-1-s.abhisit@gmail.com>
References: <20170830182100.9311-1-s.abhisit@gmail.com>
From: Abhisit Sangjan <s.abhisit@gmail.com>
Date: Thu, 31 Aug 2017 13:30:44 +0700
Message-ID: <CAMV_pUbeKEYuLpSXZwXL9+vqs-PK89_rJGtg=5uuVqfXxmcosQ@mail.gmail.com>
Subject: Fwd: [PATCH 4/5] lmp92001: mfd: gpio: Add support LMP92001
Content-Type: multipart/alternative; boundary="f403045ec3c2bbdca5055806c895"
To: Lee Jones <lee.jones@linaro.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, jmondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: knaack.h@gmx.de, lars@metafoo.de, fabrice.gasnier@st.com, Rob Herring <robh@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>, marek.vasut+renesas@gmail.com, jacopo+renesas@jmondi.org, mike.looijmans@topic.nl, peda@axentia.se, =?UTF-8?Q?Jean=2DFran=C3=A7ois_Dagenais?= <jeff.dagenais@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, lukas@wunner.de, Adriana Reus <adi.reus@gmail.com>, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--f403045ec3c2bbdca5055806c895
Content-Type: text/plain; charset="UTF-8"

Send all parts to all cc'd people to save your time tracking down all
patches of this.

---------- Forwarded message ----------
From: <s.abhisit@gmail.com>
Date: Thu, Aug 31, 2017 at 1:21 AM
Subject: [PATCH 4/5] lmp92001: mfd: gpio: Add support LMP92001
To: linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
pmeerw@pmeerw.net, Jonathan.Cameron@huawei.com, jacopo@jmondi.org,
lars@metafoo.de, Abhisit Sangjan <s.abhisit@gmail.com>


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
 drivers/gpio/Kconfig         |   7 ++
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-lmp92001.c | 202 ++++++++++++++++++++++++++++++
+++++++++++++
 3 files changed, 210 insertions(+)
 create mode 100644 drivers/gpio/gpio-lmp92001.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 461d6fc3688b..5962ea0d6745 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -948,6 +948,13 @@ config GPIO_KEMPLD
          This driver can also be built as a module. If so, the module will
be
          called gpio-kempld.

+config GPIO_LMP92001
+       tristate "LMP92001 GPIOs"
+       depends on MFD_LMP92001
+       help
+         Say yes here to access the GPIO signals of TI LMP92001 Analog
System
+         Monitor and Controller.
+
 config GPIO_LP3943
        tristate "TI/National Semiconductor LP3943 GPIO expander"
        depends on MFD_LP3943
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index a9fda6c55113..560d59c67758 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -62,6 +62,7 @@ obj-$(CONFIG_GPIO_JANZ_TTL)   += gpio-janz-ttl.o
 obj-$(CONFIG_GPIO_KEMPLD)      += gpio-kempld.o
 obj-$(CONFIG_ARCH_KS8695)      += gpio-ks8695.o
 obj-$(CONFIG_GPIO_INTEL_MID)   += gpio-intel-mid.o
+obj-$(CONFIG_GPIO_LMP92001)    += gpio-lmp92001.o
 obj-$(CONFIG_GPIO_LOONGSON)    += gpio-loongson.o
 obj-$(CONFIG_GPIO_LP3943)      += gpio-lp3943.o
 obj-$(CONFIG_GPIO_LPC18XX)     += gpio-lpc18xx.o
diff --git a/drivers/gpio/gpio-lmp92001.c b/drivers/gpio/gpio-lmp92001.c
new file mode 100644
index 000000000000..4079e362e9b3
--- /dev/null
+++ b/drivers/gpio/gpio-lmp92001.c
@@ -0,0 +1,202 @@
+/*
+ * gpio-lmp92001.c - Support for TI LMP92001 GPIOs
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
+#include <linux/bitops.h>
+#include <linux/gpio/driver.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+#include <linux/mfd/lmp92001/core.h>
+
+struct lmp92001_gpio {
+       struct lmp92001 *lmp92001;
+       struct gpio_chip gpio_chip;
+};
+
+static int lmp92001_gpio_get_direction(struct gpio_chip *chip, unsigned
offset)
+{
+       struct lmp92001_gpio *lmp92001_gpio = gpiochip_get_data(chip);
+       struct lmp92001 *lmp92001 = lmp92001_gpio->lmp92001;
+       unsigned int val;
+       int ret;
+
+       ret = regmap_read(lmp92001->regmap, LMP92001_CGPO, &val);
+       if (ret < 0)
+               return ret;
+
+       return !!(val & BIT(offset));
+}
+
+static int lmp92001_gpio_direction_in(struct gpio_chip *chip, unsigned
offset)
+{
+       struct lmp92001_gpio *lmp92001_gpio = gpiochip_get_data(chip);
+       struct lmp92001 *lmp92001 = lmp92001_gpio->lmp92001;
+
+       return regmap_update_bits(lmp92001->regmap, LMP92001_CGPO,
BIT(offset),
+                                       BIT(offset));
+}
+
+static int lmp92001_gpio_get(struct gpio_chip *chip, unsigned offset)
+{
+       struct lmp92001_gpio *lmp92001_gpio = gpiochip_get_data(chip);
+       struct lmp92001 *lmp92001 = lmp92001_gpio->lmp92001;
+       unsigned int val, sgen;
+
+       /*
+        * Does the GPIO input mode?
+        * Does the GPIO set?
+        * Reading indicated logic level.
+        * Clear indicated logic level.
+        */
+       regmap_read(lmp92001->regmap, LMP92001_CGPO, &val);
+       if ((val >> offset) & BIT(0)) {
+               regmap_read(lmp92001->regmap, LMP92001_SGEN, &sgen);
+               if (sgen & SGEN_GPI) {
+                       regmap_read(lmp92001->regmap, LMP92001_SGPI, &val);
+                       regmap_update_bits(lmp92001->regmap, LMP92001_CGPO,
+                                               0xFF, val);
+               }
+       }
+
+       return !!(val & BIT(offset));
+}
+
+static int lmp92001_gpio_direction_out(struct gpio_chip *chip, unsigned
offset,
+       int value)
+{
+       struct lmp92001_gpio *lmp92001_gpio = gpiochip_get_data(chip);
+       struct lmp92001 *lmp92001 = lmp92001_gpio->lmp92001;
+
+       return regmap_update_bits(lmp92001->regmap, LMP92001_CGPO,
BIT(offset),
+                                       0 /* 0 << offset */);
+}
+
+static void lmp92001_gpio_set(struct gpio_chip *chip, unsigned offset,
+       int value)
+{
+       struct lmp92001_gpio *lmp92001_gpio = gpiochip_get_data(chip);
+       struct lmp92001 *lmp92001 = lmp92001_gpio->lmp92001;
+
+       regmap_update_bits(lmp92001->regmap, LMP92001_CGPO, BIT(offset),
+                               value << offset);
+}
+
+#ifdef CONFIG_DEBUG_FS
+static void lmp92001_gpio_dbg_show(struct seq_file *s, struct gpio_chip
*chip)
+{
+       struct lmp92001_gpio *lmp92001_gpio = gpiochip_get_data(chip);
+       struct lmp92001 *lmp92001 = lmp92001_gpio->lmp92001;
+       int i, gpio;
+       unsigned int cgpo;
+       const char *label, *dir, *logic;
+
+       for (i = 0; i < chip->ngpio; i++) {
+               gpio = i + chip->base;
+
+               label = gpiochip_is_requested(chip, i);
+               if (!label)
+                       continue;
+
+               regmap_read(lmp92001->regmap, LMP92001_CGPO, &cgpo);
+               if ((cgpo >> i) & BIT(0))
+                       dir = "in";
+               else
+                       dir = "out";
+
+               if (lmp92001_gpio_get(chip, i))
+                       logic = "hi";
+               else
+                       logic = "lo";
+
+               seq_printf(s, " gpio-%-3d (%-20.20s) %-3.3s %-2.2s\n",
+                               gpio, label, dir, logic);
+       }
+}
+#else
+#define lmp92001_gpio_dbg_show NULL
+#endif
+
+static struct gpio_chip lmp92001_gpio_chip = {
+       .label                  = "lmp92001",
+       .owner                  = THIS_MODULE,
+       .get_direction          = lmp92001_gpio_get_direction,
+       .direction_input        = lmp92001_gpio_direction_in,
+       .get                    = lmp92001_gpio_get,
+       .direction_output       = lmp92001_gpio_direction_out,
+       .set                    = lmp92001_gpio_set,
+       .dbg_show               = lmp92001_gpio_dbg_show,
+};
+
+static int lmp92001_gpio_probe(struct platform_device *pdev)
+{
+       struct lmp92001 *lmp92001 = dev_get_drvdata(pdev->dev.parent);
+       struct lmp92001_gpio *lmp92001_gpio;
+       int ret;
+
+       lmp92001_gpio = devm_kzalloc(&pdev->dev, sizeof(*lmp92001_gpio),
+                                       GFP_KERNEL);
+       if (!lmp92001_gpio)
+               return -ENOMEM;
+
+       lmp92001_gpio->lmp92001 = lmp92001;
+       lmp92001_gpio->gpio_chip = lmp92001_gpio_chip;
+       lmp92001_gpio->gpio_chip.ngpio = 8;
+       lmp92001_gpio->gpio_chip.parent = &pdev->dev;
+       lmp92001_gpio->gpio_chip.base = -1;
+
+       ret = devm_gpiochip_add_data(&pdev->dev, &lmp92001_gpio->gpio_chip,
+                                       lmp92001_gpio);
+       if (ret < 0) {
+               dev_err(&pdev->dev, "could not register gpiochip, %d\n",
ret);
+               return ret;
+       }
+
+       platform_set_drvdata(pdev, lmp92001_gpio);
+
+       return ret;
+}
+
+static int lmp92001_gpio_remove(struct platform_device *pdev)
+{
+       return 0;
+}
+
+static struct platform_driver lmp92001_gpio_driver = {
+       .driver.name    = "lmp92001-gpio",
+       .probe          = lmp92001_gpio_probe,
+       .remove         = lmp92001_gpio_remove,
+};
+
+static int __init lmp92001_gpio_init(void)
+{
+       return platform_driver_register(&lmp92001_gpio_driver);
+}
+subsys_initcall(lmp92001_gpio_init);
+
+static void __exit lmp92001_gpio_exit(void)
+{
+       platform_driver_unregister(&lmp92001_gpio_driver);
+}
+module_exit(lmp92001_gpio_exit);
+
+MODULE_AUTHOR("Abhisit Sangjan <s.abhisit@gmail.com>");
+MODULE_DESCRIPTION("GPIO interface for TI LMP92001");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:lmp92001-gpio");
--
2.13.0

--f403045ec3c2bbdca5055806c895
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size:12.8px">Send all parts to all cc&=
#39;d people to save your time=C2=A0</span><span style=3D"font-size:12.8px"=
>tracking down all patches of this.</span><div><span style=3D"font-size:12.=
8px"><br></span><div class=3D"gmail_quote">---------- Forwarded message ---=
-------<br>From: <b class=3D"gmail_sendername"></b> <span dir=3D"ltr">&lt;<=
a href=3D"mailto:s.abhisit@gmail.com">s.abhisit@gmail.com</a>&gt;</span><br=
>Date: Thu, Aug 31, 2017 at 1:21 AM<br>Subject: [PATCH 4/5] lmp92001: mfd: =
gpio: Add support LMP92001<br>To: <a href=3D"mailto:linus.walleij@linaro.or=
g">linus.walleij@linaro.org</a><br>Cc: <a href=3D"mailto:linux-kernel@vger.=
kernel.org">linux-kernel@vger.kernel.org</a>, <a href=3D"mailto:linux-gpio@=
vger.kernel.org">linux-gpio@vger.kernel.org</a>, <a href=3D"mailto:pmeerw@p=
meerw.net">pmeerw@pmeerw.net</a>, <a href=3D"mailto:Jonathan.Cameron@huawei=
.com">Jonathan.Cameron@huawei.com</a>, <a href=3D"mailto:jacopo@jmondi.org"=
>jacopo@jmondi.org</a>, <a href=3D"mailto:lars@metafoo.de">lars@metafoo.de<=
/a>, Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@gmail.com">s.abhisit@g=
mail.com</a>&gt;<br><br><br>From: Abhisit Sangjan &lt;<a href=3D"mailto:s.a=
bhisit@gmail.com">s.abhisit@gmail.com</a>&gt;<br>
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
=C2=A0drivers/gpio/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07=
 ++<br>
=C2=A0drivers/gpio/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br=
>
=C2=A0drivers/gpio/gpio-lmp92001.c | 202 ++++++++++++++++++++++++++++++<wbr=
>+++++++++++++<br>
=C2=A03 files changed, 210 insertions(+)<br>
=C2=A0create mode 100644 drivers/gpio/gpio-lmp92001.c<br>
<br>
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig<br>
index 461d6fc3688b..5962ea0d6745 100644<br>
--- a/drivers/gpio/Kconfig<br>
+++ b/drivers/gpio/Kconfig<br>
@@ -948,6 +948,13 @@ config GPIO_KEMPLD<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This driver can also be built as a modul=
e. If so, the module will be<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 called gpio-kempld.<br>
<br>
+config GPIO_LMP92001<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;LMP92001 GPIOs&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on MFD_LMP92001<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Say yes here to access the GPIO signals =
of TI LMP92001 Analog System<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Monitor and Controller.<br>
+<br>
=C2=A0config GPIO_LP3943<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tristate &quot;TI/National Semiconductor LP3943=
 GPIO expander&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on MFD_LP3943<br>
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile<br>
index a9fda6c55113..560d59c67758 100644<br>
--- a/drivers/gpio/Makefile<br>
+++ b/drivers/gpio/Makefile<br>
@@ -62,6 +62,7 @@ obj-$(CONFIG_GPIO_JANZ_TTL)=C2=A0 =C2=A0+=3D gpio-janz-tt=
l.o<br>
=C2=A0obj-$(CONFIG_GPIO_KEMPLD)=C2=A0 =C2=A0 =C2=A0 +=3D gpio-kempld.o<br>
=C2=A0obj-$(CONFIG_ARCH_KS8695)=C2=A0 =C2=A0 =C2=A0 +=3D gpio-ks8695.o<br>
=C2=A0obj-$(CONFIG_GPIO_INTEL_MID)=C2=A0 =C2=A0+=3D gpio-intel-mid.o<br>
+obj-$(CONFIG_GPIO_LMP92001)=C2=A0 =C2=A0 +=3D gpio-lmp92001.o<br>
=C2=A0obj-$(CONFIG_GPIO_LOONGSON)=C2=A0 =C2=A0 +=3D gpio-loongson.o<br>
=C2=A0obj-$(CONFIG_GPIO_LP3943)=C2=A0 =C2=A0 =C2=A0 +=3D gpio-lp3943.o<br>
=C2=A0obj-$(CONFIG_GPIO_LPC18XX)=C2=A0 =C2=A0 =C2=A0+=3D gpio-lpc18xx.o<br>
diff --git a/drivers/gpio/gpio-lmp92001.c b/drivers/gpio/gpio-lmp92001.c<br=
>
new file mode 100644<br>
index 000000000000..4079e362e9b3<br>
--- /dev/null<br>
+++ b/drivers/gpio/gpio-lmp92001.c<br>
@@ -0,0 +1,202 @@<br>
+/*<br>
+ * gpio-lmp92001.c - Support for TI LMP92001 GPIOs<br>
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
+#include &lt;linux/bitops.h&gt;<br>
+#include &lt;linux/gpio/driver.h&gt;<br>
+#include &lt;linux/kernel.h&gt;<br>
+#include &lt;linux/module.h&gt;<br>
+<br>
+#include &lt;linux/mfd/lmp92001/core.h&gt;<br>
+<br>
+struct lmp92001_gpio {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gpio_chip gpio_chip;<br>
+};<br>
+<br>
+static int lmp92001_gpio_get_direction(<wbr>struct gpio_chip *chip, unsign=
ed offset)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001_gpio *lmp92001_gpio =3D gpiochi=
p_get_data(chip);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D lmp92001_gpio-&gt=
;lmp92001;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int val;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap, LMP920=
01_CGPO, &amp;val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return !!(val &amp; BIT(offset));<br>
+}<br>
+<br>
+static int lmp92001_gpio_direction_in(<wbr>struct gpio_chip *chip, unsigne=
d offset)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001_gpio *lmp92001_gpio =3D gpiochi=
p_get_data(chip);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D lmp92001_gpio-&gt=
;lmp92001;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return regmap_update_bits(lmp92001-&gt;<wbr>reg=
map, LMP92001_CGPO, BIT(offset),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(offse=
t));<br>
+}<br>
+<br>
+static int lmp92001_gpio_get(struct gpio_chip *chip, unsigned offset)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001_gpio *lmp92001_gpio =3D gpiochi=
p_get_data(chip);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D lmp92001_gpio-&gt=
;lmp92001;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int val, sgen;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Does the GPIO input mode?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Does the GPIO set?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Reading indicated logic level.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Clear indicated logic level.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_read(lmp92001-&gt;regmap, LMP92001_CGPO,=
 &amp;val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((val &gt;&gt; offset) &amp; BIT(0)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_read(lmp9200=
1-&gt;regmap, LMP92001_SGEN, &amp;sgen);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sgen &amp; SGEN=
_GPI) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0regmap_read(lmp92001-&gt;regmap, LMP92001_SGPI, &amp;val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0regmap_update_bits(lmp92001-&gt;<wbr>regmap, LMP92001_CGPO,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00xFF, val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return !!(val &amp; BIT(offset));<br>
+}<br>
+<br>
+static int lmp92001_gpio_direction_out(<wbr>struct gpio_chip *chip, unsign=
ed offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int value)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001_gpio *lmp92001_gpio =3D gpiochi=
p_get_data(chip);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D lmp92001_gpio-&gt=
;lmp92001;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return regmap_update_bits(lmp92001-&gt;<wbr>reg=
map, LMP92001_CGPO, BIT(offset),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 /* 0 &l=
t;&lt; offset */);<br>
+}<br>
+<br>
+static void lmp92001_gpio_set(struct gpio_chip *chip, unsigned offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int value)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001_gpio *lmp92001_gpio =3D gpiochi=
p_get_data(chip);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D lmp92001_gpio-&gt=
;lmp92001;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(lmp92001-&gt;<wbr>regmap, LM=
P92001_CGPO, BIT(offset),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value &lt;&lt; offset);<br>
+}<br>
+<br>
+#ifdef CONFIG_DEBUG_FS<br>
+static void lmp92001_gpio_dbg_show(struct seq_file *s, struct gpio_chip *c=
hip)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001_gpio *lmp92001_gpio =3D gpiochi=
p_get_data(chip);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D lmp92001_gpio-&gt=
;lmp92001;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i, gpio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int cgpo;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *label, *dir, *logic;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; chip-&gt;ngpio; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio =3D i + chip-&=
gt;base;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D gpiochip_=
is_requested(chip, i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!label)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0continue;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_read(lmp9200=
1-&gt;regmap, LMP92001_CGPO, &amp;cgpo);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((cgpo &gt;&gt; =
i) &amp; BIT(0))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dir =3D &quot;in&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dir =3D &quot;out&quot;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (lmp92001_gpio_g=
et(chip, i))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0logic =3D &quot;hi&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0logic =3D &quot;lo&quot;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0seq_printf(s, &quot=
; gpio-%-3d (%-20.20s) %-3.3s %-2.2s\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio, label, dir, logic);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
+#else<br>
+#define lmp92001_gpio_dbg_show NULL<br>
+#endif<br>
+<br>
+static struct gpio_chip lmp92001_gpio_chip =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.label=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D &quot;lmp92001&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.owner=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D THIS_MODULE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.get_direction=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D lmp92001_gpio_get_direction,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.direction_input=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 lmp92001_gpio_direction_in,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.get=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D lmp92001_gpio_get,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.direction_output=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 lmp92001_gpio_direction_out,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.set=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D lmp92001_gpio_set,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.dbg_show=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D lmp92001_gpio_dbg_show,<br>
+};<br>
+<br>
+static int lmp92001_gpio_probe(struct platform_device *pdev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D dev_get_drvdata(p=
dev-&gt;dev.<wbr>parent);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001_gpio *lmp92001_gpio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lmp92001_gpio =3D devm_kzalloc(&amp;pdev-&gt;de=
v, sizeof(*lmp92001_gpio),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GFP_KERNE=
L);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!lmp92001_gpio)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lmp92001_gpio-&gt;lmp92001 =3D lmp92001;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lmp92001_gpio-&gt;gpio_chip =3D lmp92001_gpio_c=
hip;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lmp92001_gpio-&gt;gpio_chip.ngpio =3D 8;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lmp92001_gpio-&gt;gpio_chip.<wbr>parent =3D &am=
p;pdev-&gt;dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lmp92001_gpio-&gt;gpio_chip.base =3D -1;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D devm_gpiochip_add_data(&amp;pdev-&gt;<w=
br>dev, &amp;lmp92001_gpio-&gt;gpio_chip,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lmp92001_=
gpio);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&=
gt;dev, &quot;could not register gpiochip, %d\n&quot;, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, lmp92001_gpio);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
+<br>
+static int lmp92001_gpio_remove(struct platform_device *pdev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static struct platform_driver lmp92001_gpio_driver =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.<a href=3D"http://driver.name" rel=3D"noreferr=
er" target=3D"_blank">driver.name</a>=C2=A0 =C2=A0 =3D &quot;lmp92001-gpio&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D lm=
p92001_gpio_probe,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D lm=
p92001_gpio_remove,<br>
+};<br>
+<br>
+static int __init lmp92001_gpio_init(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return platform_driver_register(&amp;<wbr>lmp92=
001_gpio_driver);<br>
+}<br>
+subsys_initcall(lmp92001_<wbr>gpio_init);<br>
+<br>
+static void __exit lmp92001_gpio_exit(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0platform_driver_unregister(&amp;<wbr>lmp92001_g=
pio_driver);<br>
+}<br>
+module_exit(lmp92001_gpio_<wbr>exit);<br>
+<br>
+MODULE_AUTHOR(&quot;Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@gmail.=
com">s.abhisit@gmail.com</a>&gt;&quot;);<br>
+MODULE_DESCRIPTION(&quot;GPIO interface for TI LMP92001&quot;);<br>
+MODULE_LICENSE(&quot;GPL&quot;);<br>
+MODULE_ALIAS(&quot;platform:<wbr>lmp92001-gpio&quot;);<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
2.13.0<br>
<br>
</font></span></div><br></div></div>

--f403045ec3c2bbdca5055806c895--
