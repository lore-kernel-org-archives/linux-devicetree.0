From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] of_pci_irq: kill useless variable in of_irq_parse_pci()
Date: Sun, 25 May 2014 22:50:06 +0400
Message-ID: <201405252250.06937.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The 'lspec' variable only caused pointless promotions from u8 to u32 on each
loop iteration, while it's enough to promote only once, after the loop.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
The patch is against Grant Likely's 'linux-2.6.git' repo's 'devicetree/next'
branch. The original patch also got rid of the 'lspec_be' variable but it turned
out to have been dealt with already in Grant's tree, so here's what remained...

 drivers/of/of_pci_irq.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

Index: linux-2.6/drivers/of/of_pci_irq.c
===================================================================
--- linux-2.6.orig/drivers/of/of_pci_irq.c
+++ linux-2.6/drivers/of/of_pci_irq.c
@@ -18,7 +18,6 @@ int of_irq_parse_pci(const struct pci_de
 {
 	struct device_node *dn, *ppnode;
 	struct pci_dev *ppdev;
-	u32 lspec;
 	__be32 laddr[3];
 	u8 pin;
 	int rc;
@@ -45,7 +44,6 @@ int of_irq_parse_pci(const struct pci_de
 		return -ENODEV;
 
 	/* Now we walk up the PCI tree */
-	lspec = pin;
 	for (;;) {
 		/* Get the pci_dev of our parent */
 		ppdev = pdev->bus->self;
@@ -79,13 +77,13 @@ int of_irq_parse_pci(const struct pci_de
 		/* We can only get here if we hit a P2P bridge with no node,
 		 * let's do standard swizzling and try again
 		 */
-		lspec = pci_swizzle_interrupt_pin(pdev, lspec);
+		pin = pci_swizzle_interrupt_pin(pdev, pin);
 		pdev = ppdev;
 	}
 
 	out_irq->np = ppnode;
 	out_irq->args_count = 1;
-	out_irq->args[0] = lspec;
+	out_irq->args[0] = pin;
 	laddr[0] = cpu_to_be32((pdev->bus->number << 16) | (pdev->devfn << 8));
 	laddr[1] = laddr[2] = cpu_to_be32(0);
 	return of_irq_parse_raw(laddr, out_irq);
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
