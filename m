From: Thierry Escande <thierry.escande@collabora.com>
Subject: [PATCH v2 5/5] firmware: google memconsole: Add ARM/ARM64 support
Date: Tue, 28 Mar 2017 18:11:29 +0200
Message-ID: <1490717489-19218-6-git-send-email-thierry.escande@collabora.com>
References: <1490717489-19218-1-git-send-email-thierry.escande@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset = "utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1490717489-19218-1-git-send-email-thierry.escande@collabora.com>
Content-Transfert-Encoding: 8bit
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@nvidia.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

This patch expands the Google firmware memory console driver to also
work on certain tree based platforms running coreboot, such as ARM/ARM64
Chromebooks. This patch now adds another path to find the coreboot table
through the device tree. In order to find that, a second level
bootloader must have installed the 'coreboot' compatible device tree
node that describes its base address and size.

This patch is a rework/split/merge of patches from the chromeos v4.4
kernel tree originally authored by:
 Wei-Ning Huang <wnhuang@chromium.org>
 Julius Werner <jwerner@chromium.org>
 Brian Norris <briannorris@chromium.org>

Signed-off-by: Thierry Escande <thierry.escande@collabora.com>
---

In this v2:
Adds a missing dependency on X86 for the GOOGLE_SMI symbol reported by
the kbuild test robot as the X86 dependency is removed from the
GOOGLE_FIRMWARE symbol for ARM support.

 drivers/firmware/google/Kconfig             | 15 ++++--
 drivers/firmware/google/Makefile            |  1 +
 drivers/firmware/google/coreboot_table-of.c | 82 +++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+), 3 deletions(-)
 create mode 100644 drivers/firmware/google/coreboot_table-of.c

diff --git a/drivers/firmware/google/Kconfig b/drivers/firmware/google/Kconfig
index 840bd62..00000e0 100644
--- a/drivers/firmware/google/Kconfig
+++ b/drivers/firmware/google/Kconfig
@@ -1,6 +1,5 @@
 menuconfig GOOGLE_FIRMWARE
 	bool "Google Firmware Drivers"
-	depends on X86
 	default n
 	help
 	  These firmware drivers are used by Google's servers.  They are
@@ -11,7 +10,7 @@ if GOOGLE_FIRMWARE
 
 config GOOGLE_SMI
 	tristate "SMI interface for Google platforms"
-	depends on ACPI && DMI && EFI
+	depends on X86 && ACPI && DMI && EFI
 	select EFI_VARS
 	help
 	  Say Y here if you want to enable SMI callbacks for Google
@@ -21,7 +20,7 @@ config GOOGLE_SMI
 
 config GOOGLE_COREBOOT_TABLE
 	tristate
-	depends on GOOGLE_COREBOOT_TABLE_ACPI
+	depends on GOOGLE_COREBOOT_TABLE_ACPI || GOOGLE_COREBOOT_TABLE_OF
 
 config GOOGLE_COREBOOT_TABLE_ACPI
 	tristate "Coreboot Table Access - ACPI"
@@ -33,6 +32,16 @@ config GOOGLE_COREBOOT_TABLE_ACPI
 	  pointer is accessed through the ACPI "GOOGCB00" object.
 	  If unsure say N.
 
+config GOOGLE_COREBOOT_TABLE_OF
+	tristate "Coreboot Table Access - Device Tree"
+	depends on OF
+	select GOOGLE_COREBOOT_TABLE
+	help
+	  This option enable the coreboot_table module, which provide other
+	  firmware modules to access coreboot table. The coreboot table pointer
+	  is accessed through the device tree node /firmware/coreboot.
+	  If unsure say N.
+
 config GOOGLE_MEMCONSOLE
 	tristate
 	depends on GOOGLE_MEMCONSOLE_X86_LEGACY || GOOGLE_MEMCONSOLE_COREBOOT
diff --git a/drivers/firmware/google/Makefile b/drivers/firmware/google/Makefile
index 662a83e..bb952c6 100644
--- a/drivers/firmware/google/Makefile
+++ b/drivers/firmware/google/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_GOOGLE_SMI)		+= gsmi.o
 obj-$(CONFIG_GOOGLE_COREBOOT_TABLE)        += coreboot_table.o
 obj-$(CONFIG_GOOGLE_COREBOOT_TABLE_ACPI)   += coreboot_table-acpi.o
+obj-$(CONFIG_GOOGLE_COREBOOT_TABLE_OF)     += coreboot_table-of.o
 obj-$(CONFIG_GOOGLE_MEMCONSOLE)            += memconsole.o
 obj-$(CONFIG_GOOGLE_MEMCONSOLE_COREBOOT)   += memconsole-coreboot.o
 obj-$(CONFIG_GOOGLE_MEMCONSOLE_X86_LEGACY) += memconsole-x86-legacy.o
diff --git a/drivers/firmware/google/coreboot_table-of.c b/drivers/firmware/google/coreboot_table-of.c
new file mode 100644
index 0000000..727acdc
--- /dev/null
+++ b/drivers/firmware/google/coreboot_table-of.c
@@ -0,0 +1,82 @@
+/*
+ * coreboot_table-of.c
+ *
+ * Coreboot table access through open firmware.
+ *
+ * Copyright 2017 Google Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License v2.0 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+#include "coreboot_table.h"
+
+static int coreboot_table_of_probe(struct platform_device *pdev)
+{
+	struct device_node *fw_dn = pdev->dev.of_node;
+	void __iomem *ptr;
+
+	ptr = of_iomap(fw_dn, 0);
+	of_node_put(fw_dn);
+	if (!ptr)
+		return -ENOMEM;
+
+	return coreboot_table_init(ptr);
+}
+
+static int coreboot_table_of_remove(struct platform_device *pdev)
+{
+	return coreboot_table_exit();
+}
+
+static const struct of_device_id coreboot_of_match[] = {
+	{ .compatible = "coreboot" },
+	{},
+};
+
+static struct platform_driver coreboot_table_of_driver = {
+	.probe = coreboot_table_of_probe,
+	.remove = coreboot_table_of_remove,
+	.driver = {
+		.name = "coreboot_table_of",
+		.of_match_table = coreboot_of_match,
+	},
+};
+
+static int __init platform_coreboot_table_of_init(void)
+{
+	struct platform_device *pdev;
+	struct device_node *of_node;
+
+	/* Limit device creation to the presence of /firmware/coreboot node */
+	of_node = of_find_node_by_path("/firmware/coreboot");
+	if (!of_node)
+		return -ENODEV;
+
+	if (!of_match_node(coreboot_of_match, of_node))
+		return -ENODEV;
+
+	pdev = of_platform_device_create(of_node, "coreboot_table_of", NULL);
+	if (!pdev)
+		return -ENODEV;
+
+	return platform_driver_register(&coreboot_table_of_driver);
+}
+
+module_init(platform_coreboot_table_of_init);
+
+MODULE_AUTHOR("Google, Inc.");
+MODULE_LICENSE("GPL");
-- 
2.7.4
