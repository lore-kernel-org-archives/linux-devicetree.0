From: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [RFC,PATCH] of/flattree: Don't assume HAVE_LMB
Date: Mon, 14 Dec 2009 11:30:03 +0800
Message-ID: <1260761403.905113.822486139634.1.gpush@pororo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

We don't always have lmb available, so make the lmb-specific code depend
on CONFIG_HAVE_LMB. Arches that don't provide LMB will need to specify
functions (early_init_dt_{add,alloc}_memory) to handle the addition and
allocation of memory in the fdt code.

When we don't have lmb.h included, we need asm/page.h for __va.

Signed-off-by: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>

---
 drivers/of/fdt.c       |   30 +++++++++++++++++++++++++++---
 include/linux/of_fdt.h |    8 ++++++++
 2 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 941da3f..4071639 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -10,10 +10,15 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/lmb.h>
 #include <linux/initrd.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
+#include <linux/string.h>
+#include <linux/errno.h>
+
+#ifdef CONFIG_HAVE_LMB
+#include <linux/lmb.h>
+#endif
 
 
 #ifdef CONFIG_PPC
@@ -27,6 +32,8 @@
 #endif
 #endif /* CONFIG_PPC */
 
+#include <asm/page.h>
+
 int __initdata dt_root_addr_cells;
 int __initdata dt_root_size_cells;
 
@@ -443,6 +450,18 @@ int __init early_init_dt_scan_root(unsigned long node, const char *uname,
 	return 1;
 }
 
+#ifdef CONFIG_HAVE_LMB
+static inline void early_init_dt_add_memory(u64 base, u64 size)
+{
+	lmb_add(base, size);
+}
+
+static inline u64 early_init_dt_alloc_memory(u64 size, u64 align)
+{
+	return lmb_alloc(size, align);
+}
+#endif /* HAVE_LMB */
+
 /**
  * early_init_dt_scan_memory - Look for an parse memory nodes
  */
@@ -499,7 +518,7 @@ static int __init early_init_dt_scan_memory(unsigned long node,
 				size = 0x80000000ul - base;
 		}
 #endif
-		lmb_add(base, size);
+		early_init_dt_add_memory(base, size);
 
 #ifdef CONFIG_PPC
 		memstart_addr = min((u64)memstart_addr, base);
@@ -607,7 +626,9 @@ void __init early_init_devtree(void *params)
 	of_scan_flat_dt(early_init_dt_scan_chosen, NULL);
 
 	/* Scan memory nodes and rebuild LMBs */
+#ifdef CONFIG_HAVE_LMB
 	lmb_init();
+#endif
 	of_scan_flat_dt(early_init_dt_scan_root, NULL);
 	of_scan_flat_dt(early_init_dt_scan_memory, NULL);
 
@@ -620,10 +641,12 @@ void __init early_init_devtree(void *params)
 	 * code will be reevaluated and refactored */
 	early_init_devtree_arch();
 
+#ifdef CONFIG_HAVE_LMB
 	lmb_analyze();
 	lmb_dump_all();
 
 	pr_debug("Phys. mem: %llx\n", lmb_phys_mem_size());
+#endif
 
 	/* We may need to relocate the flat tree, do it now.
 	 * FIXME .. and the initrd too? */
@@ -663,7 +686,8 @@ void __init unflatten_device_tree(void)
 	pr_debug("  size is %lx, allocating...\n", size);
 
 	/* Allocate memory for the expanded device tree */
-	mem = lmb_alloc(size + 4, __alignof__(struct device_node));
+	mem = early_init_dt_alloc_memory(size + 4,
+			__alignof__(struct device_node));
 	mem = (unsigned long) __va(mem);
 
 	((u32 *)mem)[size / 4] = 0xdeadbeef;
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index fb250cc..088a9c5 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -81,6 +81,14 @@ extern void early_reserve_mem(void);
 extern void early_init_devtree_arch(void);
 extern u64 dt_mem_next_cell(int s, u32 **cellp);
 
+/* With CONFIG_HAVE_LMB, we can just use the lmb_ functions to add & allocate
+ * memory; otherwise, the arch has to provide its own functions to do this.
+ */
+#ifndef CONFIG_HAVE_LMB
+extern void early_init_dt_add_memory(u64 base, u64 size);
+extern u64 early_init_dt_alloc_memory(u64 size, u64 align);
+#endif /* CONFIG_HAVE_LMB */
+
 /* Early flat tree scan hooks */
 extern int early_init_dt_scan_root(unsigned long node, const char *uname,
 				   int depth, void *data);
