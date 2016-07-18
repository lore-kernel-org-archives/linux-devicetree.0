From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] of: fdt: mark unflattened tree as detached
Date: Tue, 19 Jul 2016 00:01:12 +0200
Message-ID: <12088f6fd9a39fc28f6756ec4c1ba034b9a37f0b.1468879073.git.hramrach@gmail.com>
References: <cover.1466971467.git.hramrach@gmail.com> <01da4c372750e6618638a0320e7ea2f656da3ae5.1466971467.git.hramrach@gmail.com> <CAL_JsqLiFYbcqj__B+WB7Q4=MCsr0NOwg4BpRqg1GH+=gadsVg@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLiFYbcqj__B+WB7Q4=MCsr0NOwg4BpRqg1GH+=gadsVg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The tree returned from of_fdt_unflatten_tree cannot be attached to the
live tree because it is not marked as detached so mark it as such. The
dt resolver checks the flag and refuses to process the tree otherwise.

Signed-off-by: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 - rebase on top of 4.7rc
---
 drivers/of/fdt.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 33daffc..f5c802d 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -472,7 +472,8 @@ static int unflatten_dt_nodes(const void *blob,
 static void *__unflatten_device_tree(const void *blob,
 				     struct device_node *dad,
 				     struct device_node **mynodes,
-				     void *(*dt_alloc)(u64 size, u64 align))
+				     void *(*dt_alloc)(u64 size, u64 align),
+				     bool detached)
 {
 	int size;
 	void *mem;
@@ -516,6 +517,11 @@ static void *__unflatten_device_tree(const void *blob,
 		pr_warning("End of tree marker overwritten: %08x\n",
 			   be32_to_cpup(mem + size));
 
+	if (detached) {
+		of_node_set_flag(*mynodes, OF_DETACHED);
+		pr_debug("unflattened tree is detached\n");
+	}
+
 	pr_debug(" <- unflatten_device_tree()\n");
 	return mem;
 }
@@ -548,7 +554,8 @@ void *of_fdt_unflatten_tree(const unsigned long *blob,
 	void *mem;
 
 	mutex_lock(&of_fdt_unflatten_mutex);
-	mem = __unflatten_device_tree(blob, dad, mynodes, &kernel_tree_alloc);
+	mem = __unflatten_device_tree(blob, dad, mynodes, &kernel_tree_alloc,
+				      true);
 	mutex_unlock(&of_fdt_unflatten_mutex);
 
 	return mem;
@@ -1224,7 +1231,7 @@ bool __init early_init_dt_scan(void *params)
 void __init unflatten_device_tree(void)
 {
 	__unflatten_device_tree(initial_boot_params, NULL, &of_root,
-				early_init_dt_alloc_memory_arch);
+				early_init_dt_alloc_memory_arch, false);
 
 	/* Get pointer to "/chosen" and "/aliases" nodes for use everywhere */
 	of_alias_scan(early_init_dt_alloc_memory_arch);
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
