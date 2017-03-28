From: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 3/7] UDC: make debug prints compatible with both pci and platform devices
Date: Tue, 28 Mar 2017 16:32:05 +0530
Message-ID: <1490698929-10915-4-git-send-email-raviteja.garimella@broadcom.com>
References: <1490698929-10915-1-git-send-email-raviteja.garimella@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490698929-10915-1-git-send-email-raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds a struct device member to UDC data structure and
makes changes to the arguments of dev_err and dev_dbg calls so that
the debug prints work for both pci and platform devices.

Signed-off-by: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 drivers/usb/gadget/udc/amd5536udc.h     |  4 +++-
 drivers/usb/gadget/udc/amd5536udc_pci.c |  1 +
 drivers/usb/gadget/udc/snps_udc_core.c  | 28 ++++++++++++++--------------
 3 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/gadget/udc/amd5536udc.h b/drivers/usb/gadget/udc/amd5536udc.h
index bd2a18e..c252457 100644
--- a/drivers/usb/gadget/udc/amd5536udc.h
+++ b/drivers/usb/gadget/udc/amd5536udc.h
@@ -563,6 +563,8 @@ struct udc {
 	u16				cur_config;
 	u16				cur_intf;
 	u16				cur_alt;
+
+	struct device			*dev;
 };
 
 #define to_amd5536_udc(g)	(container_of((g), struct udc, gadget))
@@ -639,7 +641,7 @@ MODULE_PARM_DESC(use_fullspeed, "true for fullspeed only");
 
 /* debug macros ------------------------------------------------------------*/
 
-#define DBG(udc , args...)	dev_dbg(&(udc)->pdev->dev, args)
+#define DBG(udc , args...)	dev_dbg(udc->dev, args)
 
 #ifdef UDC_VERBOSE
 #define VDBG			DBG
diff --git a/drivers/usb/gadget/udc/amd5536udc_pci.c b/drivers/usb/gadget/udc/amd5536udc_pci.c
index 2a2d0a9..57a13f0 100644
--- a/drivers/usb/gadget/udc/amd5536udc_pci.c
+++ b/drivers/usb/gadget/udc/amd5536udc_pci.c
@@ -168,6 +168,7 @@ static int udc_pci_probe(
 	dev->phys_addr = resource;
 	dev->irq = pdev->irq;
 	dev->pdev = pdev;
+	dev->dev = &pdev->dev;
 
 	/* general probing */
 	if (udc_probe(dev)) {
diff --git a/drivers/usb/gadget/udc/snps_udc_core.c b/drivers/usb/gadget/udc/snps_udc_core.c
index 72f3c8f..c778d51 100644
--- a/drivers/usb/gadget/udc/snps_udc_core.c
+++ b/drivers/usb/gadget/udc/snps_udc_core.c
@@ -209,18 +209,18 @@ static void print_regs(struct udc *dev)
 	if (use_dma && use_dma_ppb && !use_dma_ppb_du) {
 		DBG(dev, "DMA mode       = PPBNDU (packet per buffer "
 			"WITHOUT desc. update)\n");
-		dev_info(&dev->pdev->dev, "DMA mode (%s)\n", "PPBNDU");
+		dev_info(dev->dev, "DMA mode (%s)\n", "PPBNDU");
 	} else if (use_dma && use_dma_ppb && use_dma_ppb_du) {
 		DBG(dev, "DMA mode       = PPBDU (packet per buffer "
 			"WITH desc. update)\n");
-		dev_info(&dev->pdev->dev, "DMA mode (%s)\n", "PPBDU");
+		dev_info(dev->dev, "DMA mode (%s)\n", "PPBDU");
 	}
 	if (use_dma && use_dma_bufferfill_mode) {
 		DBG(dev, "DMA mode       = BF (buffer fill mode)\n");
-		dev_info(&dev->pdev->dev, "DMA mode (%s)\n", "BF");
+		dev_info(dev->dev, "DMA mode (%s)\n", "BF");
 	}
 	if (!use_dma)
-		dev_info(&dev->pdev->dev, "FIFO mode\n");
+		dev_info(dev->dev, "FIFO mode\n");
 	DBG(dev, "-------------------------------------------------------\n");
 }
 
@@ -1628,7 +1628,7 @@ static void udc_setup_endpoints(struct udc *dev)
 static void usb_connect(struct udc *dev)
 {
 
-	dev_info(&dev->pdev->dev, "USB Connect\n");
+	dev_info(dev->dev, "USB Connect\n");
 
 	dev->connected = 1;
 
@@ -1646,7 +1646,7 @@ static void usb_connect(struct udc *dev)
 static void usb_disconnect(struct udc *dev)
 {
 
-	dev_info(&dev->pdev->dev, "USB Disconnect\n");
+	dev_info(dev->dev, "USB Disconnect\n");
 
 	dev->connected = 0;
 
@@ -2110,7 +2110,7 @@ static irqreturn_t udc_data_out_isr(struct udc *dev, int ep_ix)
 	}
 	/* HE event ? */
 	if (tmp & AMD_BIT(UDC_EPSTS_HE)) {
-		dev_err(&dev->pdev->dev, "HE ep%dout occurred\n", ep->num);
+		dev_err(dev->dev, "HE ep%dout occurred\n", ep->num);
 
 		/* clear HE */
 		writel(tmp | AMD_BIT(UDC_EPSTS_HE), &ep->regs->sts);
@@ -2309,7 +2309,7 @@ static irqreturn_t udc_data_in_isr(struct udc *dev, int ep_ix)
 	if (use_dma) {
 		/* BNA ? */
 		if (epsts & AMD_BIT(UDC_EPSTS_BNA)) {
-			dev_err(&dev->pdev->dev,
+			dev_err(dev->dev,
 				"BNA ep%din occurred - DESPTR = %08lx\n",
 				ep->num,
 				(unsigned long) readl(&ep->regs->desptr));
@@ -2322,7 +2322,7 @@ static irqreturn_t udc_data_in_isr(struct udc *dev, int ep_ix)
 	}
 	/* HE event ? */
 	if (epsts & AMD_BIT(UDC_EPSTS_HE)) {
-		dev_err(&dev->pdev->dev,
+		dev_err(dev->dev,
 			"HE ep%dn occurred - DESPTR = %08lx\n",
 			ep->num, (unsigned long) readl(&ep->regs->desptr));
 
@@ -2960,7 +2960,7 @@ __acquires(dev->lock)
 
 		/* link up all endpoints */
 		udc_setup_endpoints(dev);
-		dev_info(&dev->pdev->dev, "Connect: %s\n",
+		dev_info(dev->dev, "Connect: %s\n",
 			 usb_speed_string(dev->gadget.speed));
 
 		/* init ep 0 */
@@ -3172,20 +3172,20 @@ int udc_probe(struct udc *dev)
 	/* init registers, interrupts, ... */
 	startup_registers(dev);
 
-	dev_info(&dev->pdev->dev, "%s\n", mod_desc);
+	dev_info(dev->dev, "%s\n", mod_desc);
 
 	snprintf(tmp, sizeof(tmp), "%d", dev->irq);
-	dev_info(&dev->pdev->dev,
+	dev_info(dev->dev,
 		 "irq %s, pci mem %08lx, chip rev %02x(Geode5536 %s)\n",
 		 tmp, dev->phys_addr, dev->chiprev,
 		 (dev->chiprev == UDC_HSA0_REV) ? "A0" : "B1");
 	strcpy(tmp, UDC_DRIVER_VERSION_STRING);
 	if (dev->chiprev == UDC_HSA0_REV) {
-		dev_err(&dev->pdev->dev, "chip revision is A0; too old\n");
+		dev_err(dev->dev, "chip revision is A0; too old\n");
 		retval = -ENODEV;
 		goto finished;
 	}
-	dev_info(&dev->pdev->dev,
+	dev_info(dev->dev,
 		 "driver version: %s(for Geode5536 B1)\n", tmp);
 	udc = dev;
 
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
