From: Arnaud Ebalard <arno@natisbad.org>
Subject: [PATCHv3,RESEND] rtc: Add support for Intersil ISL12057 I2C RTC chip
Date: Mon, 16 Dec 2013 20:49:36 +0100
Message-ID: <637f26e051b700ca510a0af695dfd84cf2bfd35d.1387222475.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5514863106514231603=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, rtc-linux@googlegroups.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, linux-doc@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, linux-arm-kernel@lists.infradead.org, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

--===============5514863106514231603==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain


Intersil ISL12057 I2C RTC chip also supports two alarms. This patch
only adds support for basic RTC functionalities (i.e. getting and
setting time). Tests have been performed on NETGEAR ReadyNAS 102 w/
startup/shutdown scripts, hwclock, ntpdate and openntpd.

Signed-off-by: Arnaud Ebalard <arno@natisbad.org>
---
This is a resend - just in case the initial mail slept through - as I
got no feedback over the past week. I have also Cc'ed additional
people.

In order to get at least some initial support for the chip available in
mainline kernel (v3.14 will have three users waiting for it: ReadyNAS
102, 104 and 2120), I decided to temporarily remove the alarm and IRQ
related code I pushed earlier (see [1] below). If possible, I'd like to
iterate on this before Christmas in order not to miss ARM submission
cutoff (around -rc5) to push the .dts changes (once the driver is queued
for 3.14).

I will submit a patch later to add back Alarm/IRQ support once I get
some understanding of how to correctly handle my use case in current
RTC subsystem logic.

As asked by Mark, this v3 provides a complete conversion of the driver
to use regmap.

Comments welcome!

Cheers,

a+

[1]: http://thread.gmane.org/gmane.linux.drivers.devicetree/46581


Changes since previous v2:
 - converted to regmap

Changes since previous v1:
 - fixed return values for isl12057_i2c_{read,set}_regs()
 - checked associated return paths

Changes since previous v0:
 - removed alarm and IRQ related code
 - Switched to isl for intersil (no existing driver has any reference
   to isil, even though this would be the recommended choice)
 - Added intersil info in vendor-prefixes.txt file
 - Added entry for ISL 12057 in I2C trivial-devices.txt file
 - Added mutex protection for non atomic read/write


 .../devicetree/bindings/i2c/trivial-devices.txt    |   1 +
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/rtc/Kconfig                                |  11 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-isl12057.c                         | 363 +++++++++++++++++=
++++
 5 files changed, 377 insertions(+)
 create mode 100644 drivers/rtc/rtc-isl12057.c

diff --git a/Documentation/devicetree/bindings/i2c/trivial-devices.txt b/Do=
cumentation/devicetree/bindings/i2c/trivial-devices.txt
index b1cb341..cdf1430 100644
--- a/Documentation/devicetree/bindings/i2c/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
@@ -39,6 +39,7 @@ fsl,sgtl5000		SGTL5000: Ultra Low-Power Audio Codec
 gmt,g751		G751: Digital Temperature Sensor and Thermal Watchdog with Two-W=
ire Interface
 infineon,slb9635tt	Infineon SLB9635 (Soft-) I2C TPM (old protocol, max 100=
khz)
 infineon,slb9645tt	Infineon SLB9645 I2C TPM (new protocol, max 400khz)
+isl,isl12057		Intersil ISL12057 I2C RTC Chip
 maxim,ds1050		5 Bit Programmable, Pulse-Width Modulator
 maxim,max1237		Low-Power, 4-/12-Channel, 2-Wire Serial, 12-Bit ADCs
 maxim,max6625		9-Bit/12-Bit Temperature Sensors with I=C2=B2C-Compatible S=
erial Interface
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Docume=
ntation/devicetree/bindings/vendor-prefixes.txt
index edbb8d8..ed0f63f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -39,6 +39,7 @@ ibm	International Business Machines (IBM)
 idt	Integrated Device Technologies, Inc.
 img	Imagination Technologies Ltd.
 intercontrol	Inter Control Group
+isl	Intersil
 lg	LG Corporation
 linux	Linux-specific binding
 lsi	LSI Corp. (LSI Logic)
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 0077302..9608210 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -304,6 +304,17 @@ config RTC_DRV_ISL12022
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-isl12022.
=20
+config RTC_DRV_ISL12057
+       depends on I2C
+       select REGMAP_I2C
+       tristate "Intersil ISL12057"
+       help
+	  If you say yes here you get support for the Intersil ISL12057
+	  I2C RTC chip.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rtc-isl12057.
+
 config RTC_DRV_X1205
 	tristate "Xicor/Intersil X1205"
 	help
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 27b4bd8..6cd50e5 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -58,6 +58,7 @@ obj-$(CONFIG_RTC_DRV_HID_SENSOR_TIME) +=3D rtc-hid-sensor=
-time.o
 obj-$(CONFIG_RTC_DRV_IMXDI)	+=3D rtc-imxdi.o
 obj-$(CONFIG_RTC_DRV_ISL1208)	+=3D rtc-isl1208.o
 obj-$(CONFIG_RTC_DRV_ISL12022)	+=3D rtc-isl12022.o
+obj-$(CONFIG_RTC_DRV_ISL12057)  +=3D rtc-isl12057.o
 obj-$(CONFIG_RTC_DRV_JZ4740)	+=3D rtc-jz4740.o
 obj-$(CONFIG_RTC_DRV_LP8788)	+=3D rtc-lp8788.o
 obj-$(CONFIG_RTC_DRV_LPC32XX)	+=3D rtc-lpc32xx.o
diff --git a/drivers/rtc/rtc-isl12057.c b/drivers/rtc/rtc-isl12057.c
new file mode 100644
index 0000000..9d279b2
--- /dev/null
+++ b/drivers/rtc/rtc-isl12057.c
@@ -0,0 +1,363 @@
+/*
+ * rtc-isl12057 - Driver for Intersil ISL12057 I2C Real Time Clock
+ *
+ * Copyright (C) 2013, Arnaud EBALARD <arno@natisbad.org>
+ *
+ * This work is largely based on Intersil ISL1208 driver developed by
+ * Hebert Valerio Riedel <hvr@gnu.org>.
+ *
+ * Detailed datasheet on which this development is based is available here:
+ *
+ *  http://natisbad.org/NAS2/refs/ISL12057.pdf
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
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation.
+ */
+
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/rtc.h>
+#include <linux/i2c.h>
+#include <linux/bcd.h>
+#include <linux/rtc.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+
+#define DRV_NAME "rtc-isl12057"
+
+/* RTC section */
+#define ISL12057_REG_RTC_SC     0x00 /* Seconds */
+#define ISL12057_REG_RTC_MN     0x01 /* Minutes */
+#define ISL12057_REG_RTC_HR     0x02 /* Hours */
+#define ISL12057_REG_RTC_HR_PM  (1<<5) /* AM/PM bit in 12h format */
+#define ISL12057_REG_RTC_HR_MIL (1<<6) /* 24h/12h format */
+#define ISL12057_REG_RTC_DW     0x03 /* Day of the Week */
+#define ISL12057_REG_RTC_DT     0x04 /* Date */
+#define ISL12057_REG_RTC_MO     0x05 /* Month */
+#define ISL12057_REG_RTC_YR     0x06 /* Year */
+#define ISL12057_RTC_SEC_LEN    7
+
+/* Alarm 1 section */
+#define ISL12057_REG_A1_SC      0x07 /* Alarm 1 Seconds */
+#define ISL12057_REG_A1_MN      0x08 /* Alarm 1 Minutes */
+#define ISL12057_REG_A1_HR      0x09 /* Alarm 1 Hours */
+#define ISL12057_REG_A1_HR_PM   (1<<5) /* AM/PM bit in 12h format */
+#define ISL12057_REG_A1_HR_MIL  (1<<6) /* 24h/12h format */
+#define ISL12057_REG_A1_DWDT    0x0A /* Alarm 1 Date / Day of the week */
+#define ISL12057_REG_A1_DWDT_B  (1<<6) /* DW / DT selection bit */
+#define ISL12057_A1_SEC_LEN     4
+
+/* Alarm 2 section */
+#define ISL12057_REG_A2_MN      0x0B /* Alarm 2 Minutes */
+#define ISL12057_REG_A2_HR      0x0C /* Alarm 2 Hours */
+#define ISL12057_REG_A2_DWDT    0x0D /* Alarm 2 Date / Day of the week */
+#define ISL12057_A2_SEC_LEN     3
+
+/* Control/Status registers */
+#define ISL12057_REG_INT        0x0E
+#define ISL12057_REG_INT_A1IE   (1<<0) /* Alarm 1 interrupt enable bit */
+#define ISL12057_REG_INT_A2IE   (1<<1) /* Alarm 2 interrupt enable bit */
+#define ISL12057_REG_INT_INTCN  (1<<2) /* Interrupt control enable bit */
+#define ISL12057_REG_INT_RS1    (1<<3) /* Freq out control bit 1 */
+#define ISL12057_REG_INT_RS2    (1<<4) /* Freq out control bit 2 */
+#define ISL12057_REG_INT_EOSC   (1<<7) /* Oscillator enable bit */
+
+#define ISL12057_REG_SR         0x0F
+#define ISL12057_REG_SR_A1F     (1<<0) /* Alarm 1 interrupt bit */
+#define ISL12057_REG_SR_A2F     (1<<1) /* Alarm 2 interrupt bit */
+#define ISL12057_REG_SR_OSF     (1<<7) /* Oscillator failure bit */
+
+/* Register memory map length */
+#define ISL12057_MEM_MAP_LEN    0x10
+
+static struct i2c_driver isl12057_driver;
+
+struct isl12057_rtc_data {
+	struct i2c_client *client;
+	struct rtc_device *rtc;
+	struct regmap *regmap;
+	struct mutex lock;
+};
+
+static void isl12057_rtc_regs_to_tm(struct rtc_time *tm, u8 *regs)
+{
+	tm->tm_sec  =3D bcd2bin(regs[ISL12057_REG_RTC_SC]);
+	tm->tm_min  =3D bcd2bin(regs[ISL12057_REG_RTC_MN]);
+
+	if (regs[ISL12057_REG_RTC_HR] & ISL12057_REG_RTC_HR_MIL) { /* AM/PM */
+		tm->tm_hour =3D bcd2bin(regs[ISL12057_REG_RTC_HR] & 0x0f);
+		if (regs[ISL12057_REG_RTC_HR] & ISL12057_REG_RTC_HR_PM)
+			tm->tm_hour +=3D 12;
+	} else {                                            /* 24 hour mode */
+		tm->tm_hour =3D bcd2bin(regs[ISL12057_REG_RTC_HR] & 0x3f);
+	}
+
+	tm->tm_mday =3D bcd2bin(regs[ISL12057_REG_RTC_DT]);
+	tm->tm_wday =3D bcd2bin(regs[ISL12057_REG_RTC_DW]) - 1; /* starts at 1 */
+	tm->tm_mon  =3D bcd2bin(regs[ISL12057_REG_RTC_MO]) - 1; /* starts at 1 */
+	tm->tm_year =3D bcd2bin(regs[ISL12057_REG_RTC_YR]) + 100;
+}
+
+static int isl12057_rtc_tm_to_regs(u8 *regs, struct rtc_time *tm)
+{
+	/*
+	 * The clock has an 8 bit wide bcd-coded register for the year.
+	 * tm_year is an offset from 1900 and we are interested in the
+	 * 2000-2099 range, so any value less than 100 is invalid.
+	 */
+	if (tm->tm_year < 100)
+		return -EINVAL;
+
+	regs[ISL12057_REG_RTC_SC] =3D bin2bcd(tm->tm_sec);
+	regs[ISL12057_REG_RTC_MN] =3D bin2bcd(tm->tm_min);
+	regs[ISL12057_REG_RTC_HR] =3D bin2bcd(tm->tm_hour); /* 24-hour format */
+	regs[ISL12057_REG_RTC_DT] =3D bin2bcd(tm->tm_mday);
+	regs[ISL12057_REG_RTC_MO] =3D bin2bcd(tm->tm_mon + 1);
+	regs[ISL12057_REG_RTC_YR] =3D bin2bcd(tm->tm_year - 100);
+	regs[ISL12057_REG_RTC_DW] =3D bin2bcd(tm->tm_wday + 1);
+
+	return 0;
+}
+
+/*
+ * Try and match register bits w/ fixed null values to see whether we
+ * are dealing with an ISL12057.
+ */
+static int isl12057_i2c_validate_client(struct regmap *regmap)
+{
+	u8 regs[ISL12057_MEM_MAP_LEN];
+	u8 mask[ISL12057_MEM_MAP_LEN] =3D { 0x80, 0x80, 0x80, 0xf8,
+					  0xc0, 0x60, 0x00, 0x00,
+					  0x00, 0x00, 0x00, 0x00,
+					  0x00, 0x00, 0x60, 0x7c };
+	int ret, i;
+
+	ret =3D regmap_bulk_read(regmap, 0, regs, ISL12057_MEM_MAP_LEN);
+	if (ret)
+		return ret;
+
+	for (i =3D 0; i < ISL12057_MEM_MAP_LEN; ++i) {
+		if (regs[i] & mask[i])	/* check if bits are cleared */
+			return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int isl12057_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct i2c_client *client =3D to_i2c_client(dev);
+	struct isl12057_rtc_data *data =3D i2c_get_clientdata(client);
+	u8 regs[ISL12057_RTC_SEC_LEN];
+	int ret;
+
+	mutex_lock(&data->lock);
+	ret =3D regmap_bulk_read(data->regmap, ISL12057_REG_RTC_SC, regs,
+			       ISL12057_RTC_SEC_LEN);
+	mutex_unlock(&data->lock);
+
+	if (ret) {
+		dev_err(&client->dev, "%s: RTC read failed\n", __func__);
+		return ret;
+	}
+
+	isl12057_rtc_regs_to_tm(tm, regs);
+
+	return rtc_valid_tm(tm);
+}
+
+static int isl12057_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct i2c_client *client =3D to_i2c_client(dev);
+	struct isl12057_rtc_data *data =3D i2c_get_clientdata(client);
+	u8 regs[ISL12057_RTC_SEC_LEN];
+	int ret;
+
+	ret =3D isl12057_rtc_tm_to_regs(regs, tm);
+	if (ret)
+		return ret;
+
+	mutex_lock(&data->lock);
+	ret =3D regmap_bulk_write(data->regmap, ISL12057_REG_RTC_SC, regs,
+				ISL12057_RTC_SEC_LEN);
+	mutex_unlock(&data->lock);
+
+	if (ret)
+		dev_err(&client->dev, "%s: RTC write failed\n", __func__);
+
+	return ret;
+}
+
+static int isl12057_rtc_proc(struct device *dev, struct seq_file *seq)
+{
+	struct i2c_client *const client =3D to_i2c_client(dev);
+	struct isl12057_rtc_data *data =3D i2c_get_clientdata(client);
+	int reg, ret;
+
+	mutex_lock(&data->lock);
+
+	/* Status register */
+	ret =3D regmap_read(data->regmap, ISL12057_REG_SR, &reg);
+	if (ret) {
+		dev_err(&client->dev, "%s: reading SR failed\n", __func__);
+		goto out;
+	}
+
+	seq_printf(seq, "status_reg\t:%s%s%s (0x%.2x)\n",
+		   (reg & ISL12057_REG_SR_OSF) ? " OSF" : "",
+		   (reg & ISL12057_REG_SR_A1F) ? " A1F" : "",
+		   (reg & ISL12057_REG_SR_A2F) ? " A2F" : "", reg);
+
+	/* Control register */
+	ret =3D regmap_read(data->regmap, ISL12057_REG_INT, &reg);
+	if (ret) {
+		dev_err(&client->dev, "%s: reading INT failed\n", __func__);
+		goto out;
+	}
+
+	seq_printf(seq, "control_reg\t:%s%s%s%s%s%s (0x%.2x)\n",
+		   (reg & ISL12057_REG_INT_A1IE) ?  " A1IE"  : "",
+		   (reg & ISL12057_REG_INT_A2IE) ?  " A2IE"  : "",
+		   (reg & ISL12057_REG_INT_INTCN) ? " INTCN" : "",
+		   (reg & ISL12057_REG_INT_RS1) ?   " RS1"   : "",
+		   (reg & ISL12057_REG_INT_RS2) ?   " RS2"   : "",
+		   (reg & ISL12057_REG_INT_EOSC) ?  " EOSC"  : "", reg);
+
+ out:
+	mutex_unlock(&data->lock);
+
+	return ret;
+}
+
+/*
+ * Check current RTC status and enable/disable what needs to be. Return 0 =
if
+ * everything went ok and a negative value upon error. Note: this function
+ * is called early during init and hence does need mutex protection.
+ */
+static int isl12057_check_rtc_status(struct device *dev, struct regmap *re=
gmap)
+{
+	int ret;
+
+	/* Enable oscillator if not already running */
+	ret =3D regmap_update_bits(regmap, ISL12057_REG_INT,
+				 ISL12057_REG_INT_EOSC, 0);
+	if (ret < 0) {
+		dev_err(dev, "Enable to enable oscillator\n");
+		return ret;
+	}
+
+	/* Clear oscillator failure bit if needed */
+	ret =3D regmap_update_bits(regmap, ISL12057_REG_SR,
+				 ISL12057_REG_SR_OSF, 0);
+	if (ret < 0) {
+		dev_err(dev, "Enable to clear oscillator failure bit\n");
+		return ret;
+	}
+
+	/* Clear alarm bit if needed */
+	ret =3D regmap_update_bits(regmap, ISL12057_REG_SR,
+				 ISL12057_REG_SR_A1F, 0);
+	if (ret < 0) {
+		dev_err(dev, "Enable to clear alarm bit\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct rtc_class_ops rtc_ops =3D {
+	.read_time =3D isl12057_rtc_read_time,
+	.set_time =3D isl12057_rtc_set_time,
+	.proc =3D isl12057_rtc_proc,
+};
+
+static struct regmap_config isl12057_rtc_regmap_config =3D {
+	.reg_bits =3D 8,
+	.val_bits =3D 8,
+};
+
+static int isl12057_probe(struct i2c_client *client,
+			  const struct i2c_device_id *id)
+{
+	struct device *dev =3D &client->dev;
+	struct isl12057_rtc_data *data;
+	struct rtc_device *rtc;
+	struct regmap *regmap;
+	int ret =3D 0;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C |
+				     I2C_FUNC_SMBUS_BYTE_DATA |
+				     I2C_FUNC_SMBUS_I2C_BLOCK))
+		return -ENODEV;
+
+	regmap =3D devm_regmap_init_i2c(client, &isl12057_rtc_regmap_config);
+	if (IS_ERR(regmap)) {
+		ret =3D PTR_ERR(regmap);
+		dev_err(&client->dev, "regmap allocation failed: %d\n", ret);
+		return ret;
+	}
+
+	ret =3D isl12057_i2c_validate_client(regmap);
+	if (ret)
+		return ret;
+
+	ret =3D isl12057_check_rtc_status(dev, regmap);
+	if (ret)
+		return ret;
+
+	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	mutex_init(&data->lock);
+	data->client =3D client;
+	data->regmap =3D regmap;
+	i2c_set_clientdata(client, data);
+
+	rtc =3D devm_rtc_device_register(dev, DRV_NAME, &rtc_ops, THIS_MODULE);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
+	data->rtc =3D rtc;
+
+	return 0;
+}
+
+#ifdef CONFIG_OF
+static struct of_device_id isl12057_dt_match[] =3D {
+	{ .compatible =3D "isl,isl12057" },
+	{ },
+};
+#endif
+
+static const struct i2c_device_id isl12057_id[] =3D {
+	{ "isl12057", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, isl12057_id);
+
+static struct i2c_driver isl12057_driver =3D {
+	.driver =3D {
+		.name =3D DRV_NAME,
+		.owner =3D THIS_MODULE,
+		.of_match_table =3D of_match_ptr(isl12057_dt_match),
+	},
+	.probe	  =3D isl12057_probe,
+	.id_table =3D isl12057_id,
+};
+module_i2c_driver(isl12057_driver);
+
+MODULE_AUTHOR("Arnaud EBALARD <arno@natisbad.org>");
+MODULE_DESCRIPTION("Intersil ISL12057 RTC driver");
+MODULE_LICENSE("GPL");
--=20
1.8.4.4



--===============5514863106514231603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5514863106514231603==--
