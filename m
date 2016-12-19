From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 14/21] MIPS memblock: Alter IO resources initialization method
Date: Mon, 19 Dec 2016 05:07:39 +0300
Message-ID: <1482113266-13207-15-git-send-email-fancer.lancer@gmail.com>
References: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ralf@linux-mips.org, paul.burton@imgtec.com, rabinv@axis.com, matt.redfearn@imgtec.com, james.hogan@imgtec.com, alexander.sverdlin@nokia.com, robh+dt@kernel.org, frowand.list@gmail.com
Cc: Sergey.Semin@t-platforms.ru, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

Replace resource initialization method with one using memblocks.
It fully reflects all available system RAM within memory regions.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 arch/mips/kernel/setup.c | 40 +++++++++---------------------
 1 file changed, 12 insertions(+), 28 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index b18d38c..8bef2d3 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -868,46 +868,30 @@ static void __init arch_mem_init(char **cmdline_p)
 	plat_swiotlb_setup();
 }
 
+/*
+ * Declare memory within system resources
+ */
 static void __init resource_init(void)
 {
-	int i;
+	struct memblock_region *reg;
 
 	if (UNCAC_BASE != IO_BASE)
 		return;
 
+	/* Kernel code and data need to be registered within proper regions */
 	code_resource.start = __pa_symbol(&_text);
 	code_resource.end = __pa_symbol(&_etext) - 1;
 	data_resource.start = __pa_symbol(&_etext);
 	data_resource.end = __pa_symbol(&_edata) - 1;
 
-	for (i = 0; i < boot_mem_map.nr_map; i++) {
+	/* Register RAM resources */
+	for_each_memblock(memory, reg) {
 		struct resource *res;
-		unsigned long start, end;
-
-		start = boot_mem_map.map[i].addr;
-		end = boot_mem_map.map[i].addr + boot_mem_map.map[i].size - 1;
-		if (start >= HIGHMEM_START)
-			continue;
-		if (end >= HIGHMEM_START)
-			end = HIGHMEM_START - 1;
-
-		res = alloc_bootmem(sizeof(struct resource));
-
-		res->start = start;
-		res->end = end;
-		res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
-
-		switch (boot_mem_map.map[i].type) {
-		case BOOT_MEM_RAM:
-		case BOOT_MEM_INIT_RAM:
-		case BOOT_MEM_ROM_DATA:
-			res->name = "System RAM";
-			res->flags |= IORESOURCE_SYSRAM;
-			break;
-		case BOOT_MEM_RESERVED:
-		default:
-			res->name = "reserved";
-		}
+		res = memblock_virt_alloc(sizeof(*res), 0);
+		res->name  = "System RAM";
+		res->start = PFN_PHYS(memblock_region_memory_base_pfn(reg));
+		res->end = PFN_PHYS(memblock_region_memory_end_pfn(reg)) - 1;
+		res->flags = IORESOURCE_BUSY | IORESOURCE_SYSTEM_RAM;
 
 		request_resource(&iomem_resource, res);
 
-- 
2.6.6
