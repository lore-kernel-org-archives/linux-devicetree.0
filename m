From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/7] of/fdt: use memblock_virt_alloc for early alloc
Date: Fri,  5 Jan 2018 17:14:18 -0600
Message-ID: <20180105231424.19247-2-robh@kernel.org>
References: <20180105231424.19247-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180105231424.19247-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

memblock_virt_alloc() works for both memblock and bootmem, so use it and
make early_init_dt_alloc_memory_arch a static function. The arches using
bootmem define early_init_dt_alloc_memory_arch as either:

__alloc_bootmem(size, align, __pa(MAX_DMA_ADDRESS))

or:

alloc_bootmem_align(size, align)

Both of these evaluate to the same thing as does memblock_virt_alloc for
bootmem. So we can disable the arch specific functions by making
early_init_dt_alloc_memory_arch static and they can be removed in
subsequent commits.

Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/of/fdt.c       | 16 ++++------------
 drivers/of/unittest.c  | 11 ++++++++---
 include/linux/of_fdt.h |  1 -
 3 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 4675e5ac4d11..444e65aa0d29 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -14,6 +14,7 @@
 #include <linux/crc32.h>
 #include <linux/kernel.h>
 #include <linux/initrd.h>
+#include <linux/bootmem.h>
 #include <linux/memblock.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
@@ -1183,14 +1184,6 @@ int __init __weak early_init_dt_reserve_memory_arch(phys_addr_t base,
 	return memblock_reserve(base, size);
 }
 
-/*
- * called from unflatten_device_tree() to bootstrap devicetree itself
- * Architectures can override this definition if memblock isn't used
- */
-void * __init __weak early_init_dt_alloc_memory_arch(u64 size, u64 align)
-{
-	return __va(memblock_alloc(size, align));
-}
 #else
 void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
 {
@@ -1209,13 +1202,12 @@ int __init __weak early_init_dt_reserve_memory_arch(phys_addr_t base,
 		  &base, &size, nomap ? " (nomap)" : "");
 	return -ENOSYS;
 }
+#endif
 
-void * __init __weak early_init_dt_alloc_memory_arch(u64 size, u64 align)
+static void * __init early_init_dt_alloc_memory_arch(u64 size, u64 align)
 {
-	WARN_ON(1);
-	return NULL;
+	return memblock_virt_alloc(size, align);
 }
-#endif
 
 bool __init early_init_dt_verify(void *params)
 {
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 0f8052f1355c..7a9abaae874d 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -5,6 +5,7 @@
 
 #define pr_fmt(fmt) "### dt-test ### " fmt
 
+#include <linux/bootmem.h>
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/errno.h>
@@ -2053,6 +2054,11 @@ static struct overlay_info overlays[] = {
 
 static struct device_node *overlay_base_root;
 
+static void * __init dt_alloc_memory(u64 size, u64 align)
+{
+	return memblock_virt_alloc(size, align);
+}
+
 /*
  * Create base device tree for the overlay unittest.
  *
@@ -2092,8 +2098,7 @@ void __init unittest_unflatten_overlay_base(void)
 		return;
 	}
 
-	info->data = early_init_dt_alloc_memory_arch(size,
-					     roundup_pow_of_two(FDT_V17_SIZE));
+	info->data = dt_alloc_memory(size, roundup_pow_of_two(FDT_V17_SIZE));
 	if (!info->data) {
 		pr_err("alloc for dtb 'overlay_base' failed");
 		return;
@@ -2102,7 +2107,7 @@ void __init unittest_unflatten_overlay_base(void)
 	memcpy(info->data, info->dtb_begin, size);
 
 	__unflatten_device_tree(info->data, NULL, &info->np_overlay,
-				early_init_dt_alloc_memory_arch, true);
+				dt_alloc_memory, true);
 	overlay_base_root = info->np_overlay;
 }
 
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index 444e6e283828..02c05028d0ba 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -83,7 +83,6 @@ extern void early_init_dt_add_memory_arch(u64 base, u64 size);
 extern int early_init_dt_mark_hotplug_memory_arch(u64 base, u64 size);
 extern int early_init_dt_reserve_memory_arch(phys_addr_t base, phys_addr_t size,
 					     bool no_map);
-extern void * early_init_dt_alloc_memory_arch(u64 size, u64 align);
 extern u64 dt_mem_next_cell(int s, const __be32 **cellp);
 
 /* Early flat tree scan hooks */
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
