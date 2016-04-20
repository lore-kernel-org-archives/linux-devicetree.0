From: Jeppe Ledet-Pedersen <jlp-jTq9jD7AHYRWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/3] misc: eeprom: add Cypress FM33256B FRAM driver
Date: Wed, 20 Apr 2016 13:07:50 +0200
Message-ID: <1461150471-23163-3-git-send-email-jlp@gomspace.com>
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
 MAINTAINERS                         |   1 +
 drivers/misc/eeprom/Kconfig         |  12 ++++
 drivers/misc/eeprom/Makefile        |   1 +
 drivers/misc/eeprom/fm33256b-fram.c | 110 ++++++++++++++++++++++++++++++++++++
 4 files changed, 124 insertions(+)
 create mode 100644 drivers/misc/eeprom/fm33256b-fram.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 87b5023..a8b71d8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3387,6 +3387,7 @@ M:	Jeppe Ledet-Pedersen <jlp-jTq9jD7AHYRWk0Htik3J/w@public.gmane.org>
 S:	Maintained
 F:	include/linux/mfd/fm33256b.h
 F:	drivers/mfd/fm33256b.c
+F:	drivers/misc/eeprom/fm33256b-fram.c
 
 CYTTSP TOUCHSCREEN DRIVER
 M:	Ferruh Yigit <fery-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>
diff --git a/drivers/misc/eeprom/Kconfig b/drivers/misc/eeprom/Kconfig
index cfc493c..2c0c26a3 100644
--- a/drivers/misc/eeprom/Kconfig
+++ b/drivers/misc/eeprom/Kconfig
@@ -102,4 +102,16 @@ config EEPROM_DIGSY_MTC_CFG
 
 	  If unsure, say N.
 
+config EEPROM_FM33256B
+	tristate "Cypress FM33256B FRAM support"
+	depends on MFD_FM33256B
+	help
+	  This is a driver for the FRAM found in the Cypress FM33256B Processor
+	  Companion.
+
+	  The FRAM is exported as a binary sysfs file.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called fm33256b-fram.
+
 endmenu
diff --git a/drivers/misc/eeprom/Makefile b/drivers/misc/eeprom/Makefile
index fc1e81d..f991f0f 100644
--- a/drivers/misc/eeprom/Makefile
+++ b/drivers/misc/eeprom/Makefile
@@ -5,3 +5,4 @@ obj-$(CONFIG_EEPROM_MAX6875)	+= max6875.o
 obj-$(CONFIG_EEPROM_93CX6)	+= eeprom_93cx6.o
 obj-$(CONFIG_EEPROM_93XX46)	+= eeprom_93xx46.o
 obj-$(CONFIG_EEPROM_DIGSY_MTC_CFG) += digsy_mtc_eeprom.o
+obj-$(CONFIG_EEPROM_FM33256B)	+= fm33256b-fram.o
diff --git a/drivers/misc/eeprom/fm33256b-fram.c b/drivers/misc/eeprom/fm33256b-fram.c
new file mode 100644
index 0000000..fd3c2c9
--- /dev/null
+++ b/drivers/misc/eeprom/fm33256b-fram.c
@@ -0,0 +1,110 @@
+/*
+ * Cypress FM33256B Processor Companion FRAM Driver
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
+
+static ssize_t fm33256b_fram_read(struct file *filp, struct kobject *kobj,
+				  struct bin_attribute *bin_attr,
+				  char *buf, loff_t off, size_t count)
+{
+	int ret;
+	struct device *dev = container_of(kobj, struct device, kobj);
+	struct fm33256b *fm33256b = dev_get_drvdata(dev->parent);
+
+	ret = regmap_bulk_read(fm33256b->regmap_fram, off, buf, count);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static ssize_t fm33256b_fram_write(struct file *filp, struct kobject *kobj,
+				   struct bin_attribute *bin_attr,
+				   char *buf, loff_t off, size_t count)
+{
+	int ret;
+	struct device *dev = container_of(kobj, struct device, kobj);
+	struct fm33256b *fm33256b = dev_get_drvdata(dev->parent);
+
+	ret = regmap_bulk_write(fm33256b->regmap_fram, off, buf, count);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static struct bin_attribute fm33256b_fram_attr = {
+	.attr = {
+		.name = "fram",
+		.mode = S_IWUSR | S_IRUGO,
+	},
+	.size = FM33256B_MAX_FRAM,
+	.read = fm33256b_fram_read,
+	.write = fm33256b_fram_write,
+};
+
+static int fm33256b_fram_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct device *dev = &pdev->dev;
+	struct fm33256b *fm33256b;
+
+	fm33256b = dev_get_drvdata(dev->parent);
+
+	ret = sysfs_create_bin_file(&(dev->kobj), &fm33256b_fram_attr);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int fm33256b_fram_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct fm33256b *fm33256b;
+
+	fm33256b = dev_get_drvdata(dev->parent);
+
+	sysfs_remove_bin_file(&(dev->kobj), &fm33256b_fram_attr);
+
+	return 0;
+}
+
+static const struct of_device_id fm33256b_fram_dt_ids[] = {
+	{ .compatible = "cypress,fm33256b-fram" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, fm33256b_fram_dt_ids);
+
+static struct platform_driver fm33256b_fram_driver = {
+	.driver = {
+		.name = "fm33256b-fram",
+		.of_match_table = fm33256b_fram_dt_ids,
+	},
+	.probe = fm33256b_fram_probe,
+	.remove = fm33256b_fram_remove,
+};
+module_platform_driver(fm33256b_fram_driver);
+
+MODULE_ALIAS("platform:fm33256b-fram");
+MODULE_AUTHOR("Jeppe Ledet-Pedersen <jlp-jTq9jD7AHYRWk0Htik3J/w@public.gmane.org>");
+MODULE_DESCRIPTION("Cypress FM33256B Processor Companion FRAM Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
