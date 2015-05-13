From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] of/fdt: Make fdt blob input parameters of unflatten functions const
Date: Wed, 13 May 2015 16:33:56 +0200
Message-ID: <1431527636-14009-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Operations to unflatten fdt blobs never modify the input blobs, hence
make them const. Now we no longer need to cast arbitrary const data to
"void *" when calling of_fdt_unflatten_tree().

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
 drivers/of/fdt.c       | 6 +++---
 include/linux/of_fdt.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index caa6bc447165636f..5e83687c090f7ee2 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -168,7 +168,7 @@ static void *unflatten_dt_alloc(void **mem, unsigned long size,
  * @dad: Parent struct device_node
  * @fpsize: Size of the node path up at the current depth.
  */
-static void * unflatten_dt_node(void *blob,
+static void * unflatten_dt_node(const void *blob,
 				void *mem,
 				int *poffset,
 				struct device_node *dad,
@@ -378,7 +378,7 @@ static void * unflatten_dt_node(void *blob,
  * @dt_alloc: An allocator that provides a virtual address to memory
  * for the resulting tree
  */
-static void __unflatten_device_tree(void *blob,
+static void __unflatten_device_tree(const void *blob,
 			     struct device_node **mynodes,
 			     void * (*dt_alloc)(u64 size, u64 align))
 {
@@ -441,7 +441,7 @@ static void *kernel_tree_alloc(u64 size, u64 align)
  * pointers of the nodes so the normal device-tree walking functions
  * can be used.
  */
-void of_fdt_unflatten_tree(unsigned long *blob,
+void of_fdt_unflatten_tree(const unsigned long *blob,
 			struct device_node **mynodes)
 {
 	__unflatten_device_tree(blob, mynodes, &kernel_tree_alloc);
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index 587ee507965d78a1..0cf217d404ce4660 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -37,7 +37,7 @@ extern bool of_fdt_is_big_endian(const void *blob,
 				 unsigned long node);
 extern int of_fdt_match(const void *blob, unsigned long node,
 			const char *const *compat);
-extern void of_fdt_unflatten_tree(unsigned long *blob,
+extern void of_fdt_unflatten_tree(const unsigned long *blob,
 			       struct device_node **mynodes);
 
 /* TBD: Temporary export of fdt globals - remove when code fully merged */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
