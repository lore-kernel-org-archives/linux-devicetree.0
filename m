From: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 16/21] MIPS memblock: Alter paging initialization method
Date: Mon, 19 Dec 2016 05:07:41 +0300
Message-ID: <1482113266-13207-17-git-send-email-fancer.lancer@gmail.com>
References: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1482113266-13207-1-git-send-email-fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, rabinv-VrBV9hrLPhE@public.gmane.org, matt.redfearn-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Apart from the actions it did before, it initializes sparsemem
if one activated. Memory zones size calculation is moved into an
individual method.

Signed-off-by: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/mips/mm/init.c | 79 +++++++++++++++++++++++++----------
 1 file changed, 56 insertions(+), 23 deletions(-)

diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 49db909..6f186c7 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -58,6 +58,53 @@ EXPORT_SYMBOL_GPL(empty_zero_page);
 EXPORT_SYMBOL(zero_page_mask);
 
 /*
+ * Initialize sparse memory sections setting node ids and indexes
+ */
+static void __init mips_memory_present(void)
+{
+#ifdef CONFIG_SPARSEMEM
+	struct memblock_region *reg;
+
+	for_each_memblock(memory, reg)
+		memory_present(0, memblock_region_memory_base_pfn(reg),
+			memblock_region_memory_end_pfn(reg));
+#endif /* CONFIG_SPARSEMEM */
+}
+
+/*
+ * Setup nodes zone areas
+ */
+static void __init zone_sizes_init(void)
+{
+	unsigned long max_zone_pfns[MAX_NR_ZONES];
+
+	/* Clean zone boundaries array */
+	memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
+
+	/* Setup determined boundaries */
+#ifdef CONFIG_ZONE_DMA
+	max_zone_pfns[ZONE_DMA] = MAX_DMA_PFN;
+#endif
+#ifdef CONFIG_ZONE_DMA32
+	max_zone_pfns[ZONE_DMA32] = MAX_DMA32_PFN;
+#endif
+	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
+#ifdef CONFIG_HIGHMEM
+	max_zone_pfns[ZONE_HIGHMEM] = highend_pfn;
+
+	/* Make sure the processor supports highmem */
+	if (cpu_has_dc_aliases && max_low_pfn != highend_pfn) {
+		pr_warn("CPU doesn't support highmem. %ldk highmem ignored\n",
+			(highend_pfn - max_low_pfn) << (PAGE_SHIFT - 10));
+		max_zone_pfns[ZONE_HIGHMEM] = max_low_pfn;
+	}
+#endif
+
+	/* Finally initialize nodes and page maps using memblock info */
+	free_area_init_nodes(max_zone_pfns);
+}
+
+/*
  * Not static inline because used by IP27 special magic initialization code
  */
 void setup_zero_pages(void)
@@ -386,36 +433,22 @@ int page_is_ram(unsigned long pagenr)
 
 void __init paging_init(void)
 {
-	unsigned long max_zone_pfns[MAX_NR_ZONES];
-	unsigned long lastpfn __maybe_unused;
-
+	/* Initialize page tables */
 	pagetable_init();
 
+	/* Initialize highmem mapping */
 #ifdef CONFIG_HIGHMEM
 	kmap_init();
 #endif
-#ifdef CONFIG_ZONE_DMA
-	max_zone_pfns[ZONE_DMA] = MAX_DMA_PFN;
-#endif
-#ifdef CONFIG_ZONE_DMA32
-	max_zone_pfns[ZONE_DMA32] = MAX_DMA32_PFN;
-#endif
-	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
-	lastpfn = max_low_pfn;
-#ifdef CONFIG_HIGHMEM
-	max_zone_pfns[ZONE_HIGHMEM] = highend_pfn;
-	lastpfn = highend_pfn;
 
-	if (cpu_has_dc_aliases && max_low_pfn != highend_pfn) {
-		printk(KERN_WARNING "This processor doesn't support highmem."
-		       " %ldk highmem ignored\n",
-		       (highend_pfn - max_low_pfn) << (PAGE_SHIFT - 10));
-		max_zone_pfns[ZONE_HIGHMEM] = max_low_pfn;
-		lastpfn = max_low_pfn;
-	}
-#endif
+	/* Mark present RAM memory */
+	mips_memory_present();
 
-	free_area_init_nodes(max_zone_pfns);
+	/* Initialize memory maps within sparse memory sections */
+	sparse_init();
+
+	/* Initialize free areas of nodes */
+	zone_sizes_init();
 }
 
 #ifdef CONFIG_64BIT
-- 
2.6.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
