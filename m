From: Thierry Escande <thierry.escande@collabora.com>
Subject: [PATCH v2 2/5] firmware: google memconsole: Move specific EBDA parts
Date: Tue, 28 Mar 2017 18:11:26 +0200
Message-ID: <1490717489-19218-3-git-send-email-thierry.escande@collabora.com>
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

This patch splits memconsole.c in 2 parts. One containing the
architecture-independent part and the other one containing the EBDA
specific part. This prepares the integration of coreboot support for the
memconsole.

The memconsole driver is now named as memconsole-x86-legacy.

Signed-off-by: Thierry Escande <thierry.escande@collabora.com>
---
 drivers/firmware/google/Kconfig                 |   9 +-
 drivers/firmware/google/Makefile                |   3 +-
 drivers/firmware/google/memconsole-x86-legacy.c | 154 +++++++++++++++++++++++
 drivers/firmware/google/memconsole.c            | 155 ++++--------------------
 drivers/firmware/google/memconsole.h            |  43 +++++++
 5 files changed, 229 insertions(+), 135 deletions(-)
 create mode 100644 drivers/firmware/google/memconsole-x86-legacy.c
 create mode 100644 drivers/firmware/google/memconsole.h

diff --git a/drivers/firmware/google/Kconfig b/drivers/firmware/google/Kconfig
index 475bd01..27a0658 100644
--- a/drivers/firmware/google/Kconfig
+++ b/drivers/firmware/google/Kconfig
@@ -20,8 +20,13 @@ config GOOGLE_SMI
 	  variables.
 
 config GOOGLE_MEMCONSOLE
-	tristate "Firmware Memory Console"
-	depends on DMI
+	tristate
+	depends on GOOGLE_MEMCONSOLE_X86_LEGACY
+
+config GOOGLE_MEMCONSOLE_X86_LEGACY
+	tristate "Firmware Memory Console - X86 Legacy support"
+	depends on X86 && ACPI && DMI
+	select GOOGLE_MEMCONSOLE
 	help
 	  This option enables the kernel to search for a firmware log in
 	  the EBDA on Google servers.  If found, this log is exported to
diff --git a/drivers/firmware/google/Makefile b/drivers/firmware/google/Makefile
index 54a294e..10683ef 100644
--- a/drivers/firmware/google/Makefile
+++ b/drivers/firmware/google/Makefile
@@ -1,3 +1,4 @@
 
 obj-$(CONFIG_GOOGLE_SMI)		+= gsmi.o
-obj-$(CONFIG_GOOGLE_MEMCONSOLE)		+= memconsole.o
+obj-$(CONFIG_GOOGLE_MEMCONSOLE)            += memconsole.o
+obj-$(CONFIG_GOOGLE_MEMCONSOLE_X86_LEGACY) += memconsole-x86-legacy.o
diff --git a/drivers/firmware/google/memconsole-x86-legacy.c b/drivers/firmware/google/memconsole-x86-legacy.c
new file mode 100644
index 0000000..529078c
--- /dev/null
+++ b/drivers/firmware/google/memconsole-x86-legacy.c
@@ -0,0 +1,154 @@
+/*
+ * memconsole-x86-legacy.c
+ *
+ * EBDA specific parts of the memory based BIOS console.
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
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/dmi.h>
+#include <linux/mm.h>
+#include <asm/bios_ebda.h>
+#include <asm/e820.h>
+#include <linux/acpi.h>
+
+#include "memconsole.h"
+
+#define BIOS_MEMCONSOLE_V1_MAGIC	0xDEADBABE
+#define BIOS_MEMCONSOLE_V2_MAGIC	(('M')|('C'<<8)|('O'<<16)|('N'<<24))
+
+struct biosmemcon_ebda {
+	u32 signature;
+	union {
+		struct {
+			u8  enabled;
+			u32 buffer_addr;
+			u16 start;
+			u16 end;
+			u16 num_chars;
+			u8  wrapped;
+		} __packed v1;
+		struct {
+			u32 buffer_addr;
+			/* Misdocumented as number of pages! */
+			u16 num_bytes;
+			u16 start;
+			u16 end;
+		} __packed v2;
+	};
+} __packed;
+
+static void found_v1_header(struct biosmemcon_ebda *hdr)
+{
+	pr_info("memconsole: BIOS console v1 EBDA structure found at %p\n",
+		hdr);
+	pr_info("memconsole: BIOS console buffer at 0x%.8x, start = %d, end = %d, num = %d\n",
+		hdr->v1.buffer_addr, hdr->v1.start,
+		hdr->v1.end, hdr->v1.num_chars);
+
+	memconsole_setup(phys_to_virt(hdr->v1.buffer_addr), hdr->v1.num_chars);
+}
+
+static void found_v2_header(struct biosmemcon_ebda *hdr)
+{
+	pr_info("memconsole: BIOS console v2 EBDA structure found at %p\n",
+		hdr);
+	pr_info("memconsole: BIOS console buffer at 0x%.8x, start = %d, end = %d, num_bytes = %d\n",
+		hdr->v2.buffer_addr, hdr->v2.start,
+		hdr->v2.end, hdr->v2.num_bytes);
+
+	memconsole_setup(phys_to_virt(hdr->v2.buffer_addr + hdr->v2.start),
+			 hdr->v2.end - hdr->v2.start);
+}
+
+/*
+ * Search through the EBDA for the BIOS Memory Console, and
+ * set the global variables to point to it.  Return true if found.
+ */
+static bool memconsole_ebda_init(void)
+{
+	unsigned int address;
+	size_t length, cur;
+
+	address = get_bios_ebda();
+	if (!address) {
+		pr_info("memconsole: BIOS EBDA non-existent.\n");
+		return false;
+	}
+
+	/* EBDA length is byte 0 of EBDA (in KB) */
+	length = *(u8 *)phys_to_virt(address);
+	length <<= 10; /* convert to bytes */
+
+	/*
+	 * Search through EBDA for BIOS memory console structure
+	 * note: signature is not necessarily dword-aligned
+	 */
+	for (cur = 0; cur < length; cur++) {
+		struct biosmemcon_ebda *hdr = phys_to_virt(address + cur);
+
+		/* memconsole v1 */
+		if (hdr->signature == BIOS_MEMCONSOLE_V1_MAGIC) {
+			found_v1_header(hdr);
+			return true;
+		}
+
+		/* memconsole v2 */
+		if (hdr->signature == BIOS_MEMCONSOLE_V2_MAGIC) {
+			found_v2_header(hdr);
+			return true;
+		}
+	}
+
+	pr_info("memconsole: BIOS console EBDA structure not found!\n");
+	return false;
+}
+
+static struct dmi_system_id memconsole_dmi_table[] __initdata = {
+	{
+		.ident = "Google Board",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Google, Inc."),
+		},
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(dmi, memconsole_dmi_table);
+
+static bool __init memconsole_find(void)
+{
+	if (!dmi_check_system(memconsole_dmi_table))
+		return false;
+
+	return memconsole_ebda_init();
+}
+
+static int __init memconsole_x86_init(void)
+{
+	if (!memconsole_find())
+		return -ENODEV;
+
+	return memconsole_sysfs_init();
+}
+
+static void __exit memconsole_x86_exit(void)
+{
+	memconsole_exit();
+}
+
+module_init(memconsole_x86_init);
+module_exit(memconsole_x86_exit);
+
+MODULE_AUTHOR("Google, Inc.");
+MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/google/memconsole.c b/drivers/firmware/google/memconsole.c
index 2f569aa..94e200d 100644
--- a/drivers/firmware/google/memconsole.c
+++ b/drivers/firmware/google/memconsole.c
@@ -1,66 +1,36 @@
 /*
  * memconsole.c
  *
- * Infrastructure for importing the BIOS memory based console
- * into the kernel log ringbuffer.
+ * Architecture-independent parts of the memory based BIOS console.
  *
- * Copyright 2010 Google Inc. All rights reserved.
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
  */
 
-#include <linux/ctype.h>
 #include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/string.h>
 #include <linux/sysfs.h>
 #include <linux/kobject.h>
 #include <linux/module.h>
-#include <linux/dmi.h>
-#include <linux/io.h>
-#include <asm/bios_ebda.h>
 
-#define BIOS_MEMCONSOLE_V1_MAGIC	0xDEADBABE
-#define BIOS_MEMCONSOLE_V2_MAGIC	(('M')|('C'<<8)|('O'<<16)|('N'<<24))
+#include "memconsole.h"
 
-struct biosmemcon_ebda {
-	u32 signature;
-	union {
-		struct {
-			u8  enabled;
-			u32 buffer_addr;
-			u16 start;
-			u16 end;
-			u16 num_chars;
-			u8  wrapped;
-		} __packed v1;
-		struct {
-			u32 buffer_addr;
-			/* Misdocumented as number of pages! */
-			u16 num_bytes;
-			u16 start;
-			u16 end;
-		} __packed v2;
-	};
-} __packed;
-
-static u32 memconsole_baseaddr;
+static char *memconsole_baseaddr;
 static size_t memconsole_length;
 
 static ssize_t memconsole_read(struct file *filp, struct kobject *kobp,
 			       struct bin_attribute *bin_attr, char *buf,
 			       loff_t pos, size_t count)
 {
-	char *memconsole;
-	ssize_t ret;
-
-	memconsole = ioremap_cache(memconsole_baseaddr, memconsole_length);
-	if (!memconsole) {
-		pr_err("memconsole: ioremap_cache failed\n");
-		return -ENOMEM;
-	}
-	ret = memory_read_from_buffer(buf, count, &pos, memconsole,
-				      memconsole_length);
-	iounmap(memconsole);
-	return ret;
+	return memory_read_from_buffer(buf, count, &pos, memconsole_baseaddr,
+				       memconsole_length);
 }
 
 static struct bin_attribute memconsole_bin_attr = {
@@ -68,104 +38,25 @@ static struct bin_attribute memconsole_bin_attr = {
 	.read = memconsole_read,
 };
 
-
-static void __init found_v1_header(struct biosmemcon_ebda *hdr)
-{
-	pr_info("BIOS console v1 EBDA structure found at %p\n", hdr);
-	pr_info("BIOS console buffer at 0x%.8x, "
-	       "start = %d, end = %d, num = %d\n",
-	       hdr->v1.buffer_addr, hdr->v1.start,
-	       hdr->v1.end, hdr->v1.num_chars);
-
-	memconsole_length = hdr->v1.num_chars;
-	memconsole_baseaddr = hdr->v1.buffer_addr;
-}
-
-static void __init found_v2_header(struct biosmemcon_ebda *hdr)
-{
-	pr_info("BIOS console v2 EBDA structure found at %p\n", hdr);
-	pr_info("BIOS console buffer at 0x%.8x, "
-	       "start = %d, end = %d, num_bytes = %d\n",
-	       hdr->v2.buffer_addr, hdr->v2.start,
-	       hdr->v2.end, hdr->v2.num_bytes);
-
-	memconsole_length = hdr->v2.end - hdr->v2.start;
-	memconsole_baseaddr = hdr->v2.buffer_addr + hdr->v2.start;
-}
-
-/*
- * Search through the EBDA for the BIOS Memory Console, and
- * set the global variables to point to it.  Return true if found.
- */
-static bool __init found_memconsole(void)
+void memconsole_setup(void *baseaddr, size_t length)
 {
-	unsigned int address;
-	size_t length, cur;
-
-	address = get_bios_ebda();
-	if (!address) {
-		pr_info("BIOS EBDA non-existent.\n");
-		return false;
-	}
-
-	/* EBDA length is byte 0 of EBDA (in KB) */
-	length = *(u8 *)phys_to_virt(address);
-	length <<= 10; /* convert to bytes */
-
-	/*
-	 * Search through EBDA for BIOS memory console structure
-	 * note: signature is not necessarily dword-aligned
-	 */
-	for (cur = 0; cur < length; cur++) {
-		struct biosmemcon_ebda *hdr = phys_to_virt(address + cur);
-
-		/* memconsole v1 */
-		if (hdr->signature == BIOS_MEMCONSOLE_V1_MAGIC) {
-			found_v1_header(hdr);
-			return true;
-		}
-
-		/* memconsole v2 */
-		if (hdr->signature == BIOS_MEMCONSOLE_V2_MAGIC) {
-			found_v2_header(hdr);
-			return true;
-		}
-	}
-
-	pr_info("BIOS console EBDA structure not found!\n");
-	return false;
+	memconsole_baseaddr = baseaddr;
+	memconsole_length = length;
 }
+EXPORT_SYMBOL(memconsole_setup);
 
-static struct dmi_system_id memconsole_dmi_table[] __initdata = {
-	{
-		.ident = "Google Board",
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "Google, Inc."),
-		},
-	},
-	{}
-};
-MODULE_DEVICE_TABLE(dmi, memconsole_dmi_table);
-
-static int __init memconsole_init(void)
+int memconsole_sysfs_init(void)
 {
-	if (!dmi_check_system(memconsole_dmi_table))
-		return -ENODEV;
-
-	if (!found_memconsole())
-		return -ENODEV;
-
 	memconsole_bin_attr.size = memconsole_length;
 	return sysfs_create_bin_file(firmware_kobj, &memconsole_bin_attr);
 }
+EXPORT_SYMBOL(memconsole_sysfs_init);
 
-static void __exit memconsole_exit(void)
+void memconsole_exit(void)
 {
 	sysfs_remove_bin_file(firmware_kobj, &memconsole_bin_attr);
 }
-
-module_init(memconsole_init);
-module_exit(memconsole_exit);
+EXPORT_SYMBOL(memconsole_exit);
 
 MODULE_AUTHOR("Google, Inc.");
 MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/google/memconsole.h b/drivers/firmware/google/memconsole.h
new file mode 100644
index 0000000..190fc03
--- /dev/null
+++ b/drivers/firmware/google/memconsole.h
@@ -0,0 +1,43 @@
+/*
+ * memconsole.h
+ *
+ * Internal headers of the memory based BIOS console.
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
+#ifndef __FIRMWARE_GOOGLE_MEMCONSOLE_H
+#define __FIRMWARE_GOOGLE_MEMCONSOLE_H
+
+/*
+ * memconsole_setup
+ *
+ * Initialize the memory console from raw (virtual) base
+ * address and length.
+ */
+void memconsole_setup(void *baseaddr, size_t length);
+
+/*
+ * memconsole_sysfs_init
+ *
+ * Update memory console length and create binary file
+ * for firmware object.
+ */
+int memconsole_sysfs_init(void);
+
+/* memconsole_exit
+ *
+ * Unmap the console buffer.
+ */
+void memconsole_exit(void);
+
+#endif /* __FIRMWARE_GOOGLE_MEMCONSOLE_H */
-- 
2.7.4
