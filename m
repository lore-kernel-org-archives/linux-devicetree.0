From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH V4 13/16] MIPS: BMIPS: Flush the readahead cache after DMA
Date: Thu, 27 Nov 2014 20:32:19 -0800
Message-ID: <1417149142-3756-14-git-send-email-cernekee@gmail.com>
References: <1417149142-3756-1-git-send-email-cernekee@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1417149142-3756-1-git-send-email-cernekee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ralf@linux-mips.org
Cc: f.fainelli@gmail.com, jfraser@broadcom.com, dtor@chromium.org, tglx@linutronix.de, jason@lakedaemon.net, jogo@openwrt.org, arnd@arndb.de, computersforpeace@gmail.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

BMIPS 3300/435x/438x CPUs have a readahead cache that is separate from
the L1/L2.  During a DMA operation, accesses adjacent to a DMA buffer
may cause parts of the DMA buffer to be prefetched into the RAC.  To
avoid possible coherency problems, flush the RAC upon DMA completion.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 arch/mips/mm/dma-default.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/mips/mm/dma-default.c b/arch/mips/mm/dma-default.c
index af5f046e627e..ee6d12cb7588 100644
--- a/arch/mips/mm/dma-default.c
+++ b/arch/mips/mm/dma-default.c
@@ -18,6 +18,7 @@
 #include <linux/highmem.h>
 #include <linux/dma-contiguous.h>
 
+#include <asm/bmips.h>
 #include <asm/cache.h>
 #include <asm/cpu-type.h>
 #include <asm/io.h>
@@ -69,6 +70,18 @@ static inline struct page *dma_addr_to_page(struct device *dev,
  */
 static inline int cpu_needs_post_dma_flush(struct device *dev)
 {
+	if (boot_cpu_type() == CPU_BMIPS3300 ||
+	    boot_cpu_type() == CPU_BMIPS4350 ||
+	    boot_cpu_type() == CPU_BMIPS4380) {
+		void __iomem *cbr = BMIPS_GET_CBR();
+
+		/* Flush stale data out of the readahead cache */
+		__raw_writel(0x100, cbr + BMIPS_RAC_CONFIG);
+		__raw_readl(cbr + BMIPS_RAC_CONFIG);
+
+		return 0;
+	}
+
 	return !plat_device_is_coherent(dev) &&
 	       (boot_cpu_type() == CPU_R10000 ||
 		boot_cpu_type() == CPU_R12000 ||
-- 
2.1.0
