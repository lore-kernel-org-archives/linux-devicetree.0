From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: [PATCH] of/fdt: Add mutex protection for calls to __unflatten_device_tree()
Date: Sat,  5 Dec 2015 16:13:53 -0800
Message-ID: <1449360833-27026-1-git-send-email-linux@roeck-us.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

__unflatten_device_tree() calls unflatten_dt_node(), which declares
a static variable. It is therefore not reentrant.

One of the callers of __unflatten_device_tree(), unflatten_device_tree(),
is only called once during early initialization and does not need to be
protected. The other caller, of_fdt_unflatten_tree(), can be called at
any time, possibly multiple times in parallel. This can happen, for
example, if multiple devicetree overlays have to be loaded and installed.

Without this protection, errors such as the following may be seen.

kernel: End of tree marker overwritten: e6a3a458
kernel: find_target_node:
	Failed to find target-indirect node at /fragment@0
kernel: __of_overlay_create: of_build_overlay_info() failed for tree@/

Add a mutex to of_fdt_unflatten_tree() to make the call reentrant.

Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
---
 drivers/of/fdt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index d2430298a309..f13565d8b964 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/initrd.h>
 #include <linux/memblock.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/of_reserved_mem.h>
@@ -436,6 +437,8 @@ static void *kernel_tree_alloc(u64 size, u64 align)
 	return kzalloc(size, GFP_KERNEL);
 }
 
+static DEFINE_MUTEX(of_fdt_unflatten_mutex);
+
 /**
  * of_fdt_unflatten_tree - create tree of device_nodes from flat blob
  *
@@ -447,7 +450,9 @@ static void *kernel_tree_alloc(u64 size, u64 align)
 void of_fdt_unflatten_tree(const unsigned long *blob,
 			struct device_node **mynodes)
 {
+	mutex_lock(&of_fdt_unflatten_mutex);
 	__unflatten_device_tree(blob, mynodes, &kernel_tree_alloc);
+	mutex_unlock(&of_fdt_unflatten_mutex);
 }
 EXPORT_SYMBOL_GPL(of_fdt_unflatten_tree);
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
