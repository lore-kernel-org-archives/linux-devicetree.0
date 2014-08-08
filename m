From: <suravee.suthikulpanit@amd.com>
Subject: [PATCH 1/4] irqchip: gic-v2m: Remove irq-gic-v2m.h file
Date: Fri, 8 Aug 2014 18:17:13 -0500
Message-ID: <1407539836-9768-2-git-send-email-suravee.suthikulpanit@amd.com>
References: <1407539836-9768-1-git-send-email-suravee.suthikulpanit@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1407539836-9768-1-git-send-email-suravee.suthikulpanit@amd.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: marc.zyngier@arm.com, mark.rutland@arm.com, jason@lakedaemon.net
Cc: Mark Rutland <Mark.Rutland@arm.com>, devicetree@vger.kernel.org, pawel.moll@arm.com, linux-doc@vger.kernel.org, Marc Zyngier <Marc.Zyngier@arm.com>, Catalin.Marinas@arm.com, Harish.Kasiviswanathan@amd.com, linux-kernel@vger.kernel.org, Will.Deacon@arm.com, Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>, linux-pci@vger.kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>

Remove irq-gic-v2m.h file which is no longer used

Signed-off-by: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
Cc: Mark Rutland <Mark.Rutland@arm.com>
Cc: Marc Zyngier <Marc.Zyngier@arm.com>
Cc: Jason Cooper <jason@lakedaemon.net>
---
 drivers/irqchip/irq-gic-v2m.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v2m.h b/drivers/irqchip/irq-gic-v2m.h
index 2d93a87..e69de29 100644
--- a/drivers/irqchip/irq-gic-v2m.h
+++ b/drivers/irqchip/irq-gic-v2m.h
@@ -1,13 +0,0 @@
-#ifndef _IRQ_GIC_V2M_H_
-#define _IRQ_GIC_V2M_H_
-
-struct v2m_data {
-	spinlock_t msi_cnt_lock;
-	struct resource res;      /* GICv2m resource */
-	void __iomem *base;       /* GICv2m virt address */
-	unsigned int spi_start;   /* The SPI number that MSIs start */
-	unsigned int nr_spis;     /* The number of SPIs for MSIs */
-	unsigned long *bm;        /* MSI vector bitmap */
-};
-
-#endif /*_IRQ_GIC_V2M_H_*/
-- 
1.9.0
