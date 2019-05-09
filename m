From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH 1/2] of/fdt: Remove dead code and mark functions with __init
Date: Thu,  9 May 2019 14:55:37 -0700
Message-ID: <20190509215538.93346-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>
List-Id: devicetree@vger.kernel.org

Some functions in here are never called, and others are only called
during __init. Remove the dead code and some dead exports for functions
that don't exist (I'm looking at you of_fdt_get_string!). Mark some
functions with __init so we can throw them away after we boot up and
poke at the FDT blob too.

Cc: Hsin-Yi Wang <hsinyi@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../devicetree/bindings/common-properties.txt |  4 +-
 drivers/of/fdt.c                              | 37 +++----------------
 include/linux/of_fdt.h                        | 11 ------
 3 files changed, 7 insertions(+), 45 deletions(-)

diff --git a/Documentation/devicetree/bindings/common-properties.txt b/Documentation/devicetree/bindings/common-properties.txt
index a3448bfa1c82..1c50d8700ab5 100644
--- a/Documentation/devicetree/bindings/common-properties.txt
+++ b/Documentation/devicetree/bindings/common-properties.txt
@@ -25,8 +25,8 @@ Optional properties:
 If a binding supports these properties, then the binding should also
 specify the default behavior if none of these properties are present.
 In such cases, little-endian is the preferred default, but it is not
-a requirement.  The of_device_is_big_endian() and of_fdt_is_big_endian()
-helper functions do assume that little-endian is the default, because
+a requirement.  The of_device_is_big_endian()
+helper function assumes that little-endian is the default, because
 most existing (PCI-based) drivers implicitly default to LE by using
 readl/writel for MMIO accesses.
 
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index de893c9616a1..918098c9f72a 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -38,7 +38,7 @@
  * memory entries in the /memory node. This function may be called
  * any time after initial_boot_param is set.
  */
-void of_fdt_limit_memory(int limit)
+void __init of_fdt_limit_memory(int limit)
 {
 	int memory;
 	int len;
@@ -110,25 +110,6 @@ static int of_fdt_is_compatible(const void *blob,
 	return 0;
 }
 
-/**
- * of_fdt_is_big_endian - Return true if given node needs BE MMIO accesses
- * @blob: A device tree blob
- * @node: node to test
- *
- * Returns true if the node has a "big-endian" property, or if the kernel
- * was compiled for BE *and* the node has a "native-endian" property.
- * Returns false otherwise.
- */
-bool of_fdt_is_big_endian(const void *blob, unsigned long node)
-{
-	if (fdt_getprop(blob, node, "big-endian", NULL))
-		return true;
-	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN) &&
-	    fdt_getprop(blob, node, "native-endian", NULL))
-		return true;
-	return false;
-}
-
 static bool of_fdt_device_is_available(const void *blob, unsigned long node)
 {
 	const char *status = fdt_getprop(blob, node, "status", NULL);
@@ -145,8 +126,8 @@ static bool of_fdt_device_is_available(const void *blob, unsigned long node)
 /**
  * of_fdt_match - Return true if node matches a list of compatible values
  */
-int of_fdt_match(const void *blob, unsigned long node,
-                 const char *const *compat)
+static int __init of_fdt_match(const void *blob, unsigned long node,
+			       const char *const *compat)
 {
 	unsigned int tmp, score = 0;
 
@@ -758,7 +739,7 @@ int __init of_scan_flat_dt_subnodes(unsigned long parent,
  * @return offset of the subnode, or -FDT_ERR_NOTFOUND if there is none
  */
 
-int of_get_flat_dt_subnode_by_name(unsigned long node, const char *uname)
+int __init of_get_flat_dt_subnode_by_name(unsigned long node, const char *uname)
 {
 	return fdt_subnode_offset(initial_boot_params, node, uname);
 }
@@ -771,14 +752,6 @@ unsigned long __init of_get_flat_dt_root(void)
 	return 0;
 }
 
-/**
- * of_get_flat_dt_size - Return the total size of the FDT
- */
-int __init of_get_flat_dt_size(void)
-{
-	return fdt_totalsize(initial_boot_params);
-}
-
 /**
  * of_get_flat_dt_prop - Given a node in the flat blob, return the property ptr
  *
@@ -804,7 +777,7 @@ int __init of_flat_dt_is_compatible(unsigned long node, const char *compat)
 /**
  * of_flat_dt_match - Return true if node matches a list of compatible values
  */
-int __init of_flat_dt_match(unsigned long node, const char *const *compat)
+static int __init of_flat_dt_match(unsigned long node, const char *const *compat)
 {
 	return of_fdt_match(initial_boot_params, node, compat);
 }
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index a713e5d156d8..acf820e88952 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -23,15 +23,6 @@
 struct device_node;
 
 /* For scanning an arbitrary device-tree at any time */
-extern char *of_fdt_get_string(const void *blob, u32 offset);
-extern void *of_fdt_get_property(const void *blob,
-				 unsigned long node,
-				 const char *name,
-				 int *size);
-extern bool of_fdt_is_big_endian(const void *blob,
-				 unsigned long node);
-extern int of_fdt_match(const void *blob, unsigned long node,
-			const char *const *compat);
 extern void *of_fdt_unflatten_tree(const unsigned long *blob,
 				   struct device_node *dad,
 				   struct device_node **mynodes);
@@ -64,9 +55,7 @@ extern int of_get_flat_dt_subnode_by_name(unsigned long node,
 extern const void *of_get_flat_dt_prop(unsigned long node, const char *name,
 				       int *size);
 extern int of_flat_dt_is_compatible(unsigned long node, const char *name);
-extern int of_flat_dt_match(unsigned long node, const char *const *matches);
 extern unsigned long of_get_flat_dt_root(void);
-extern int of_get_flat_dt_size(void);
 extern uint32_t of_get_flat_dt_phandle(unsigned long node);
 
 extern int early_init_dt_scan_chosen(unsigned long node, const char *uname,
-- 
Sent by a computer through tubes
