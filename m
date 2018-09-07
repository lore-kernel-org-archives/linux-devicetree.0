From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH 1/2] of/fdt: Allow architectures to override CONFIG_CMDLINE logic
Date: Fri,  7 Sep 2018 11:54:13 -0700
Message-ID: <20180907185414.2630-1-paul.burton@mips.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Paul Burton <paul.burton@mips.com>, Frank Rowand <frowand.list@gmail.com>, Jaedon Shin <jaedon.shin@gmail.com>, Mathieu Malaterre <malat@debian.org>, Rob Herring <robh+dt@kernel.org>, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The CONFIG_CMDLINE-related logic in early_init_dt_scan_chosen() falls
back to copying CONFIG_CMDLINE into boot_command_line/data if the DT has
a /chosen node but that node has no bootargs property or a bootargs
property of length zero.

This is problematic for the MIPS architecture because we support
concatenating arguments from either the DT or the bootloader with those
from CONFIG_CMDLINE, but the behaviour of early_init_dt_scan_chosen()
gives us no way of knowing whether boot_command_line contains arguments
from DT or already contains CONFIG_CMDLINE. This can lead to us
concatenating CONFIG_CMDLINE with itself, duplicating command line
arguments which can be problematic (eg. for earlycon which will attempt
to register the same console twice & warn about it).

Move the CONFIG_CMDLINE-related logic to a weak function that
architectures can provide their own version of, such that we continue to
use the existing logic for architectures where it's suitable but also
allow MIPS to override this behaviour such that the architecture code
knows when CONFIG_CMDLINE is used.

Signed-off-by: Paul Burton <paul.burton@mips.com>
References: https://patchwork.linux-mips.org/patch/18804/
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: Jaedon Shin <jaedon.shin@gmail.com>
Cc: Mathieu Malaterre <malat@debian.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org
Cc: stable@vger.kernel.org # v4.16+
---
Marked for stable as a prerequisite of the following patch.

DT maintainers: if you're OK with this it'd be great to get an ack so
this can go through the mips-fixes tree.
---
 drivers/of/fdt.c       | 55 +++++++++++++++++++++++++++++-------------
 include/linux/of_fdt.h |  1 +
 2 files changed, 39 insertions(+), 17 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 800ad252cf9c..94c474315cff 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1072,6 +1072,43 @@ int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
 	return 0;
 }
 
+/**
+ * early_init_dt_fixup_cmdline_arch() - Modify a command line taken from DT
+ * @data: A pointer to the command line
+ *
+ * This function provides an opportunity to make modifications to command line
+ * arguments taken from a device tree before use, for example to concatenate
+ * them with arguments from other sources or replace them entirely.
+ *
+ * Modifications should be made directly to the string pointed at by @data,
+ * which is COMMAND_LINE_SIZE bytes in size.
+ *
+ * The default implementation supports extending or overriding the DT command
+ * line arguments using CONFIG_CMDLINE. Since other sources of command line
+ * arguments are platform-specific, architectures can provide their own
+ * implementation of this function to obtain their desired behaviour.
+ */
+void __init __weak early_init_dt_fixup_cmdline_arch(char *data)
+{
+	/*
+	 * CONFIG_CMDLINE is meant to be a default in case nothing else
+	 * managed to set the command line, unless CONFIG_CMDLINE_FORCE
+	 * is set in which case we override whatever was found earlier.
+	 */
+#ifdef CONFIG_CMDLINE
+#if defined(CONFIG_CMDLINE_EXTEND)
+	strlcat(data, " ", COMMAND_LINE_SIZE);
+	strlcat(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
+#elif defined(CONFIG_CMDLINE_FORCE)
+	strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
+#else
+	/* No arguments from boot loader, use kernel's cmdl */
+	if (!data[0])
+		strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
+#endif
+#endif /* CONFIG_CMDLINE */
+}
+
 int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 				     int depth, void *data)
 {
@@ -1091,23 +1128,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 	if (p != NULL && l > 0)
 		strlcpy(data, p, min((int)l, COMMAND_LINE_SIZE));
 
-	/*
-	 * CONFIG_CMDLINE is meant to be a default in case nothing else
-	 * managed to set the command line, unless CONFIG_CMDLINE_FORCE
-	 * is set in which case we override whatever was found earlier.
-	 */
-#ifdef CONFIG_CMDLINE
-#if defined(CONFIG_CMDLINE_EXTEND)
-	strlcat(data, " ", COMMAND_LINE_SIZE);
-	strlcat(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
-#elif defined(CONFIG_CMDLINE_FORCE)
-	strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
-#else
-	/* No arguments from boot loader, use kernel's  cmdl*/
-	if (!((char *)data)[0])
-		strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
-#endif
-#endif /* CONFIG_CMDLINE */
+	early_init_dt_fixup_cmdline_arch(data);
 
 	pr_debug("Command line is: %s\n", (char*)data);
 
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index b9cd9ebdf9b9..98935695f49d 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -80,6 +80,7 @@ extern void early_init_dt_add_memory_arch(u64 base, u64 size);
 extern int early_init_dt_mark_hotplug_memory_arch(u64 base, u64 size);
 extern int early_init_dt_reserve_memory_arch(phys_addr_t base, phys_addr_t size,
 					     bool no_map);
+extern void early_init_dt_fixup_cmdline_arch(char *data);
 extern u64 dt_mem_next_cell(int s, const __be32 **cellp);
 
 /* Early flat tree scan hooks */
-- 
2.18.0
