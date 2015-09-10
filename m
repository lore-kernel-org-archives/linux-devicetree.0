From: Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: [RESEND PATCH 3/3] reset: hi6220: Reset driver for hisilicon hi6220 SoC
Date: Thu, 10 Sep 2015 14:11:30 +0800
Message-ID: <1441865490-104686-3-git-send-email-puck.chen@hisilicon.com>
References: <1441865490-104686-1-git-send-email-puck.chen@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441865490-104686-1-git-send-email-puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add reset driver for hi6220-hikey board,this driver supply deassert
of IP. on hi6220 SoC.

Signed-off-by: Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
---
 drivers/reset/Kconfig                  |  1 +
 drivers/reset/Makefile                 |  1 +
 drivers/reset/hisilicon/Kconfig        |  5 +++
 drivers/reset/hisilicon/Makefile       |  1 +
 drivers/reset/hisilicon/hi6220_reset.c | 74 ++++++++++++++++++++++++++++++++++
 5 files changed, 82 insertions(+)
 create mode 100644 drivers/reset/hisilicon/Kconfig
 create mode 100644 drivers/reset/hisilicon/Makefile
 create mode 100644 drivers/reset/hisilicon/hi6220_reset.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 0615f50..df37212 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -13,3 +13,4 @@ menuconfig RESET_CONTROLLER
 	  If unsure, say no.
 
 source "drivers/reset/sti/Kconfig"
+source "drivers/reset/hisilicon/Kconfig"
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 157d421..331d7b2 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -3,3 +3,4 @@ obj-$(CONFIG_ARCH_SOCFPGA) += reset-socfpga.o
 obj-$(CONFIG_ARCH_BERLIN) += reset-berlin.o
 obj-$(CONFIG_ARCH_SUNXI) += reset-sunxi.o
 obj-$(CONFIG_ARCH_STI) += sti/
+obj-$(CONFIG_ARCH_HISI) += hisilicon/
diff --git a/drivers/reset/hisilicon/Kconfig b/drivers/reset/hisilicon/Kconfig
new file mode 100644
index 0000000..bceed14
--- /dev/null
+++ b/drivers/reset/hisilicon/Kconfig
@@ -0,0 +1,5 @@
+config COMMON_RESET_HI6220
+	tristate "Hi6220 Clock Driver"
+	depends on (ARCH_HISI && RESET_CONTROLLER)
+	help
+	  Build the Hisilicon Hi6220 reset driver.
diff --git a/drivers/reset/hisilicon/Makefile b/drivers/reset/hisilicon/Makefile
new file mode 100644
index 0000000..c932f86
--- /dev/null
+++ b/drivers/reset/hisilicon/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_COMMON_RESET_HI6220) += hi6220_reset.o
diff --git a/drivers/reset/hisilicon/hi6220_reset.c b/drivers/reset/hisilicon/hi6220_reset.c
new file mode 100644
index 0000000..a88fc57
--- /dev/null
+++ b/drivers/reset/hisilicon/hi6220_reset.c
@@ -0,0 +1,74 @@
+/*
+ * Hisilicon Hi6220 reset controller driver
+ *
+ * Copyright (c) 2015 Hisilicon Limited.
+ *
+ * Author: Feng Chen <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/init.h>
+#include <linux/bitops.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/reset-controller.h>
+#include <linux/reset.h>
+
+static void __iomem *src_base;
+static DEFINE_SPINLOCK(reset_lock);
+
+static int hi6220_reset_module(struct reset_controller_dev *rc_dev,
+		unsigned long idx)
+{
+	unsigned long timeout;
+	unsigned long flags;
+	int bit;
+	u32 val;
+
+	int bank = idx >> 8;
+	int offset = idx & 0xff;
+
+	spin_lock_irqsave(&reset_lock, flags);
+
+	val = readl(src_base + (bank * 0x10));
+	writel(val | BIT(offset), src_base + (bank * 0x10));
+
+	spin_unlock_irqrestore(&reset_lock, flags);
+
+	return 0;
+
+}
+
+static struct reset_control_ops hi6220_reset_ops = {
+	.deassert = hi6220_reset_module,
+};
+
+static struct reset_controller_dev hi6220_reset_dev = {
+	.ops = &hi6220_reset_ops,
+	.nr_resets = 0xffff,
+};
+
+static void __init hi6220_reset_init(void)
+{
+	struct device_node *np;
+	struct reset_control *test = NULL;
+
+	np = of_find_compatible_node(NULL, NULL, "hisilicon,hisi_reset_ctl");
+	if (!np) {
+		pr_err("find reset node in dts error!\n");
+		return;
+	}
+	src_base = of_iomap(np, 0);
+	WARN_ON(!src_base);
+
+	hi6220_reset_dev.of_node = np;
+	if (IS_ENABLED(CONFIG_RESET_CONTROLLER))
+		reset_controller_register(&hi6220_reset_dev);
+}
+
+postcore_initcall(hi6220_reset_init);
+
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
