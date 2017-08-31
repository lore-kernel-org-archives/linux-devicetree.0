Return-Path: <SRS0=VjFt=AB=gmail.com=s.abhisit@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170830180720.8426-1-s.abhisit@gmail.com>
References: <20170830180720.8426-1-s.abhisit@gmail.com>
From: Abhisit Sangjan <s.abhisit@gmail.com>
Date: Thu, 31 Aug 2017 13:27:30 +0700
Message-ID: <CAMV_pUZwOgkRfs4+pbTifpPVOwy8Y2w7UFL1fda4HkVkYqXR4w@mail.gmail.com>
Subject: Fwd: [PATCH 1/5] lmp92001: mfd: Add support TI LMP92001
Content-Type: multipart/alternative; boundary="001a1140ddb43791a5055806bd52"
To: Lee Jones <lee.jones@linaro.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, jmondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: knaack.h@gmx.de, lars@metafoo.de, fabrice.gasnier@st.com, Rob Herring <robh@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>, marek.vasut+renesas@gmail.com, jacopo+renesas@jmondi.org, mike.looijmans@topic.nl, peda@axentia.se, =?UTF-8?Q?Jean=2DFran=C3=A7ois_Dagenais?= <jeff.dagenais@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, lukas@wunner.de, Adriana Reus <adi.reus@gmail.com>, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--001a1140ddb43791a5055806bd52
Content-Type: text/plain; charset="UTF-8"

Send all parts to all cc'd people to save your time tracking down all
patches of this.

---------- Forwarded message ----------
From: <s.abhisit@gmail.com>
Date: Thu, Aug 31, 2017 at 1:07 AM
Subject: [PATCH 1/5] lmp92001: mfd: Add support TI LMP92001
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org, Abhisit Sangjan <s.abhisit@gmail.com>


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
 drivers/mfd/Kconfig                |  12 ++
 drivers/mfd/Makefile               |   4 +
 drivers/mfd/lmp92001-core.c        | 307 ++++++++++++++++++++++++++++++
+++++++
 drivers/mfd/lmp92001-debug.c       |  64 ++++++++
 drivers/mfd/lmp92001-i2c.c         | 211 +++++++++++++++++++++++++
 include/linux/mfd/lmp92001/core.h  | 135 ++++++++++++++++
 include/linux/mfd/lmp92001/debug.h |  27 ++++
 7 files changed, 760 insertions(+)
 create mode 100644 drivers/mfd/lmp92001-core.c
 create mode 100644 drivers/mfd/lmp92001-debug.c
 create mode 100644 drivers/mfd/lmp92001-i2c.c
 create mode 100644 include/linux/mfd/lmp92001/core.h
 create mode 100644 include/linux/mfd/lmp92001/debug.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 94ad2c1c3d90..a20389a30cf8 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1528,6 +1528,18 @@ config MFD_LM3533
          additional drivers must be enabled in order to use the LED,
          backlight or ambient-light-sensor functionality of the device.

+config MFD_LMP92001
+       tristate "TI LMP92001 Analog System Monitor and Controller"
+       depends on I2C
+       select MFD_CORE
+       select REGMAP_I2C
+       help
+         Say yes here to enable support for TI LMP92001 Analog System
+         Monitor and Controller
+
+         This driver provide support for 16 ADC, 12 DAC, Voltage Reference,
+         Analog Temperature Sensor and 8-bit GPIO Port.
+
 config MFD_TIMBERDALE
        tristate "Timberdale FPGA"
        select MFD_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 080793b3fd0e..20d2e65d503a 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -199,6 +199,10 @@ obj-$(CONFIG_MFD_RN5T618)  += rn5t618.o
 obj-$(CONFIG_MFD_SEC_CORE)     += sec-core.o sec-irq.o
 obj-$(CONFIG_MFD_SYSCON)       += syscon.o
 obj-$(CONFIG_MFD_LM3533)       += lm3533-core.o lm3533-ctrlbank.o
+
+lmp92001-objs                  := lmp92001-core.o lmp92001-i2c.o
lmp92001-debug.o
+obj-$(CONFIG_MFD_LMP92001)     += lmp92001.o
+
 obj-$(CONFIG_MFD_VEXPRESS_SYSREG)      += vexpress-sysreg.o
 obj-$(CONFIG_MFD_RETU)         += retu-mfd.o
 obj-$(CONFIG_MFD_AS3711)       += as3711.o
diff --git a/drivers/mfd/lmp92001-core.c b/drivers/mfd/lmp92001-core.c
new file mode 100644
index 000000000000..5ee315ce61bb
--- /dev/null
+++ b/drivers/mfd/lmp92001-core.c
@@ -0,0 +1,307 @@
+/*
+ * lmp92001-core.c - Device access for TI LMP92001
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
+#include <linux/mfd/lmp92001/core.h>
+#include <linux/mfd/lmp92001/debug.h>
+
+static const struct mfd_cell lmp92001_devs[] = {
+       {
+               .name = "lmp92001-gpio",
+               .of_compatible = "ti,lmp92001-gpio",
+       },
+       {
+               .name = "lmp92001-adc",
+               .of_compatible = "ti,lmp92001-adc",
+       },
+       {
+               .name = "lmp92001-dac",
+               .of_compatible = "ti,lmp92001-dac",
+       },
+};
+
+static struct reg_default lmp92001_defaults[] = {
+       { LMP92001_SGEN,  0x40   },
+       { LMP92001_SHIL,  0x00   },
+       { LMP92001_SLOL,  0x00   },
+       { LMP92001_CGEN,  0x00   },
+       { LMP92001_CDAC,  0x03   },
+       { LMP92001_CGPO,  0xFF   },
+       { LMP92001_CINH,  0x00   },
+       { LMP92001_CINL,  0x00   },
+       { LMP92001_CAD1,  0x00   },
+       { LMP92001_CAD2,  0x00   },
+       { LMP92001_CAD3,  0x00   },
+       { LMP92001_CTRIG, 0x00   },
+       { LMP92001_CREF,  0x07   },
+       { LMP92001_ADC1,  0x0000 },
+       { LMP92001_ADC2,  0x0000 },
+       { LMP92001_ADC3,  0x0000 },
+       { LMP92001_ADC4,  0x0000 },
+       { LMP92001_ADC5,  0x0000 },
+       { LMP92001_ADC6,  0x0000 },
+       { LMP92001_ADC7,  0x0000 },
+       { LMP92001_ADC8,  0x0000 },
+       { LMP92001_ADC9,  0x0000 },
+       { LMP92001_ADC10, 0x0000 },
+       { LMP92001_ADC11, 0x0000 },
+       { LMP92001_ADC12, 0x0000 },
+       { LMP92001_ADC13, 0x0000 },
+       { LMP92001_ADC14, 0x0000 },
+       { LMP92001_ADC15, 0x0000 },
+       { LMP92001_ADC16, 0x0000 },
+       { LMP92001_LIH1,  0x0FFF },
+       { LMP92001_LIH2,  0x0FFF },
+       { LMP92001_LIH3,  0x0FFF },
+       { LMP92001_LIH9,  0x0FFF },
+       { LMP92001_LIH10, 0x0FFF },
+       { LMP92001_LIH11, 0x0FFF },
+       { LMP92001_LIL1,  0x0000 },
+       { LMP92001_LIL2,  0x0000 },
+       { LMP92001_LIL3,  0x0000 },
+       { LMP92001_LIL9,  0x0000 },
+       { LMP92001_LIL10, 0x0000 },
+       { LMP92001_LIL11, 0x0000 },
+       { LMP92001_DAC1,  0x0000 },
+       { LMP92001_DAC2,  0x0000 },
+       { LMP92001_DAC3,  0x0000 },
+       { LMP92001_DAC4,  0x0000 },
+       { LMP92001_DAC5,  0x0000 },
+       { LMP92001_DAC6,  0x0000 },
+       { LMP92001_DAC7,  0x0000 },
+       { LMP92001_DAC8,  0x0000 },
+       { LMP92001_DAC9,  0x0000 },
+       { LMP92001_DAC10, 0x0000 },
+       { LMP92001_DAC11, 0x0000 },
+       { LMP92001_DAC12, 0x0000 },
+       { LMP92001_DALL,  0x0000 },
+};
+
+static bool lmp92001_reg_readable(struct device *dev, unsigned int reg)
+{
+       switch (reg) {
+       case LMP92001_ID:
+       case LMP92001_VER:
+       case LMP92001_SGEN:
+       case LMP92001_SGPI:
+       case LMP92001_SHIL:
+       case LMP92001_SLOL:
+       case LMP92001_CGEN:
+       case LMP92001_CDAC:
+       case LMP92001_CGPO:
+       case LMP92001_CINH:
+       case LMP92001_CINL:
+       case LMP92001_CAD1:
+       case LMP92001_CAD2:
+       case LMP92001_CAD3:
+       case LMP92001_ADC1:
+       case LMP92001_ADC2:
+       case LMP92001_ADC3:
+       case LMP92001_ADC4:
+       case LMP92001_ADC5:
+       case LMP92001_ADC6:
+       case LMP92001_ADC7:
+       case LMP92001_ADC8:
+       case LMP92001_ADC9:
+       case LMP92001_ADC10:
+       case LMP92001_ADC11:
+       case LMP92001_ADC12:
+       case LMP92001_ADC13:
+       case LMP92001_ADC14:
+       case LMP92001_ADC15:
+       case LMP92001_ADC16:
+       case LMP92001_ADC17:
+       case LMP92001_LIH1:
+       case LMP92001_LIH2:
+       case LMP92001_LIH3:
+       case LMP92001_LIH9:
+       case LMP92001_LIH10:
+       case LMP92001_LIH11:
+       case LMP92001_LIL1:
+       case LMP92001_LIL2:
+       case LMP92001_LIL3:
+       case LMP92001_LIL9:
+       case LMP92001_LIL10:
+       case LMP92001_LIL11:
+       case LMP92001_CREF:
+       case LMP92001_DAC1:
+       case LMP92001_DAC2:
+       case LMP92001_DAC3:
+       case LMP92001_DAC4:
+       case LMP92001_DAC5:
+       case LMP92001_DAC6:
+       case LMP92001_DAC7:
+       case LMP92001_DAC8:
+       case LMP92001_DAC9:
+       case LMP92001_DAC10:
+       case LMP92001_DAC11:
+       case LMP92001_DAC12:
+       case LMP92001_BLK0:
+       case LMP92001_BLK1:
+       case LMP92001_BLK2:
+       case LMP92001_BLK3:
+       case LMP92001_BLK4:
+       case LMP92001_BLK5:
+               return true;
+       default:
+               return false;
+       }
+}
+
+static bool lmp92001_reg_writeable(struct device *dev, unsigned int reg)
+{
+       switch (reg) {
+       case LMP92001_CGEN:
+       case LMP92001_CDAC:
+       case LMP92001_CGPO:
+       case LMP92001_CINH:
+       case LMP92001_CINL:
+       case LMP92001_CAD1:
+       case LMP92001_CAD2:
+       case LMP92001_CAD3:
+       case LMP92001_CTRIG:
+       case LMP92001_LIH1:
+       case LMP92001_LIH2:
+       case LMP92001_LIH3:
+       case LMP92001_LIH9:
+       case LMP92001_LIH10:
+       case LMP92001_LIH11:
+       case LMP92001_LIL1:
+       case LMP92001_LIL2:
+       case LMP92001_LIL3:
+       case LMP92001_LIL9:
+       case LMP92001_LIL10:
+       case LMP92001_LIL11:
+       case LMP92001_CREF:
+       case LMP92001_DAC1:
+       case LMP92001_DAC2:
+       case LMP92001_DAC3:
+       case LMP92001_DAC4:
+       case LMP92001_DAC5:
+       case LMP92001_DAC6:
+       case LMP92001_DAC7:
+       case LMP92001_DAC8:
+       case LMP92001_DAC9:
+       case LMP92001_DAC10:
+       case LMP92001_DAC11:
+       case LMP92001_DAC12:
+       case LMP92001_DALL:
+       case LMP92001_BLK0:
+       case LMP92001_BLK1:
+       case LMP92001_BLK4:
+       case LMP92001_BLK5:
+               return true;
+       default:
+               return false;
+       }
+}
+
+static bool lmp92001_reg_volatile(struct device *dev, unsigned int reg)
+{
+       switch (reg) {
+       case LMP92001_SGEN:
+       case LMP92001_SGPI:
+       case LMP92001_SHIL:
+       case LMP92001_SLOL:
+       case LMP92001_CGEN:
+       case LMP92001_ADC1:
+       case LMP92001_ADC2:
+       case LMP92001_ADC3:
+       case LMP92001_ADC4:
+       case LMP92001_ADC5:
+       case LMP92001_ADC6:
+       case LMP92001_ADC7:
+       case LMP92001_ADC8:
+       case LMP92001_ADC9:
+       case LMP92001_ADC10:
+       case LMP92001_ADC11:
+       case LMP92001_ADC12:
+       case LMP92001_ADC13:
+       case LMP92001_ADC14:
+       case LMP92001_ADC15:
+       case LMP92001_ADC16:
+       case LMP92001_ADC17:
+       case LMP92001_BLK2:
+       case LMP92001_BLK3:
+               return true;
+       default:
+               return false;
+       }
+}
+
+struct regmap_config lmp92001_regmap_config = {
+       .reg_bits = 8,
+       .val_bits = 16,
+
+       .cache_type = REGCACHE_RBTREE,
+
+       .reg_defaults = lmp92001_defaults,
+       .num_reg_defaults = ARRAY_SIZE(lmp92001_defaults),
+
+       .max_register = LMP92001_BLK5,
+       .readable_reg = lmp92001_reg_readable,
+       .writeable_reg = lmp92001_reg_writeable,
+       .volatile_reg = lmp92001_reg_volatile,
+};
+
+int lmp92001_device_init(struct lmp92001 *lmp92001, unsigned long id, int
irq)
+{
+       int ret;
+       unsigned int comid, ver;
+
+       dev_set_drvdata(lmp92001->dev, lmp92001);
+
+       ret = regmap_read(lmp92001->regmap, LMP92001_ID, &comid);
+       if (ret < 0) {
+               dev_err(lmp92001->dev, "failed to read Company ID: %d\n",
ret);
+               goto exit;
+       }
+
+       ret = regmap_read(lmp92001->regmap, LMP92001_VER, &ver);
+       if (ret < 0) {
+               dev_err(lmp92001->dev, "failed to read Version: %d\n", ret);
+               goto exit;
+       }
+
+       dev_info(lmp92001->dev, "Company ID 0x%.2x, Version 0x%.2x\n",
+                       comid, ver);
+
+       ret = mfd_add_devices(lmp92001->dev, PLATFORM_DEVID_AUTO,
+                               lmp92001_devs, ARRAY_SIZE(lmp92001_devs),
+                               NULL, 0, NULL);
+       if (ret != 0) {
+               dev_err(lmp92001->dev, "failed to add children\n");
+               goto exit;
+       }
+
+       ret = lmp92001_debug_init(lmp92001);
+       if (ret < 0) {
+               dev_err(lmp92001->dev, "failed to initial debug fs.\n");
+               goto exit;
+       }
+
+exit:
+       return ret;
+}
+
+void lmp92001_device_exit(struct lmp92001 *lmp92001)
+{
+       lmp92001_debug_exit(lmp92001);
+       mfd_remove_devices(lmp92001->dev);
+}
diff --git a/drivers/mfd/lmp92001-debug.c b/drivers/mfd/lmp92001-debug.c
new file mode 100644
index 000000000000..b1746dc810b3
--- /dev/null
+++ b/drivers/mfd/lmp92001-debug.c
@@ -0,0 +1,64 @@
+/*
+ * lmp92001-debug.c - Debug file system for TI LMP92001
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
+#include <linux/kernel.h>
+
+#include <linux/mfd/lmp92001/core.h>
+
+static ssize_t lmp92001_id_ver_show(struct device *dev,
+       struct device_attribute *attr, char *buf)
+{
+       struct lmp92001 *lmp92001 = dev_get_drvdata(dev);
+       int ret;
+       unsigned int comid, ver;
+
+       ret = regmap_read(lmp92001->regmap, LMP92001_ID, &comid);
+       if (ret < 0) {
+               dev_err(lmp92001->dev, "failed to read Company ID: %d\n",
ret);
+               return ret;
+       }
+
+       ret = regmap_read(lmp92001->regmap, LMP92001_VER, &ver);
+       if (ret < 0) {
+               dev_err(lmp92001->dev, "failed to read Version: %d\n", ret);
+               return ret;
+       }
+
+       return sprintf(buf, "Company ID 0x%02x (%d), Version 0x%02x (%d)\n",
+                       comid, comid, ver, ver);
+}
+static DEVICE_ATTR(lmp92001_id_ver, 0444, lmp92001_id_ver_show, NULL);
+
+int lmp92001_debug_init(struct lmp92001 *lmp92001)
+{
+       int ret;
+
+       ret = device_create_file(lmp92001->dev, &dev_attr_lmp92001_id_ver);
+       if (ret != 0)
+               dev_err(lmp92001->dev,
+                       "unique ID attribute is not created: %d\n", ret);
+
+       return ret;
+}
+
+void lmp92001_debug_exit(struct lmp92001 *lmp92001)
+{
+       device_remove_file(lmp92001->dev, &dev_attr_lmp92001_id_ver);
+}
diff --git a/drivers/mfd/lmp92001-i2c.c b/drivers/mfd/lmp92001-i2c.c
new file mode 100644
index 000000000000..e22ea88f5820
--- /dev/null
+++ b/drivers/mfd/lmp92001-i2c.c
@@ -0,0 +1,211 @@
+/*
+ * lmp92001-i2c.c - I2C access for TI LMP92001
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
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_gpio.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include <linux/mfd/lmp92001/core.h>
+
+static const unsigned short lmp92001_i2c_addresses[] = {
+       0x40, 0x42, 0x44, 0x46, 0x48, 0x4A, 0x4C, 0x4E, 0x50, I2C_CLIENT_END
+};
+
+/* TODO: To read/write block access, it may need to re-ordering
endianness! */
+static int lmp92001_reg_read(void *context, unsigned int reg, unsigned int
*val)
+{
+       struct device *dev = context;
+       struct i2c_client *i2c = to_i2c_client(dev);
+       int ret;
+
+       if (reg > 0xff)
+               return -EINVAL;
+
+       switch (reg) {
+       case LMP92001_ID ... LMP92001_CTRIG:
+       case LMP92001_CREF:
+               *val = ret = i2c_smbus_read_byte_data(i2c, reg);
+               break;
+       case LMP92001_ADC1 ... LMP92001_LIL11:
+       case LMP92001_DAC1 ... LMP92001_DALL:
+               *val = ret = i2c_smbus_read_word_swapped(i2c, reg);
+               break;
+       case LMP92001_BLK0 ... LMP92001_BLK5:
+               ret = i2c_smbus_read_block_data(i2c, reg,
+                                               (u8 *)((uintptr_t)*val));
+               break;
+       default:
+               return -EINVAL;
+       }
+
+       if (ret < 0)
+               return ret;
+
+       return 0;
+}
+
+static int lmp92001_reg_write(void *context, unsigned int reg, unsigned
int val)
+{
+       struct device *dev = context;
+       struct i2c_client *i2c = to_i2c_client(dev);
+       int ret;
+
+       if (reg > 0xff)
+               return -EINVAL;
+
+       switch (reg) {
+       case LMP92001_ID ... LMP92001_CTRIG:
+       case LMP92001_CREF:
+               ret = i2c_smbus_write_byte_data(i2c, reg, val);
+               break;
+       case LMP92001_ADC1 ... LMP92001_LIL11:
+       case LMP92001_DAC1 ... LMP92001_DALL:
+               ret = i2c_smbus_write_word_swapped(i2c, reg, val);
+               break;
+       /* To call this function/case, must be passed val as pointer */
+       case LMP92001_BLK0:
+       case LMP92001_BLK4:
+               ret = i2c_smbus_write_block_data(i2c, reg, 24,
+                                               (u8 *)((uintptr_t)val));
+               break;
+       case LMP92001_BLK1:
+       case LMP92001_BLK5:
+               ret = i2c_smbus_write_block_data(i2c, reg, 12,
+                                               (u8 *)((uintptr_t)val));
+               break;
+       case LMP92001_BLK2:
+               ret = i2c_smbus_write_block_data(i2c, reg, 34,
+                                               (u8 *)((uintptr_t)val));
+               break;
+       case LMP92001_BLK3:
+               ret = i2c_smbus_write_block_data(i2c, reg, 18,
+                                               (u8 *)((uintptr_t)val));
+               break;
+       default:
+               return -EINVAL;
+       }
+
+       return ret;
+}
+
+static int lmp92001_i2c_probe(struct i2c_client *i2c,
+       const struct i2c_device_id *id)
+{
+       struct lmp92001 *lmp92001;
+       int ret;
+
+       lmp92001 = devm_kzalloc(&i2c->dev, sizeof(struct lmp92001),
GFP_KERNEL);
+       if (!lmp92001)
+               return -ENOMEM;
+
+       i2c_set_clientdata(i2c, lmp92001);
+       lmp92001->dev = &i2c->dev;
+
+       lmp92001_regmap_config.reg_read = lmp92001_reg_read;
+       lmp92001_regmap_config.reg_write = lmp92001_reg_write;
+
+       lmp92001->regmap = devm_regmap_init(&i2c->dev, NULL, &i2c->dev,
+                                               &lmp92001_regmap_config);
+       if (IS_ERR(lmp92001->regmap)) {
+               ret = PTR_ERR(lmp92001->regmap);
+               dev_err(lmp92001->dev, "failed to allocate register map:
%d\n",
+                               ret);
+               return ret;
+       }
+
+       return lmp92001_device_init(lmp92001, id->driver_data, i2c->irq);
+}
+
+static int lmp92001_i2c_remove(struct i2c_client *i2c)
+{
+       struct lmp92001 *lmp92001 = i2c_get_clientdata(i2c);
+
+       lmp92001_device_exit(lmp92001);
+
+       return 0;
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id lmp92001_dt_ids[] = {
+       { .compatible = "ti,lmp92001", },
+       { },
+};
+MODULE_DEVICE_TABLE(of, lmp92001_dt_ids);
+#endif
+
+static const struct i2c_device_id lmp92001_i2c_ids[] = {
+       { "lmp92001" },
+       { },
+};
+MODULE_DEVICE_TABLE(i2c, lmp92001_i2c_ids);
+
+static int lmp92001_i2c_detect(struct i2c_client *i2c,
+       struct i2c_board_info *info)
+{
+       struct i2c_adapter *adapter = i2c->adapter;
+       s32 comid, ver;
+
+       if (!i2c_check_functionality(adapter,
+                                       I2C_FUNC_SMBUS_BYTE_DATA |
+                                       I2C_FUNC_SMBUS_WORD_DATA |
+                                       I2C_FUNC_SMBUS_BLOCK_DATA))
+               return -ENODEV;
+
+       comid = i2c_smbus_read_byte_data(i2c, LMP92001_ID);
+       ver = i2c_smbus_read_byte_data(i2c, LMP92001_VER);
+
+       if (comid != 0x01 || ver != 0x10)
+               return -ENODEV;
+
+       return 0;
+}
+
+static struct i2c_driver lmp92001_i2c_driver = {
+       .driver = {
+               .name = "lmp92001",
+               .of_match_table = of_match_ptr(lmp92001_dt_ids),
+       },
+       .probe          = lmp92001_i2c_probe,
+       .remove         = lmp92001_i2c_remove,
+       .id_table       = lmp92001_i2c_ids,
+       .detect         = lmp92001_i2c_detect,
+       .address_list   = lmp92001_i2c_addresses,
+};
+
+static int __init lmp92001_i2c_init(void)
+{
+       return i2c_add_driver(&lmp92001_i2c_driver);
+}
+subsys_initcall(lmp92001_i2c_init);
+
+static void __exit lmp92001_i2c_exit(void)
+{
+       i2c_del_driver(&lmp92001_i2c_driver);
+}
+module_exit(lmp92001_i2c_exit);
+
+MODULE_DESCRIPTION("i2c driver for TI LMP92001");
+MODULE_AUTHOR("Abhisit Sangjan <s.abhisit@gmail.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/lmp92001/core.h b/include/linux/mfd/lmp92001/
core.h
new file mode 100644
index 000000000000..81aabf8b8e7a
--- /dev/null
+++ b/include/linux/mfd/lmp92001/core.h
@@ -0,0 +1,135 @@
+/*
+ * include/linux/mfd/lmp92001/core.h - Core interface for TI LMP92001
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
+#ifndef __MFD_LMP92001_CORE_H__
+#define __MFD_LMP92001_CORE_H__
+
+#include <linux/device.h>
+#include <linux/mfd/core.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+
+/*
+ * Register values.
+ */
+/* ID */
+#define LMP92001_ID    0x0E
+#define LMP92001_VER   0x0F
+/* STATUS */
+#define LMP92001_SGEN  0x10
+#define LMP92001_SGPI  0x11
+#define LMP92001_SHIL  0x12
+#define LMP92001_SLOL  0x13
+/* CONTROL */
+#define LMP92001_CGEN  0x14
+#define LMP92001_CDAC  0x15
+#define LMP92001_CGPO  0x16
+#define LMP92001_CINH  0x17
+#define LMP92001_CINL  0x18
+#define LMP92001_CAD1  0x19
+#define LMP92001_CAD2  0x1A
+#define LMP92001_CAD3  0x1B
+#define LMP92001_CTRIG 0x1C
+/* ADC OUTPUT DATA */
+#define LMP92001_ADC1  0x20
+#define LMP92001_ADC2  0x21
+#define LMP92001_ADC3  0x22
+#define LMP92001_ADC4  0x23
+#define LMP92001_ADC5  0x24
+#define LMP92001_ADC6  0x25
+#define LMP92001_ADC7  0x26
+#define LMP92001_ADC8  0x27
+#define LMP92001_ADC9  0x28
+#define LMP92001_ADC10 0x29
+#define LMP92001_ADC11 0x2A
+#define LMP92001_ADC12 0x2B
+#define LMP92001_ADC13 0x2C
+#define LMP92001_ADC14 0x2D
+#define LMP92001_ADC15 0x2E
+#define LMP92001_ADC16 0x2F
+#define LMP92001_ADC17 0x30
+/* ADC WINDOW COMPARATOR LIMITS */
+#define LMP92001_LIH1  0x40
+#define LMP92001_LIH2  0x41
+#define LMP92001_LIH3  0x42
+#define LMP92001_LIH9  0x43
+#define LMP92001_LIH10 0x44
+#define LMP92001_LIH11 0x45
+#define LMP92001_LIL1  0x46
+#define LMP92001_LIL2  0x47
+#define LMP92001_LIL3  0x48
+#define LMP92001_LIL9  0x49
+#define LMP92001_LIL10 0x4A
+#define LMP92001_LIL11 0x4B
+/* INTERNAL REFERENCE CONTROL */
+#define LMP92001_CREF  0x66
+/* DAC INPUT DATA */
+#define LMP92001_DAC1  0x80
+#define LMP92001_DAC2  0x81
+#define LMP92001_DAC3  0x82
+#define LMP92001_DAC4  0x83
+#define LMP92001_DAC5  0x84
+#define LMP92001_DAC6  0x85
+#define LMP92001_DAC7  0x86
+#define LMP92001_DAC8  0x87
+#define LMP92001_DAC9  0x88
+#define LMP92001_DAC10 0x89
+#define LMP92001_DAC11 0x8A
+#define LMP92001_DAC12 0x8B
+#define LMP92001_DALL  0x90
+/* MEMORY MAPPED BLOCK COMMANDS */
+#define LMP92001_BLK0  0xF0
+#define LMP92001_BLK1  0xF1
+#define LMP92001_BLK2  0xF2
+#define LMP92001_BLK3  0xF3
+#define LMP92001_BLK4  0xF4
+#define LMP92001_BLK5  0xF5
+
+/*
+ * Helpful macros
+ */
+/* DAC */
+#define CDAC_OFF       BIT(0)
+#define CDAC_OLVL      BIT(1)
+#define CDAC_GANG      BIT(2)
+/* INT. REFERANCE ENABLE */
+#define CREF_DEXT      BIT(0)
+#define CREF_AEXT      BIT(1)
+/* GENERAL */
+#define CGEN_STRT      BIT(0)
+#define CGEN_LCK       BIT(1)
+#define CGEN_RST       BIT(7)
+/* STATUS: GENERNAL */
+#define SGEN_GPI       BIT(0)
+
+struct lmp92001 {
+       struct device *dev;
+       struct regmap *regmap;
+
+       struct mutex adc_lock;
+       struct mutex dac_lock;
+};
+
+extern struct regmap_config lmp92001_regmap_config;
+
+int lmp92001_device_init(struct lmp92001 *lmp92001, unsigned long id, int
irq);
+void lmp92001_device_exit(struct lmp92001 *lmp92001);
+
+#endif /* __MFD_LMP92001_CORE_H__ */
diff --git a/include/linux/mfd/lmp92001/debug.h
b/include/linux/mfd/lmp92001/debug.h
new file mode 100644
index 000000000000..e6fda7efc917
--- /dev/null
+++ b/include/linux/mfd/lmp92001/debug.h
@@ -0,0 +1,27 @@
+/*
+ * include/linux/mfd/lmp92001/debug.h - Debug interface for TI 92001
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
+#ifndef __MFD_LMP92001_DEBUG_H__
+#define __MFD_LMP92001_DEBUG_H__
+
+int lmp92001_debug_init(struct lmp92001 *lmp92001);
+void lmp92001_debug_exit(struct lmp92001 *lmp92001);
+
+#endif /* __MFD_LMP92001_DEBUG_H__ */
--
2.13.0

--001a1140ddb43791a5055806bd52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size:12.8px">Send all parts to all cc&=
#39;d people to save your time=C2=A0</span><span style=3D"font-size:12.8px"=
>tracking down all patches of this.</span><div><span style=3D"font-size:12.=
8px"><br></span><div class=3D"gmail_quote">---------- Forwarded message ---=
-------<br>From: <b class=3D"gmail_sendername"></b> <span dir=3D"ltr">&lt;<=
a href=3D"mailto:s.abhisit@gmail.com">s.abhisit@gmail.com</a>&gt;</span><br=
>Date: Thu, Aug 31, 2017 at 1:07 AM<br>Subject: [PATCH 1/5] lmp92001: mfd: =
Add support TI LMP92001<br>To: <a href=3D"mailto:lee.jones@linaro.org">lee.=
jones@linaro.org</a><br>Cc: <a href=3D"mailto:linux-kernel@vger.kernel.org"=
>linux-kernel@vger.kernel.org</a>, Abhisit Sangjan &lt;<a href=3D"mailto:s.=
abhisit@gmail.com">s.abhisit@gmail.com</a>&gt;<br><br><br>From: Abhisit San=
gjan &lt;<a href=3D"mailto:s.abhisit@gmail.com">s.abhisit@gmail.com</a>&gt;=
<br>
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
=C2=A0drivers/mfd/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 12 ++<br>
=C2=A0drivers/mfd/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0drivers/mfd/lmp92001-core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 307 ++++++++=
++++++++++++++++++++++<wbr>+++++++<br>
=C2=A0drivers/mfd/lmp92001-debug.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 64 +++=
+++++<br>
=C2=A0drivers/mfd/lmp92001-i2c.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 211 +++=
++++++++++++++++++++++<br>
=C2=A0include/linux/mfd/lmp92001/<wbr>core.h=C2=A0 | 135 ++++++++++++++++<b=
r>
=C2=A0include/linux/mfd/lmp92001/<wbr>debug.h |=C2=A0 27 ++++<br>
=C2=A07 files changed, 760 insertions(+)<br>
=C2=A0create mode 100644 drivers/mfd/lmp92001-core.c<br>
=C2=A0create mode 100644 drivers/mfd/lmp92001-debug.c<br>
=C2=A0create mode 100644 drivers/mfd/lmp92001-i2c.c<br>
=C2=A0create mode 100644 include/linux/mfd/lmp92001/<wbr>core.h<br>
=C2=A0create mode 100644 include/linux/mfd/lmp92001/<wbr>debug.h<br>
<br>
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig<br>
index 94ad2c1c3d90..a20389a30cf8 100644<br>
--- a/drivers/mfd/Kconfig<br>
+++ b/drivers/mfd/Kconfig<br>
@@ -1528,6 +1528,18 @@ config MFD_LM3533<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 additional drivers must be enabled in or=
der to use the LED,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 backlight or ambient-light-sensor functi=
onality of the device.<br>
<br>
+config MFD_LMP92001<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;TI LMP92001 Analog System Monito=
r and Controller&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on I2C<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select MFD_CORE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select REGMAP_I2C<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Say yes here to enable support for TI LM=
P92001 Analog System<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Monitor and Controller<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This driver provide support for 16 ADC, =
12 DAC, Voltage Reference,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Analog Temperature Sensor and 8-bit GPIO=
 Port.<br>
+<br>
=C2=A0config MFD_TIMBERDALE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tristate &quot;Timberdale FPGA&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select MFD_CORE<br>
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile<br>
index 080793b3fd0e..20d2e65d503a 100644<br>
--- a/drivers/mfd/Makefile<br>
+++ b/drivers/mfd/Makefile<br>
@@ -199,6 +199,10 @@ obj-$(CONFIG_MFD_RN5T618)=C2=A0 +=3D rn5t618.o<br>
=C2=A0obj-$(CONFIG_MFD_SEC_CORE)=C2=A0 =C2=A0 =C2=A0+=3D sec-core.o sec-irq=
.o<br>
=C2=A0obj-$(CONFIG_MFD_SYSCON)=C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D syscon.o<br>
=C2=A0obj-$(CONFIG_MFD_LM3533)=C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D lm3533-core.o=
 lm3533-ctrlbank.o<br>
+<br>
+lmp92001-objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 :=3D lmp92001-core.o lmp92001-i2c.o lmp92001-debug.o<br>
+obj-$(CONFIG_MFD_LMP92001)=C2=A0 =C2=A0 =C2=A0+=3D lmp92001.o<br>
+<br>
=C2=A0obj-$(CONFIG_MFD_VEXPRESS_<wbr>SYSREG)=C2=A0 =C2=A0 =C2=A0 +=3D vexpr=
ess-sysreg.o<br>
=C2=A0obj-$(CONFIG_MFD_RETU)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D retu-mfd=
.o<br>
=C2=A0obj-$(CONFIG_MFD_AS3711)=C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D as3711.o<br>
diff --git a/drivers/mfd/lmp92001-core.c b/drivers/mfd/lmp92001-core.c<br>
new file mode 100644<br>
index 000000000000..5ee315ce61bb<br>
--- /dev/null<br>
+++ b/drivers/mfd/lmp92001-core.c<br>
@@ -0,0 +1,307 @@<br>
+/*<br>
+ * lmp92001-core.c - Device access for TI LMP92001<br>
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
+#include &lt;linux/mfd/lmp92001/core.h&gt;<br>
+#include &lt;linux/mfd/lmp92001/debug.h&gt;<br>
+<br>
+static const struct mfd_cell lmp92001_devs[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;lmp=
92001-gpio&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_compatible =3D =
&quot;ti,lmp92001-gpio&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;lmp=
92001-adc&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_compatible =3D =
&quot;ti,lmp92001-adc&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;lmp=
92001-dac&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_compatible =3D =
&quot;ti,lmp92001-dac&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+};<br>
+<br>
+static struct reg_default lmp92001_defaults[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_SGEN,=C2=A0 0x40=C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_SHIL,=C2=A0 0x00=C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_SLOL,=C2=A0 0x00=C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_CGEN,=C2=A0 0x00=C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_CDAC,=C2=A0 0x03=C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_CGPO,=C2=A0 0xFF=C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_CINH,=C2=A0 0x00=C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_CINL,=C2=A0 0x00=C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_CAD1,=C2=A0 0x00=C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_CAD2,=C2=A0 0x00=C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_CAD3,=C2=A0 0x00=C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_CTRIG, 0x00=C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_CREF,=C2=A0 0x07=C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC1,=C2=A0 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC2,=C2=A0 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC3,=C2=A0 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC4,=C2=A0 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC5,=C2=A0 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC6,=C2=A0 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC7,=C2=A0 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC8,=C2=A0 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC9,=C2=A0 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC10, 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC11, 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC12, 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC13, 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC14, 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC15, 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC16, 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_LIH1,=C2=A0 0x0FFF },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_LIH2,=C2=A0 0x0FFF },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_LIH3,=C2=A0 0x0FFF },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_LIH9,=C2=A0 0x0FFF },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_LIH10, 0x0FFF },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_LIH11, 0x0FFF },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_LIL1,=C2=A0 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_LIL2,=C2=A0 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_LIL3,=C2=A0 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_LIL9,=C2=A0 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_LIL10, 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_LIL11, 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_DAC1,=C2=A0 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_DAC2,=C2=A0 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_DAC3,=C2=A0 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_DAC4,=C2=A0 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_DAC5,=C2=A0 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_DAC6,=C2=A0 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_DAC7,=C2=A0 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_DAC8,=C2=A0 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_DAC9,=C2=A0 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_DAC10, 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_DAC11, 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_DAC12, 0x0000 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ LMP92001_DALL,=C2=A0 0x0000 },<br>
+};<br>
+<br>
+static bool lmp92001_reg_readable(struct device *dev, unsigned int reg)<br=
>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (reg) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ID:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_VER:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_SGEN:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_SGPI:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_SHIL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_SLOL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_CGEN:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_CDAC:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_CGPO:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_CINH:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_CINL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_CAD1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_CAD2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_CAD3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC4:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC5:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC6:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC7:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC8:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC9:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC10:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC11:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC12:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC13:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC14:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC15:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC16:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC17:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_LIH1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_LIH2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_LIH3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_LIH9:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_LIH10:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_LIH11:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_LIL1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_LIL2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_LIL3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_LIL9:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_LIL10:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_LIL11:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_CREF:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DAC1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DAC2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DAC3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DAC4:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DAC5:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DAC6:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DAC7:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DAC8:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DAC9:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DAC10:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DAC11:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DAC12:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_BLK0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_BLK1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_BLK2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_BLK3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_BLK4:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_BLK5:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
+<br>
+static bool lmp92001_reg_writeable(struct device *dev, unsigned int reg)<b=
r>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (reg) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_CGEN:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_CDAC:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_CGPO:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_CINH:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_CINL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_CAD1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_CAD2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_CAD3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_CTRIG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_LIH1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_LIH2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_LIH3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_LIH9:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_LIH10:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_LIH11:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_LIL1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_LIL2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_LIL3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_LIL9:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_LIL10:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_LIL11:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_CREF:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DAC1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DAC2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DAC3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DAC4:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DAC5:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DAC6:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DAC7:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DAC8:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DAC9:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DAC10:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DAC11:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DAC12:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DALL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_BLK0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_BLK1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_BLK4:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_BLK5:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
+<br>
+static bool lmp92001_reg_volatile(struct device *dev, unsigned int reg)<br=
>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (reg) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_SGEN:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_SGPI:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_SHIL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_SLOL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_CGEN:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC4:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC5:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC6:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC7:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC8:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC9:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC10:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC11:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC12:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC13:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC14:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC15:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC16:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC17:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_BLK2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_BLK3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
+<br>
+struct regmap_config lmp92001_regmap_config =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.reg_bits =3D 8,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.val_bits =3D 16,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.cache_type =3D REGCACHE_RBTREE,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.reg_defaults =3D lmp92001_defaults,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.num_reg_defaults =3D ARRAY_SIZE(lmp92001_defau=
lts),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.max_register =3D LMP92001_BLK5,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.readable_reg =3D lmp92001_reg_readable,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.writeable_reg =3D lmp92001_reg_writeable,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.volatile_reg =3D lmp92001_reg_volatile,<br>
+};<br>
+<br>
+int lmp92001_device_init(struct lmp92001 *lmp92001, unsigned long id, int =
irq)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int comid, ver;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_set_drvdata(lmp92001-&gt;dev, lmp92001);<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap, LMP920=
01_ID, &amp;comid);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(lmp92001-&g=
t;dev, &quot;failed to read Company ID: %d\n&quot;, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap, LMP920=
01_VER, &amp;ver);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(lmp92001-&g=
t;dev, &quot;failed to read Version: %d\n&quot;, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info(lmp92001-&gt;dev, &quot;Company ID 0x%=
.2x, Version 0x%.2x\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0comid, ver);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mfd_add_devices(lmp92001-&gt;dev, PLATF=
ORM_DEVID_AUTO,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lmp92001_devs, ARRAY_SIZE(lmp92001_de=
vs),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, 0, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(lmp92001-&g=
t;dev, &quot;failed to add children\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D lmp92001_debug_init(lmp92001);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(lmp92001-&g=
t;dev, &quot;failed to initial debug fs.\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+exit:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
+<br>
+void lmp92001_device_exit(struct lmp92001 *lmp92001)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lmp92001_debug_exit(lmp92001);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mfd_remove_devices(lmp92001-&gt;<wbr>dev);<br>
+}<br>
diff --git a/drivers/mfd/lmp92001-debug.c b/drivers/mfd/lmp92001-debug.c<br=
>
new file mode 100644<br>
index 000000000000..b1746dc810b3<br>
--- /dev/null<br>
+++ b/drivers/mfd/lmp92001-debug.c<br>
@@ -0,0 +1,64 @@<br>
+/*<br>
+ * lmp92001-debug.c - Debug file system for TI LMP92001<br>
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
+#include &lt;linux/kernel.h&gt;<br>
+<br>
+#include &lt;linux/mfd/lmp92001/core.h&gt;<br>
+<br>
+static ssize_t lmp92001_id_ver_show(struct device *dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_attribute *attr, char *buf)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D dev_get_drvdata(d=
ev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int comid, ver;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap, LMP920=
01_ID, &amp;comid);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(lmp92001-&g=
t;dev, &quot;failed to read Company ID: %d\n&quot;, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap, LMP920=
01_VER, &amp;ver);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(lmp92001-&g=
t;dev, &quot;failed to read Version: %d\n&quot;, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;Company ID 0x%02x (%d=
), Version 0x%02x (%d)\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0comid, comid, ver, ver);<br>
+}<br>
+static DEVICE_ATTR(lmp92001_id_ver, 0444, lmp92001_id_ver_show, NULL);<br>
+<br>
+int lmp92001_debug_init(struct lmp92001 *lmp92001)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D device_create_file(lmp92001-&gt;<wbr>de=
v, &amp;dev_attr_lmp92001_id_ver);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret !=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(lmp92001-&g=
t;dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;unique ID attribute is not created: %d\n&quot;, ret);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
+<br>
+void lmp92001_debug_exit(struct lmp92001 *lmp92001)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0device_remove_file(lmp92001-&gt;<wbr>dev, &amp;=
dev_attr_lmp92001_id_ver);<br>
+}<br>
diff --git a/drivers/mfd/lmp92001-i2c.c b/drivers/mfd/lmp92001-i2c.c<br>
new file mode 100644<br>
index 000000000000..e22ea88f5820<br>
--- /dev/null<br>
+++ b/drivers/mfd/lmp92001-i2c.c<br>
@@ -0,0 +1,211 @@<br>
+/*<br>
+ * lmp92001-i2c.c - I2C access for TI LMP92001<br>
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
+#include &lt;linux/err.h&gt;<br>
+#include &lt;linux/i2c.h&gt;<br>
+#include &lt;linux/module.h&gt;<br>
+#include &lt;linux/of.h&gt;<br>
+#include &lt;linux/of_device.h&gt;<br>
+#include &lt;linux/of_gpio.h&gt;<br>
+#include &lt;linux/platform_device.h&gt;<br>
+#include &lt;linux/slab.h&gt;<br>
+<br>
+#include &lt;linux/mfd/lmp92001/core.h&gt;<br>
+<br>
+static const unsigned short lmp92001_i2c_addresses[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A00x40, 0x42, 0x44, 0x46, 0x48, 0x4A, 0x4C, 0x4E,=
 0x50, I2C_CLIENT_END<br>
+};<br>
+<br>
+/* TODO: To read/write block access, it may need to re-ordering endianness=
! */<br>
+static int lmp92001_reg_read(void *context, unsigned int reg, unsigned int=
 *val)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D context;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct i2c_client *i2c =3D to_i2c_client(dev);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (reg &gt; 0xff)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (reg) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ID ... LMP92001_CTRIG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_CREF:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D ret =3D i2=
c_smbus_read_byte_data(i2c, reg);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC1 ... LMP92001_LIL11:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DAC1 ... LMP92001_DALL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D ret =3D i2=
c_smbus_read_word_swapped(<wbr>i2c, reg);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_BLK0 ... LMP92001_BLK5:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbus_r=
ead_block_data(i2c, reg,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(u8 *)((uintptr_t)*val));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int lmp92001_reg_write(void *context, unsigned int reg, unsigned in=
t val)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D context;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct i2c_client *i2c =3D to_i2c_client(dev);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (reg &gt; 0xff)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (reg) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ID ... LMP92001_CTRIG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_CREF:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbus_w=
rite_byte_data(i2c, reg, val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_ADC1 ... LMP92001_LIL11:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_DAC1 ... LMP92001_DALL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbus_w=
rite_word_swapped(<wbr>i2c, reg, val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* To call this function/case, must be passed v=
al as pointer */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_BLK0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_BLK4:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbus_w=
rite_block_data(<wbr>i2c, reg, 24,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(u8 *)((uintptr_t)val));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_BLK1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_BLK5:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbus_w=
rite_block_data(<wbr>i2c, reg, 12,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(u8 *)((uintptr_t)val));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_BLK2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbus_w=
rite_block_data(<wbr>i2c, reg, 34,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(u8 *)((uintptr_t)val));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case LMP92001_BLK3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbus_w=
rite_block_data(<wbr>i2c, reg, 18,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(u8 *)((uintptr_t)val));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
+<br>
+static int lmp92001_i2c_probe(struct i2c_client *i2c,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct i2c_device_id *id)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lmp92001 =3D devm_kzalloc(&amp;i2c-&gt;dev, siz=
eof(struct lmp92001), GFP_KERNEL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!lmp92001)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_set_clientdata(i2c, lmp92001);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lmp92001-&gt;dev =3D &amp;i2c-&gt;dev;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lmp92001_regmap_config.reg_<wbr>read =3D lmp920=
01_reg_read;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lmp92001_regmap_config.reg_<wbr>write =3D lmp92=
001_reg_write;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lmp92001-&gt;regmap =3D devm_regmap_init(&amp;i=
2c-&gt;dev, NULL, &amp;i2c-&gt;dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&amp;lmp92001_regmap_config);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(lmp92001-&gt;regmap)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(lmp=
92001-&gt;regmap);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(lmp92001-&g=
t;dev, &quot;failed to allocate register map: %d\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return lmp92001_device_init(lmp92001, id-&gt;dr=
iver_data, i2c-&gt;irq);<br>
+}<br>
+<br>
+static int lmp92001_i2c_remove(struct i2c_client *i2c)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D i2c_get_clientdat=
a(i2c);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lmp92001_device_exit(lmp92001)<wbr>;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+#ifdef CONFIG_OF<br>
+static const struct of_device_id lmp92001_dt_ids[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;ti,lmp92001&quot;, },<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ },<br>
+};<br>
+MODULE_DEVICE_TABLE(of, lmp92001_dt_ids);<br>
+#endif<br>
+<br>
+static const struct i2c_device_id lmp92001_i2c_ids[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;lmp92001&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ },<br>
+};<br>
+MODULE_DEVICE_TABLE(i2c, lmp92001_i2c_ids);<br>
+<br>
+static int lmp92001_i2c_detect(struct i2c_client *i2c,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct i2c_board_info *info)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct i2c_adapter *adapter =3D i2c-&gt;adapter=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0s32 comid, ver;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!i2c_check_functionality(<wbr>adapter,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I2C_FUNC_=
SMBUS_BYTE_DATA |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I2C_FUNC_=
SMBUS_WORD_DATA |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I2C_FUNC_=
SMBUS_BLOCK_DATA))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0comid =3D i2c_smbus_read_byte_data(i2c, LMP9200=
1_ID);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ver =3D i2c_smbus_read_byte_data(i2c, LMP92001_=
VER);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (comid !=3D 0x01 || ver !=3D 0x10)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static struct i2c_driver lmp92001_i2c_driver =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;lmp=
92001&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D=
 of_match_ptr(lmp92001_dt_ids),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D lm=
p92001_i2c_probe,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D lm=
p92001_i2c_remove,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.id_table=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D lmp9200=
1_i2c_ids,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.detect=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D lm=
p92001_i2c_detect,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.address_list=C2=A0 =C2=A0=3D lmp92001_i2c_addr=
esses,<br>
+};<br>
+<br>
+static int __init lmp92001_i2c_init(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return i2c_add_driver(&amp;lmp92001_i2c_<wbr>dr=
iver);<br>
+}<br>
+subsys_initcall(lmp92001_i2c_<wbr>init);<br>
+<br>
+static void __exit lmp92001_i2c_exit(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_del_driver(&amp;lmp92001_i2c_<wbr>driver);<=
br>
+}<br>
+module_exit(lmp92001_i2c_<wbr>exit);<br>
+<br>
+MODULE_DESCRIPTION(&quot;i2c driver for TI LMP92001&quot;);<br>
+MODULE_AUTHOR(&quot;Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@gmail.=
com">s.abhisit@gmail.com</a>&gt;&quot;);<br>
+MODULE_LICENSE(&quot;GPL&quot;);<br>
diff --git a/include/linux/mfd/lmp92001/<wbr>core.h b/include/linux/mfd/lmp=
92001/<wbr>core.h<br>
new file mode 100644<br>
index 000000000000..81aabf8b8e7a<br>
--- /dev/null<br>
+++ b/include/linux/mfd/lmp92001/<wbr>core.h<br>
@@ -0,0 +1,135 @@<br>
+/*<br>
+ * include/linux/mfd/lmp92001/<wbr>core.h - Core interface for TI LMP92001=
<br>
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
+#ifndef __MFD_LMP92001_CORE_H__<br>
+#define __MFD_LMP92001_CORE_H__<br>
+<br>
+#include &lt;linux/device.h&gt;<br>
+#include &lt;linux/mfd/core.h&gt;<br>
+#include &lt;linux/mutex.h&gt;<br>
+#include &lt;linux/regmap.h&gt;<br>
+<br>
+/*<br>
+ * Register values.<br>
+ */<br>
+/* ID */<br>
+#define LMP92001_ID=C2=A0 =C2=A0 0x0E<br>
+#define LMP92001_VER=C2=A0 =C2=A00x0F<br>
+/* STATUS */<br>
+#define LMP92001_SGEN=C2=A0 0x10<br>
+#define LMP92001_SGPI=C2=A0 0x11<br>
+#define LMP92001_SHIL=C2=A0 0x12<br>
+#define LMP92001_SLOL=C2=A0 0x13<br>
+/* CONTROL */<br>
+#define LMP92001_CGEN=C2=A0 0x14<br>
+#define LMP92001_CDAC=C2=A0 0x15<br>
+#define LMP92001_CGPO=C2=A0 0x16<br>
+#define LMP92001_CINH=C2=A0 0x17<br>
+#define LMP92001_CINL=C2=A0 0x18<br>
+#define LMP92001_CAD1=C2=A0 0x19<br>
+#define LMP92001_CAD2=C2=A0 0x1A<br>
+#define LMP92001_CAD3=C2=A0 0x1B<br>
+#define LMP92001_CTRIG 0x1C<br>
+/* ADC OUTPUT DATA */<br>
+#define LMP92001_ADC1=C2=A0 0x20<br>
+#define LMP92001_ADC2=C2=A0 0x21<br>
+#define LMP92001_ADC3=C2=A0 0x22<br>
+#define LMP92001_ADC4=C2=A0 0x23<br>
+#define LMP92001_ADC5=C2=A0 0x24<br>
+#define LMP92001_ADC6=C2=A0 0x25<br>
+#define LMP92001_ADC7=C2=A0 0x26<br>
+#define LMP92001_ADC8=C2=A0 0x27<br>
+#define LMP92001_ADC9=C2=A0 0x28<br>
+#define LMP92001_ADC10 0x29<br>
+#define LMP92001_ADC11 0x2A<br>
+#define LMP92001_ADC12 0x2B<br>
+#define LMP92001_ADC13 0x2C<br>
+#define LMP92001_ADC14 0x2D<br>
+#define LMP92001_ADC15 0x2E<br>
+#define LMP92001_ADC16 0x2F<br>
+#define LMP92001_ADC17 0x30<br>
+/* ADC WINDOW COMPARATOR LIMITS */<br>
+#define LMP92001_LIH1=C2=A0 0x40<br>
+#define LMP92001_LIH2=C2=A0 0x41<br>
+#define LMP92001_LIH3=C2=A0 0x42<br>
+#define LMP92001_LIH9=C2=A0 0x43<br>
+#define LMP92001_LIH10 0x44<br>
+#define LMP92001_LIH11 0x45<br>
+#define LMP92001_LIL1=C2=A0 0x46<br>
+#define LMP92001_LIL2=C2=A0 0x47<br>
+#define LMP92001_LIL3=C2=A0 0x48<br>
+#define LMP92001_LIL9=C2=A0 0x49<br>
+#define LMP92001_LIL10 0x4A<br>
+#define LMP92001_LIL11 0x4B<br>
+/* INTERNAL REFERENCE CONTROL */<br>
+#define LMP92001_CREF=C2=A0 0x66<br>
+/* DAC INPUT DATA */<br>
+#define LMP92001_DAC1=C2=A0 0x80<br>
+#define LMP92001_DAC2=C2=A0 0x81<br>
+#define LMP92001_DAC3=C2=A0 0x82<br>
+#define LMP92001_DAC4=C2=A0 0x83<br>
+#define LMP92001_DAC5=C2=A0 0x84<br>
+#define LMP92001_DAC6=C2=A0 0x85<br>
+#define LMP92001_DAC7=C2=A0 0x86<br>
+#define LMP92001_DAC8=C2=A0 0x87<br>
+#define LMP92001_DAC9=C2=A0 0x88<br>
+#define LMP92001_DAC10 0x89<br>
+#define LMP92001_DAC11 0x8A<br>
+#define LMP92001_DAC12 0x8B<br>
+#define LMP92001_DALL=C2=A0 0x90<br>
+/* MEMORY MAPPED BLOCK COMMANDS */<br>
+#define LMP92001_BLK0=C2=A0 0xF0<br>
+#define LMP92001_BLK1=C2=A0 0xF1<br>
+#define LMP92001_BLK2=C2=A0 0xF2<br>
+#define LMP92001_BLK3=C2=A0 0xF3<br>
+#define LMP92001_BLK4=C2=A0 0xF4<br>
+#define LMP92001_BLK5=C2=A0 0xF5<br>
+<br>
+/*<br>
+ * Helpful macros<br>
+ */<br>
+/* DAC */<br>
+#define CDAC_OFF=C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(0)<br>
+#define CDAC_OLVL=C2=A0 =C2=A0 =C2=A0 BIT(1)<br>
+#define CDAC_GANG=C2=A0 =C2=A0 =C2=A0 BIT(2)<br>
+/* INT. REFERANCE ENABLE */<br>
+#define CREF_DEXT=C2=A0 =C2=A0 =C2=A0 BIT(0)<br>
+#define CREF_AEXT=C2=A0 =C2=A0 =C2=A0 BIT(1)<br>
+/* GENERAL */<br>
+#define CGEN_STRT=C2=A0 =C2=A0 =C2=A0 BIT(0)<br>
+#define CGEN_LCK=C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(1)<br>
+#define CGEN_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(7)<br>
+/* STATUS: GENERNAL */<br>
+#define SGEN_GPI=C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(0)<br>
+<br>
+struct lmp92001 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct regmap *regmap;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mutex adc_lock;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mutex dac_lock;<br>
+};<br>
+<br>
+extern struct regmap_config lmp92001_regmap_config;<br>
+<br>
+int lmp92001_device_init(struct lmp92001 *lmp92001, unsigned long id, int =
irq);<br>
+void lmp92001_device_exit(struct lmp92001 *lmp92001);<br>
+<br>
+#endif /* __MFD_LMP92001_CORE_H__ */<br>
diff --git a/include/linux/mfd/lmp92001/<wbr>debug.h b/include/linux/mfd/lm=
p92001/<wbr>debug.h<br>
new file mode 100644<br>
index 000000000000..e6fda7efc917<br>
--- /dev/null<br>
+++ b/include/linux/mfd/lmp92001/<wbr>debug.h<br>
@@ -0,0 +1,27 @@<br>
+/*<br>
+ * include/linux/mfd/lmp92001/<wbr>debug.h - Debug interface for TI 92001<=
br>
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
+#ifndef __MFD_LMP92001_DEBUG_H__<br>
+#define __MFD_LMP92001_DEBUG_H__<br>
+<br>
+int lmp92001_debug_init(struct lmp92001 *lmp92001);<br>
+void lmp92001_debug_exit(struct lmp92001 *lmp92001);<br>
+<br>
+#endif /* __MFD_LMP92001_DEBUG_H__ */<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
2.13.0<br>
<br>
</font></span></div><br></div></div>

--001a1140ddb43791a5055806bd52--
