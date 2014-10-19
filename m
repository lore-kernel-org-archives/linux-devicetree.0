From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] of/fdt: Add extern prototype for early_init_dt_scan_chosen_serial()
Date: Sun, 19 Oct 2014 01:11:34 -0700
Message-ID: <1413706294-12578-1-git-send-email-cernekee@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The original commit that introduced this function (fb11ffe74c794a)
indicated that calling it from the architecture code was one possible
use case.  Let's declare it in of_fdt.h to make it a public API.

Signed-off-by: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 include/linux/of_fdt.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index 0ff360d..5d233df 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -12,6 +12,7 @@
 #ifndef _LINUX_OF_FDT_H
 #define _LINUX_OF_FDT_H
 
+#include <linux/errno.h>
 #include <linux/types.h>
 #include <linux/init.h>
 
@@ -87,6 +88,13 @@ extern void early_init_devtree(void *);
 extern void early_get_first_memblock_info(void *, phys_addr_t *);
 extern u64 fdt_translate_address(const void *blob, int node_offset);
 extern void of_fdt_limit_memory(int limit);
+
+#if defined(CONFIG_SERIAL_EARLYCON)
+extern int early_init_dt_scan_chosen_serial(void);
+#else
+static inline int early_init_dt_scan_chosen_serial(void) { return -ENOENT; }
+#endif
+
 #else /* CONFIG_OF_FLATTREE */
 static inline void early_init_fdt_scan_reserved_mem(void) {}
 static inline const char *of_flat_dt_get_machine_name(void) { return NULL; }
-- 
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
