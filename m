From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 15/21] MIPS memblock: Alter weakened MAAR initialization method
Date: Mon, 19 Dec 2016 05:07:40 +0300
Message-ID: <1482113266-13207-16-git-send-email-fancer.lancer@gmail.com>
References: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ralf@linux-mips.org, paul.burton@imgtec.com, rabinv@axis.com, matt.redfearn@imgtec.com, james.hogan@imgtec.com, alexander.sverdlin@nokia.com, robh+dt@kernel.org, frowand.list@gmail.com
Cc: Sergey.Semin@t-platforms.ru, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

MAAR initialization method can be slightly simplified, since
memblock allocator is fully available.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 arch/mips/mm/init.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index a4f49c7..49db909 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -22,6 +22,7 @@
 #include <linux/ptrace.h>
 #include <linux/mman.h>
 #include <linux/mm.h>
+#include <linux/memblock.h>
 #include <linux/bootmem.h>
 #include <linux/highmem.h>
 #include <linux/swap.h>
@@ -245,28 +246,26 @@ void __init fixrange_init(unsigned long start, unsigned long end,
 #endif
 }
 
-unsigned __weak platform_maar_init(unsigned num_pairs)
+/*
+ * Platform-specific method of MAAR registers initialization
+ */
+unsigned int __weak platform_maar_init(unsigned int num_pairs)
 {
 	struct maar_config cfg[BOOT_MEM_MAP_MAX];
-	unsigned i, num_configured, num_cfg = 0;
+	struct memblock_region *reg;
+	unsigned int num_configured, num_cfg = 0;
 
-	for (i = 0; i < boot_mem_map.nr_map; i++) {
-		switch (boot_mem_map.map[i].type) {
-		case BOOT_MEM_RAM:
-		case BOOT_MEM_INIT_RAM:
+	/* Collect RAM regions within MAAR config array */
+	for_each_memblock(memory, reg) {
+		if (num_cfg >= BOOT_MEM_MAP_MAX) {
+			pr_info("Too many memory regions to init MAARs");
 			break;
-		default:
-			continue;
 		}
-
 		/* Round lower up */
-		cfg[num_cfg].lower = boot_mem_map.map[i].addr;
-		cfg[num_cfg].lower = (cfg[num_cfg].lower + 0xffff) & ~0xffff;
+		cfg[num_cfg].lower = (reg->base + 0xffff) & ~0xffff;
 
 		/* Round upper down */
-		cfg[num_cfg].upper = boot_mem_map.map[i].addr +
-					boot_mem_map.map[i].size;
-		cfg[num_cfg].upper = (cfg[num_cfg].upper & ~0xffff) - 1;
+		cfg[num_cfg].upper = ((reg->base + reg->size) & ~0xffff) - 1;
 
 		cfg[num_cfg].attrs = MIPS_MAAR_S;
 		num_cfg++;
-- 
2.6.6
