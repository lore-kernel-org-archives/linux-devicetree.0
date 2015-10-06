From: Daniel Walker <danielwa-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH-RFC 6/7] drivers: of: ifdef out cmdline section
Date: Tue,  6 Oct 2015 08:47:13 -0700
Message-ID: <1444146434-12776-6-git-send-email-danielwa@cisco.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: xe-kernel-qGaTmy9+pjmU+GOnkdjqUdBPR1lH4CV8@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Daniel Walker <dwalker-zu3NM2574RrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

It looks like there's some seepage of cmdline stuff into
the generic device tree code. This conflicts with the
generic cmdline implementation so I remove it in the case
when that's enabled.

Cc: xe-kernel-qGaTmy9+pjmU+GOnkdjqUdBPR1lH4CV8@public.gmane.org
Cc: Daniel Walker <dwalker-zu3NM2574RrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Daniel Walker <danielwa-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
---
 drivers/of/fdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 6e82bc42..80f1e48 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -953,7 +953,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 	 * managed to set the command line, unless CONFIG_CMDLINE_FORCE
 	 * is set in which case we override whatever was found earlier.
 	 */
-#ifdef CONFIG_CMDLINE
+#if defined(CONFIG_CMDLINE) && !defined(CONFIG_GENERIC_CMDLINE)
 #ifndef CONFIG_CMDLINE_FORCE
 	if (!((char *)data)[0])
 #endif
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
