From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH 1/8] arm64: mm: use arm64_dma_phys_limit instead of calling max_zone_dma_phys()
Date: Wed, 31 Jul 2019 17:47:44 +0200
Message-ID: <20190731154752.16557-2-nsaenzjulienne@suse.de>
References: <20190731154752.16557-1-nsaenzjulienne@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190731154752.16557-1-nsaenzjulienne@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: catalin.marinas@arm.com, hch@lst.de, wahrenst@gmx.net, marc.zyngier@arm.com, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, iommu@lists.linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: phill@raspberryi.org, f.fainelli@gmail.com, will@kernel.org, robh+dt@kernel.org, eric@anholt.net, mbrugger@suse.com, nsaenzjulienne@suse.de, akpm@linux-foundation.org, frowand.list@gmail.com, m.szyprowski@samsung.com, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

By the time we call zones_sizes_init() arm64_dma_phys_limit already
contains the result of max_zone_dma_phys(). We use the variable instead
of calling the function directly to save some precious cpu time.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---

 arch/arm64/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index f3c795278def..6112d6c90fa8 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -181,7 +181,7 @@ static void __init zone_sizes_init(unsigned long min, unsigned long max)
 	unsigned long max_zone_pfns[MAX_NR_ZONES]  = {0};
 
 #ifdef CONFIG_ZONE_DMA32
-	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(max_zone_dma_phys());
+	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(arm64_dma_phys_limit);
 #endif
 	max_zone_pfns[ZONE_NORMAL] = max;
 
-- 
2.22.0
