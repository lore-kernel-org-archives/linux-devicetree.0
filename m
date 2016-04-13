From: Max Uvarov <muvarov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] fdt: fix extend of cmd line
Date: Wed, 13 Apr 2016 12:52:16 +0300
Message-ID: <1460541136-18385-1-git-send-email-muvarov@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Max Uvarov <muvarov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On arm CONFIG_CMDLINE_EXTEND does not append build-in
cmdline in kernel to U-boot parameters. Fix it here.
Theoretically this patch should repair kdump work where
it adds elfcorehdr= and memmap additional parameters
to second kernel.

Signed-off-by: Max Uvarov <muvarov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/fdt.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 3349d2a..5e897bf 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -969,10 +969,16 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 	 * is set in which case we override whatever was found earlier.
 	 */
 #ifdef CONFIG_CMDLINE
-#ifndef CONFIG_CMDLINE_FORCE
+#if defined(CONFIG_CMDLINE_EXTEND)
+	strlcat(data, " ", COMMAND_LINE_SIZE);
+	strlcat(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
+#elif defined(CONFIG_CMDLINE_FORCE)
+	strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
+#else
+	/* No arguments from boot loader, use kernel's  cmdl*/
 	if (!((char *)data)[0])
-#endif
 		strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
+#endif
 #endif /* CONFIG_CMDLINE */
 
 	pr_debug("Command line is: %s\n", (char*)data);
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
