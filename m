From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 11/21] MIPS memblock: Add memblock sanity check method
Date: Mon, 19 Dec 2016 05:07:36 +0300
Message-ID: <1482113266-13207-12-git-send-email-fancer.lancer@gmail.com>
References: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ralf@linux-mips.org, paul.burton@imgtec.com, rabinv@axis.com, matt.redfearn@imgtec.com, james.hogan@imgtec.com, alexander.sverdlin@nokia.com, robh+dt@kernel.org, frowand.list@gmail.com
Cc: Sergey.Semin@t-platforms.ru, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

Perform memory sanity check right after basic memory is added.
It makes sure there is low memory available and there is no high
memory if one isn't supported. Additionally low memory limit needs
to be calculated so memblock would have a proper upper boundary for
memory allocations.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 arch/mips/kernel/setup.c | 83 ++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 6562f55..d2f410d 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -472,6 +472,86 @@ static void __init mips_reserve_initrd_mem(void) { }
 #endif
 
 /*
+ * Check initialized memory.
+ */
+static void __init sanity_check_meminfo(void)
+{
+	phys_addr_t physmem_start = PFN_PHYS(ARCH_PFN_OFFSET);
+	phys_addr_t size_limit = 0;
+	struct memblock_region *reg;
+	bool highmem = false;
+	bool should_use_highmem = false;
+
+	/*
+	 * Walk over all memory ranges discarding highmem if it's disabled and
+	 * calculating the memblock allocator limit
+	 */
+	for_each_memblock(memory, reg) {
+		phys_addr_t block_start = reg->base;
+		phys_addr_t block_end = reg->base + reg->size;
+		phys_addr_t block_size = reg->size;
+
+		if (block_start >= HIGHMEM_START) {
+			highmem = true;
+			size_limit = block_size;
+		} else {
+			size_limit = HIGHMEM_START - block_start;
+		}
+
+		/* Discard highmem physical memory if it isn't supported */
+		if (!IS_BUILTIN(CONFIG_HIGHMEM)) {
+			/* Discard the whole highmem memory block */
+			if (highmem) {
+				pr_notice("Ignoring RAM at %pa-%pa (!CONFIG_HIGHMEM)\n",
+					&block_start, &block_end);
+				memblock_remove(block_start, block_size);
+				should_use_highmem = true;
+				continue;
+			}
+			/* Truncate memory block */
+			if (block_size > size_limit) {
+				phys_addr_t overlap_size = block_size - size_limit;
+				phys_addr_t highmem_start = HIGHMEM_START;
+
+				pr_notice("Truncate highmem %pa-%pa to -%pa\n",
+					&block_start, &block_end, &highmem_start);
+				memblock_remove(highmem_start, overlap_size);
+				block_end = highmem_start;
+				should_use_highmem = true;
+			}
+		}
+		/* Truncate region if it starts below ARCH_PFN_OFFSET */
+		if (block_start < physmem_start) {
+			phys_addr_t overlap_size = physmem_start - block_start;
+
+			pr_notice("Truncate lowmem %pa-%pa to %pa-\n",
+				&block_start, &block_end, &physmem_start);
+			memblock_remove(block_start, overlap_size);
+		}
+
+		/* Calculate actual lowmem limit for memblock allocator */
+		if (!highmem) {
+			if (block_end > mips_lowmem_limit) {
+				if (block_size > size_limit)
+					mips_lowmem_limit = HIGHMEM_START;
+				else
+					mips_lowmem_limit = block_end;
+			}
+		}
+	}
+
+	/* Panic if no lowmem has been determined */
+	if (!mips_lowmem_limit)
+		panic("Oops, where is low memory? 0_o\n");
+
+	if (should_use_highmem)
+		pr_notice("Consider using HIGHMEM enabled kernel\n");
+
+	/* Set memblock allocator limit */
+	memblock_set_current_limit(mips_lowmem_limit);
+}
+
+/*
  * Reserve kernel code and data within memblock allocator
  */
 static void __init mips_reserve_kernel_mem(void)
@@ -712,6 +792,9 @@ static void __init arch_mem_init(char **cmdline_p)
 	/* Parse passed parameters */
 	mips_parse_param(cmdline_p);
 
+	/* Sanity check the specified memory */
+	sanity_check_meminfo();
+
 	pr_info("Determined physical RAM map:\n");
 	print_memory_map();
 
-- 
2.6.6
