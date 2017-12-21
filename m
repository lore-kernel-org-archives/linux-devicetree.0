From: <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 1/2] PCI: mediatek: Clear IRQ status after IRQ dispatched to avoid reentry
Date: Thu, 21 Dec 2017 19:38:44 +0800
Message-ID: <1513856325-28813-2-git-send-email-honghui.zhang@mediatek.com>
References: <1513856325-28813-1-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513856325-28813-1-git-send-email-honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org
Cc: honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, hongkun.cao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, xinping.qian-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Honghui Zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

There maybe a same IRQ reentry scenario after IRQ received in current
IRQ handle flow:
	EP device		PCIe host driver	EP driver
1. issue an IRQ
			2. received IRQ
			3. clear IRQ status
			4. dispatch IRQ
						5. clear IRQ source
The IRQ status was not successfully cleared at step 2 since the IRQ
source was not cleared yet. So the PCIe host driver may receive the
same IRQ after step 5. Then there's an IRQ reentry occurred.
Even worse, if the reentry IRQ was not an IRQ that EP driver expected,
it may not handle the IRQ. Then we may run into the infinite loop from
step 2 to step 4.
Clear the IRQ status after IRQ have been dispatched to avoid the IRQ
reentry.
This patch also fix another INTx IRQ issue by initialize the iterate
before the loop. If an INTx IRQ re-occurred while we are dispatching
the INTx IRQ, then iterate may start from PCI_NUM_INTX + INTX_SHIFT
instead of INTX_SHIFT for the second time entering the
for_each_set_bit_from() loop.

Signed-off-by: Honghui Zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Acked-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/pci/host/pcie-mediatek.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/host/pcie-mediatek.c b/drivers/pci/host/pcie-mediatek.c
index db93efd..fc29a9a 100644
--- a/drivers/pci/host/pcie-mediatek.c
+++ b/drivers/pci/host/pcie-mediatek.c
@@ -601,15 +601,16 @@ static irqreturn_t mtk_pcie_intr_handler(int irq, void *data)
 	struct mtk_pcie_port *port = (struct mtk_pcie_port *)data;
 	unsigned long status;
 	u32 virq;
-	u32 bit = INTX_SHIFT;
+	u32 bit;
 
 	while ((status = readl(port->base + PCIE_INT_STATUS)) & INTX_MASK) {
+		bit = INTX_SHIFT;
 		for_each_set_bit_from(bit, &status, PCI_NUM_INTX + INTX_SHIFT) {
-			/* Clear the INTx */
-			writel(1 << bit, port->base + PCIE_INT_STATUS);
 			virq = irq_find_mapping(port->irq_domain,
 						bit - INTX_SHIFT);
 			generic_handle_irq(virq);
+			/* Clear the INTx */
+			writel(1 << bit, port->base + PCIE_INT_STATUS);
 		}
 	}
 
@@ -619,10 +620,10 @@ static irqreturn_t mtk_pcie_intr_handler(int irq, void *data)
 
 			while ((imsi_status = readl(port->base + PCIE_IMSI_STATUS))) {
 				for_each_set_bit(bit, &imsi_status, MTK_MSI_IRQS_NUM) {
-					/* Clear the MSI */
-					writel(1 << bit, port->base + PCIE_IMSI_STATUS);
 					virq = irq_find_mapping(port->msi_domain, bit);
 					generic_handle_irq(virq);
+					/* Clear the MSI */
+					writel(1 << bit, port->base + PCIE_IMSI_STATUS);
 				}
 			}
 			/* Clear MSI interrupt status */
-- 
2.6.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
