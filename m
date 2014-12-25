From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH V6 15/25] MIPS: BMIPS: Flush the readahead cache after DMA
Date: Thu, 25 Dec 2014 09:49:10 -0800
Message-ID: <1419529760-9520-16-git-send-email-cernekee@gmail.com>
References: <1419529760-9520-1-git-send-email-cernekee@gmail.com>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1419529760-9520-1-git-send-email-cernekee@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org
Cc: f.fainelli@gmail.com, jaedon.shin@gmail.com, abrestic@chromium.org, tglx@linutronix.de, jason@lakedaemon.net, jogo@openwrt.org, arnd@arndb.de, computersforpeace@gmail.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

BMIPS 3300/435x/438x CPUs have a readahead cache that is separate from
the L1/L2.  During a DMA operation, accesses adjacent to a DMA buffer
may cause parts of the DMA buffer to be prefetched into the RAC.  To
avoid possible coherency problems, flush the RAC upon DMA completion.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
Signed-off-by: Jaedon Shin <jaedon.shin@gmail.com>
---
 arch/mips/mm/dma-default.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/mips/mm/dma-default.c b/arch/mips/mm/dma-default.c
index af5f046..38ee47a 100644
--- a/arch/mips/mm/dma-default.c
+++ b/arch/mips/mm/dma-default.c
@@ -18,6 +18,7 @@
 #include <linux/highmem.h>
 #include <linux/dma-contiguous.h>
 
+#include <asm/bmips.h>
 #include <asm/cache.h>
 #include <asm/cpu-type.h>
 #include <asm/io.h>
@@ -69,6 +70,20 @@ static inline struct page *dma_addr_to_page(struct device *dev,
  */
 static inline int cpu_needs_post_dma_flush(struct device *dev)
 {
+	if (boot_cpu_type() == CPU_BMIPS3300 ||
+	    boot_cpu_type() == CPU_BMIPS4350 ||
+	    boot_cpu_type() == CPU_BMIPS4380) {
+		void __iomem *cbr = BMIPS_GET_CBR();
+		u32 cfg;
+
+		/* Flush stale data out of the readahead cache */
+		cfg = __raw_readl(cbr + BMIPS_RAC_CONFIG);
+		__raw_writel(cfg | 0x100, cbr + BMIPS_RAC_CONFIG);
+		__raw_readl(cbr + BMIPS_RAC_CONFIG);
+
+		return 0;
+	}
+
 	return !plat_device_is_coherent(dev) &&
 	       (boot_cpu_type() == CPU_R10000 ||
 		boot_cpu_type() == CPU_R12000 ||
-- 
2.1.1
