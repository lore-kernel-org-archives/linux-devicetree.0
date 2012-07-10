From: Chandrabhanu Mahapatra <cmahapatra@ti.com>
Subject: [PATCH 3/4] OMAP: Define TCA6424 max number of possible IRQs
Date: Tue, 10 Jul 2012 19:06:08 +0530
Message-ID: <f77496c24aa05320ad8cdc81759dd16d7bbb9d65.1341925681.git.cmahapatra@ti.com>
References: <cover.1341925681.git.cmahapatra@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1341925681.git.cmahapatra@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@secretlab.ca, linus.walleij@stericsson.com, rob.herring@calxeda.com
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, leed.aguilar@ti.com, Chandrabhanu Mahapatra <cmahapatra@ti.com>
List-Id: devicetree@vger.kernel.org

From: Leed Aguilar <leed.aguilar@ti.com>

TCA6424 being a 24 bit I2C and SMBus I/O expander has 24 available GPIO lines
that can be used as IRQs lines. So, the support for 24 more IRQ lines has been
added to the kernel.

Change-Id: I22e4fbb3a1e4c4b53ae698a9b22cdb0f4ad7f4e6
Signed-off-by: Leed Aguilar <leed.aguilar@ti.com>
Signed-off-by: Chandrabhanu Mahapatra <cmahapatra@ti.com>
---
 arch/arm/plat-omap/include/plat/irqs.h |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm/plat-omap/include/plat/irqs.h b/arch/arm/plat-omap/include/plat/irqs.h
index 37bbbbb..97c71ba 100644
--- a/arch/arm/plat-omap/include/plat/irqs.h
+++ b/arch/arm/plat-omap/include/plat/irqs.h
@@ -378,8 +378,17 @@
 #endif
 #define OMAP_FPGA_IRQ_END	(OMAP_FPGA_IRQ_BASE + OMAP_FPGA_NR_IRQS)
 
+/* TCA6424A I2C and SMBus I/O expander */
+#define OMAP_TCA6424_IRQ_BASE	(OMAP_FPGA_IRQ_END)
+#ifdef CONFIG_GPIO_PCA953X
+#define OMAP_TCA6424_NR_IRQS	24
+#else
+#define OMAP_TCA6424_NR_IRQS	0
+#endif
+#define OMAP_TCA6424_IRQ_END	(OMAP_TCA6424_IRQ_BASE + OMAP_TCA6424_NR_IRQS)
+
 /* External TWL4030 can handle interrupts on 2430 and 34xx boards */
-#define	TWL4030_IRQ_BASE	(OMAP_FPGA_IRQ_END)
+#define	TWL4030_IRQ_BASE	(OMAP_TCA6424_IRQ_END)
 #ifdef	CONFIG_TWL4030_CORE
 #define	TWL4030_BASE_NR_IRQS	8
 #define	TWL4030_PWR_NR_IRQS	8
-- 
1.7.10
