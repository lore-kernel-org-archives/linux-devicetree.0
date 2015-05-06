From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] of: fdt: mark unflattened tree as detached
Date: Thu, 7 May 2015 00:53:14 +0200
Message-ID: <b81cbbe39d68500b57bd8512fca41ac0193511b1.1439793321.git.hramrach@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The tree returned from of_fdt_unflatten_tree cannot be attached to the
live tree because it is not marked as detached so mark it as such. The
dt resolver checks the flag and refuses to process the tree otherwise.

Signed-off-by: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/fdt.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 0749656..32523e6 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -383,7 +383,8 @@ static void * unflatten_dt_node(const void *blob,
  */
 static void __unflatten_device_tree(const void *blob,
 			     struct device_node **mynodes,
-			     void * (*dt_alloc)(u64 size, u64 align))
+			     void * (*dt_alloc)(u64 size, u64 align),
+			     bool detached)
 {
 	unsigned long size;
 	int start;
@@ -427,6 +428,10 @@ static void __unflatten_device_tree(const void *blob,
 	if (be32_to_cpup(mem + size) != 0xdeadbeef)
 		pr_warning("End of tree marker overwritten: %08x\n",
 			   be32_to_cpup(mem + size));
+	if (detached) {
+		of_node_set_flag(*mynodes, OF_DETACHED);
+		pr_debug("unflattened tree is detached\n");
+	}
 
 	pr_debug(" <- unflatten_device_tree()\n");
 }
@@ -447,7 +452,7 @@ static void *kernel_tree_alloc(u64 size, u64 align)
 void of_fdt_unflatten_tree(const unsigned long *blob,
 			struct device_node **mynodes)
 {
-	__unflatten_device_tree(blob, mynodes, &kernel_tree_alloc);
+	__unflatten_device_tree(blob, mynodes, &kernel_tree_alloc, true);
 }
 EXPORT_SYMBOL_GPL(of_fdt_unflatten_tree);
 
@@ -1099,7 +1104,8 @@ bool __init early_init_dt_scan(void *params)
 void __init unflatten_device_tree(void)
 {
 	__unflatten_device_tree(initial_boot_params, &of_root,
-				early_init_dt_alloc_memory_arch);
+				early_init_dt_alloc_memory_arch,
+				false);
 
 	/* Get pointer to "/chosen" and "/aliases" nodes for use everywhere */
 	of_alias_scan(early_init_dt_alloc_memory_arch);
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
