From: Thierry Escande <thierry.escande-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v2 3/5] firmware: google memconsole: Add coreboot support
Date: Tue, 28 Mar 2017 18:11:27 +0200
Message-ID: <1490717489-19218-4-git-send-email-thierry.escande@collabora.com>
References: <1490717489-19218-1-git-send-email-thierry.escande@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset = "utf-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490717489-19218-1-git-send-email-thierry.escande-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Content-Transfert-Encoding: 8bit
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Coreboot (http://www.coreboot.org) allows to save the firmware console
output in a memory buffer. With this patch, the address of this memory
buffer is obtained from coreboot tables on x86 chromebook devices
declaring an ACPI device with name matching GOOGCB00 or BOOT0000.

If the memconsole-coreboot driver is able to find the coreboot table,
the memconsole driver sets the cbmem_console address and initializes the
memconsole sysfs entries.

The coreboot_table-acpi driver is responsible for setting the address of
the coreboot table header when probed. If this address is not yet set
when memconsole-coreboot is probed, then the probe is deferred by
returning -EPROBE_DEFER.

This patch is a rework/split/merge of patches from the chromeos v4.4
kernel tree originally authored by:
 Vadim Bendebury <vbendeb-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
 Wei-Ning Huang <wnhuang-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
 Yuji Sasaki <sasakiy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
 Duncan Laurie <dlaurie-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
 Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
 Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Signed-off-by: Thierry Escande <thierry.escande-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
 drivers/firmware/google/Kconfig               |  25 +++++-
 drivers/firmware/google/Makefile              |   3 +
 drivers/firmware/google/coreboot_table-acpi.c |  88 +++++++++++++++++++++
 drivers/firmware/google/coreboot_table.c      |  94 ++++++++++++++++++++++
 drivers/firmware/google/coreboot_table.h      |  50 ++++++++++++
 drivers/firmware/google/memconsole-coreboot.c | 109 ++++++++++++++++++++++++++
 6 files changed, 368 insertions(+), 1 deletion(-)
 create mode 100644 drivers/firmware/google/coreboot_table-acpi.c
 create mode 100644 drivers/firmware/google/coreboot_table.c
 create mode 100644 drivers/firmware/google/coreboot_table.h
 create mode 100644 drivers/firmware/google/memconsole-coreboot.c

diff --git a/drivers/firmware/google/Kconfig b/drivers/firmware/google/Kconfig
index 27a0658..840bd62 100644
--- a/drivers/firmware/google/Kconfig
+++ b/drivers/firmware/google/Kconfig
@@ -19,9 +19,23 @@ config GOOGLE_SMI
 	  clearing the EFI event log and reading and writing NVRAM
 	  variables.
 
+config GOOGLE_COREBOOT_TABLE
+	tristate
+	depends on GOOGLE_COREBOOT_TABLE_ACPI
+
+config GOOGLE_COREBOOT_TABLE_ACPI
+	tristate "Coreboot Table Access - ACPI"
+	depends on ACPI
+	select GOOGLE_COREBOOT_TABLE
+	help
+	  This option enables the coreboot_table module, which provides other
+	  firmware modules to access to the coreboot table. The coreboot table
+	  pointer is accessed through the ACPI "GOOGCB00" object.
+	  If unsure say N.
+
 config GOOGLE_MEMCONSOLE
 	tristate
-	depends on GOOGLE_MEMCONSOLE_X86_LEGACY
+	depends on GOOGLE_MEMCONSOLE_X86_LEGACY || GOOGLE_MEMCONSOLE_COREBOOT
 
 config GOOGLE_MEMCONSOLE_X86_LEGACY
 	tristate "Firmware Memory Console - X86 Legacy support"
@@ -32,4 +46,13 @@ config GOOGLE_MEMCONSOLE_X86_LEGACY
 	  the EBDA on Google servers.  If found, this log is exported to
 	  userland in the file /sys/firmware/log.
 
+config GOOGLE_MEMCONSOLE_COREBOOT
+	tristate "Firmware Memory Console"
+	depends on GOOGLE_COREBOOT_TABLE
+	select GOOGLE_MEMCONSOLE
+	help
+	  This option enables the kernel to search for a firmware log in
+	  the coreboot table.  If found, this log is exported to userland
+	  in the file /sys/firmware/log.
+
 endif # GOOGLE_FIRMWARE
diff --git a/drivers/firmware/google/Makefile b/drivers/firmware/google/Makefile
index 10683ef..662a83e 100644
--- a/drivers/firmware/google/Makefile
+++ b/drivers/firmware/google/Makefile
@@ -1,4 +1,7 @@
 
 obj-$(CONFIG_GOOGLE_SMI)		+= gsmi.o
+obj-$(CONFIG_GOOGLE_COREBOOT_TABLE)        += coreboot_table.o
+obj-$(CONFIG_GOOGLE_COREBOOT_TABLE_ACPI)   += coreboot_table-acpi.o
 obj-$(CONFIG_GOOGLE_MEMCONSOLE)            += memconsole.o
+obj-$(CONFIG_GOOGLE_MEMCONSOLE_COREBOOT)   += memconsole-coreboot.o
 obj-$(CONFIG_GOOGLE_MEMCONSOLE_X86_LEGACY) += memconsole-x86-legacy.o
diff --git a/drivers/firmware/google/coreboot_table-acpi.c b/drivers/firmware/google/coreboot_table-acpi.c
new file mode 100644
index 0000000..fb98db2
--- /dev/null
+++ b/drivers/firmware/google/coreboot_table-acpi.c
@@ -0,0 +1,88 @@
+/*
+ * coreboot_table-acpi.c
+ *
+ * Using ACPI to locate Coreboot table and provide coreboot table access.
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
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "coreboot_table.h"
+
+static int coreboot_table_acpi_probe(struct platform_device *pdev)
+{
+	phys_addr_t phyaddr;
+	resource_size_t len;
+	struct coreboot_table_header __iomem *header = NULL;
+	struct resource *res;
+	void __iomem *ptr = NULL;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
+	len = resource_size(res);
+	if (!res->start || !len)
+		return -EINVAL;
+
+	phyaddr = res->start;
+	header = ioremap_cache(phyaddr, sizeof(*header));
+	if (header == NULL)
+		return -ENOMEM;
+
+	ptr = ioremap_cache(phyaddr,
+			    header->header_bytes + header->table_bytes);
+	iounmap(header);
+	if (!ptr)
+		return -ENOMEM;
+
+	return coreboot_table_init(ptr);
+}
+
+static int coreboot_table_acpi_remove(struct platform_device *pdev)
+{
+	return coreboot_table_exit();
+}
+
+static const struct acpi_device_id cros_coreboot_acpi_match[] = {
+	{ "GOOGCB00", 0 },
+	{ "BOOT0000", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, cros_coreboot_acpi_match);
+
+static struct platform_driver coreboot_table_acpi_driver = {
+	.probe = coreboot_table_acpi_probe,
+	.remove = coreboot_table_acpi_remove,
+	.driver = {
+		.name = "coreboot_table_acpi",
+		.acpi_match_table = ACPI_PTR(cros_coreboot_acpi_match),
+	},
+};
+
+static int __init coreboot_table_acpi_init(void)
+{
+	return platform_driver_register(&coreboot_table_acpi_driver);
+}
+
+module_init(coreboot_table_acpi_init);
+
+MODULE_AUTHOR("Google, Inc.");
+MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/google/coreboot_table.c
new file mode 100644
index 0000000..0019d3e
--- /dev/null
+++ b/drivers/firmware/google/coreboot_table.c
@@ -0,0 +1,94 @@
+/*
+ * coreboot_table.c
+ *
+ * Module providing coreboot table access.
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
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+#include "coreboot_table.h"
+
+struct coreboot_table_entry {
+	u32 tag;
+	u32 size;
+};
+
+static struct coreboot_table_header __iomem *ptr_header;
+
+/*
+ * This function parses the coreboot table for an entry that contains the base
+ * address of the given entry tag. The coreboot table consists of a header
+ * directly followed by a number of small, variable-sized entries, which each
+ * contain an identifying tag and their length as the first two fields.
+ */
+int coreboot_table_find(int tag, void *data, size_t data_size)
+{
+	struct coreboot_table_header header;
+	struct coreboot_table_entry entry;
+	void *ptr_entry;
+	int i;
+
+	if (!ptr_header)
+		return -EPROBE_DEFER;
+
+	memcpy_fromio(&header, ptr_header, sizeof(header));
+
+	if (strncmp(header.signature, "LBIO", sizeof(header.signature))) {
+		pr_warn("coreboot_table: coreboot table missing or corrupt!\n");
+		return -ENODEV;
+	}
+
+	ptr_entry = (void *)ptr_header + header.header_bytes;
+
+	for (i = 0; i < header.table_entries; i++) {
+		memcpy_fromio(&entry, ptr_entry, sizeof(entry));
+		if (entry.tag == tag) {
+			if (data_size < entry.size)
+				return -EINVAL;
+
+			memcpy_fromio(data, ptr_entry, entry.size);
+
+			return 0;
+		}
+
+		ptr_entry += entry.size;
+	}
+
+	return -ENOENT;
+}
+EXPORT_SYMBOL(coreboot_table_find);
+
+int coreboot_table_init(void __iomem *ptr)
+{
+	ptr_header = ptr;
+
+	return 0;
+}
+EXPORT_SYMBOL(coreboot_table_init);
+
+int coreboot_table_exit(void)
+{
+	if (ptr_header)
+		iounmap(ptr_header);
+
+	return 0;
+}
+EXPORT_SYMBOL(coreboot_table_exit);
+
+MODULE_AUTHOR("Google, Inc.");
+MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/google/coreboot_table.h b/drivers/firmware/google/coreboot_table.h
new file mode 100644
index 0000000..6eff1ae
--- /dev/null
+++ b/drivers/firmware/google/coreboot_table.h
@@ -0,0 +1,50 @@
+/*
+ * coreboot_table.h
+ *
+ * Internal header for coreboot table access.
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
+#ifndef __COREBOOT_TABLE_H
+#define __COREBOOT_TABLE_H
+
+#include <linux/io.h>
+
+/* List of coreboot entry structures that is used */
+struct lb_cbmem_ref {
+	uint32_t tag;
+	uint32_t size;
+
+	uint64_t cbmem_addr;
+};
+
+/* Coreboot table header structure */
+struct coreboot_table_header {
+	char signature[4];
+	u32 header_bytes;
+	u32 header_checksum;
+	u32 table_bytes;
+	u32 table_checksum;
+	u32 table_entries;
+};
+
+/* Retrieve coreboot table entry with tag *tag* and copy it to data */
+int coreboot_table_find(int tag, void *data, size_t data_size);
+
+/* Initialize coreboot table module given a pointer to iomem */
+int coreboot_table_init(void __iomem *ptr);
+
+/* Cleanup coreboot table module */
+int coreboot_table_exit(void);
+
+#endif /* __COREBOOT_TABLE_H */
diff --git a/drivers/firmware/google/memconsole-coreboot.c b/drivers/firmware/google/memconsole-coreboot.c
new file mode 100644
index 0000000..2121014
--- /dev/null
+++ b/drivers/firmware/google/memconsole-coreboot.c
@@ -0,0 +1,109 @@
+/*
+ * memconsole-coreboot.c
+ *
+ * Memory based BIOS console accessed through coreboot table.
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
+#include <linux/platform_device.h>
+
+#include "memconsole.h"
+#include "coreboot_table.h"
+
+#define CB_TAG_CBMEM_CONSOLE	0x17
+
+/* CBMEM firmware console log descriptor. */
+struct cbmem_cons {
+	u32 buffer_size;
+	u32 buffer_cursor;
+	u8  buffer_body[0];
+} __packed;
+
+static struct cbmem_cons __iomem *cbmem_console;
+
+static int memconsole_coreboot_init(phys_addr_t physaddr)
+{
+	struct cbmem_cons __iomem *tmp_cbmc;
+
+	tmp_cbmc = memremap(physaddr, sizeof(*tmp_cbmc), MEMREMAP_WB);
+
+	if (!tmp_cbmc)
+		return -ENOMEM;
+
+	cbmem_console = memremap(physaddr,
+				 tmp_cbmc->buffer_size + sizeof(*cbmem_console),
+				 MEMREMAP_WB);
+	memunmap(tmp_cbmc);
+
+	if (!cbmem_console)
+		return -ENOMEM;
+
+	memconsole_setup(cbmem_console->buffer_body,
+		min(cbmem_console->buffer_cursor, cbmem_console->buffer_size));
+
+	return 0;
+}
+
+static int memconsole_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct lb_cbmem_ref entry;
+
+	ret = coreboot_table_find(CB_TAG_CBMEM_CONSOLE, &entry, sizeof(entry));
+	if (ret)
+		return ret;
+
+	ret = memconsole_coreboot_init(entry.cbmem_addr);
+	if (ret)
+		return ret;
+
+	return memconsole_sysfs_init();
+}
+
+static int memconsole_remove(struct platform_device *pdev)
+{
+	memconsole_exit();
+
+	if (cbmem_console)
+		memunmap(cbmem_console);
+
+	return 0;
+}
+
+static struct platform_driver memconsole_driver = {
+	.probe = memconsole_probe,
+	.remove = memconsole_remove,
+	.driver = {
+		.name = "memconsole",
+	},
+};
+
+static int __init platform_memconsole_init(void)
+{
+	struct platform_device *pdev;
+
+	pdev = platform_device_register_simple("memconsole", -1, NULL, 0);
+	if (pdev == NULL)
+		return -ENODEV;
+
+	platform_driver_register(&memconsole_driver);
+
+	return 0;
+}
+
+module_init(platform_memconsole_init);
+
+MODULE_AUTHOR("Google, Inc.");
+MODULE_LICENSE("GPL");
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
