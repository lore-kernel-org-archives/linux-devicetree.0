From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/8] of/fdt: Add unflatten_partial_device_tree
Date: Fri, 16 Jul 2010 11:13:36 -0700
Message-ID: <91a7e060-e748-47d5-aa7d-4fc45343d212@SG2EHSMHS005.ehs.local>
References: <1279304021-22216-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-3-git-send-email-stephen.neuendorffer@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1279304021-22216-3-git-send-email-stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This code allows a user to parse a partial device tree blob, which is
structurally independent of any toplevel blob.
Previously, this code assumed that the blob comes from initial_boot_params.
Now, unflatten_partial_device_tree can take a blob from an arbitrary position,
and the location of the blob gets passed around to the various support functions.

Signed-off-by: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
 drivers/of/fdt.c       |  169 +++++++++++++++++++++++++++++++++--------------
 include/linux/of_fdt.h |   11 ++-
 2 files changed, 126 insertions(+), 54 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index d61fda8..89fb1f3 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -11,10 +11,12 @@
 
 #include <linux/kernel.h>
 #include <linux/initrd.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/string.h>
 #include <linux/errno.h>
+#include <linux/slab.h>
 
 #ifdef CONFIG_PPC
 #include <asm/machdep.h>
@@ -22,15 +24,19 @@
 
 #include <asm/page.h>
 
-int __initdata dt_root_addr_cells;
-int __initdata dt_root_size_cells;
+int dt_root_addr_cells;
+int dt_root_size_cells;
 
 struct boot_param_header *initial_boot_params;
 
-char *find_flat_dt_string(u32 offset)
+void __unflatten_device_tree(unsigned long *blob, struct device_node **mynodes,
+			     unsigned long (*dt_alloc)(u64 size, u64 align));
+
+char *find_flat_dt_string(u32 offset,
+			  struct boot_param_header *blob)
 {
-	return ((char *)initial_boot_params) +
-		be32_to_cpu(initial_boot_params->off_dt_strings) + offset;
+	return ((char *)blob) +
+		be32_to_cpu(blob->off_dt_strings) + offset;
 }
 
 /**
@@ -118,8 +124,9 @@ unsigned long __init of_get_flat_dt_root(void)
  * This function can be used within scan_flattened_dt callback to get
  * access to properties
  */
-void *__init of_get_flat_dt_prop(unsigned long node, const char *name,
-				 unsigned long *size)
+void * __init of_get_flat_dt_prop(unsigned long node, const char *name,
+				 unsigned long *size,
+				 struct boot_param_header *blob)
 {
 	unsigned long p = node;
 
@@ -140,7 +147,7 @@ void *__init of_get_flat_dt_prop(unsigned long node, const char *name,
 		if (be32_to_cpu(initial_boot_params->version) < 0x10)
 			p = ALIGN(p, sz >= 8 ? 8 : 4);
 
-		nstr = find_flat_dt_string(noff);
+		nstr = find_flat_dt_string(noff, blob);
 		if (nstr == NULL) {
 			pr_warning("Can't find property index name !\n");
 			return NULL;
@@ -160,12 +167,13 @@ void *__init of_get_flat_dt_prop(unsigned long node, const char *name,
  * @node: node to test
  * @compat: compatible string to compare with compatible list.
  */
-int __init of_flat_dt_is_compatible(unsigned long node, const char *compat)
+int  of_flat_dt_is_compatible(unsigned long node, const char *compat,
+				 struct boot_param_header *blob)
 {
 	const char *cp;
 	unsigned long cplen, l;
 
-	cp = of_get_flat_dt_prop(node, "compatible", &cplen);
+	cp = of_get_flat_dt_prop(node, "compatible", &cplen, blob);
 	if (cp == NULL)
 		return 0;
 	while (cplen > 0) {
@@ -179,7 +187,7 @@ int __init of_flat_dt_is_compatible(unsigned long node, const char *compat)
 	return 0;
 }
 
-static void *__init unflatten_dt_alloc(unsigned long *mem, unsigned long size,
+static void *unflatten_dt_alloc(unsigned long *mem, unsigned long size,
 				       unsigned long align)
 {
 	void *res;
@@ -198,11 +206,12 @@ static void *__init unflatten_dt_alloc(unsigned long *mem, unsigned long size,
  * @allnextpp: pointer to ->allnext from last allocated device_node
  * @fpsize: Size of the node path up at the current depth.
  */
-unsigned long __init unflatten_dt_node(unsigned long mem,
-					unsigned long *p,
-					struct device_node *dad,
-					struct device_node ***allnextpp,
-					unsigned long fpsize)
+unsigned long unflatten_dt_node(unsigned long mem,
+				unsigned long *p,
+				struct device_node *dad,
+				struct device_node ***allnextpp,
+				unsigned long fpsize,
+				struct boot_param_header *blob)
 {
 	struct device_node *np;
 	struct property *pp, **prev_pp = NULL;
@@ -298,10 +307,10 @@ unsigned long __init unflatten_dt_node(unsigned long mem,
 		sz = be32_to_cpup((__be32 *)(*p));
 		noff = be32_to_cpup((__be32 *)((*p) + 4));
 		*p += 8;
-		if (be32_to_cpu(initial_boot_params->version) < 0x10)
+		if (be32_to_cpu(blob->version) < 0x10)
 			*p = ALIGN(*p, sz >= 8 ? 8 : 4);
 
-		pname = find_flat_dt_string(noff);
+		pname = find_flat_dt_string(noff, blob);
 		if (pname == NULL) {
 			pr_info("Can't find property name in list !\n");
 			break;
@@ -380,7 +389,8 @@ unsigned long __init unflatten_dt_node(unsigned long mem,
 		if (tag == OF_DT_NOP)
 			*p += 4;
 		else
-			mem = unflatten_dt_node(mem, p, np, allnextpp, fpsize);
+			mem = unflatten_dt_node(mem, p, np, allnextpp,
+						fpsize, blob);
 		tag = be32_to_cpup((__be32 *)(*p));
 	}
 	if (tag != OF_DT_END_NODE) {
@@ -391,6 +401,8 @@ unsigned long __init unflatten_dt_node(unsigned long mem,
 	return mem;
 }
 
+#if defined(CONFIG_MICROBLAZE) || defined(CONFIG_POWERPC) || defined(CONFIG_SPARC)
+
 #ifdef CONFIG_BLK_DEV_INITRD
 /**
  * early_init_dt_check_for_initrd - Decode initrd location from flat tree
@@ -403,12 +415,14 @@ void __init early_init_dt_check_for_initrd(unsigned long node)
 
 	pr_debug("Looking for initrd properties... ");
 
-	prop = of_get_flat_dt_prop(node, "linux,initrd-start", &len);
+	prop = of_get_flat_dt_prop(node, "linux,initrd-start",
+				   &len, initial_boot_params);
 	if (!prop)
 		return;
 	start = of_read_ulong(prop, len/4);
 
-	prop = of_get_flat_dt_prop(node, "linux,initrd-end", &len);
+	prop = of_get_flat_dt_prop(node, "linux,initrd-end",
+				   &len, initial_boot_params);
 	if (!prop)
 		return;
 	end = of_read_ulong(prop, len/4);
@@ -436,12 +450,14 @@ int __init early_init_dt_scan_root(unsigned long node, const char *uname,
 	dt_root_size_cells = OF_ROOT_NODE_SIZE_CELLS_DEFAULT;
 	dt_root_addr_cells = OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
 
-	prop = of_get_flat_dt_prop(node, "#size-cells", NULL);
+	prop = of_get_flat_dt_prop(node, "#size-cells",
+				   NULL, initial_boot_params);
 	if (prop)
 		dt_root_size_cells = be32_to_cpup(prop);
 	pr_debug("dt_root_size_cells = %x\n", dt_root_size_cells);
 
-	prop = of_get_flat_dt_prop(node, "#address-cells", NULL);
+	prop = of_get_flat_dt_prop(node, "#address-cells",
+				   NULL, initial_boot_params);
 	if (prop)
 		dt_root_addr_cells = be32_to_cpup(prop);
 	pr_debug("dt_root_addr_cells = %x\n", dt_root_addr_cells);
@@ -450,7 +466,7 @@ int __init early_init_dt_scan_root(unsigned long node, const char *uname,
 	return 1;
 }
 
-u64 __init dt_mem_next_cell(int s, __be32 **cellp)
+u64  dt_mem_next_cell(int s, __be32 **cellp)
 {
 	__be32 *p = *cellp;
 
@@ -464,7 +480,8 @@ u64 __init dt_mem_next_cell(int s, __be32 **cellp)
 int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
 				     int depth, void *data)
 {
-	char *type = of_get_flat_dt_prop(node, "device_type", NULL);
+	char *type = of_get_flat_dt_prop(node, "device_type",
+					 NULL, initial_boot_params);
 	__be32 *reg, *endp;
 	unsigned long l;
 
@@ -479,9 +496,10 @@ int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
 	} else if (strcmp(type, "memory") != 0)
 		return 0;
 
-	reg = of_get_flat_dt_prop(node, "linux,usable-memory", &l);
+	reg = of_get_flat_dt_prop(node, "linux,usable-memory",
+				  &l, initial_boot_params);
 	if (reg == NULL)
-		reg = of_get_flat_dt_prop(node, "reg", &l);
+		reg = of_get_flat_dt_prop(node, "reg", &l, initial_boot_params);
 	if (reg == NULL)
 		return 0;
 
@@ -521,12 +539,12 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 
 	early_init_dt_check_for_initrd(node);
 
+#ifdef CONFIG_CMDLINE
 	/* Retreive command line */
-	p = of_get_flat_dt_prop(node, "bootargs", &l);
+	p = of_get_flat_dt_prop(node, "bootargs", &l, initial_boot_params);
 	if (p != NULL && l > 0)
 		strlcpy(cmd_line, p, min((int)l, COMMAND_LINE_SIZE));
 
-#ifdef CONFIG_CMDLINE
 #ifndef CONFIG_CMDLINE_FORCE
 	if (p == NULL || l == 0 || (l == 1 && (*p) == 0))
 #endif
@@ -535,12 +553,21 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 
 	early_init_dt_scan_chosen_arch(node);
 
+#ifdef CONFIG_CMDLINE
 	pr_debug("Command line is: %s\n", cmd_line);
+#endif /* CONFIG_CMDLINE */
 
 	/* break now */
 	return 1;
 }
 
+
+static unsigned long early_device_tree_alloc(u64 size, u64 align)
+{
+	unsigned long mem = early_init_dt_alloc_memory_arch(size, align);
+	return (unsigned long) __va(mem);
+}
+
 /**
  * unflatten_device_tree - create tree of device_nodes from flat blob
  *
@@ -551,58 +578,98 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
  */
 void __init unflatten_device_tree(void)
 {
+	__unflatten_device_tree(initial_boot_params, &allnodes,
+				early_device_tree_alloc);
+
+	/* Get pointer to OF "/chosen" node for use everywhere */
+	of_chosen = of_find_node_by_path("/chosen");
+	if (of_chosen == NULL)
+		of_chosen = of_find_node_by_path("/chosen@0");
+}
+
+#endif
+
+static unsigned long kernel_tree_alloc(u64 size, u64 align)
+{
+	return (unsigned long) kzalloc(size, GFP_KERNEL);
+}
+
+/**
+ * unflatten_partial_device_tree - create tree of device_nodes from flat blob
+ *
+ * unflattens the device-tree passed by the firmware, creating the
+ * tree of struct device_node. It also fills the "name" and "type"
+ * pointers of the nodes so the normal device-tree walking functions
+ * can be used.
+ */
+void unflatten_partial_device_tree(unsigned long *blob,
+				   struct device_node **mynodes)
+{
+	__unflatten_device_tree(blob, mynodes, &kernel_tree_alloc);
+}
+EXPORT_SYMBOL(unflatten_partial_device_tree);
+
+/**
+ * __unflatten_device_tree - create tree of device_nodes from flat blob
+ *
+ * unflattens the device-tree passed by the firmware, creating the
+ * tree of struct device_node. It also fills the "name" and "type"
+ * pointers of the nodes so the normal device-tree walking functions
+ * can be used.  Memory is allocated using the given function.
+ */
+void __unflatten_device_tree(unsigned long *blob, struct device_node **mynodes,
+			     unsigned long (*dt_alloc)(u64 size, u64 align))
+{
+	struct boot_param_header *device_tree =
+		(struct boot_param_header *)blob;
 	unsigned long start, mem, size;
-	struct device_node **allnextp = &allnodes;
+	struct device_node **allnextp = mynodes;
 
 	pr_debug(" -> unflatten_device_tree()\n");
 
-	if (!initial_boot_params) {
+	if (!device_tree) {
 		pr_debug("No device tree pointer\n");
 		return;
 	}
 
 	pr_debug("Unflattening device tree:\n");
-	pr_debug("magic: %08x\n", be32_to_cpu(initial_boot_params->magic));
-	pr_debug("size: %08x\n", be32_to_cpu(initial_boot_params->totalsize));
-	pr_debug("version: %08x\n", be32_to_cpu(initial_boot_params->version));
+	pr_debug("magic: %08x\n", be32_to_cpu(device_tree->magic));
+	pr_debug("size: %08x\n", be32_to_cpu(device_tree->totalsize));
+	pr_debug("version: %08x\n", be32_to_cpu(device_tree->version));
 
-	if (be32_to_cpu(initial_boot_params->magic) != OF_DT_HEADER) {
-		pr_err("Invalid device tree blob header\n");
+	if (be32_to_cpu(device_tree->magic) != OF_DT_HEADER) {
+		pr_err("Invalid device tree blob header %x\n",
+		       be32_to_cpu(device_tree->magic));
 		return;
 	}
 
 	/* First pass, scan for size */
-	start = ((unsigned long)initial_boot_params) +
-		be32_to_cpu(initial_boot_params->off_dt_struct);
-	size = unflatten_dt_node(0, &start, NULL, NULL, 0);
+	start = ((unsigned long)device_tree) +
+		be32_to_cpu(device_tree->off_dt_struct);
+	size = unflatten_dt_node(0, &start, NULL, NULL, 0, device_tree);
 	size = (size | 3) + 1;
 
 	pr_debug("  size is %lx, allocating...\n", size);
 
 	/* Allocate memory for the expanded device tree */
-	mem = early_init_dt_alloc_memory_arch(size + 4,
-			__alignof__(struct device_node));
-	mem = (unsigned long) __va(mem);
+	mem = (unsigned long) dt_alloc(size + 4,
+		      __alignof__(struct device_node));
 
 	((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeef);
 
 	pr_debug("  unflattening %lx...\n", mem);
 
 	/* Second pass, do actual unflattening */
-	start = ((unsigned long)initial_boot_params) +
-		be32_to_cpu(initial_boot_params->off_dt_struct);
-	unflatten_dt_node(mem, &start, NULL, &allnextp, 0);
+	start = ((unsigned long)device_tree) +
+		be32_to_cpu(device_tree->off_dt_struct);
+	unflatten_dt_node(mem, &start, NULL, &allnextp, 0, device_tree);
 	if (be32_to_cpup((__be32 *)start) != OF_DT_END)
-		pr_warning("Weird tag at end of tree: %08x\n", *((u32 *)start));
+		pr_warning("Weird tag at end of tree: %08x\n",
+			   *((u32 *)start));
 	if (be32_to_cpu(((__be32 *)mem)[size / 4]) != 0xdeadbeef)
 		pr_warning("End of tree marker overwritten: %08x\n",
 			   be32_to_cpu(((__be32 *)mem)[size / 4]));
 	*allnextp = NULL;
 
-	/* Get pointer to OF "/chosen" node for use everywhere */
-	of_chosen = of_find_node_by_path("/chosen");
-	if (of_chosen == NULL)
-		of_chosen = of_find_node_by_path("/chosen@0");
-
 	pr_debug(" <- unflatten_device_tree()\n");
 }
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index 71e1a91..2bc0754 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -64,13 +64,16 @@ extern int __initdata dt_root_size_cells;
 extern struct boot_param_header *initial_boot_params;
 
 /* For scanning the flat device-tree at boot time */
-extern char *find_flat_dt_string(u32 offset);
+extern char *find_flat_dt_string(u32 offset,
+			  struct boot_param_header *blob);
 extern int of_scan_flat_dt(int (*it)(unsigned long node, const char *uname,
 				     int depth, void *data),
 			   void *data);
 extern void *of_get_flat_dt_prop(unsigned long node, const char *name,
-				 unsigned long *size);
-extern int of_flat_dt_is_compatible(unsigned long node, const char *name);
+				 unsigned long *size,
+			  struct boot_param_header *blob);
+extern int of_flat_dt_is_compatible(unsigned long node, const char *name,
+			  struct boot_param_header *blob);
 extern unsigned long of_get_flat_dt_root(void);
 extern void early_init_dt_scan_chosen_arch(unsigned long node);
 extern int early_init_dt_scan_chosen(unsigned long node, const char *uname,
@@ -98,6 +101,8 @@ extern int early_init_dt_scan_root(unsigned long node, const char *uname,
 
 /* Other Prototypes */
 extern void unflatten_device_tree(void);
+extern void unflatten_partial_device_tree(unsigned long *blob,
+					  struct device_node **mynodes);
 extern void early_init_devtree(void *);
 #else /* CONFIG_OF_FLATTREE */
 static inline void unflatten_device_tree(void) {}
-- 
1.5.6.6



This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
