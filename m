From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: [PATCH 7/7] ARM: dma: implement set_arch_dma_coherent_ops()
Date: Thu, 6 Mar 2014 17:19:58 +0800
Message-ID: <1394097598-17622-8-git-send-email-santosh.shilimkar@ti.com>
References: <1394097598-17622-1-git-send-email-santosh.shilimkar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1394097598-17622-1-git-send-email-santosh.shilimkar@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: devicetree@vger.kernel.org

Implement the set_arch_dma_coherent_ops() for ARM architecture.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Russell King <linux@arm.linux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Olof Johansson <olof@lixom.net>
Cc: Grant Likely <grant.likely@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
---
 arch/arm/include/asm/dma-mapping.h |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/include/asm/dma-mapping.h b/arch/arm/include/asm/dma-mapping.h
index 8c12149..765c9e7 100644
--- a/arch/arm/include/asm/dma-mapping.h
+++ b/arch/arm/include/asm/dma-mapping.h
@@ -114,6 +114,13 @@ static inline unsigned long dma_max_pfn(struct device *dev)
 }
 #define dma_max_pfn(dev) dma_max_pfn(dev)
 
+static inline int set_arch_dma_coherent_ops(struct device *dev)
+{
+	set_dma_ops(dev, &arm_coherent_dma_ops);
+	return 0;
+}
+#define set_arch_dma_coherent_ops(dev)	set_arch_dma_coherent_ops(dev)
+
 static inline dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
 {
 	unsigned int offset = paddr & ~PAGE_MASK;
-- 
1.7.9.5
