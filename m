From: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v8 42/45] drivers/of: Rename unflatten_dt_node()
Date: Wed, 17 Feb 2016 14:44:25 +1100
Message-ID: <1455680668-23298-43-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1455680668-23298-1-git-send-email-gwshan@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455680668-23298-1-git-send-email-gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org, dja-Yfaxwxk/+vWsTnJN9+BGXg@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This renames unflatten_dt_node() to unflatten_dt_nodes() as it
populates multiple device nodes from FDT blob. No logical changes
introduced.

Signed-off-by: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
 drivers/of/fdt.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 667a5b2..3fc9a30 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -381,7 +381,7 @@ static void reverse_nodes(struct device_node *parent)
 }
 
 /**
- * unflatten_dt_node - Alloc and populate a device_node from the flat tree
+ * unflatten_dt_nodes - Alloc and populate a device_node from the flat tree
  * @blob: The parent device tree blob
  * @mem: Memory chunk to use for allocating device nodes and properties
  * @dad: Parent struct device_node
@@ -389,10 +389,10 @@ static void reverse_nodes(struct device_node *parent)
  *
  * It returns the size of unflattened device tree or error code
  */
-static int unflatten_dt_node(const void *blob,
-			     void *mem,
-			     struct device_node *dad,
-			     struct device_node **nodepp)
+static int unflatten_dt_nodes(const void *blob,
+			      void *mem,
+			      struct device_node *dad,
+			      struct device_node **nodepp)
 {
 	struct device_node *root;
 	int offset = 0, depth = 0;
@@ -479,7 +479,7 @@ static void __unflatten_device_tree(const void *blob,
 	}
 
 	/* First pass, scan for size */
-	size = unflatten_dt_node(blob, NULL, NULL, NULL);
+	size = unflatten_dt_nodes(blob, NULL, NULL, NULL);
 	if (size < 0)
 		return;
 
@@ -495,7 +495,7 @@ static void __unflatten_device_tree(const void *blob,
 	pr_debug("  unflattening %p...\n", mem);
 
 	/* Second pass, do actual unflattening */
-	unflatten_dt_node(blob, mem, NULL, mynodes);
+	unflatten_dt_nodes(blob, mem, NULL, mynodes);
 	if (be32_to_cpup(mem + size) != 0xdeadbeef)
 		pr_warning("End of tree marker overwritten: %08x\n",
 			   be32_to_cpup(mem + size));
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
