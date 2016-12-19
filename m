From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 13/21] MIPS memblock: Add memblock allocator initialization
Date: Mon, 19 Dec 2016 05:07:38 +0300
Message-ID: <1482113266-13207-14-git-send-email-fancer.lancer@gmail.com>
References: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ralf@linux-mips.org, paul.burton@imgtec.com, rabinv@axis.com, matt.redfearn@imgtec.com, james.hogan@imgtec.com, alexander.sverdlin@nokia.com, robh+dt@kernel.org, frowand.list@gmail.com
Cc: Sergey.Semin@t-platforms.ru, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

Initialization is done by subsequent performing of the following
steps:
1) Call platform-specific call adding memory regions
2) Parse kernel parameters looking (they may change memory layout)
3) Check whether declared memory is in sane
4) Reserve memory for kernel, initrd, crashdump, fdt, devices and CMA
5) Find PFN limits of the memory regions
6) Allow memblocks resize
7) Perform basic paging subsystem initialization: nodes, zones, page
tables (if necessary), kernel mapping and so on.

Sparse sections initialization is moved into mem_init() method

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 arch/mips/kernel/setup.c | 93 +++++++++++++++++++++++-------
 1 file changed, 71 insertions(+), 22 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 409d23d..b18d38c 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -9,6 +9,7 @@
  * Copyright (C) 1996 Stoned Elipot
  * Copyright (C) 1999 Silicon Graphics, Inc.
  * Copyright (C) 2000, 2001, 2002, 2007	 Maciej W. Rozycki
+ * Copyright (C) 2016 T-platforms
  */
 #include <linux/init.h>
 #include <linux/ioport.h>
@@ -27,6 +28,7 @@
 #include <linux/device.h>
 #include <linux/dma-contiguous.h>
 #include <linux/decompress/generic.h>
+#include <linux/of_fdt.h>
 
 #include <asm/addrspace.h>
 #include <asm/bootinfo.h>
@@ -733,20 +735,34 @@ static void __init find_pfn_limits(void)
 }
 
 /*
- * Initialize the bootmem allocator. It also setup initrd related data
- * if needed.
+ * Initialize the memblock allocator
  */
 #if defined(CONFIG_SGI_IP27) || (defined(CONFIG_CPU_LOONGSON3) && defined(CONFIG_NUMA))
 
-static void __init bootmem_init(void)
+static void __init mips_bootmem_init(void)
 {
+	/* Reserve kernel code/data memory */
+	mips_reserve_kernel_mem();
+
 	/* Check and reserve memory occupied by initrd */
 	mips_reserve_initrd_mem();
+
+	/* Reserve memory for elfcorehdr */
+	mips_reserve_elfcorehdr();
+
+	/* Parse crashkernel parameter */
+	mips_parse_crashkernel();
+
+	/* Reserve memory for DMA contiguous allocator */
+	dma_contiguous_reserve(mips_lowmem_limit);
+
+	/* Allow memblock resize from now */
+	memblock_allow_resize();
 }
 
 #else  /* !CONFIG_SGI_IP27 */
 
-static void __init bootmem_init(void)
+static void __init mips_bootmem_init(void)
 {
 	/* Reserve kernel code/data memory */
 	mips_reserve_kernel_mem();
@@ -760,8 +776,23 @@ static void __init bootmem_init(void)
 	/* Parse crashkernel parameter */
 	mips_parse_crashkernel();
 
+	/*
+	 * Platform code usually copies fdt, but still lets reserve its memory
+	 * in case if it doesn't
+	 */
+	early_init_fdt_reserve_self();
+
+	/* Scan reserved-memory nodes of fdt */
+	early_init_fdt_scan_reserved_mem();
+
+	/* Reserve memory for DMA contiguous allocator */
+	dma_contiguous_reserve(mips_lowmem_limit);
+
 	/* Find memory PFN limits */
 	find_pfn_limits();
+
+	/* Allow memblock resize from now */
+	memblock_allow_resize();
 }
 
 #endif	/* CONFIG_SGI_IP27 */
@@ -770,30 +801,51 @@ static void __init bootmem_init(void)
  * arch_mem_init - initialize memory management subsystem
  *
  *  o plat_mem_setup() detects the memory configuration and will record detected
- *    memory areas using add_memory_region.
+ *    memory areas using add_memory_region, which in addition preinitializes
+ *    memblock ranges.
  *
  * At this stage the memory configuration of the system is known to the
  * kernel but generic memory management system is still entirely uninitialized.
  *
- *  o bootmem_init()
- *  o sparse_init()
- *  o paging_init()
- *  o dma_contiguous_reserve()
+ *  o mips_parse_param() parses parameters passed to the kernel in accordance
+ *    with CMDLINE configs.
+ *  o sanity_check_meminfo() performs memory ranges sanity checks, for
+ *    example, drop high mem regions if it's not supported, set memblock limit
+ *    of low memory allocations
+ *  o mips_bootmem_init() performs memblock further initializations,
+ *    particularly reserve crucial regions, including kernel segments, initrd,
+ *    elfcorehdrm, crashkernel, fdt, DMA contiguous allocator, set PFN-related
+ *    global variables.
+ *  o print_memory_map() prints initialized and verified memory map
+ *  o device_tree_init() calls platform-specific method to perform some
+ *    device tree related operations
+ *  o plat_swiotlb_setup() - platform-specific SWIOTLB setup method
+ *
+ * Basic setup of page allocator is done in setup_arch():
+ *  o paging_init() performs initialization of paging subsystem, in particular
+ *    setup page tables (PGD, PMD, etc), kernel mapping, sparse memory segments
+ *    if supported. It performs memory test if one is enabled. Finally it
+ *    calculates memory zone limits and calls free_area_init_node()
+ *    initializing pages memory maps, nodes, nodes free areas - basis of the
+ *    buddy allocator.
  *
  * At this stage the bootmem allocator is ready to use.
  *
  * NOTE: historically plat_mem_setup did the entire platform initialization.
- *	 This was rather impractical because it meant plat_mem_setup had to
+ *       This was rather impractical because it meant plat_mem_setup had to
  * get away without any kind of memory allocator.  To keep old code from
  * breaking plat_setup was just renamed to plat_mem_setup and a second platform
  * initialization hook for anything else was introduced.
+ * Additionally boot_mem_map structure used to keep base memory layout so
+ * then ancient bootmem allocator would be properly initialized. Since memblock
+ * allocator is used for early memory management now, the boot_mem_map is
+ * conserved just for compatibility.
+ */
+/*
+ * MIPS early memory manager setup
  */
-
 static void __init arch_mem_init(char **cmdline_p)
 {
-	struct memblock_region *reg;
-	extern void plat_mem_setup(void);
-
 	/* call board setup routine */
 	plat_mem_setup();
 
@@ -803,20 +855,17 @@ static void __init arch_mem_init(char **cmdline_p)
 	/* Sanity check the specified memory */
 	sanity_check_meminfo();
 
-	bootmem_init();
+	/* Initialize memblock allocator */
+	mips_bootmem_init();
 
 	/* Print memory map initialized by arch-specific code and params */
 	print_memory_map();
 
+	/* Perform platform-specific device tree scanning */
 	device_tree_init();
-	sparse_init();
-	plat_swiotlb_setup();
 
-	dma_contiguous_reserve(PFN_PHYS(max_low_pfn));
-	/* Tell bootmem about cma reserved memblock section */
-	for_each_memblock(reserved, reg)
-		if (reg->size != 0)
-			reserve_bootmem(reg->base, reg->size, BOOTMEM_DEFAULT);
+	/* Perform platform-specific SWIOTLB setup */
+	plat_swiotlb_setup();
 }
 
 static void __init resource_init(void)
-- 
2.6.6
