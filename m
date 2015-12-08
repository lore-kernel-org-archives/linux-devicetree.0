From: John Stultz <john.stultz@linaro.org>
Subject: [RFC][PATCH] misc: Introduce reboot_reason driver
Date: Tue,  8 Dec 2015 13:29:22 -0800
Message-ID: <1449610162-30543-1-git-send-email-john.stultz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: John Stultz <john.stultz@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinay Simha BN <simhavcs@gmail.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, devicetree@vger.kernel.org, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

This patch adds a basic driver to allow for commands like
"reboot bootloader" and "reboot recovery" to communicate this
reboot-reason to the bootloader.

This is commonly done on Android devices, in order to reboot
the device into fastboot or recovery mode. It also supports
custom OEM specific commands, via "reboot oem-<value>".

This driver pulls the phys memory address from DT as well as
the magic reason values that are written to the address for
each mode.

For an example, this patch also adds the DT support for
the nexus7 device via its dts (which is not yet upstream).

Thoughts and feedback would be appreciated!

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: Vinay Simha BN <simhavcs@gmail.com>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: devicetree@vger.kernel.org
Cc: Android Kernel Team <kernel-team@android.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts |   9 ++
 drivers/misc/Kconfig                          |   8 ++
 drivers/misc/Makefile                         |   1 +
 drivers/misc/reboot_reason.c                  | 117 ++++++++++++++++++++++++++
 4 files changed, 135 insertions(+)
 create mode 100644 drivers/misc/reboot_reason.c

diff --git a/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
index 5183d18..ee5dcb7 100644
--- a/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
@@ -282,6 +282,15 @@
 			};
 		};
 
+		reboot_reason: reboot_reason@2a03f65c {
+			compatible		= "reboot_reason";
+			reg			= <0x2A03F65C 0x4>;
+			reason,none		= <0x77665501>;
+			reason,bootloader	= <0x77665500>;
+			reason,recovery		= <0x77665502>;
+			reason,oem		= <0x6f656d00>;
+		};
+
 		gpio-keys {
 			compatible = "gpio-keys";
 			power {
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 22892c7..b5c141b 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -525,6 +525,14 @@ config VEXPRESS_SYSCFG
 	  bus. System Configuration interface is one of the possible means
 	  of generating transactions on this bus.
 
+config REBOOT_REASON
+	bool "Pass reboot reason to bootloader"
+	default n
+	help
+	  On many systems there is a desire to provide a reboot reason to
+	  the bootloader, so that the bootloader can boot into a desired
+	  mode on the next boot.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 537d7f3..4581e62 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -56,3 +56,4 @@ obj-$(CONFIG_GENWQE)		+= genwqe/
 obj-$(CONFIG_ECHO)		+= echo/
 obj-$(CONFIG_VEXPRESS_SYSCFG)	+= vexpress-syscfg.o
 obj-$(CONFIG_CXL_BASE)		+= cxl/
+obj-$(CONFIG_REBOOT_REASON)	+= reboot_reason.o
diff --git a/drivers/misc/reboot_reason.c b/drivers/misc/reboot_reason.c
new file mode 100644
index 0000000..5c9b55eb
--- /dev/null
+++ b/drivers/misc/reboot_reason.c
@@ -0,0 +1,117 @@
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/interrupt.h>
+#include <linux/spinlock.h>
+#include <linux/reboot.h>
+
+/* Types of reasons */
+static enum {
+	NONE,
+	BOOTLOADER,
+	RECOVERY,
+	OEM,
+	MAX_REASONS
+} __maybe_unused reason_types;
+
+static u32			reasons[MAX_REASONS];
+static void __iomem		*reboot_reason_addr;
+static struct notifier_block	restart_nb;
+
+static int reboot_reason(struct notifier_block *nb, unsigned long action,
+								void *data)
+{
+	char *cmd = (char *)data;
+	long reason = reasons[NONE];
+
+	if (!reboot_reason_addr)
+		return NOTIFY_DONE;
+
+	if (cmd != NULL) {
+		if (!strncmp(cmd, "bootloader", 10))
+			reason = reasons[BOOTLOADER];
+		else if (!strncmp(cmd, "recovery", 8))
+			reason = reasons[RECOVERY];
+		else if (!strncmp(cmd, "oem-", 4)) {
+			unsigned long code;
+
+			if (!kstrtoul(cmd+4, 0, &code))
+				reason = reasons[OEM] | (code & 0xff);
+		}
+	}
+
+	if (reason != -1)
+		writel(reason, reboot_reason_addr);
+	return NOTIFY_DONE;
+}
+
+static int reboot_reason_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	u32 val;
+	int i;
+
+	/* initialize the reasons */
+	for (i = 0; i < MAX_REASONS; i++)
+		reasons[i] = -1;
+
+	/* Try to grab the reason io address */
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	reboot_reason_addr = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(reboot_reason_addr))
+		return PTR_ERR(reboot_reason_addr);
+
+	/* initialize specified reasons from DT */
+	if (!of_property_read_u32(pdev->dev.of_node, "reason,none", &val))
+		reasons[NONE] = val;
+	if (!of_property_read_u32(pdev->dev.of_node, "reason,bootloader", &val))
+		reasons[BOOTLOADER] = val;
+	if (!of_property_read_u32(pdev->dev.of_node, "reason,recovery", &val))
+		reasons[RECOVERY] = val;
+	if (!of_property_read_u32(pdev->dev.of_node, "reason,oem", &val))
+		reasons[OEM] = val;
+
+	/* Install the notifier */
+	restart_nb.notifier_call = reboot_reason;
+	restart_nb.priority = 256;
+	if (register_restart_handler(&restart_nb)) {
+		dev_err(&pdev->dev,
+			"failed to setup restart handler.\n");
+	}
+	return 0;
+}
+
+int reboot_reason_remove(struct platform_device *pdev)
+{
+	unregister_restart_handler(&restart_nb);
+	return 0;
+}
+
+static const struct of_device_id reboot_reason_of_match[] = {
+	{ .compatible = "reboot_reason", },
+	{ },
+};
+
+static struct platform_driver reboot_reason_driver = {
+	.driver = {
+		.name = "reboot_reason",
+		.of_match_table = reboot_reason_of_match,
+	},
+	.probe = reboot_reason_probe,
+	.remove = reboot_reason_remove,
+};
+
+static int __init reboot_reason_init(void)
+{
+	return platform_driver_register(&reboot_reason_driver);
+}
+arch_initcall(reboot_reason_init);
+
+static void __exit reboot_reason_exit(void)
+{
+	platform_driver_unregister(&reboot_reason_driver);
+}
+module_exit(reboot_reason_exit);
-- 
1.9.1
