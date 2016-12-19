From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 17/21] MIPS memblock: Alter high memory freeing method
Date: Mon, 19 Dec 2016 05:07:42 +0300
Message-ID: <1482113266-13207-18-git-send-email-fancer.lancer@gmail.com>
References: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ralf@linux-mips.org, paul.burton@imgtec.com, rabinv@axis.com, matt.redfearn@imgtec.com, james.hogan@imgtec.com, alexander.sverdlin@nokia.com, robh+dt@kernel.org, frowand.list@gmail.com
Cc: Sergey.Semin@t-platforms.ru, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

Memblock regions are used to find all available high memory
and to set it free into buddy allocator.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 arch/mips/mm/init.c | 54 ++++++++++++++---------------------
 1 file changed, 21 insertions(+), 33 deletions(-)

diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 6f186c7..98680fb 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -404,32 +404,6 @@ void maar_init(void)
 }
 
 #ifndef CONFIG_NEED_MULTIPLE_NODES
-int page_is_ram(unsigned long pagenr)
-{
-	int i;
-
-	for (i = 0; i < boot_mem_map.nr_map; i++) {
-		unsigned long addr, end;
-
-		switch (boot_mem_map.map[i].type) {
-		case BOOT_MEM_RAM:
-		case BOOT_MEM_INIT_RAM:
-			break;
-		default:
-			/* not usable memory */
-			continue;
-		}
-
-		addr = PFN_UP(boot_mem_map.map[i].addr);
-		end = PFN_DOWN(boot_mem_map.map[i].addr +
-			       boot_mem_map.map[i].size);
-
-		if (pagenr >= addr && pagenr < end)
-			return 1;
-	}
-
-	return 0;
-}
 
 void __init paging_init(void)
 {
@@ -458,18 +432,32 @@ static struct kcore_list kcore_kseg0;
 static inline void mem_init_free_highmem(void)
 {
 #ifdef CONFIG_HIGHMEM
-	unsigned long tmp;
+	struct memblock_region *reg;
+	unsigned long pfn;
 
 	if (cpu_has_dc_aliases)
 		return;
 
-	for (tmp = highstart_pfn; tmp < highend_pfn; tmp++) {
-		struct page *page = pfn_to_page(tmp);
+	/* Walk through all memory regions freeing highmem pages only */
+	for_each_memblock(memory, reg) {
+		unsigned long start = memblock_region_memory_base_pfn(reg);
+		unsigned long end = memblock_region_memory_end_pfn(reg);
+
+		/* Ignore complete lowmem entries */
+		if (end <= max_low_pfn)
+			continue;
 
-		if (!page_is_ram(tmp))
-			SetPageReserved(page);
-		else
-			free_highmem_page(page);
+		/* Truncate partial highmem entries */
+		if (start < max_low_pfn)
+			start = max_low_pfn;
+
+		/*
+		 * MIPS memblock allocator doesn't allocate regions from high
+		 * memory (see mips_lowmem_limit variable initialization), so
+		 * just set corresponding pages free
+		 */
+		for (pfn = start; pfn < end; pfn++)
+			free_highmem_page(pfn_to_page(pfn));
 	}
 #endif
 }
-- 
2.6.6
