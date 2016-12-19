From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 08/21] MIPS memblock: Move kernel parameters parser into individual method
Date: Mon, 19 Dec 2016 05:07:33 +0300
Message-ID: <1482113266-13207-9-git-send-email-fancer.lancer@gmail.com>
References: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org, paul.burton@imgtec.com, rabinv@axis.com, matt.redfearn@imgtec.com, james.hogan@imgtec.com, alexander.sverdlin@nokia.com, robh+dt@kernel.org, frowand.list@gmail.com
Cc: Sergey.Semin@t-platforms.ru, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

Main memory initialization method looks messy with cmd line parser
built-in. So it's better for readability to put it into a separated
method.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 arch/mips/kernel/setup.c | 87 ++++++++++++++++--------------
 1 file changed, 48 insertions(+), 39 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 52205fb..9c1a60d 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -231,6 +231,51 @@ static void __init print_memory_map(void)
 }
 
 /*
+ * Parse passed cmdline
+ */
+#define USE_PROM_CMDLINE	IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_BOOTLOADER)
+#define USE_DTB_CMDLINE		IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_DTB)
+#define EXTEND_WITH_PROM	IS_ENABLED(CONFIG_MIPS_CMDLINE_EXTEND)
+#define BUILTIN_EXTEND_WITH_PROM	\
+	IS_ENABLED(CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND)
+
+static void __init mips_parse_param(char **cmdline_p)
+{
+#if defined(CONFIG_CMDLINE_BOOL) && defined(CONFIG_CMDLINE_OVERRIDE)
+	strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
+#else
+	if ((USE_PROM_CMDLINE && arcs_cmdline[0]) ||
+	    (USE_DTB_CMDLINE && !boot_command_line[0]))
+		strlcpy(boot_command_line, arcs_cmdline, COMMAND_LINE_SIZE);
+
+	if (EXTEND_WITH_PROM && arcs_cmdline[0]) {
+		if (boot_command_line[0])
+			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
+		strlcat(boot_command_line, arcs_cmdline, COMMAND_LINE_SIZE);
+	}
+
+#if defined(CONFIG_CMDLINE_BOOL)
+	if (builtin_cmdline[0]) {
+		if (boot_command_line[0])
+			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
+		strlcat(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
+	}
+
+	if (BUILTIN_EXTEND_WITH_PROM && arcs_cmdline[0]) {
+		if (boot_command_line[0])
+			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
+		strlcat(boot_command_line, arcs_cmdline, COMMAND_LINE_SIZE);
+	}
+#endif
+#endif
+	strlcpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
+
+	*cmdline_p = command_line;
+
+	parse_early_param();
+}
+
+/*
  * Parse "mem=size@start" parameter rewriting a defined memory map
  * We look for mem=size@start, where start and size are "value[KkMm]"
  */
@@ -790,12 +835,6 @@ static void __init arch_mem_addpart(phys_addr_t mem, phys_addr_t end, int type)
 	add_memory_region(mem, size, type);
 }
 
-#define USE_PROM_CMDLINE	IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_BOOTLOADER)
-#define USE_DTB_CMDLINE		IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_DTB)
-#define EXTEND_WITH_PROM	IS_ENABLED(CONFIG_MIPS_CMDLINE_DTB_EXTEND)
-#define BUILTIN_EXTEND_WITH_PROM	\
-	IS_ENABLED(CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND)
-
 static void __init arch_mem_init(char **cmdline_p)
 {
 	struct memblock_region *reg;
@@ -804,6 +843,9 @@ static void __init arch_mem_init(char **cmdline_p)
 	/* call board setup routine */
 	plat_mem_setup();
 
+	/* Parse passed parameters */
+	mips_parse_param(cmdline_p);
+
 	/*
 	 * Make sure all kernel memory is in the maps.  The "UP" and
 	 * "DOWN" are opposite for initdata since if it crosses over
@@ -820,39 +862,6 @@ static void __init arch_mem_init(char **cmdline_p)
 	pr_info("Determined physical RAM map:\n");
 	print_memory_map();
 
-#if defined(CONFIG_CMDLINE_BOOL) && defined(CONFIG_CMDLINE_OVERRIDE)
-	strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
-#else
-	if ((USE_PROM_CMDLINE && arcs_cmdline[0]) ||
-	    (USE_DTB_CMDLINE && !boot_command_line[0]))
-		strlcpy(boot_command_line, arcs_cmdline, COMMAND_LINE_SIZE);
-
-	if (EXTEND_WITH_PROM && arcs_cmdline[0]) {
-		if (boot_command_line[0])
-			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
-		strlcat(boot_command_line, arcs_cmdline, COMMAND_LINE_SIZE);
-	}
-
-#if defined(CONFIG_CMDLINE_BOOL)
-	if (builtin_cmdline[0]) {
-		if (boot_command_line[0])
-			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
-		strlcat(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
-	}
-
-	if (BUILTIN_EXTEND_WITH_PROM && arcs_cmdline[0]) {
-		if (boot_command_line[0])
-			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
-		strlcat(boot_command_line, arcs_cmdline, COMMAND_LINE_SIZE);
-	}
-#endif
-#endif
-	strlcpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
-
-	*cmdline_p = command_line;
-
-	parse_early_param();
-
 	bootmem_init();
 
 	device_tree_init();
-- 
2.6.6
