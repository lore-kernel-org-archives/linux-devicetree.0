From: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCHv4 2/2] rtc: cpcap: new rtc driver
Date: Thu,  2 Mar 2017 01:27:09 +0100
Message-ID: <20170302002709.22276-2-sre@kernel.org>
References: <20170220073535.27393-1-sre@kernel.org>
 <20170302002709.22276-1-sre@kernel.org>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBDXMLNOH5ANRB2ON3XCQKGQEE3PWYZQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170302002709.22276-1-sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This driver supports the Motorola CPCAP PMIC found on
some of Motorola's mobile phones, such as the Droid 4.

Tested-by: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Changes since PATCHv3:
 - Modified DT binding document to mention parent device
---
 .../devicetree/bindings/rtc/cpcap-rtc.txt          |  18 ++
 drivers/rtc/Kconfig                                |   7 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-cpcap.c                            | 332 +++++++++++++++++++++
 4 files changed, 358 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
 create mode 100644 drivers/rtc/rtc-cpcap.c

diff --git a/Documentation/devicetree/bindings/rtc/cpcap-rtc.txt b/Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
new file mode 100644
index 000000000000..45750ff3112d
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
@@ -0,0 +1,18 @@
+Motorola CPCAP PMIC RTC
+-----------------------
+
+This module is part of the CPCAP. For more details about the whole
+chip see Documentation/devicetree/bindings/mfd/motorola-cpcap.txt.
+
+Requires node properties:
+- compatible: should contain "motorola,cpcap-rtc"
+- interrupts: An interrupt specifier for alarm and 1 Hz irq
+
+Example:
+
+&cpcap {
+	cpcap_rtc: rtc {
+		compatible = "motorola,cpcap-rtc";
+		interrupts = <39 IRQ_TYPE_NONE>, <26 IRQ_TYPE_NONE>;
+	};
+};
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index ee1b0e9dde79..050bec749fae 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1731,6 +1731,13 @@ config RTC_DRV_STM32
 	   This driver can also be built as a module, if so, the module
 	   will be called "rtc-stm32".
 
+config RTC_DRV_CPCAP
+	depends on MFD_CPCAP
+	tristate "Motorola CPCAP RTC"
+	help
+	   Say y here for CPCAP rtc found on some Motorola phones
+	   and tablets such as Droid 4.
+
 comment "HID Sensor RTC drivers"
 
 config RTC_DRV_HID_SENSOR_TIME
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index f07297b1460a..13857d2fce09 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_RTC_DRV_BQ32K)	+= rtc-bq32k.o
 obj-$(CONFIG_RTC_DRV_BQ4802)	+= rtc-bq4802.o
 obj-$(CONFIG_RTC_DRV_CMOS)	+= rtc-cmos.o
 obj-$(CONFIG_RTC_DRV_COH901331)	+= rtc-coh901331.o
+obj-$(CONFIG_RTC_DRV_CPCAP)	+= rtc-cpcap.o
 obj-$(CONFIG_RTC_DRV_DA9052)	+= rtc-da9052.o
 obj-$(CONFIG_RTC_DRV_DA9055)	+= rtc-da9055.o
 obj-$(CONFIG_RTC_DRV_DA9063)	+= rtc-da9063.o
diff --git a/drivers/rtc/rtc-cpcap.c b/drivers/rtc/rtc-cpcap.c
new file mode 100644
index 000000000000..7c6a3c3167bd
--- /dev/null
+++ b/drivers/rtc/rtc-cpcap.c
@@ -0,0 +1,332 @@
+/*
+ * Motorola CPCAP PMIC RTC driver
+ *
+ * Based on cpcap-regulator.c from Motorola Linux kernel tree
+ * Copyright (C) 2009 Motorola, Inc.
+ *
+ * Rewritten for mainline kernel
+ *  - use DT
+ *  - use regmap
+ *  - use standard interrupt framework
+ *  - use managed device resources
+ *  - remove custom "secure clock daemon" helpers
+ *
+ * Copyright (C) 2017 Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+#include <linux/err.h>
+#include <linux/regmap.h>
+#include <linux/mfd/motorola-cpcap.h>
+#include <linux/slab.h>
+#include <linux/sched.h>
+
+#define SECS_PER_DAY 86400
+#define DAY_MASK  0x7FFF
+#define TOD1_MASK 0x00FF
+#define TOD2_MASK 0x01FF
+
+struct cpcap_time {
+	int day;
+	int tod1;
+	int tod2;
+};
+
+struct cpcap_rtc {
+	struct regmap *regmap;
+	struct rtc_device *rtc_dev;
+	u16 vendor;
+	int alarm_irq;
+	bool alarm_enabled;
+	int update_irq;
+	bool update_enabled;
+};
+
+static void cpcap2rtc_time(struct rtc_time *rtc, struct cpcap_time *cpcap)
+{
+	unsigned long int tod;
+	unsigned long int time;
+
+	tod = (cpcap->tod1 & TOD1_MASK) | ((cpcap->tod2 & TOD2_MASK) << 8);
+	time = tod + ((cpcap->day & DAY_MASK) * SECS_PER_DAY);
+
+	rtc_time_to_tm(time, rtc);
+}
+
+static void rtc2cpcap_time(struct cpcap_time *cpcap, struct rtc_time *rtc)
+{
+	unsigned long time;
+
+	rtc_tm_to_time(rtc, &time);
+
+	cpcap->day = time / SECS_PER_DAY;
+	time %= SECS_PER_DAY;
+	cpcap->tod2 = (time >> 8) & TOD2_MASK;
+	cpcap->tod1 = time & TOD1_MASK;
+}
+
+static int cpcap_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct cpcap_rtc *rtc = dev_get_drvdata(dev);
+
+	if (rtc->alarm_enabled == enabled)
+		return 0;
+
+	if (enabled)
+		enable_irq(rtc->alarm_irq);
+	else
+		disable_irq(rtc->alarm_irq);
+
+	rtc->alarm_enabled = !!enabled;
+
+	return 0;
+}
+
+static int cpcap_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct cpcap_rtc *rtc;
+	struct cpcap_time cpcap_tm;
+	int temp_tod2;
+	int ret;
+
+	rtc = dev_get_drvdata(dev);
+
+	ret = regmap_read(rtc->regmap, CPCAP_REG_TOD2, &temp_tod2);
+	ret |= regmap_read(rtc->regmap, CPCAP_REG_DAY, &cpcap_tm.day);
+	ret |= regmap_read(rtc->regmap, CPCAP_REG_TOD1, &cpcap_tm.tod1);
+	ret |= regmap_read(rtc->regmap, CPCAP_REG_TOD2, &cpcap_tm.tod2);
+
+	if (temp_tod2 > cpcap_tm.tod2)
+		ret |= regmap_read(rtc->regmap, CPCAP_REG_DAY, &cpcap_tm.day);
+
+	if (ret) {
+		dev_err(dev, "Failed to read time\n");
+		return -EIO;
+	}
+
+	cpcap2rtc_time(tm, &cpcap_tm);
+
+	return rtc_valid_tm(tm);
+}
+
+static int cpcap_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct cpcap_rtc *rtc;
+	struct cpcap_time cpcap_tm;
+	int ret = 0;
+
+	rtc = dev_get_drvdata(dev);
+
+	rtc2cpcap_time(&cpcap_tm, tm);
+
+	if (rtc->alarm_enabled)
+		disable_irq(rtc->alarm_irq);
+	if (rtc->update_enabled)
+		disable_irq(rtc->update_irq);
+
+	if (rtc->vendor == CPCAP_VENDOR_ST) {
+		/* The TOD1 and TOD2 registers MUST be written in this order
+		 * for the change to properly set.
+		 */
+		ret |= regmap_update_bits(rtc->regmap, CPCAP_REG_TOD1,
+					  TOD1_MASK, cpcap_tm.tod1);
+		ret |= regmap_update_bits(rtc->regmap, CPCAP_REG_TOD2,
+					  TOD2_MASK, cpcap_tm.tod2);
+		ret |= regmap_update_bits(rtc->regmap, CPCAP_REG_DAY,
+					  DAY_MASK, cpcap_tm.day);
+	} else {
+		/* Clearing the upper lower 8 bits of the TOD guarantees that
+		 * the upper half of TOD (TOD2) will not increment for 0xFF RTC
+		 * ticks (255 seconds).  During this time we can safely write
+		 * to DAY, TOD2, then TOD1 (in that order) and expect RTC to be
+		 * synchronized to the exact time requested upon the final write
+		 * to TOD1.
+		 */
+		ret |= regmap_update_bits(rtc->regmap, CPCAP_REG_TOD1,
+					  TOD1_MASK, 0);
+		ret |= regmap_update_bits(rtc->regmap, CPCAP_REG_DAY,
+					  DAY_MASK, cpcap_tm.day);
+		ret |= regmap_update_bits(rtc->regmap, CPCAP_REG_TOD2,
+					  TOD2_MASK, cpcap_tm.tod2);
+		ret |= regmap_update_bits(rtc->regmap, CPCAP_REG_TOD1,
+					  TOD1_MASK, cpcap_tm.tod1);
+	}
+
+	if (rtc->update_enabled)
+		enable_irq(rtc->update_irq);
+	if (rtc->alarm_enabled)
+		enable_irq(rtc->alarm_irq);
+
+	return ret;
+}
+
+static int cpcap_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct cpcap_rtc *rtc;
+	struct cpcap_time cpcap_tm;
+	int ret;
+
+	rtc = dev_get_drvdata(dev);
+
+	alrm->enabled = rtc->alarm_enabled;
+
+	ret = regmap_read(rtc->regmap, CPCAP_REG_DAYA, &cpcap_tm.day);
+	ret |= regmap_read(rtc->regmap, CPCAP_REG_TODA2, &cpcap_tm.tod2);
+	ret |= regmap_read(rtc->regmap, CPCAP_REG_TODA1, &cpcap_tm.tod1);
+
+	if (ret) {
+		dev_err(dev, "Failed to read time\n");
+		return -EIO;
+	}
+
+	cpcap2rtc_time(&alrm->time, &cpcap_tm);
+	return rtc_valid_tm(&alrm->time);
+}
+
+static int cpcap_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct cpcap_rtc *rtc;
+	struct cpcap_time cpcap_tm;
+	int ret;
+
+	rtc = dev_get_drvdata(dev);
+
+	rtc2cpcap_time(&cpcap_tm, &alrm->time);
+
+	if (rtc->alarm_enabled)
+		disable_irq(rtc->alarm_irq);
+
+	ret = regmap_update_bits(rtc->regmap, CPCAP_REG_DAYA, DAY_MASK,
+				 cpcap_tm.day);
+	ret |= regmap_update_bits(rtc->regmap, CPCAP_REG_TODA2, TOD2_MASK,
+				  cpcap_tm.tod2);
+	ret |= regmap_update_bits(rtc->regmap, CPCAP_REG_TODA1, TOD1_MASK,
+				  cpcap_tm.tod1);
+
+	if (!ret) {
+		enable_irq(rtc->alarm_irq);
+		rtc->alarm_enabled = true;
+	}
+
+	return ret;
+}
+
+static const struct rtc_class_ops cpcap_rtc_ops = {
+	.read_time		= cpcap_rtc_read_time,
+	.set_time		= cpcap_rtc_set_time,
+	.read_alarm		= cpcap_rtc_read_alarm,
+	.set_alarm		= cpcap_rtc_set_alarm,
+	.alarm_irq_enable	= cpcap_rtc_alarm_irq_enable,
+};
+
+static irqreturn_t cpcap_rtc_alarm_irq(int irq, void *data)
+{
+	struct cpcap_rtc *rtc = data;
+
+	rtc_update_irq(rtc->rtc_dev, 1, RTC_AF | RTC_IRQF);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t cpcap_rtc_update_irq(int irq, void *data)
+{
+	struct cpcap_rtc *rtc = data;
+
+	rtc_update_irq(rtc->rtc_dev, 1, RTC_UF | RTC_IRQF);
+	return IRQ_HANDLED;
+}
+
+static int cpcap_rtc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cpcap_rtc *rtc;
+	int err;
+
+	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
+	if (!rtc)
+		return -ENOMEM;
+
+	rtc->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!rtc->regmap)
+		return -ENODEV;
+
+	platform_set_drvdata(pdev, rtc);
+	rtc->rtc_dev = devm_rtc_device_register(dev, "cpcap_rtc",
+						&cpcap_rtc_ops, THIS_MODULE);
+
+	if (IS_ERR(rtc->rtc_dev)) {
+		kfree(rtc);
+		return PTR_ERR(rtc->rtc_dev);
+	}
+
+	err = cpcap_get_vendor(dev, rtc->regmap, &rtc->vendor);
+	if (err)
+		return err;
+
+	rtc->alarm_irq = platform_get_irq(pdev, 0);
+	err = devm_request_threaded_irq(dev, rtc->alarm_irq, NULL,
+					cpcap_rtc_alarm_irq, IRQ_NONE,
+					"rtc_alarm", rtc);
+	if (err) {
+		dev_err(dev, "Could not request alarm irq: %d\n", err);
+		return err;
+	}
+	disable_irq(rtc->alarm_irq);
+
+	/* Stock Android uses the 1 Hz interrupt for "secure clock daemon",
+	 * which is not supported by the mainline kernel. The mainline kernel
+	 * does not use the irq at the moment, but we explicitly request and
+	 * disable it, so that its masked and does not wake up the processor
+	 * every second.
+	 */
+	rtc->update_irq = platform_get_irq(pdev, 1);
+	err = devm_request_threaded_irq(dev, rtc->update_irq, NULL,
+					cpcap_rtc_update_irq, IRQ_NONE,
+					"rtc_1hz", rtc);
+	if (err) {
+		dev_err(dev, "Could not request update irq: %d\n", err);
+		return err;
+	}
+	disable_irq(rtc->update_irq);
+
+	err = device_init_wakeup(dev, 1);
+	if (err) {
+		dev_err(dev, "wakeup initialization failed (%d)\n", err);
+		/* ignore error and continue without wakeup support */
+	}
+
+	return 0;
+}
+
+static const struct of_device_id cpcap_rtc_of_match[] = {
+	{ .compatible = "motorola,cpcap-rtc", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, cpcap_rtc_of_match);
+
+static struct platform_driver cpcap_rtc_driver = {
+	.probe		= cpcap_rtc_probe,
+	.driver		= {
+		.name	= "cpcap-rtc",
+		.of_match_table = cpcap_rtc_of_match,
+	},
+};
+
+module_platform_driver(cpcap_rtc_driver);
+
+MODULE_ALIAS("platform:cpcap-rtc");
+MODULE_DESCRIPTION("CPCAP RTC driver");
+MODULE_AUTHOR("Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>");
+MODULE_LICENSE("GPL");
-- 
2.11.0

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
