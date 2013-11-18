From: arno@natisbad.org (Arnaud Ebalard)
Subject: [PATCHv2] rtc: Add support for Intersil ISL12057 I2C RTC chip
Date: Mon, 18 Nov 2013 21:51:27 +0100
Message-ID: <87k3g5l9gw.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Kent Yoder <key@linux.vnet.ibm.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org


Intersil ISL12057 I2C RTC chip also supports two alarms. This patch
only adds support for basic RTC functionalities (i.e. getting and
setting time). Tests have been performed on NETGEAR ReadyNAS 102 w/
startup/shutdown scripts, hwclock, ntpdate and openntpd.

Signed-off-by: Arnaud Ebalard <arno@natisbad.org>
---
Hi,

In order to get at least some initial support for the chip available in
mainline kernel (3.14 will have three users waiting for it: ReadyNAS
102, 104 and 2120), I decided to temporarily remove the alarm and IRQ
related code I pushed earlier (see [1] below). I will submit a patch
later to add back Alarm/IRQ support once I have understood how to
correctly handle my use case described via existing RTC logic.

Anyway, comments are welcome on the patch!


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


Now, regarding later submission of Alarm/IRQ functionality, here is the
use case: on all 3 NETGEAR NAS above (102, 104 and RN2120), the Alarm
interrupt pins of the ISL 12057 are not connected to the SoC, i.e. Linu=
x
kernel never gets warned via an interrupt when the alarm goes off. The
reason is that the alarm interrupt pin is connected to some regulator
which will power up the (previously off) device when the alarm goes
off. It raises some questions for which I am looking for some supports
from RTC maintainer and people familiar w/ RTC framework:

 - Are there no previous example of such need from existing platform?
 - How can this use case be supported? Tested?
 - in usual context, what is the purpose of having an IRQ handler for
   such an alarm event: just acknowledge it and remove the alarm? Or
   are there other reasons?

As a side note, I want to repeat that previous code (the one I dropped
from current patch) worked fine to get alarm installed (i.e. once the
device powered off, it woke up as expected using the alarm). I was just
unable to test the interrupt handling part, for the reason described
above.

Cheers,

a+

[1]: http://thread.gmane.org/gmane.linux.drivers.devicetree/46581


 .../devicetree/bindings/i2c/trivial-devices.txt    |   1 +
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/rtc/Kconfig                                |   9 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-isl12057.c                         | 397 +++++++++++++=
++++++++
 5 files changed, 409 insertions(+)
 create mode 100644 drivers/rtc/rtc-isl12057.c

diff --git a/Documentation/devicetree/bindings/i2c/trivial-devices.txt =
b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
index ad6a738..b57c71e 100644
--- a/Documentation/devicetree/bindings/i2c/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
@@ -37,6 +37,7 @@ fsl,mpr121		MPR121: Proximity Capacitive Touch Sensor=
 Controller
 fsl,sgtl5000		SGTL5000: Ultra Low-Power Audio Codec
 infineon,slb9635tt	Infineon SLB9635 (Soft-) I2C TPM (old protocol, max=
 100khz)
 infineon,slb9645tt	Infineon SLB9645 I2C TPM (new protocol, max 400khz)
+isl,isl12057		Intersil ISL12057 I2C RTC Chip
 maxim,ds1050		5 Bit Programmable, Pulse-Width Modulator
 maxim,max1237		Low-Power, 4-/12-Channel, 2-Wire Serial, 12-Bit ADCs
 maxim,max6625		9-Bit/12-Bit Temperature Sensors with I=C2=B2C-Compatib=
le Serial Interface
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Do=
cumentation/devicetree/bindings/vendor-prefixes.txt
index ce95ed1..507761a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -38,6 +38,7 @@ ibm	International Business Machines (IBM)
 idt	Integrated Device Technologies, Inc.
 img	Imagination Technologies Ltd.
 intercontrol	Inter Control Group
+isl	Intersil
 linux	Linux-specific binding
 lsi	LSI Corp. (LSI Logic)
 marvell	Marvell Technology Group Ltd.
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 15f166a..bcc0c17 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -304,6 +304,15 @@ config RTC_DRV_ISL12022
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-isl12022.
=20
+config RTC_DRV_ISL12057
+       tristate "Intersil ISL12057"
+       help
+	  If you say yes here you get support for the Intersil ISL12057
+	  I2C RTC/Calendar chip.
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
@@ -58,6 +58,7 @@ obj-$(CONFIG_RTC_DRV_HID_SENSOR_TIME) +=3D rtc-hid-se=
nsor-time.o
 obj-$(CONFIG_RTC_DRV_IMXDI)	+=3D rtc-imxdi.o
 obj-$(CONFIG_RTC_DRV_ISL1208)	+=3D rtc-isl1208.o
 obj-$(CONFIG_RTC_DRV_ISL12022)	+=3D rtc-isl12022.o
+obj-$(CONFIG_RTC_DRV_ISL12057)  +=3D rtc-isl12057.o
 obj-$(CONFIG_RTC_DRV_JZ4740)	+=3D rtc-jz4740.o
 obj-$(CONFIG_RTC_DRV_LP8788)	+=3D rtc-lp8788.o
 obj-$(CONFIG_RTC_DRV_LPC32XX)	+=3D rtc-lpc32xx.o
diff --git a/drivers/rtc/rtc-isl12057.c b/drivers/rtc/rtc-isl12057.c
new file mode 100644
index 0000000..02c794c
--- /dev/null
+++ b/drivers/rtc/rtc-isl12057.c
@@ -0,0 +1,397 @@
+/*
+ * rtc-isl12057 - Driver for Intersil ISL12057 I2C Real Time Clock
+ *
+ * Copyright (C) 2013, Arnaud EBALARD <arno@natisbad.org>
+ *
+ * This work is largely based on Intersil ISL1208 driver developed by
+ * Hebert Valerio Riedel <hvr@gnu.org>.
+ *
+ * Detailed datasheet on which this development is based is available =
here:
+ *
+ *  http://natisbad.org/NAS2/refs/ISL12057.pdf
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License as published b=
y
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
+
+#define DRV_NAME "rtc-isl12057"
+#define DRV_VERSION "0.1"
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
+#define ISL12057_REG_A1_DWDT    0x0A /* Alarm 1 Date / Day of the week=
 */
+#define ISL12057_REG_A1_DWDT_B  (1<<6) /* DW / DT selection bit */
+#define ISL12057_A1_SEC_LEN     4
+
+/* Alarm 2 section */
+#define ISL12057_REG_A2_MN      0x0B /* Alarm 2 Minutes */
+#define ISL12057_REG_A2_HR      0x0C /* Alarm 2 Hours */
+#define ISL12057_REG_A2_DWDT    0x0D /* Alarm 2 Date / Day of the week=
 */
+#define ISL12057_A2_SEC_LEN     3
+
+/* Control/Status registers */
+#define ISL12057_REG_INT        0x0E
+#define ISL12057_REG_INT_A1IE   (1<<0) /* Alarm 1 interrupt enable bit=
 */
+#define ISL12057_REG_INT_A2IE   (1<<1) /* Alarm 2 interrupt enable bit=
 */
+#define ISL12057_REG_INT_INTCN  (1<<2) /* Interrupt control enable bit=
 */
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
+	struct mutex lock;
+};
+
+/* Block read. Returns 0 on success, or a negative errno. */
+static int isl12057_i2c_read_regs(struct i2c_client *client, u8 reg, u=
8 buf[],
+				  unsigned len)
+{
+	struct i2c_msg msgs[2] =3D {
+		{
+			.addr =3D client->addr,
+			.flags =3D 0,
+			.len =3D sizeof(u8),
+			.buf =3D buf
+		},
+		{
+			.addr =3D client->addr,
+			.flags =3D I2C_M_RD,
+			.len =3D len,
+			.buf =3D buf
+		}
+	};
+	int ret;
+
+	BUG_ON(reg > ISL12057_REG_SR);
+	BUG_ON(reg + len > ISL12057_REG_SR + 1);
+
+	ret =3D i2c_transfer(client->adapter, msgs, 2);
+	if (ret < 0)
+		return ret;
+
+	return (ret =3D=3D 2) ? 0 : -EIO;
+}
+
+/* Block write. Returns 0 on success, or a negative errno. */
+static int isl12057_i2c_set_regs(struct i2c_client *client, u8 reg,
+				 u8 const buf[], unsigned len)
+{
+	u8 i2c_buf[ISL12057_MEM_MAP_LEN + 1];
+	struct i2c_msg msgs[1] =3D {
+		{
+			.addr =3D client->addr,
+			.flags =3D 0,
+			.len =3D len + 1,
+			.buf =3D i2c_buf
+		}
+	};
+	int ret;
+
+	BUG_ON(reg > ISL12057_REG_SR);
+	BUG_ON(reg + len > ISL12057_REG_SR + 1);
+
+	i2c_buf[0] =3D reg;
+	memcpy(&i2c_buf[1], &buf[0], len);
+
+	ret =3D i2c_transfer(client->adapter, msgs, 1);
+	if (ret < 0)
+		return ret;
+
+	return (ret =3D=3D 1) ? 0 : -EIO;
+}
+
+/*
+ * Try and match register bits w/ fixed null values to see whether we
+ * are dealing with an ISL12057.
+ */
+static int isl12057_i2c_validate_client(struct i2c_client *client)
+{
+	u8 regs[ISL12057_MEM_MAP_LEN] =3D { 0, };
+	u8 mask[ISL12057_MEM_MAP_LEN] =3D { 0x80, 0x80, 0x80, 0xf8,
+					  0xc0, 0x60, 0x00, 0x00,
+					  0x00, 0x00, 0x00, 0x00,
+					  0x00, 0x00, 0x60, 0x7c };
+	int ret, i;
+
+	ret =3D isl12057_i2c_read_regs(client, 0, regs, ISL12057_MEM_MAP_LEN)=
;
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
+static int isl12057_rtc_read_time(struct device *dev, struct rtc_time =
*tm)
+{
+	struct i2c_client *client =3D to_i2c_client(dev);
+	struct isl12057_rtc_data *data =3D i2c_get_clientdata(client);
+	u8 regs[ISL12057_RTC_SEC_LEN] =3D { 0, };
+	int ret;
+
+	mutex_lock(&data->lock);
+	ret =3D i2c_smbus_read_byte_data(client, ISL12057_REG_SR);
+	if (ret < 0) {
+		dev_err(&client->dev, "%s: reading SR failed\n", __func__);
+		return ret;
+	}
+
+	ret =3D isl12057_i2c_read_regs(client, ISL12057_REG_RTC_SC, regs,
+				     ISL12057_RTC_SEC_LEN);
+	mutex_unlock(&data->lock);
+	if (ret) {
+		dev_err(&client->dev, "%s: reading RTC section failed\n",
+			__func__);
+		return ret;
+	}
+
+	tm->tm_sec  =3D bcd2bin(regs[ISL12057_REG_RTC_SC]);
+	tm->tm_min  =3D bcd2bin(regs[ISL12057_REG_RTC_MN]);
+	tm->tm_hour =3D bcd2bin(regs[ISL12057_REG_RTC_HR] & 0x3f);
+	tm->tm_mday =3D bcd2bin(regs[ISL12057_REG_RTC_DT]);
+	tm->tm_wday =3D bcd2bin(regs[ISL12057_REG_RTC_DW]) - 1; /* starts at =
1 */
+	tm->tm_mon  =3D bcd2bin(regs[ISL12057_REG_RTC_MO]) - 1; /* starts at =
1 */
+	tm->tm_year =3D bcd2bin(regs[ISL12057_REG_RTC_YR]) + 100;
+
+	return 0;
+}
+
+static int isl12057_rtc_set_time(struct device *dev, struct rtc_time *=
tm)
+{
+	struct i2c_client *client =3D to_i2c_client(dev);
+	struct isl12057_rtc_data *data =3D i2c_get_clientdata(client);
+	u8 regs[ISL12057_RTC_SEC_LEN] =3D { 0, };
+	int ret;
+
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
+	regs[ISL12057_REG_RTC_HR] =3D bin2bcd(tm->tm_hour); /* 24-hour format=
 */
+	regs[ISL12057_REG_RTC_DT] =3D bin2bcd(tm->tm_mday);
+	regs[ISL12057_REG_RTC_MO] =3D bin2bcd(tm->tm_mon + 1);
+	regs[ISL12057_REG_RTC_YR] =3D bin2bcd(tm->tm_year - 100);
+	regs[ISL12057_REG_RTC_DW] =3D bin2bcd(tm->tm_wday + 1);
+
+	/* write RTC registers */
+	mutex_lock(&data->lock);
+	ret =3D isl12057_i2c_set_regs(client, 0, regs, ISL12057_RTC_SEC_LEN);
+	mutex_unlock(&data->lock);
+	if (ret) {
+		dev_err(&client->dev, "%s: writing RTC section failed\n",
+			__func__);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int isl12057_rtc_proc(struct device *dev, struct seq_file *seq)
+{
+	struct i2c_client *const client =3D to_i2c_client(dev);
+	struct isl12057_rtc_data *data =3D i2c_get_clientdata(client);
+	int sr, ir;
+
+	mutex_lock(&data->lock);
+	/* Status register */
+	sr =3D i2c_smbus_read_byte_data(client, ISL12057_REG_SR);
+	if (sr < 0) {
+		dev_err(&client->dev, "%s: reading SR failed\n", __func__);
+		return sr;
+	}
+
+	seq_printf(seq, "status_reg\t:%s%s%s (0x%.2x)\n",
+		   (sr & ISL12057_REG_SR_OSF) ? " OSF" : "",
+		   (sr & ISL12057_REG_SR_A1F) ? " A1F" : "",
+		   (sr & ISL12057_REG_SR_A2F) ? " A2F" : "", sr);
+
+	/* Control register */
+	ir =3D i2c_smbus_read_byte_data(client, ISL12057_REG_INT);
+	mutex_unlock(&data->lock);
+	if (ir < 0) {
+		dev_err(&client->dev, "%s: reading INT failed\n", __func__);
+		return ir;
+	}
+
+	seq_printf(seq, "status_reg\t:%s%s%s%s%s%s (0x%.2x)\n",
+		   (ir & ISL12057_REG_INT_A1IE) ?  " A1IE"  : "",
+		   (ir & ISL12057_REG_INT_A2IE) ?  " A2IE"  : "",
+		   (ir & ISL12057_REG_INT_INTCN) ? " INTCN" : "",
+		   (ir & ISL12057_REG_INT_RS1) ?   " RS1"   : "",
+		   (ir & ISL12057_REG_INT_RS2) ?   " RS2"   : "",
+		   (ir & ISL12057_REG_INT_EOSC) ?  " EOSC"  : "", ir);
+
+	return 0;
+}
+
+/*
+ * Check current RTC status and enable/disable what needs to be. Retur=
n 0 if
+ * everything went ok and a negative value upon error. Note: this func=
tion
+ * is called early during init and hence does need mutex protection.
+ */
+static int isl12057_check_rtc_status(struct i2c_client *client)
+{
+	int ret;
+
+	/* Enable oscillator if not already running */
+	ret =3D i2c_smbus_read_byte_data(client, ISL12057_REG_INT);
+	if (ret < 0) {
+		dev_err(&client->dev, "reading control reg failed\n");
+		return ret;
+	}
+	if (ret & ISL12057_REG_INT_EOSC) {
+		ret &=3D ~ISL12057_REG_INT_EOSC; /* 0 means enabled */
+		ret =3D i2c_smbus_write_byte_data(client, ISL12057_REG_INT, ret);
+		if (ret < 0) {
+			dev_err(&client->dev, "writing control reg failed\n");
+			return ret;
+		}
+	}
+
+	/* Clear oscillator failure and alarm bit if needed */
+	ret =3D i2c_smbus_read_byte_data(client, ISL12057_REG_SR);
+	if (ret < 0) {
+		dev_err(&client->dev, "reading status reg failed\n");
+		return ret;
+	}
+	if (ret & (ISL12057_REG_SR_OSF | ISL12057_REG_SR_A1F)) {
+		ret &=3D ~(ISL12057_REG_SR_OSF | ISL12057_REG_SR_A1F);
+		ret =3D i2c_smbus_write_byte_data(client, ISL12057_REG_SR, ret);
+		if (ret < 0) {
+			dev_err(&client->dev, "writing status reg failed\n");
+			return ret;
+		}
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
+static int isl12057_probe(struct i2c_client *client,
+			  const struct i2c_device_id *id)
+{
+	struct device *dev =3D &client->dev;
+	struct isl12057_rtc_data *data;
+	struct rtc_device *rtc;
+	int ret =3D 0;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C |
+				     I2C_FUNC_SMBUS_BYTE_DATA |
+				     I2C_FUNC_SMBUS_I2C_BLOCK))
+		return -ENODEV;
+
+	if (isl12057_i2c_validate_client(client) < 0)
+		return -ENODEV;
+
+	dev_info(dev, "chip found, driver version " DRV_VERSION "\n");
+
+	ret =3D isl12057_check_rtc_status(client);
+	if (ret)
+		return ret;
+
+	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	mutex_init(&data->lock);
+	data->client =3D client;
+	i2c_set_clientdata(client, data);
+
+	rtc =3D devm_rtc_device_register(dev, DRV_NAME, &rtc_ops, THIS_MODULE=
);
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
+MODULE_VERSION(DRV_VERSION);
+MODULE_LICENSE("GPL");
--=20
1.8.4.rc3

