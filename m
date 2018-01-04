From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2] of/fdt: Fix #ifdef dependency of early flattree declarations
Date: Thu,  4 Jan 2018 10:08:36 +0100
Message-ID: <1515056916-6411-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

If OF_FLATTREE=y, but OF_EARLY_FLATTREE=n:

    drivers/tty/serial/earlycon.o: In function `param_setup_earlycon':
    earlycon.c:(.init.text+0x3a4): undefined reference to `early_init_dt_scan_chosen_stdout'

Fix this by moving the early flattree forward declarations and dummy
implementations inside an #ifdef CONFIG_OF_EARLY_FLATTREE block.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
Seen after forcing OF_FLATTREE=y on sparc64 allmodconfig
(Hi, out-of-tree OF_CONFIGFS!).

v2:
  - Move "#ifdef CONFIG_OF_EARLY_FLATTREE" section outside "#ifdef
    CONFIG_OF_FLATTREE" section to provide dummies if !OF_FLATTREE,
  - Move architecture-specific early_init_devtree() and
    early_get_first_memblock_info() inside "#ifdef
    CONFIG_OF_EARLY_FLATTREE" section.
---
 include/linux/of_fdt.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index 013c5418aeecfdbd..444e6e283828a27e 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -47,6 +47,12 @@ extern void *initial_boot_params;
 extern char __dtb_start[];
 extern char __dtb_end[];
 
+/* Other Prototypes */
+extern u64 of_flat_dt_translate_address(unsigned long node);
+extern void of_fdt_limit_memory(int limit);
+#endif /* CONFIG_OF_FLATTREE */
+
+#ifdef CONFIG_OF_EARLY_FLATTREE
 /* For scanning the flat device-tree at boot time */
 extern int of_scan_flat_dt(int (*it)(unsigned long node, const char *uname,
 				     int depth, void *data),
@@ -97,16 +103,14 @@ extern void unflatten_device_tree(void);
 extern void unflatten_and_copy_device_tree(void);
 extern void early_init_devtree(void *);
 extern void early_get_first_memblock_info(void *, phys_addr_t *);
-extern u64 of_flat_dt_translate_address(unsigned long node);
-extern void of_fdt_limit_memory(int limit);
-#else /* CONFIG_OF_FLATTREE */
+#else /* CONFIG_OF_EARLY_FLATTREE */
 static inline int early_init_dt_scan_chosen_stdout(void) { return -ENODEV; }
 static inline void early_init_fdt_scan_reserved_mem(void) {}
 static inline void early_init_fdt_reserve_self(void) {}
 static inline const char *of_flat_dt_get_machine_name(void) { return NULL; }
 static inline void unflatten_device_tree(void) {}
 static inline void unflatten_and_copy_device_tree(void) {}
-#endif /* CONFIG_OF_FLATTREE */
+#endif /* CONFIG_OF_EARLY_FLATTREE */
 
 #endif /* __ASSEMBLY__ */
 #endif /* _LINUX_OF_FDT_H */
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
