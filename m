From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2] of: Support CONFIG_CMDLINE_EXTEND config option
Date: Fri, 13 Jan 2012 14:15:48 -0800
Message-ID: <1326492948-26160-1-git-send-email-dianders@chromium.org>
References: <1326156853-24840-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1326156853-24840-1-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The old logic assumes CMDLINE_FROM_BOOTLOADER vs. CMDLINE_FORCE and
ignores CMDLINE_EXTEND.  Here's the old logic:

- CONFIG_CMDLINE_FORCE=true
    CONFIG_CMDLINE
- dt bootargs=non-empty:
    dt bootargs
- dt bootargs=empty, @data is non-empty string
    @data is left unchanged
- dt bootargs=empty, @data is empty string
    CONFIG_CMDLINE (or "" if that's not defined)

The new logic is now documented in of_fdt.h and is copied here for
reference:

- CONFIG_CMDLINE_FORCE=true
    CONFIG_CMDLINE
- CONFIG_CMDLINE_EXTEND=true, @data is non-empty string
    @data + dt bootargs (even if dt bootargs are empty)
- CONFIG_CMDLINE_EXTEND=true, @data is empty string
    CONFIG_CMDLINE + dt bootargs (even if dt bootargs are empty)
- CMDLINE_FROM_BOOTLOADER=true, dt bootargs=non-empty:
    dt bootargs
- CMDLINE_FROM_BOOTLOADER=true, dt bootargs=empty, @data is non-empty string
    @data is left unchanged
- CMDLINE_FROM_BOOTLOADER=true, dt bootargs=empty, @data is empty string
    CONFIG_CMDLINE (or "" if that's not defined)

Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
CC: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
CC: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
CC: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
CC: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
---
I didn't hear a response from Ben about whether he was OK with
my proposal for how CONFIG_CMDLINE_EXTEND should behave with
a non-empty @data, so sending out code that implements my
interpretation.  Hopefully this looks OK.

Changes in v2:
- Removed broken fix for the case when there is no "chosen" attribute.
- Changed CONFIG_CMDLINE_EXTEND behavior when @data is a non-empty string.

 drivers/of/fdt.c       |   56 ++++++++++++++++++++++++++++++++++-------------
 include/linux/of_fdt.h |   21 ++++++++++++++++++
 2 files changed, 61 insertions(+), 16 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index ea2bd1b..740efa2 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -664,6 +664,29 @@ int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
 	return 0;
 }
 
+/*
+ * Convert configs to something easy to use in C code
+ */
+#if defined(CONFIG_CMDLINE_FORCE)
+static const int overwrite_incoming_cmdline = 1;
+static const int read_dt_cmdline;
+static const int concat_cmdline;
+#elif defined(CONFIG_CMDLINE_EXTEND)
+static const int overwrite_incoming_cmdline;
+static const int read_dt_cmdline = 1;
+static const int concat_cmdline = 1;
+#else /* CMDLINE_FROM_BOOTLOADER */
+static const int overwrite_incoming_cmdline;
+static const int read_dt_cmdline = 1;
+static const int concat_cmdline;
+#endif
+
+#ifdef CONFIG_CMDLINE
+static const char *config_cmdline = CONFIG_CMDLINE;
+#else
+static const char *config_cmdline = "";
+#endif
+
 int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 				     int depth, void *data)
 {
@@ -678,22 +701,23 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 
 	early_init_dt_check_for_initrd(node);
 
-	/* Retrieve command line */
-	p = of_get_flat_dt_prop(node, "bootargs", &l);
-	if (p != NULL && l > 0)
-		strlcpy(data, p, min((int)l, COMMAND_LINE_SIZE));
-
-	/*
-	 * CONFIG_CMDLINE is meant to be a default in case nothing else
-	 * managed to set the command line, unless CONFIG_CMDLINE_FORCE
-	 * is set in which case we override whatever was found earlier.
-	 */
-#ifdef CONFIG_CMDLINE
-#ifndef CONFIG_CMDLINE_FORCE
-	if (!((char *)data)[0])
-#endif
-		strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
-#endif /* CONFIG_CMDLINE */
+	/* Put CONFIG_CMDLINE in if forced or if data had nothing in it to start */
+	if (overwrite_incoming_cmdline || !((char *)data)[0])
+		strlcpy(data, config_cmdline, COMMAND_LINE_SIZE);
+
+	/* Retrieve command line unless forcing */
+	if (read_dt_cmdline) {
+		p = of_get_flat_dt_prop(node, "bootargs", &l);
+		if (p != NULL && l > 0) {
+			if (concat_cmdline) {
+				strlcat(data, " ", COMMAND_LINE_SIZE);
+				strlcat(data, p, min_t(int, (int)l,
+						       COMMAND_LINE_SIZE));
+			} else
+				strlcpy(data, p, min_t(int, (int)l,
+						       COMMAND_LINE_SIZE));
+		}
+	}
 
 	pr_debug("Command line is: %s\n", (char*)data);
 
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index ed136ad..7e190a9 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -91,6 +91,27 @@ extern int of_flat_dt_is_compatible(unsigned long node, const char *name);
 extern int of_flat_dt_match(unsigned long node, const char *const *matches);
 extern unsigned long of_get_flat_dt_root(void);
 
+/*
+ * early_init_dt_scan_chosen - scan the device tree for ramdisk and bootargs
+ *
+ * The boot arguments will be placed into the memory pointed to by @data.
+ * That memory should be COMMAND_LINE_SIZE big and initialized to be a valid
+ * (possibly empty) string.  Logic for what will be in @data after this
+ * function finishes:
+ *
+ * - CONFIG_CMDLINE_FORCE=true
+ *     CONFIG_CMDLINE
+ * - CONFIG_CMDLINE_EXTEND=true, @data is non-empty string
+ *     @data + dt bootargs (even if dt bootargs are empty)
+ * - CONFIG_CMDLINE_EXTEND=true, @data is empty string
+ *     CONFIG_CMDLINE + dt bootargs (even if dt bootargs are empty)
+ * - CMDLINE_FROM_BOOTLOADER=true, dt bootargs=non-empty:
+ *     dt bootargs
+ * - CMDLINE_FROM_BOOTLOADER=true, dt bootargs=empty, @data is non-empty string
+ *     @data is left unchanged
+ * - CMDLINE_FROM_BOOTLOADER=true, dt bootargs=empty, @data is empty string
+ *     CONFIG_CMDLINE (or "" if that's not defined)
+ */
 extern int early_init_dt_scan_chosen(unsigned long node, const char *uname,
 				     int depth, void *data);
 extern void early_init_dt_check_for_initrd(unsigned long node);
-- 
1.7.7.3
