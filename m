From: John Stultz <john.stultz@linaro.org>
Subject: [RFC][PATCH 2/3] power: reset: Add sram-reboot-mode driver
Date: Tue, 26 Jan 2016 16:37:59 -0800
Message-ID: <1453855080-17760-3-git-send-email-john.stultz@linaro.org>
References: <1453855080-17760-1-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453855080-17760-1-git-send-email-john.stultz@linaro.org>
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
Cc: Heiko St=C3=BCbner <heiko@sntech.de>
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
 drivers/power/reset/Kconfig            |  9 +++++
 drivers/power/reset/Makefile           |  1 +
 drivers/power/reset/sram-reboot-mode.c | 66 ++++++++++++++++++++++++++=
++++++++
 3 files changed, 76 insertions(+)
 create mode 100644 drivers/power/reset/sram-reboot-mode.c

diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index 76a6251..b033922 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -182,5 +182,14 @@ config SYSCON_REBOOT_MODE
 	 register, then the bootloader can read it to take different
 	 action according to the mode.
=20
+config SRAM_REBOOT_MODE
+	bool "Generic SRAM reboot mode driver"
+	select REBOOT_MODE
+	help
+	 Say y here will enable reboot mode driver. This will
+	 get reboot mode arguments and store it in an SRAM
+	 address, then the bootloader can read it to take different
+	 action according to the mode.
+
 endif
=20
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefil=
e
index afd05e9..4780f20 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -21,4 +21,5 @@ obj-$(CONFIG_POWER_RESET_SYSCON_POWEROFF) +=3D syscon=
-poweroff.o
 obj-$(CONFIG_POWER_RESET_RMOBILE) +=3D rmobile-reset.o
 obj-$(CONFIG_REBOOT_MODE) +=3D reboot-mode.o
 obj-$(CONFIG_SYSCON_REBOOT_MODE) +=3D syscon-reboot-mode.o
+obj-$(CONFIG_SRAM_REBOOT_MODE) +=3D sram-reboot-mode.o
=20
diff --git a/drivers/power/reset/sram-reboot-mode.c b/drivers/power/res=
et/sram-reboot-mode.c
new file mode 100644
index 0000000..065c3a8
--- /dev/null
+++ b/drivers/power/reset/sram-reboot-mode.c
@@ -0,0 +1,66 @@
+/*
+ * Copyright (c) 2016, Linaro Limited
+ * Based on syscon-reboot-mode.c
+ * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License as published b=
y
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
+static void __iomem *reboot_reason_val_addr;
+
+static int sram_reboot_mode_write(int magic)
+{
+	writel(magic, reboot_reason_val_addr);
+	return 0;
+}
+
+static int sram_reboot_mode_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	int ret;
+
+	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return PTR_ERR(res);
+
+	reboot_reason_val_addr =3D devm_ioremap(&pdev->dev, res->start, resou=
rce_size(res));
+	if (IS_ERR(reboot_reason_val_addr))
+		return PTR_ERR(reboot_reason_val_addr);
+
+	ret =3D reboot_mode_register(&pdev->dev, sram_reboot_mode_write);
+	if (ret)
+		dev_err(&pdev->dev, "can't register reboot mode\n");
+
+	return ret;
+}
+
+static const struct of_device_id sram_reboot_mode_of_match[] =3D {
+	{ .compatible =3D "sram-reboot-mode" },
+	{}
+};
+
+static struct platform_driver sram_reboot_mode_driver =3D {
+	.probe =3D sram_reboot_mode_probe,
+	.driver =3D {
+		.name =3D "sram-reboot-mode",
+		.of_match_table =3D sram_reboot_mode_of_match,
+	},
+};
+module_platform_driver(sram_reboot_mode_driver);
+
+MODULE_AUTHOR("John Stultz <john.stultz@linaro.org>");
+MODULE_DESCRIPTION("SRAM reboot mode driver");
+MODULE_LICENSE("GPL v2");
--=20
1.9.1
