From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: [PATCH v2 7/7] ARM: mm: use phys_addr_t in __dma_page_[cpu_to_dev/dev_to_cpu]
Date: Sat, 19 Apr 2014 10:32:52 -0400
Message-ID: <1397917972-6293-8-git-send-email-santosh.shilimkar@ti.com>
References: <1397917972-6293-1-git-send-email-santosh.shilimkar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1397917972-6293-1-git-send-email-santosh.shilimkar@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@ti.com>
List-Id: devicetree@vger.kernel.org

On a 32 bit ARM architecture with LPAE extension physical addresses
cannot fit into unsigned long variable.

So fix it by using phys_addr_t instead of unsigned long.

Signed-off-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
---
 arch/arm/mm/dma-mapping.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index f62aa06..5260f43 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -885,7 +885,7 @@ static void dma_cache_maint_page(struct page *page, unsigned long offset,
 static void __dma_page_cpu_to_dev(struct page *page, unsigned long off,
 	size_t size, enum dma_data_direction dir)
 {
-	unsigned long paddr;
+	phys_addr_t paddr;
 
 	dma_cache_maint_page(page, off, size, dir, dmac_map_area);
 
@@ -901,7 +901,7 @@ static void __dma_page_cpu_to_dev(struct page *page, unsigned long off,
 static void __dma_page_dev_to_cpu(struct page *page, unsigned long off,
 	size_t size, enum dma_data_direction dir)
 {
-	unsigned long paddr = page_to_phys(page) + off;
+	phys_addr_t paddr = page_to_phys(page) + off;
 
 	/* FIXME: non-speculating: not required */
 	/* don't bother invalidating if DMA to device */
-- 
1.7.9.5
