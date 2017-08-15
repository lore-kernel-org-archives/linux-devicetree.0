From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH 2/3] ARC: Decouple linux kernel memory address and link address
Date: Tue, 15 Aug 2017 21:13:54 +0300
Message-ID: <20170815181355.29937-3-Eugeniy.Paltsev@synopsys.com>
References: <20170815181355.29937-1-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170815181355.29937-1-Eugeniy.Paltsev@synopsys.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: linux-snps-arc@lists.infradead.org
Cc: devicetree@vger.kernel.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

We faced with problem when we tried to utilize 1G DRAM by linux on
HSDK.

We can't use our usual kernel memory address (0x80000000) like on
AXS103 because of DCCM memory bank located at exactly same
address (0x80000000)
But we can't simply move kernel memory address to another address (like
0x90000000) because IOC base address must be aligned to the
size of the aperture as specified in the IOC size register.

So we had to use 1G aligned address for kernel memory.

We can't use 0x00000000 or 0x40000000 addresses because addresses
lover then 0x80000000 are MMU-translated.
We can't use 0xB0000000 address because we can define a volatile
uncached region only from AUX_NON_VOLATILE_LIMIT to the
0xFFFFFFFF. (the end of region is hardcoded)

So, the decision is to link kernel to 0x90000000, but use
0x80000000-0xBFFFFFFF memory region and reallocate DCCM in our platform
code.
This patch only makes possible to set kernel memory address not equal to
kernel link address.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 arch/arc/Kconfig            | 5 +++++
 arch/arc/include/asm/page.h | 2 +-
 arch/arc/mm/cache.c         | 2 +-
 arch/arc/mm/init.c          | 6 +++---
 4 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index a545969..75e5276 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -430,6 +430,11 @@ config LINUX_LINK_BASE
 	  However some customers have peripherals mapped at this addr, so
 	  Linux needs to be scooted a bit.
 	  If you don't know what the above means, leave this setting alone.
+
+config KERNEL_RAM_BASE_ADDRESS
+	hex "Linux ram base address"
+	default LINUX_LINK_BASE
+	help
 	  This needs to match memory start address specified in Device Tree
 
 config HIGHMEM
diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
index 296c342..777f676 100644
--- a/arch/arc/include/asm/page.h
+++ b/arch/arc/include/asm/page.h
@@ -85,7 +85,7 @@ typedef pte_t * pgtable_t;
  */
 #define virt_to_pfn(kaddr)	(__pa(kaddr) >> PAGE_SHIFT)
 
-#define ARCH_PFN_OFFSET		virt_to_pfn(CONFIG_LINUX_LINK_BASE)
+#define ARCH_PFN_OFFSET		virt_to_pfn(CONFIG_KERNEL_RAM_BASE_ADDRESS)
 
 #ifdef CONFIG_FLATMEM
 #define pfn_valid(pfn)		(((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
index 383ff77..f303274 100644
--- a/arch/arc/mm/cache.c
+++ b/arch/arc/mm/cache.c
@@ -1113,7 +1113,7 @@ noinline void __init arc_ioc_setup(void)
 	 * For now we assume IOC aperture to cover all the memory used by the
 	 * kernel.
 	 */
-	ap_base = CONFIG_LINUX_LINK_BASE;
+	ap_base = CONFIG_KERNEL_RAM_BASE_ADDRESS;
 
 	if (ap_base % ap_size != 0)
 		panic("IOC Aperture start must be aligned to the size of the aperture");
diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index 8c9415e..f84cba2 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -26,7 +26,7 @@ pgd_t swapper_pg_dir[PTRS_PER_PGD] __aligned(PAGE_SIZE);
 char empty_zero_page[PAGE_SIZE] __aligned(PAGE_SIZE);
 EXPORT_SYMBOL(empty_zero_page);
 
-static const unsigned long low_mem_start = CONFIG_LINUX_LINK_BASE;
+static const unsigned long low_mem_start = CONFIG_KERNEL_RAM_BASE_ADDRESS;
 static unsigned long low_mem_sz;
 
 #ifdef CONFIG_HIGHMEM
@@ -63,7 +63,7 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
 
 	if (!low_mem_sz) {
 		if (base != low_mem_start)
-			panic("CONFIG_LINUX_LINK_BASE != DT memory { }");
+			panic("CONFIG_KERNEL_RAM_BASE_ADDRESS != DT memory { }");
 
 		low_mem_sz = size;
 		in_use = 1;
@@ -161,7 +161,7 @@ void __init setup_arch_memory(void)
 	 * We can't use the helper free_area_init(zones[]) because it uses
 	 * PAGE_OFFSET to compute the @min_low_pfn which would be wrong
 	 * when our kernel doesn't start at PAGE_OFFSET, i.e.
-	 * PAGE_OFFSET != CONFIG_LINUX_LINK_BASE
+	 * PAGE_OFFSET != CONFIG_KERNEL_RAM_BASE_ADDRESS
 	 */
 	free_area_init_node(0,			/* node-id */
 			    zones_size,		/* num pages per zone */
-- 
2.9.3
