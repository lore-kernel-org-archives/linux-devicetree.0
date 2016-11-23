From: Jason Liu <jason.hui.liu-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 1/1] of: of_reserved_mem: Ensure cma reserved region not cross the low/high memory
Date: Wed, 23 Nov 2016 19:37:01 +0800
Message-ID: <1479901021-25064-1-git-send-email-jason.hui.liu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, labbott-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Need ensure the cma reserved region not cross the low/high memory boundary
when using the dynamic allocation methond through device-tree, otherwise,
kernel will fail to boot up when cma reserved region cross how/high mem.

Signed-off-by: Jason Liu <jason.hui.liu-3arQi8VN3Tc@public.gmane.org>
Cc: Laura Abbott <labbott-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 drivers/of/of_reserved_mem.c    | 42 +++++++++++++++++++++++++++++++----------
 include/linux/of_reserved_mem.h |  3 ++-
 2 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 366d8c3..852345a 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -31,11 +31,15 @@
 
 #if defined(CONFIG_HAVE_MEMBLOCK)
 #include <linux/memblock.h>
-int __init __weak early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
-	phys_addr_t align, phys_addr_t start, phys_addr_t end, bool nomap,
-	phys_addr_t *res_base)
+int __init __weak early_init_dt_alloc_reserved_memory_arch(unsigned long node,
+	phys_addr_t size, phys_addr_t align, phys_addr_t start, phys_addr_t end,
+	bool nomap, phys_addr_t *res_base)
 {
 	phys_addr_t base;
+	phys_addr_t highmem_start;
+
+	highmem_start = __pa(high_memory - 1) + 1;
+
 	/*
 	 * We use __memblock_alloc_base() because memblock_alloc_base()
 	 * panic()s on allocation failure.
@@ -53,15 +57,33 @@ int __init __weak early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
 		return -ENOMEM;
 	}
 
+	/*
+	 * Sanity check for the cma reserved region:If the reserved region
+	 * crosses the low/high memory boundary, try to fix it up and then
+	 * fall back to allocate the cma region from the low mememory space.
+	 */
+
+	if (IS_ENABLED(CONFIG_CMA)
+	    && of_flat_dt_is_compatible(node, "shared-dma-pool")
+	    && of_get_flat_dt_prop(node, "reusable", NULL) && !nomap) {
+		if (base < highmem_start && (base + size) > highmem_start) {
+			memblock_free(base, size);
+			base = memblock_alloc_range(size, align, start,
+						highmem_start, MEMBLOCK_NONE);
+			if (!base)
+				return -ENOMEM;
+		}
+	}
+
 	*res_base = base;
 	if (nomap)
 		return memblock_remove(base, size);
 	return 0;
 }
 #else
-int __init __weak early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
-	phys_addr_t align, phys_addr_t start, phys_addr_t end, bool nomap,
-	phys_addr_t *res_base)
+int __init __weak early_init_dt_alloc_reserved_memory_arch(unsigned long node,
+	phys_addr_t size, phys_addr_t align, phys_addr_t start, phys_addr_t end,
+	bool nomap, phys_addr_t *res_base)
 {
 	pr_err("Reserved memory not supported, ignoring region 0x%llx%s\n",
 		  size, nomap ? " (nomap)" : "");
@@ -155,8 +177,8 @@ static int __init __reserved_mem_alloc_size(unsigned long node,
 			end = start + dt_mem_next_cell(dt_root_size_cells,
 						       &prop);
 
-			ret = early_init_dt_alloc_reserved_memory_arch(size,
-					align, start, end, nomap, &base);
+			ret = early_init_dt_alloc_reserved_memory_arch(node,
+					size, align, start, end, nomap, &base);
 			if (ret == 0) {
 				pr_debug("allocated memory for '%s' node: base %pa, size %ld MiB\n",
 					uname, &base,
@@ -167,8 +189,8 @@ static int __init __reserved_mem_alloc_size(unsigned long node,
 		}
 
 	} else {
-		ret = early_init_dt_alloc_reserved_memory_arch(size, align,
-							0, 0, nomap, &base);
+		ret = early_init_dt_alloc_reserved_memory_arch(node,
+					size, align, 0, 0, nomap, &base);
 		if (ret == 0)
 			pr_debug("allocated memory for '%s' node: base %pa, size %ld MiB\n",
 				uname, &base, (unsigned long)size / SZ_1M);
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index f8e1992..a6ee451 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -34,7 +34,8 @@ int of_reserved_mem_device_init_by_idx(struct device *dev,
 				       struct device_node *np, int idx);
 void of_reserved_mem_device_release(struct device *dev);
 
-int early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
+int early_init_dt_alloc_reserved_memory_arch(unsigned long node,
+					     phys_addr_t size,
 					     phys_addr_t align,
 					     phys_addr_t start,
 					     phys_addr_t end,
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
