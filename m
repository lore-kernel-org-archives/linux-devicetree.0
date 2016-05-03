From: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v9 20/22] drivers/of: Return allocated memory from of_fdt_unflatten_tree()
Date: Tue,  3 May 2016 23:22:51 +1000
Message-ID: <1462281773-26438-21-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1462281773-26438-1-git-send-email-gwshan@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462281773-26438-1-git-send-email-gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dja-Yfaxwxk/+vWsTnJN9+BGXg@public.gmane.org, alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org, Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This returns the allocate memory chunk, storing the unflattened device
tree, from of_fdt_unflatten_tree() so that memory chunk can be released
on demand in PowerNV PCI hotplug driver.

Signed-off-by: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/of/fdt.c       | 33 ++++++++++++++++++++++-----------
 include/linux/of_fdt.h |  6 +++---
 2 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 337fb1a..c95054c 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -454,11 +454,14 @@ static int unflatten_dt_nodes(const void *blob,
  * @mynodes: The device_node tree created by the call
  * @dt_alloc: An allocator that provides a virtual address to memory
  * for the resulting tree
+ *
+ * Returns NULL on failure or the memory chunk containing the unflattened
+ * device tree on success.
  */
-static void __unflatten_device_tree(const void *blob,
-			     struct device_node *dad,
-			     struct device_node **mynodes,
-			     void * (*dt_alloc)(u64 size, u64 align))
+static void *__unflatten_device_tree(const void *blob,
+				     struct device_node *dad,
+				     struct device_node **mynodes,
+				     void *(*dt_alloc)(u64 size, u64 align))
 {
 	int size;
 	void *mem;
@@ -467,7 +470,7 @@ static void __unflatten_device_tree(const void *blob,
 
 	if (!blob) {
 		pr_debug("No device tree pointer\n");
-		return;
+		return NULL;
 	}
 
 	pr_debug("Unflattening device tree:\n");
@@ -477,13 +480,13 @@ static void __unflatten_device_tree(const void *blob,
 
 	if (fdt_check_header(blob)) {
 		pr_err("Invalid device tree blob header\n");
-		return;
+		return NULL;
 	}
 
 	/* First pass, scan for size */
 	size = unflatten_dt_nodes(blob, NULL, dad, NULL);
 	if (size < 0)
-		return;
+		return NULL;
 
 	size = ALIGN(size, 4);
 	pr_debug("  size is %d, allocating...\n", size);
@@ -503,6 +506,7 @@ static void __unflatten_device_tree(const void *blob,
 			   be32_to_cpup(mem + size));
 
 	pr_debug(" <- unflatten_device_tree()\n");
+	return mem;
 }
 
 static void *kernel_tree_alloc(u64 size, u64 align)
@@ -522,14 +526,21 @@ static DEFINE_MUTEX(of_fdt_unflatten_mutex);
  * tree of struct device_node. It also fills the "name" and "type"
  * pointers of the nodes so the normal device-tree walking functions
  * can be used.
+ *
+ * Returns NULL on failure or the memory chunk containing the unflattened
+ * device tree on success.
  */
-void of_fdt_unflatten_tree(const unsigned long *blob,
-			struct device_node *dad,
-			struct device_node **mynodes)
+void *of_fdt_unflatten_tree(const unsigned long *blob,
+			    struct device_node *dad,
+			    struct device_node **mynodes)
 {
+	void *mem;
+
 	mutex_lock(&of_fdt_unflatten_mutex);
-	__unflatten_device_tree(blob, dad, mynodes, &kernel_tree_alloc);
+	mem = __unflatten_device_tree(blob, dad, mynodes, &kernel_tree_alloc);
 	mutex_unlock(&of_fdt_unflatten_mutex);
+
+	return mem;
 }
 EXPORT_SYMBOL_GPL(of_fdt_unflatten_tree);
 
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index 1bffcbd..901ec01 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -37,9 +37,9 @@ extern bool of_fdt_is_big_endian(const void *blob,
 				 unsigned long node);
 extern int of_fdt_match(const void *blob, unsigned long node,
 			const char *const *compat);
-extern void of_fdt_unflatten_tree(const unsigned long *blob,
-			       struct device_node *dad,
-			       struct device_node **mynodes);
+extern void *of_fdt_unflatten_tree(const unsigned long *blob,
+				   struct device_node *dad,
+				   struct device_node **mynodes);
 
 /* TBD: Temporary export of fdt globals - remove when code fully merged */
 extern int __initdata dt_root_addr_cells;
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
