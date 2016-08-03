From: John Stultz <john.stultz@linaro.org>
Subject: [RFC][PATCH 3/4] power: reset: Add sram-reboot-mode driver
Date: Wed,  3 Aug 2016 16:05:22 -0700
Message-ID: <1470265523-27557-4-git-send-email-john.stultz@linaro.org>
References: <1470265523-27557-1-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470265523-27557-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: John Stultz <john.stultz@linaro.org>, Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Caesar Wang <wxt@rock-chips.com>, Kees Cook <keescook@chromium.org>, Guodong Xu <guodong.xu@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Vishal Bhoj <vishal.bhoj@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

Add sram-reboot-mode driver, which enables
reboot modes to be specified from sram subnodes.

Cc: Andy Yan <andy.yan@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Thierry Reding <treding@nvidia.com>
Cc: Heiko Stübner <heiko@sntech.de>
Cc: Caesar Wang <wxt@rock-chips.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Guodong Xu <guodong.xu@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Vishal Bhoj <vishal.bhoj@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: devicetree@vger.kernel.org
Cc: Android Kernel Team <kernel-team@android.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/power/reset/Kconfig            | 10 ++++
 drivers/power/reset/Makefile           |  1 +
 drivers/power/reset/sram-reboot-mode.c | 95 ++++++++++++++++++++++++++++++++++
 3 files changed, 106 insertions(+)
 create mode 100644 drivers/power/reset/sram-reboot-mode.c

diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index 3bfac53..af553ed 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -208,5 +208,15 @@ config SYSCON_REBOOT_MODE
 	  register, then the bootloader can read it to take different
 	  action according to the mode.
 
+config SRAM_REBOOT_MODE
+	bool "Generic SRAM reboot mode driver"
+	select REBOOT_MODE
+	select SRAM
+	help
+	 Say y here will enable reboot mode driver. This will
+	 get reboot mode arguments and store it in an SRAM
+	 address, then the bootloader can read it to take different
+	 action according to the mode.
+
 endif
 
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index 1be307c..14f23ad 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -24,3 +24,4 @@ obj-$(CONFIG_POWER_RESET_RMOBILE) += rmobile-reset.o
 obj-$(CONFIG_POWER_RESET_ZX) += zx-reboot.o
 obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
 obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
+obj-$(CONFIG_SRAM_REBOOT_MODE) += sram-reboot-mode.o
diff --git a/drivers/power/reset/sram-reboot-mode.c b/drivers/power/reset/sram-reboot-mode.c
new file mode 100644
index 0000000..8945dac
--- /dev/null
+++ b/drivers/power/reset/sram-reboot-mode.c
@@ -0,0 +1,95 @@
+/*
+ * Copyright (c) 2016, Linaro Limited
+ * Based on syscon-reboot-mode.c
+ * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/reboot.h>
+#include <linux/regmap.h>
+#include "reboot-mode.h"
+
+
+
+struct sram_reboot_mode {
+	struct reboot_mode_driver reboot;
+	void __iomem *reboot_reason_val_addr;
+};
+
+static int sram_reboot_mode_write(struct reboot_mode_driver *reboot,
+					unsigned int magic)
+{
+	struct sram_reboot_mode *sram_rbm;
+
+	sram_rbm = container_of(reboot, struct sram_reboot_mode, reboot);
+
+	writel(magic, sram_rbm->reboot_reason_val_addr);
+	return 0;
+}
+
+static int sram_reboot_mode_probe(struct platform_device *pdev)
+{
+	struct sram_reboot_mode *sram_rbm;
+	struct resource *res;
+	int ret;
+
+	sram_rbm = devm_kzalloc(&pdev->dev, sizeof(*sram_rbm), GFP_KERNEL);
+	if (!sram_rbm)
+		return -ENOMEM;
+
+	sram_rbm->reboot.dev = &pdev->dev;
+	sram_rbm->reboot.write = sram_reboot_mode_write;
+
+	dev_set_drvdata(&pdev->dev, sram_rbm);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return PTR_ERR(res);
+
+	sram_rbm->reboot_reason_val_addr = devm_ioremap(&pdev->dev, res->start,
+							 resource_size(res));
+	if (IS_ERR(sram_rbm->reboot_reason_val_addr))
+		return PTR_ERR(sram_rbm->reboot_reason_val_addr);
+
+	ret = reboot_mode_register(&sram_rbm->reboot);
+	if (ret)
+		dev_err(&pdev->dev, "can't register reboot mode\n");
+
+	return ret;
+}
+
+static int sram_reboot_mode_remove(struct platform_device *pdev)
+{
+	struct sram_reboot_mode *sram_rbm = dev_get_drvdata(&pdev->dev);
+
+	return reboot_mode_unregister(&sram_rbm->reboot);
+}
+
+static const struct of_device_id sram_reboot_mode_of_match[] = {
+	{ .compatible = "sram-reboot-mode" },
+	{}
+};
+
+static struct platform_driver sram_reboot_mode_driver = {
+	.probe = sram_reboot_mode_probe,
+	.remove = sram_reboot_mode_remove,
+	.driver = {
+		.name = "sram-reboot-mode",
+		.of_match_table = sram_reboot_mode_of_match,
+	},
+};
+module_platform_driver(sram_reboot_mode_driver);
+
+MODULE_AUTHOR("John Stultz <john.stultz@linaro.org>");
+MODULE_DESCRIPTION("SRAM reboot mode driver");
+MODULE_LICENSE("GPL v2");
-- 
1.9.1
