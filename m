Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mic92-1-81-57-185-249.fbx.proxad.net ([81.57.185.249]:53152
	"EHLO smtp.natisbad.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754407Ab3HBXJb (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 2 Aug 2013 19:09:31 -0400
From: arno@natisbad.org (Arnaud Ebalard)
Subject: [RFC,PATCHv0] Add support for Intersil ISL12057 I2C RTC/Alarm chip
Date: Sat, 03 Aug 2013 01:00:49 +0200
Message-ID: <877gg3r93y.fsf@natisbad.org>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, rtc-linux@googlegroups.com, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-ID: <devicetree@vger.kernel.org>

Hi,

Netgear ReadyNAS 102 (Armada 370-base) NAS includes an Intersil ISL12057
I2C RTC/Alarm chip. As part of an effort to get full support for the NAS
in mainline kernel, I wrote a driver for the chip based on ISL1208 one
developed by Hebert Valerio Riedel. This v0 is a first round to get some
comments and advices.

Setting and retrieving time works as expected at startup and shutdown.
Also, alarm bit is set in status register when the alarm is triggered.
Nonetheless:

 1) I found no way to test interrupt handling code which is supposed to
 get called when the alarm triggers and an interrupt occurs on pin 3 of
 the chip: I don't have the expected IRQ value on my platform. I already
 tried and assign some dummy handler to unassigned IRQ (i.e. unreferenced
 in /proc/interrupts) w/o luck. If you have any idea/direction, I'd be
 happy to test. ATM, for that reason, that part of the code is untested.

 2) trying to interact w/ the clock using userland tools does not work:

 root@humble:/sys/class/rtc/rtc0# hwclock -r
 hwclock: select() to /dev/rtc0 to wait for clock tick timed out: Success

 root@humble:/tmp# gcc rtctest.c 
 root@humble:/tmp# ./a.out 

                        RTC Driver Test Example.

  Counting 5 update (1/sec) interrupts from reading /dev/rtc0:

  [ nothing happens ]

  I tried and find some documentation on the topic to understand where
  the issue comes from but found nothing obvious.


I intend to provide some documentation in next round and fix reported
issues. Additionally, I wonder why ISL1208 code has no specific mutex
protection for access and changes. I also followed that path in attached
driver but I guess this is something that should be improved.

Comments welcome,

Cheers,

a+

Signed-off-by: Arnaud Ebalard <arno@natisbad.org>
---
 drivers/rtc/Kconfig        |   9 +
 drivers/rtc/Makefile       |   1 +
 drivers/rtc/rtc-isl12057.c | 641 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 651 insertions(+)
 create mode 100644 drivers/rtc/rtc-isl12057.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 9e3498b..b3d4894 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -294,6 +294,15 @@ config RTC_DRV_ISL12022
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-isl12022.
 
+config RTC_DRV_ISL12057
+       tristate "Intersil ISL12057"
+       help
+	  If you say yes here you get support for the Intersil ISL12057
+	  I2C RTC/Alarm chip.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rtc-isl12057.
+
 config RTC_DRV_X1205
 	tristate "Xicor/Intersil X1205"
 	help
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index d3b4488..2cbf8f9 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -57,6 +57,7 @@ obj-$(CONFIG_RTC_DRV_HID_SENSOR_TIME) += rtc-hid-sensor-time.o
 obj-$(CONFIG_RTC_DRV_IMXDI)	+= rtc-imxdi.o
 obj-$(CONFIG_RTC_DRV_ISL1208)	+= rtc-isl1208.o
 obj-$(CONFIG_RTC_DRV_ISL12022)	+= rtc-isl12022.o
+obj-$(CONFIG_RTC_DRV_ISL12057)  += rtc-isl12057.o
 obj-$(CONFIG_RTC_DRV_JZ4740)	+= rtc-jz4740.o
 obj-$(CONFIG_RTC_DRV_LP8788)	+= rtc-lp8788.o
 obj-$(CONFIG_RTC_DRV_LPC32XX)	+= rtc-lpc32xx.o
diff --git a/drivers/rtc/rtc-isl12057.c b/drivers/rtc/rtc-isl12057.c
new file mode 100644
index 0000000..7bc6465
--- /dev/null
+++ b/drivers/rtc/rtc-isl12057.c
@@ -0,0 +1,641 @@
+/*
+ * rtc-isl12057 - Driver for Intersil ISL12057 I2C Real Time Clock/Calendar
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
+/* block read */
+static int isl12057_i2c_read_regs(struct i2c_client *client, u8 reg, u8 buf[],
+				  unsigned len)
+{
+	struct i2c_msg msgs[2] = {
+		{
+			.addr = client->addr,
+			.len = sizeof(u8),
+			.buf = buf
+		},
+		{
+			.addr = client->addr,
+			.flags = I2C_M_RD,
+			.len = len,
+			.buf = buf
+		}
+	};
+	int ret;
+
+	BUG_ON(reg > ISL12057_REG_SR);
+	BUG_ON(reg + len > ISL12057_REG_SR + 1);
+
+	ret = i2c_transfer(client->adapter, msgs, 2);
+	if (ret <= 0)
+		return ret;
+
+	return 0;
+}
+
+/* block write */
+static int isl12057_i2c_set_regs(struct i2c_client *client, u8 reg,
+				 u8 const buf[], unsigned len)
+{
+	u8 i2c_buf[ISL12057_MEM_MAP_LEN + 1];
+	struct i2c_msg msgs[1] = {
+		{
+			.addr = client->addr,
+			.len = len + 1,
+			.buf = i2c_buf
+		}
+	};
+	int ret;
+
+	BUG_ON(reg > ISL12057_REG_SR);
+	BUG_ON(reg + len > ISL12057_REG_SR + 1);
+
+	i2c_buf[0] = reg;
+	memcpy(&i2c_buf[1], &buf[0], len);
+
+	ret = i2c_transfer(client->adapter, msgs, 1);
+	if (ret <= 0)
+		return ret;
+
+	return 0;
+}
+
+/*
+ * Try and match register bits w/ fixed null values to see whether we
+ * are dealing with an ISL12057.
+ */
+static int isl12057_i2c_validate_client(struct i2c_client *client)
+{
+	u8 regs[ISL12057_MEM_MAP_LEN] = { 0, };
+	u8 mask[ISL12057_MEM_MAP_LEN] = { 0x80, 0x80, 0x80, 0xf8,
+					  0xc0, 0x60, 0x00, 0x00,
+					  0x00, 0x00, 0x00, 0x00,
+					  0x00, 0x00, 0x60, 0x7c };
+	int ret, i;
+
+	ret = isl12057_i2c_read_regs(client, 0, regs, ISL12057_MEM_MAP_LEN);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ISL12057_MEM_MAP_LEN; ++i) {
+		if (regs[i] & mask[i])	/* check if bits are cleared */
+			return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int isl12057_rtc_toggle_alarm(struct i2c_client *client, int enable)
+{
+	int ir;
+
+	ir = i2c_smbus_read_byte_data(client, ISL12057_REG_INT);
+	if (ir < 0) {
+		dev_err(&client->dev, "%s: reading INT failed\n", __func__);
+		return ir;
+	}
+
+	if (enable)
+		ir |=  ISL12057_REG_INT_A1IE;
+	else
+		ir &= ~ISL12057_REG_INT_A1IE;
+
+	ir = i2c_smbus_write_byte_data(client, ISL12057_REG_INT, ir);
+	if (ir < 0) {
+		dev_err(&client->dev, "%s: writing INT failed\n", __func__);
+		return ir;
+	}
+
+	return 0;
+}
+
+static int isl12057_i2c_read_time(struct i2c_client *client,
+				  struct rtc_time *tm)
+{
+	u8 regs[ISL12057_RTC_SEC_LEN] = { 0, };
+	int ret;
+
+	ret = i2c_smbus_read_byte_data(client, ISL12057_REG_SR);
+	if (ret < 0) {
+		dev_err(&client->dev, "%s: reading SR failed\n", __func__);
+		return ret;
+	}
+
+	ret = isl12057_i2c_read_regs(client, ISL12057_REG_RTC_SC, regs,
+				     ISL12057_RTC_SEC_LEN);
+	if (ret < 0) {
+		dev_err(&client->dev, "%s: reading RTC section failed\n",
+			__func__);
+		return ret;
+	}
+
+	tm->tm_sec  = bcd2bin(regs[ISL12057_REG_RTC_SC]);
+	tm->tm_min  = bcd2bin(regs[ISL12057_REG_RTC_MN]);
+	tm->tm_hour = bcd2bin(regs[ISL12057_REG_RTC_HR] & 0x3f);
+	tm->tm_mday = bcd2bin(regs[ISL12057_REG_RTC_DT]);
+	tm->tm_wday = bcd2bin(regs[ISL12057_REG_RTC_DW]) - 1; /* starts at 1 */
+	tm->tm_mon  = bcd2bin(regs[ISL12057_REG_RTC_MO]) - 1; /* starts at 1 */
+	tm->tm_year = bcd2bin(regs[ISL12057_REG_RTC_YR]) + 100;
+
+	return 0;
+}
+
+static int isl12057_i2c_read_alarm(struct i2c_client *client,
+				   struct rtc_wkalrm *alarm)
+{
+	struct rtc_time rtc_tm, *alarm_tm = &alarm->time;
+	u8 regs[ISL12057_A1_SEC_LEN] = { 0, };
+	unsigned long rtc_secs, alarm_secs;
+	int ir, ret;
+
+	ret = isl12057_i2c_read_regs(client, ISL12057_REG_A1_SC, regs,
+				     ISL12057_A1_SEC_LEN);
+	if (ret < 0) {
+		dev_err(&client->dev, "%s: reading alarm section failed\n",
+			__func__);
+		return ret;
+	}
+
+	alarm_tm->tm_sec  = bcd2bin(regs[0] & 0x7f);
+	alarm_tm->tm_min  = bcd2bin(regs[1] & 0x7f);
+	alarm_tm->tm_hour = bcd2bin(regs[2] & 0x3f);
+	alarm_tm->tm_mday = bcd2bin(regs[3] & 0x3f);
+	alarm_tm->tm_wday = -1;
+
+	/*
+	 * The alarm section does not store year/month. We use the ones in rtc
+	 * section as a basis and increment month and then year if needed to get
+	 * alarm after current time.
+	 */
+	ret = isl12057_i2c_read_time(client, &rtc_tm);
+	if (ret)
+		return ret;
+	alarm_tm->tm_year = rtc_tm.tm_year;
+	alarm_tm->tm_mon = rtc_tm.tm_mon;
+
+	ret = rtc_tm_to_time(&rtc_tm, &rtc_secs);
+	if (ret)
+		return ret;
+
+	ret = rtc_tm_to_time(alarm_tm, &alarm_secs);
+	if (ret)
+		return ret;
+
+	if (alarm_secs < rtc_secs) {
+		if (alarm_tm->tm_mon == 11) {
+			alarm_tm->tm_mon = 0;
+			alarm_tm->tm_year += 1;
+		} else {
+			alarm_tm->tm_mon += 1;
+		}
+	}
+
+	ir = i2c_smbus_read_byte_data(client, ISL12057_REG_INT);
+	if (ir < 0) {
+		dev_err(&client->dev, "%s: reading INT failed\n", __func__);
+		return ir;
+	}
+	alarm->enabled = !!(ir & ISL12057_REG_INT_A1IE);
+
+	return 0;
+}
+
+static int isl12057_i2c_set_alarm(struct i2c_client *client,
+				  struct rtc_wkalrm *alarm)
+{
+	struct rtc_time *alarm_tm = &alarm->time;
+	u8 regs[ISL12057_A1_SEC_LEN] = { 0, };
+	unsigned long rtc_secs, alarm_secs;
+	struct rtc_time rtc_tm;
+	int ret, sr, enable = 1;
+
+	ret = isl12057_i2c_read_time(client, &rtc_tm);
+	if (ret)
+		return ret;
+
+	ret = rtc_tm_to_time(&rtc_tm, &rtc_secs);
+	if (ret)
+		return ret;
+
+	ret = rtc_tm_to_time(alarm_tm, &alarm_secs);
+	if (ret)
+		return ret;
+
+	/* If alarm time is before current time, disable the alarm */
+	if (!alarm->enabled || alarm_secs <= rtc_secs) {
+		enable = 0;
+	} else {
+		/*
+		 * Chip only support alarms up to one month in the future. Let's
+		 * return an error if we get something after that limit.
+		 * Comparison is done by incrementing rtc_tm month field by one
+		 * and checking alarm value is still below.
+		 */
+		if (rtc_tm.tm_mon == 11) { /* handle year wrapping */
+			rtc_tm.tm_mon = 0;
+			rtc_tm.tm_year += 1;
+		} else {
+			rtc_tm.tm_mon += 1;
+		}
+
+		ret = rtc_tm_to_time(&rtc_tm, &rtc_secs);
+		if (ret)
+			return ret;
+
+		if (alarm_secs > rtc_secs) {
+			dev_err(&client->dev,
+				"%s: limit is one month in the future\n",
+				__func__);
+			return -EINVAL;
+		}
+	}
+
+	/* Disable the alarm before modifying it */
+	sr = i2c_smbus_read_byte_data(client, ISL12057_REG_SR);
+	if (sr < 0) {
+		dev_err(&client->dev, "%s: reading SR failed\n", __func__);
+		return sr;
+	}
+
+	if (sr & ISL12057_REG_SR_A1F) {
+		sr &= ~ISL12057_REG_SR_A1F;
+		sr = i2c_smbus_write_byte_data(client, ISL12057_REG_SR, sr);
+		if (sr < 0) {
+			dev_err(&client->dev, "%s: writing SR failed\n",
+				__func__);
+			return sr;
+		}
+	}
+
+	/* Program alarm registers */
+	regs[0] = bin2bcd(alarm_tm->tm_sec);
+	regs[1] = bin2bcd(alarm_tm->tm_min);
+	regs[2] = bin2bcd(alarm_tm->tm_hour);
+	regs[3] = bin2bcd(alarm_tm->tm_mday);
+
+	ret = isl12057_i2c_set_regs(client, ISL12057_REG_A1_SC, regs,
+				    ISL12057_A1_SEC_LEN);
+	if (ret < 0) {
+		dev_err(&client->dev, "%s: writing ALARM section failed\n",
+			__func__);
+		return ret;
+	}
+
+	/* Enable or disable alarm */
+	ret = isl12057_rtc_toggle_alarm(client, enable);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int isl12057_i2c_set_time(struct i2c_client *client,
+				 struct rtc_time const *tm)
+{
+	u8 regs[ISL12057_RTC_SEC_LEN] = { 0, };
+	int sr;
+
+	/*
+	 * The clock has an 8 bit wide bcd-coded register for the year.
+	 * tm_year is an offset from 1900 and we are interested in the
+	 * 2000-2099 range, so any value less than 100 is invalid.
+	 */
+	if (tm->tm_year < 100)
+		return -EINVAL;
+
+	regs[ISL12057_REG_RTC_SC] = bin2bcd(tm->tm_sec);
+	regs[ISL12057_REG_RTC_MN] = bin2bcd(tm->tm_min);
+	regs[ISL12057_REG_RTC_HR] = bin2bcd(tm->tm_hour); /* 24-hour format */
+	regs[ISL12057_REG_RTC_DT] = bin2bcd(tm->tm_mday);
+	regs[ISL12057_REG_RTC_MO] = bin2bcd(tm->tm_mon + 1);
+	regs[ISL12057_REG_RTC_YR] = bin2bcd(tm->tm_year - 100);
+	regs[ISL12057_REG_RTC_DW] = bin2bcd(tm->tm_wday + 1);
+
+	/* write RTC registers */
+	sr = isl12057_i2c_set_regs(client, 0, regs, ISL12057_RTC_SEC_LEN);
+	if (sr < 0) {
+		dev_err(&client->dev, "%s: writing RTC section failed\n",
+			__func__);
+		return sr;
+	}
+
+	return 0;
+}
+
+
+static int isl12057_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	return isl12057_i2c_read_time(to_i2c_client(dev), tm);
+}
+
+static int isl12057_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	return isl12057_i2c_set_time(to_i2c_client(dev), tm);
+}
+
+static int isl12057_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	return isl12057_i2c_read_alarm(to_i2c_client(dev), alarm);
+}
+
+static int isl12057_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	return isl12057_i2c_set_alarm(to_i2c_client(dev), alarm);
+}
+
+static int isl12057_rtc_proc(struct device *dev, struct seq_file *seq)
+{
+	struct i2c_client *const client = to_i2c_client(dev);
+	int sr, ir;
+
+	/* Status register */
+	sr = i2c_smbus_read_byte_data(client, ISL12057_REG_SR);
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
+	ir = i2c_smbus_read_byte_data(client, ISL12057_REG_INT);
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
+static int isl12057_rtc_alarm_irq_enable(struct device *dev,
+					 unsigned int enabled)
+{
+	return isl12057_rtc_toggle_alarm(to_i2c_client(dev), enabled);
+}
+
+static irqreturn_t isl12057_rtc_interrupt(int irq, void *data)
+{
+	unsigned long timeout = jiffies + msecs_to_jiffies(1000);
+	struct i2c_client *client = data;
+	struct rtc_device *rtc = i2c_get_clientdata(client);
+	int handled = 0, sr = -1, err;
+
+	/*
+	 * I2C reads get NAK'ed if we read straight away after an interrupt?
+	 * Using a mdelay/msleep didn't seem to help either, so we work around
+	 * this by continually trying to read the register for a short time.
+	 */
+	while (1) {
+		sr = i2c_smbus_read_byte_data(client, ISL12057_REG_SR);
+		if (sr >= 0)
+			break;
+
+		if (time_after(jiffies, timeout)) {
+			dev_err(&client->dev, "%s: reading SR failed\n",
+				__func__);
+			return sr;
+		}
+	}
+
+	if (sr & ISL12057_REG_SR_A1F) {
+		dev_dbg(&client->dev, "alarm!\n");
+
+		rtc_update_irq(rtc, 1, RTC_IRQF | RTC_AF);
+
+		/* Clear the alarm */
+		sr &= ~ISL12057_REG_SR_A1F;
+		sr = i2c_smbus_write_byte_data(client, ISL12057_REG_SR, sr);
+		if (sr < 0)
+			dev_err(&client->dev, "%s: writing SR failed\n",
+				__func__);
+		else
+			handled = 1;
+
+		/* Disable the alarm */
+		err = isl12057_rtc_toggle_alarm(client, 0);
+		if (err)
+			return err;
+	}
+
+	return handled ? IRQ_HANDLED : IRQ_NONE;
+}
+
+static const struct rtc_class_ops isl12057_rtc_ops = {
+	.read_time = isl12057_rtc_read_time,
+	.set_time = isl12057_rtc_set_time,
+	.read_alarm = isl12057_rtc_read_alarm,
+	.set_alarm = isl12057_rtc_set_alarm,
+	.alarm_irq_enable = isl12057_rtc_alarm_irq_enable,
+	.proc = isl12057_rtc_proc,
+};
+
+static int isl12057_probe(struct i2c_client *client,
+			  const struct i2c_device_id *id)
+{
+	struct rtc_device *rtc;
+	int ret = 0;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+		return -ENODEV;
+
+	if (isl12057_i2c_validate_client(client) < 0)
+		return -ENODEV;
+
+	dev_info(&client->dev, "chip found, driver version " DRV_VERSION "\n");
+
+	if (client->irq > 0) {
+		ret = devm_request_threaded_irq(&client->dev, client->irq, NULL,
+						isl12057_rtc_interrupt,
+						IRQF_SHARED|IRQF_ONESHOT,
+						DRV_NAME, client);
+		if (!ret) {
+			device_init_wakeup(&client->dev, 1);
+			enable_irq_wake(client->irq);
+		} else {
+			dev_err(&client->dev,
+				"Unable to request irq %d, no alarm support\n",
+				client->irq);
+			client->irq = 0;
+		}
+	}
+
+	rtc = devm_rtc_device_register(&client->dev, DRV_NAME,
+				       &isl12057_rtc_ops, THIS_MODULE);
+	if (IS_ERR(rtc)) {
+		ret = PTR_ERR(rtc);
+		goto exit_free_irq;
+	}
+
+	i2c_set_clientdata(client, rtc);
+
+	/* Enable oscillator if not already running */
+	ret = i2c_smbus_read_byte_data(client, ISL12057_REG_INT);
+	if (ret < 0) {
+		dev_err(&client->dev, "reading control reg failed\n");
+		goto exit_free_irq;
+	}
+	if (ret & ISL12057_REG_INT_EOSC) {
+		ret &= ~ISL12057_REG_INT_EOSC; /* 0 means enabled */
+		ret = i2c_smbus_write_byte_data(client, ISL12057_REG_INT, ret);
+		if (ret < 0) {
+			dev_err(&client->dev, "writing control reg failed\n");
+			goto exit_free_irq;
+		}
+	}
+
+	/* Clear oscillator failure and alarm bit if needed */
+	ret = i2c_smbus_read_byte_data(client, ISL12057_REG_SR);
+	if (ret < 0) {
+		dev_err(&client->dev, "reading status reg failed\n");
+		goto exit_free_irq;
+	}
+	if (ret & (ISL12057_REG_SR_OSF | ISL12057_REG_SR_A1F)) {
+		ret &= ~(ISL12057_REG_SR_OSF | ISL12057_REG_SR_A1F);
+		ret = i2c_smbus_write_byte_data(client, ISL12057_REG_SR, ret);
+		if (ret < 0) {
+			dev_err(&client->dev, "writing status reg failed\n");
+			goto exit_free_irq;
+		}
+	}
+
+	return 0;
+
+exit_free_irq:
+	if (client->irq)
+		free_irq(client->irq, client);
+
+	return ret;
+}
+
+static int isl12057_remove(struct i2c_client *client)
+{
+	struct rtc_device *rtc = i2c_get_clientdata(client);
+
+	rtc_device_unregister(rtc);
+	if (client->irq)
+		free_irq(client->irq, client);
+
+	return 0;
+}
+
+
+#ifdef CONFIG_OF
+static struct of_device_id isl12057_dt_match[] = {
+	{ .compatible = "isil,isl12057" },
+	{ },
+};
+#endif
+
+static const struct i2c_device_id isl12057_id[] = {
+	{ "isl12057", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, isl12057_id);
+
+static struct i2c_driver isl12057_driver = {
+	.driver = {
+		.name = DRV_NAME,
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(isl12057_dt_match),
+	},
+	.probe	  = isl12057_probe,
+	.remove	  = isl12057_remove,
+	.id_table = isl12057_id,
+};
+
+module_i2c_driver(isl12057_driver);
+
+MODULE_AUTHOR("Arnaud EBALARD <arno@natisbad.org>");
+MODULE_DESCRIPTION("Intersil ISL12057 RTC/Alarm driver");
+MODULE_VERSION(DRV_VERSION);
+MODULE_LICENSE("GPL");
-- 
1.8.3.1

