From: Jeppe Ledet-Pedersen <jlp-jTq9jD7AHYRWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 3/3] rtc: add Cypress FM33256B RTC driver
Date: Wed, 20 Apr 2016 13:07:51 +0200
Message-ID: <1461150471-23163-4-git-send-email-jlp@gomspace.com>
References: <1461150471-23163-1-git-send-email-jlp@gomspace.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461150471-23163-1-git-send-email-jlp-jTq9jD7AHYRWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeppe Ledet-Pedersen <jlp-jTq9jD7AHYRWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jeppe Ledet-Pedersen <jlp-jTq9jD7AHYRWk0Htik3J/w@public.gmane.org>
---
 MAINTAINERS                |   1 +
 drivers/rtc/Kconfig        |  10 +++
 drivers/rtc/Makefile       |   1 +
 drivers/rtc/rtc-fm33256b.c | 166 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 178 insertions(+)
 create mode 100644 drivers/rtc/rtc-fm33256b.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a8b71d8..9ccc285 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3388,6 +3388,7 @@ S:	Maintained
 F:	include/linux/mfd/fm33256b.h
 F:	drivers/mfd/fm33256b.c
 F:	drivers/misc/eeprom/fm33256b-fram.c
+F:	drivers/rtc/rtc-fm33256b.c
 
 CYTTSP TOUCHSCREEN DRIVER
 M:	Ferruh Yigit <fery-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 3e84315..7856f0b 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -740,6 +740,16 @@ config RTC_DRV_MCP795
 	  This driver can also be built as a module. If so the module
 	  will be called rtc-mcp795.
 
+config RTC_DRV_FM33256B
+	tristate "Cypress FM33256B RTC support"
+	depends on MFD_FM33256B
+	help
+	  If you say Y here you will get support for the RTC found in the
+	  Cypress FM33256B Processor Companion.
+
+	  This driver can also be built as a module. If so the module
+	  will be called rtc-fm33256b.
+
 endif # SPI_MASTER
 
 #
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index ea28337..1478fb6 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -64,6 +64,7 @@ obj-$(CONFIG_RTC_DRV_EFI)	+= rtc-efi.o
 obj-$(CONFIG_RTC_DRV_EM3027)	+= rtc-em3027.o
 obj-$(CONFIG_RTC_DRV_EP93XX)	+= rtc-ep93xx.o
 obj-$(CONFIG_RTC_DRV_FM3130)	+= rtc-fm3130.o
+obj-$(CONFIG_RTC_DRV_FM33256B)	+= rtc-fm33256b.o
 obj-$(CONFIG_RTC_DRV_GEMINI)	+= rtc-gemini.o
 obj-$(CONFIG_RTC_DRV_GENERIC)	+= rtc-generic.o
 obj-$(CONFIG_RTC_DRV_HID_SENSOR_TIME) += rtc-hid-sensor-time.o
diff --git a/drivers/rtc/rtc-fm33256b.c b/drivers/rtc/rtc-fm33256b.c
new file mode 100644
index 0000000..a9650d4
--- /dev/null
+++ b/drivers/rtc/rtc-fm33256b.c
@@ -0,0 +1,166 @@
+/*
+ * Cypress FM33256B Processor Companion RTC Driver
+ *
+ * Copyright (C) 2016 GomSpace ApS
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/mfd/fm33256b.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/rtc.h>
+#include <linux/bcd.h>
+
+struct fm33256b_rtc {
+	struct fm33256b *fm33256b;
+	struct rtc_device *rtcdev;
+};
+
+static int fm33256b_rtc_readtime(struct device *dev, struct rtc_time *tm)
+{
+	int ret;
+	struct fm33256b_rtc *rtc = dev_get_drvdata(dev);
+	uint8_t time[7];
+
+	/* Lock time update */
+	ret = regmap_update_bits(rtc->fm33256b->regmap_pc,
+				 FM33256B_RTC_ALARM_CONTROL_REG,
+				 FM33256B_R, FM33256B_R);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_bulk_read(rtc->fm33256b->regmap_pc,
+			       FM33256B_SECONDS_REG, time, sizeof(time));
+	if (ret < 0)
+		return ret;
+
+	/* Unlock time update */
+	ret = regmap_update_bits(rtc->fm33256b->regmap_pc,
+				 FM33256B_RTC_ALARM_CONTROL_REG,
+				 FM33256B_R, 0);
+	if (ret < 0)
+		return ret;
+
+	tm->tm_sec	= bcd2bin(time[0]);
+	tm->tm_min	= bcd2bin(time[1]);
+	tm->tm_hour	= bcd2bin(time[2]);
+	tm->tm_wday	= bcd2bin(time[3]) - 1;
+	tm->tm_mday	= bcd2bin(time[4]);
+	tm->tm_mon	= bcd2bin(time[5]) - 1;
+	tm->tm_year	= bcd2bin(time[6]);
+
+	if (tm->tm_year < 70)
+		tm->tm_year += 100;
+
+	return rtc_valid_tm(tm);
+}
+
+static int fm33256b_rtc_settime(struct device *dev, struct rtc_time *tm)
+{
+	int ret;
+	struct fm33256b_rtc *rtc = dev_get_drvdata(dev);
+	uint8_t time[7];
+
+	time[0] = bin2bcd(tm->tm_sec);
+	time[1] = bin2bcd(tm->tm_min);
+	time[2] = bin2bcd(tm->tm_hour);
+	time[3] = bin2bcd(tm->tm_wday + 1);
+	time[4] = bin2bcd(tm->tm_mday);
+	time[5] = bin2bcd(tm->tm_mon + 1);
+	time[6] = bin2bcd(tm->tm_year % 100);
+
+	/* Unlock time update */
+	ret = regmap_update_bits(rtc->fm33256b->regmap_pc,
+				 FM33256B_RTC_ALARM_CONTROL_REG,
+				 FM33256B_W, FM33256B_W);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_bulk_write(rtc->fm33256b->regmap_pc,
+				FM33256B_SECONDS_REG, time, sizeof(time));
+	if (ret < 0)
+		return ret;
+
+	/* Lock time update */
+	ret = regmap_update_bits(rtc->fm33256b->regmap_pc,
+				 FM33256B_RTC_ALARM_CONTROL_REG,
+				 FM33256B_W, 0);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static const struct rtc_class_ops fm33256b_rtc_ops = {
+	.read_time	= fm33256b_rtc_readtime,
+	.set_time	= fm33256b_rtc_settime,
+};
+
+static int fm33256b_rtc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct fm33256b *fm33256b;
+	struct fm33256b_rtc *rtc;
+
+	fm33256b = dev_get_drvdata(dev->parent);
+
+	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
+	if (!rtc)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, rtc);
+
+	rtc->fm33256b = fm33256b;
+	rtc->rtcdev = devm_rtc_device_register(&pdev->dev, KBUILD_MODNAME,
+					       &fm33256b_rtc_ops, THIS_MODULE);
+	if (IS_ERR(rtc->rtcdev))
+		return PTR_ERR(rtc->rtcdev);
+
+	return 0;
+}
+
+static int fm33256b_rtc_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct fm33256b *fm33256b;
+	struct fm33256b_rtc *rtc = platform_get_drvdata(pdev);
+
+	fm33256b = dev_get_drvdata(dev->parent);
+
+	devm_rtc_device_unregister(&pdev->dev, rtc->rtcdev);
+
+	return 0;
+}
+
+static const struct of_device_id fm33256b_rtc_dt_ids[] = {
+	{ .compatible = "cypress,fm33256b-rtc" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, fm33256b_rtc_dt_ids);
+
+static struct platform_driver fm33256b_rtc_driver = {
+	.driver = {
+		.name = "fm33256b-rtc",
+		.of_match_table = fm33256b_rtc_dt_ids,
+	},
+	.probe = fm33256b_rtc_probe,
+	.remove = fm33256b_rtc_remove,
+};
+module_platform_driver(fm33256b_rtc_driver);
+
+MODULE_ALIAS("platform:fm33256b-rtc");
+MODULE_AUTHOR("Jeppe Ledet-Pedersen <jlp-jTq9jD7AHYRWk0Htik3J/w@public.gmane.org>");
+MODULE_DESCRIPTION("Cypress FM33256B Processor Companion RTC Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
