From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH] of: make of_fdt_is_compatible() static
Date: Tue, 20 Jun 2017 16:38:28 -0700
Message-ID: <1498001908-12795-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

The callers of of_fdt_is_compatible() are all in fdt.c so
make it static.

Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
---
 drivers/of/fdt.c       | 2 +-
 include/linux/of_fdt.h | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 3080d9dd031d..5c71cb933426 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -91,7 +91,7 @@ void of_fdt_limit_memory(int limit)
  * On match, returns a non-zero value with smaller values returned for more
  * specific compatible values.
  */
-int of_fdt_is_compatible(const void *blob,
+static int of_fdt_is_compatible(const void *blob,
 		      unsigned long node, const char *compat)
 {
 	const char *cp;
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index 1dfbfd0d8040..013c5418aeec 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -31,9 +31,6 @@ extern void *of_fdt_get_property(const void *blob,
 				 unsigned long node,
 				 const char *name,
 				 int *size);
-extern int of_fdt_is_compatible(const void *blob,
-				unsigned long node,
-				const char *compat);
 extern bool of_fdt_is_big_endian(const void *blob,
 				 unsigned long node);
 extern int of_fdt_match(const void *blob, unsigned long node,
-- 
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
