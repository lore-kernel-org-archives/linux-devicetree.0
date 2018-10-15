From: Nick Kossifidis <mick@ics.forth.gr>
Subject: [PATCH v2] OF: Handle CMDLINE when /chosen node is not present
Date: Mon, 15 Oct 2018 17:20:10 +0300
Message-ID: <20181015142010.13401-1-mick@ics.forth.gr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org
Cc: Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org, robh+dt@kernel.org, frowand.list@gmail.com, palmer@sifive.com
List-Id: devicetree@vger.kernel.org

The /chosen node is optional so we should handle CMDLINE regardless
the presence of /chosen/bootargs. Move handling of CMDLINE in
early_init_dt_scan() instead.

v2: Fix typo on comments section

Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
---
 drivers/of/fdt.c | 69 +++++++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 48 insertions(+), 21 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 800ad252c..868464b0b 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -31,6 +31,14 @@
 
 #include "of_private.h"
 
+#ifdef CONFIG_CMDLINE
+#ifdef CONFIG_CMDLINE_FORCE
+static const char fixed_cmdline[] __initconst = CONFIG_CMDLINE;
+#else
+static char builtin_cmdline[] __initdata = CONFIG_CMDLINE;
+#endif
+#endif
+
 /*
  * of_fdt_limit_memory - limit the number of regions in the /memory node
  * @limit: maximum entries
@@ -1088,28 +1096,10 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 
 	/* Retrieve command line */
 	p = of_get_flat_dt_prop(node, "bootargs", &l);
-	if (p != NULL && l > 0)
+	if (p != NULL && l > 0) {
 		strlcpy(data, p, min((int)l, COMMAND_LINE_SIZE));
-
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
-
-	pr_debug("Command line is: %s\n", (char*)data);
+		pr_debug("Got bootargs: %s\n", (char *) data);
+	}
 
 	/* break now */
 	return 1;
@@ -1240,6 +1230,43 @@ bool __init early_init_dt_scan(void *params)
 		return false;
 
 	early_init_dt_scan_nodes();
+
+	/*
+	 * The /chosen node normally contains the bootargs element
+	 * that includes the kernel's command line parameters.
+	 * However the presence of /chosen is not mandatory so
+	 * in case we didn't get a command line when scanning
+	 * nodes above, we need to provide one here before we
+	 * return if possible.
+	 *
+	 * The built-in command line can be used as a default
+	 * command line in case we received nothing from the
+	 * device tree/bootloader. It can also be used for
+	 * extending or replacing the received command line.
+	 */
+#ifdef CONFIG_CMDLINE
+#if defined(CONFIG_CMDLINE_EXTEND)
+	/*
+	 * Order of parameters shouldn't matter for most cases,
+	 * so prepending or appending the built-in command line
+	 * shouldn't make a difference. In cases where it does
+	 * it's up to the user to configure the kernel and/or
+	 * the bootloader properly.
+	 */
+	if (builtin_cmdline[0]) {
+		strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
+		strlcat(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
+	}
+#elif defined(CONFIG_CMDLINE_FORCE)
+	if (fixed_cmdline[0])
+		strlcpy(boot_command_line, fixed_cmdline, COMMAND_LINE_SIZE);
+#else
+	/* No arguments from boot loader, use kernel's cmdline */
+	if (!boot_command_line[0] && builtin_cmdline[0])
+		strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
+#endif
+#endif /* CONFIG_CMDLINE */
+
 	return true;
 }
 
-- 
2.16.4
