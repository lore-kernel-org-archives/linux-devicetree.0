From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: [PATCH v2 1/7] ARM: mm: Introduce archdata.dma_pfn_offset
Date: Thu, 27 Feb 2014 16:17:46 -0500
Message-ID: <1393535872-20915-2-git-send-email-santosh.shilimkar@ti.com>
References: <1393535872-20915-1-git-send-email-santosh.shilimkar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1393535872-20915-1-git-send-email-santosh.shilimkar@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arnd@arndb.de
Cc: devicetree@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>, Russell King <linux@arm.linux.org.uk>, linus.walleij@linaro.org, magnus.damm@gmail.com, Olof Johansson <olof@lixom.net>, robh+dt@kernel.org, Santosh Shilimkar <santosh.shilimkar@ti.com>, grant.likely@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Grygorii Strashko <grygorii.strashko@ti.com>

In most of cases DMA addresses can be performed using offset value of
 Bus address space relatively to physical address space as following:

PFN->DMA:
 __pfn_to_phys(pfn + [-]dma_pfn_offset)

DMA->PFN:
 __phys_to_pfn(dma_addr) + [-]dma_pfn_offset

This patch introduces new field dma_pfn_offset in ARM dev_archdata
structure which has to be filed per-device at arch init time
(simplest way is to use Platform bus notifier to handle
BUS_NOTIFY_ADD_DEVICE event) and updates DMA address translation
routines in order to accommodate bus offset value by default.

Cc: Russell King <linux@arm.linux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Olof Johansson <olof@lixom.net>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
---
 arch/arm/include/asm/device.h      |    1 +
 arch/arm/include/asm/dma-mapping.h |   17 +++++++++++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm/include/asm/device.h b/arch/arm/include/asm/device.h
index dc662fc..861961c 100644
--- a/arch/arm/include/asm/device.h
+++ b/arch/arm/include/asm/device.h
@@ -8,6 +8,7 @@
 
 struct dev_archdata {
 	struct dma_map_ops	*dma_ops;
+	unsigned long		dma_pfn_offset;
 #ifdef CONFIG_DMABOUNCE
 	struct dmabounce_device_info *dmabounce;
 #endif
diff --git a/arch/arm/include/asm/dma-mapping.h b/arch/arm/include/asm/dma-mapping.h
index e701a4d..247ed72 100644
--- a/arch/arm/include/asm/dma-mapping.h
+++ b/arch/arm/include/asm/dma-mapping.h
@@ -58,22 +58,31 @@ static inline int dma_set_mask(struct device *dev, u64 mask)
 #ifndef __arch_pfn_to_dma
 static inline dma_addr_t pfn_to_dma(struct device *dev, unsigned long pfn)
 {
-	return (dma_addr_t)__pfn_to_bus(pfn);
+	if (!dev)
+		return DMA_ERROR_CODE;
+	return (dma_addr_t)__pfn_to_bus(pfn - dev->archdata.dma_pfn_offset);
 }
 
 static inline unsigned long dma_to_pfn(struct device *dev, dma_addr_t addr)
 {
-	return __bus_to_pfn(addr);
+	if (!dev)
+		return 0;
+	return __bus_to_pfn(addr) + dev->archdata.dma_pfn_offset;
 }
 
 static inline void *dma_to_virt(struct device *dev, dma_addr_t addr)
 {
-	return (void *)__bus_to_virt((unsigned long)addr);
+	if (!dev)
+		return NULL;
+	return (void *)__bus_to_virt(__pfn_to_bus(dma_to_pfn(dev, addr)));
 }
 
 static inline dma_addr_t virt_to_dma(struct device *dev, void *addr)
 {
-	return (dma_addr_t)__virt_to_bus((unsigned long)(addr));
+	if (!dev)
+		return DMA_ERROR_CODE;
+	return pfn_to_dma(dev,
+			   __bus_to_pfn(__virt_to_bus((unsigned long)(addr))));
 }
 
 #else
-- 
1.7.9.5
