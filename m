From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 12/21] MIPS memblock: Add memblock print outs in debug
Date: Mon, 19 Dec 2016 05:07:37 +0300
Message-ID: <1482113266-13207-13-git-send-email-fancer.lancer@gmail.com>
References: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ralf@linux-mips.org, paul.burton@imgtec.com, rabinv@axis.com, matt.redfearn@imgtec.com, james.hogan@imgtec.com, alexander.sverdlin@nokia.com, robh+dt@kernel.org, frowand.list@gmail.com
Cc: Sergey.Semin@t-platforms.ru, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

When debugging it is useful to have a list of all memory regions
added and reserved in the system. Ones are printed right from
memblock if memblock_debug is enabled.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 arch/mips/kernel/setup.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index d2f410d..409d23d 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -200,11 +200,16 @@ void __init detect_memory_region(phys_addr_t start, phys_addr_t sz_min, phys_add
 	add_memory_region(start, size, BOOT_MEM_RAM);
 }
 
+/*
+ * Print declared memory layout
+ */
 static void __init print_memory_map(void)
 {
 	int i;
 	const int field = 2 * sizeof(unsigned long);
 
+	/* Print the added memory map  */
+	pr_info("Determined physical RAM map:\n");
 	for (i = 0; i < boot_mem_map.nr_map; i++) {
 		printk(KERN_INFO " memory: %0*Lx @ %0*Lx ",
 		       field, (unsigned long long) boot_mem_map.map[i].size,
@@ -228,6 +233,9 @@ static void __init print_memory_map(void)
 			break;
 		}
 	}
+
+	/* Print memblocks if memblock_debug is set */
+	memblock_dump_all();
 }
 
 /*
@@ -795,11 +803,11 @@ static void __init arch_mem_init(char **cmdline_p)
 	/* Sanity check the specified memory */
 	sanity_check_meminfo();
 
-	pr_info("Determined physical RAM map:\n");
-	print_memory_map();
-
 	bootmem_init();
 
+	/* Print memory map initialized by arch-specific code and params */
+	print_memory_map();
+
 	device_tree_init();
 	sparse_init();
 	plat_swiotlb_setup();
-- 
2.6.6
