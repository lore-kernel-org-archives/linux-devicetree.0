From: Raviteja Garimella <raviteja.garimella@broadcom.com>
Subject: [RFC 1/1] Changes to support the driver for platform device registration
Date: Thu,  5 Jan 2017 13:53:17 +0530
Message-ID: <1483604597-26160-2-git-send-email-raviteja.garimella@broadcom.com>
References: <1483604597-26160-1-git-send-email-raviteja.garimella@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1483604597-26160-1-git-send-email-raviteja.garimella@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

-- Add OF based platform device registration
-- Modify debug prints to be compatible with both pci and platform devices
-- Add members to 'struct udc' for extcon and phy support
-- Add checks to not process repeated calls to udc connect and
   disconnect routines
-- Kconfig changes

Signed-off-by: Raviteja Garimella <raviteja.garimella@broadcom.com>
---
 drivers/usb/gadget/udc/Kconfig      |   6 +-
 drivers/usb/gadget/udc/amd5536udc.c | 397 +++++++++++++++++++++++++++++++++---
 drivers/usb/gadget/udc/amd5536udc.h |  17 +-
 3 files changed, 387 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index 658b8da..7728fec 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -263,7 +263,7 @@ source "drivers/usb/gadget/udc/bdc/Kconfig"
 
 config USB_AMD5536UDC
 	tristate "AMD5536 UDC"
-	depends on PCI
+	depends on PCI || OF
 	help
 	   The AMD5536 UDC is part of the AMD Geode CS5536, an x86 southbridge.
 	   It is a USB Highspeed DMA capable USB device controller. Beside ep0
@@ -271,6 +271,10 @@ config USB_AMD5536UDC
 	   The UDC port supports OTG operation, and may be used as a host port
 	   if it's not being used to implement peripheral or OTG roles.
 
+	   This UDC is based on Synopsis Designware core USB Device controller
+	   IP. The driver also supports UDCs integrated to ARM based SoC's like
+	   Broadcom's Northstar2 and Cygnus platforms.
+
 	   Say "y" to link the driver statically, or "m" to build a
 	   dynamically linked module called "amd5536udc" and force all
 	   gadget drivers to also be dynamically linked.
diff --git a/drivers/usb/gadget/udc/amd5536udc.c b/drivers/usb/gadget/udc/amd5536udc.c
index ea03ca7..b086cf1 100644
--- a/drivers/usb/gadget/udc/amd5536udc.c
+++ b/drivers/usb/gadget/udc/amd5536udc.c
@@ -22,16 +22,25 @@
  * UDC DMA requires 32-bit aligned buffers so DMA with gadget ether does not
  * work without updating NET_IP_ALIGN. Or PIO mode (module param "use_dma=0")
  * can be used with gadget ether.
+ *
+ * This driver is compatible for Broadcom's UDC for Northstar2 and Cygnus
+ * SOCs. The UDC is based on Synopsys designware core USB device controller IP.
  */
 
 /* debug control */
 /* #define UDC_VERBOSE */
 
 /* Driver strings */
-#define UDC_MOD_DESCRIPTION		"AMD 5536 UDC - USB Device Controller"
+#define UDC_MOD_DESCRIPTION	"AMD 5536 UDC - Synopsys USB Device Controller"
 #define UDC_DRIVER_VERSION_STRING	"01.00.0206"
 
 /* system */
+#include <linux/extcon.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/of_gpio.h>
+#include <linux/platform_device.h>
+#include <linux/phy/phy.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/kernel.h>
@@ -251,18 +260,18 @@ static void print_regs(struct udc *dev)
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
 
@@ -1666,8 +1675,11 @@ static void udc_setup_endpoints(struct udc *dev)
 /* Bringup after Connect event, initial bringup to be ready for ep0 events */
 static void usb_connect(struct udc *dev)
 {
+	/* Return if already connected */
+	if (dev->connected)
+		return;
 
-	dev_info(&dev->pdev->dev, "USB Connect\n");
+	dev_info(dev->dev, "USB Connect\n");
 
 	dev->connected = 1;
 
@@ -1684,8 +1696,11 @@ static void usb_connect(struct udc *dev)
  */
 static void usb_disconnect(struct udc *dev)
 {
+	/* Return if already disconnected */
+	if (!dev->connected)
+		return;
 
-	dev_info(&dev->pdev->dev, "USB Disconnect\n");
+	dev_info(dev->dev, "USB Disconnect\n");
 
 	dev->connected = 0;
 
@@ -1758,11 +1773,15 @@ static void udc_soft_reset(struct udc *dev)
 	/* device int. status reset */
 	writel(UDC_DEV_MSK_DISABLE, &dev->regs->irqsts);
 
-	spin_lock_irqsave(&udc_irq_spinlock, flags);
-	writel(AMD_BIT(UDC_DEVCFG_SOFTRESET), &dev->regs->cfg);
-	readl(&dev->regs->cfg);
-	spin_unlock_irqrestore(&udc_irq_spinlock, flags);
-
+	/* Don't do this for Broadcom UDC since this is a reserved
+	 * bit.
+	 */
+	if (dev->chiprev != UDC_BCM_REV) {
+		spin_lock_irqsave(&udc_irq_spinlock, flags);
+		writel(AMD_BIT(UDC_DEVCFG_SOFTRESET), &dev->regs->cfg);
+		readl(&dev->regs->cfg);
+		spin_unlock_irqrestore(&udc_irq_spinlock, flags);
+	}
 }
 
 /* RDE timer callback to set RDE bit */
@@ -2149,7 +2168,7 @@ static irqreturn_t udc_data_out_isr(struct udc *dev, int ep_ix)
 	}
 	/* HE event ? */
 	if (tmp & AMD_BIT(UDC_EPSTS_HE)) {
-		dev_err(&dev->pdev->dev, "HE ep%dout occurred\n", ep->num);
+		dev_err(dev->dev, "HE ep%dout occurred\n", ep->num);
 
 		/* clear HE */
 		writel(tmp | AMD_BIT(UDC_EPSTS_HE), &ep->regs->sts);
@@ -2348,7 +2367,7 @@ static irqreturn_t udc_data_in_isr(struct udc *dev, int ep_ix)
 	if (use_dma) {
 		/* BNA ? */
 		if (epsts & AMD_BIT(UDC_EPSTS_BNA)) {
-			dev_err(&dev->pdev->dev,
+			dev_err(dev->dev,
 				"BNA ep%din occurred - DESPTR = %08lx\n",
 				ep->num,
 				(unsigned long) readl(&ep->regs->desptr));
@@ -2361,7 +2380,7 @@ static irqreturn_t udc_data_in_isr(struct udc *dev, int ep_ix)
 	}
 	/* HE event ? */
 	if (epsts & AMD_BIT(UDC_EPSTS_HE)) {
-		dev_err(&dev->pdev->dev,
+		dev_err(dev->dev,
 			"HE ep%dn occurred - DESPTR = %08lx\n",
 			ep->num, (unsigned long) readl(&ep->regs->desptr));
 
@@ -2999,7 +3018,7 @@ __acquires(dev->lock)
 
 		/* link up all endpoints */
 		udc_setup_endpoints(dev);
-		dev_info(&dev->pdev->dev, "Connect: %s\n",
+		dev_info(dev->dev, "Connect: %s\n",
 			 usb_speed_string(dev->gadget.speed));
 
 		/* init ep 0 */
@@ -3162,7 +3181,7 @@ static int init_dma_pools(struct udc *dev)
 	}
 
 	/* DMA setup */
-	dev->data_requests = dma_pool_create("data_requests", NULL,
+	dev->data_requests = dma_pool_create("data_requests", dev->dev,
 		sizeof(struct udc_data_dma), 0, 0);
 	if (!dev->data_requests) {
 		DBG(dev, "can't get request data pool\n");
@@ -3173,7 +3192,7 @@ static int init_dma_pools(struct udc *dev)
 	dev->ep[UDC_EP0IN_IX].dma = &dev->regs->ctl;
 
 	/* dma desc for setup data */
-	dev->stp_requests = dma_pool_create("setup requests", NULL,
+	dev->stp_requests = dma_pool_create("setup requests", dev->dev,
 		sizeof(struct udc_stp_dma), 0, 0);
 	if (!dev->stp_requests) {
 		DBG(dev, "can't get stp request pool\n");
@@ -3232,24 +3251,29 @@ static int udc_probe(struct udc *dev)
 	/* init registers, interrupts, ... */
 	startup_registers(dev);
 
-	dev_info(&dev->pdev->dev, "%s\n", mod_desc);
+	dev_info(dev->dev, "%s\n", mod_desc);
 
 	snprintf(tmp, sizeof(tmp), "%d", dev->irq);
-	dev_info(&dev->pdev->dev,
-		 "irq %s, pci mem %08lx, chip rev %02x(Geode5536 %s)\n",
-		 tmp, dev->phys_addr, dev->chiprev,
-		 (dev->chiprev == UDC_HSA0_REV) ? "A0" : "B1");
-	strcpy(tmp, UDC_DRIVER_VERSION_STRING);
-	if (dev->chiprev == UDC_HSA0_REV) {
-		dev_err(&dev->pdev->dev, "chip revision is A0; too old\n");
-		retval = -ENODEV;
-		goto finished;
+
+	/* Print this device info for AMD chips only */
+	if (dev->chiprev == UDC_HSA0_REV ||
+	    dev->chiprev == UDC_HSB1_REV) {
+		dev_info(dev->dev, "irq %s, pci mem %08lx, chip rev %02x(Geode5536 %s)\n",
+			 tmp, dev->phys_addr, dev->chiprev,
+			 (dev->chiprev == UDC_HSA0_REV) ?
+			 "A0" : "B1");
+		strcpy(tmp, UDC_DRIVER_VERSION_STRING);
+		if (dev->chiprev == UDC_HSA0_REV) {
+			dev_err(dev->dev, "chip revision is A0; too old\n");
+			retval = -ENODEV;
+			goto finished;
+		}
+		dev_info(dev->dev,
+			 "driver version: %s(for Geode5536 B1)\n", tmp);
 	}
-	dev_info(&dev->pdev->dev,
-		 "driver version: %s(for Geode5536 B1)\n", tmp);
 	udc = dev;
 
-	retval = usb_add_gadget_udc_release(&udc->pdev->dev, &dev->gadget,
+	retval = usb_add_gadget_udc_release(udc->dev, &dev->gadget,
 					    gadget_release);
 	if (retval)
 		goto finished;
@@ -3363,6 +3387,7 @@ static int udc_pci_probe(
 	dev->phys_addr = resource;
 	dev->irq = pdev->irq;
 	dev->pdev = pdev;
+	dev->dev = &pdev->dev;
 
 	/* general probing */
 	if (udc_probe(dev)) {
@@ -3408,6 +3433,316 @@ static struct pci_driver udc_pci_driver = {
 
 module_pci_driver(udc_pci_driver);
 
+void start_udc(struct udc *udc)
+{
+	if (udc->driver) {
+		dev_info(udc->dev, "Connecting...\n");
+		udc_enable_dev_setup_interrupts(udc);
+		udc_basic_init(udc);
+		udc->connected = 1;
+	}
+}
+
+void stop_udc(struct udc *udc)
+{
+	int num;
+	u32 reg;
+
+	spin_lock(&udc->lock);
+
+	/* Flush the receieve fifo */
+	reg = readl(&udc->regs->ctl);
+	reg |= AMD_BIT(UDC_DEVCTL_SRX_FLUSH);
+	writel(reg, &udc->regs->ctl);
+
+	reg = readl(&udc->regs->ctl);
+	reg &= ~(AMD_BIT(UDC_DEVCTL_SRX_FLUSH));
+	writel(reg, &udc->regs->ctl);
+	dev_dbg(udc->dev, "ep rx queue flushed\n");
+
+	/* Mask interrupts. Required more so when the
+	 * UDC is connected to a DRD phy.
+	 */
+	udc_mask_unused_interrupts(udc);
+
+	/* Disconnect gadget driver */
+	if (udc->driver) {
+		spin_unlock(&udc->lock);
+		udc->driver->disconnect(&udc->gadget);
+		spin_lock(&udc->lock);
+
+		/* empty queues */
+		for (num = 0; num < UDC_EP_NUM; num++)
+			empty_req_queue(&udc->ep[num]);
+	}
+	udc->connected = 0;
+
+	spin_unlock(&udc->lock);
+	dev_info(udc->dev, "Device disconnected\n");
+}
+
+void udc_drd_work(struct work_struct *work)
+{
+	struct udc *udc;
+
+	udc = container_of(to_delayed_work(work),
+			   struct udc, drd_work);
+
+	if (udc->conn_type) {
+		dev_dbg(udc->dev, "idle -> device\n");
+		start_udc(udc);
+	} else {
+		dev_dbg(udc->dev, "device -> idle\n");
+		stop_udc(udc);
+	}
+}
+
+static int usbd_connect_notify(struct notifier_block *self,
+			       unsigned long event, void *ptr)
+{
+	struct udc *udc = container_of(self, struct udc, nb);
+
+	dev_dbg(udc->dev, "%s: event: %lu\n", __func__, event);
+
+	udc->conn_type = event;
+
+	schedule_delayed_work(&udc->drd_work, 0);
+
+	return NOTIFY_OK;
+}
+
+static int udc_plat_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	struct udc *udc;
+	int ret;
+
+	udc = devm_kzalloc(dev, sizeof(*udc), GFP_KERNEL);
+	if (!udc)
+		return -ENOMEM;
+
+	spin_lock_init(&udc->lock);
+	udc->dev = dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	udc->virt_addr = devm_ioremap_resource(dev, res);
+	if (IS_ERR(udc->regs))
+		return PTR_ERR(udc->regs);
+
+	/* udc csr registers base */
+	udc->csr = udc->virt_addr + UDC_CSR_ADDR;
+
+	/* dev registers base */
+	udc->regs = udc->virt_addr + UDC_DEVCFG_ADDR;
+
+	/* ep registers base */
+	udc->ep_regs = udc->virt_addr + UDC_EPREGS_ADDR;
+
+	/* fifo's base */
+	udc->rxfifo = (u32 __iomem *)(udc->virt_addr + UDC_RXFIFO_ADDR);
+	udc->txfifo = (u32 __iomem *)(udc->virt_addr + UDC_TXFIFO_ADDR);
+
+	udc->phys_addr = (unsigned long)res->start;
+
+	udc->irq = irq_of_parse_and_map(dev->of_node, 0);
+	if (udc->irq <= 0) {
+		dev_err(dev, "Can't parse and map interrupt\n");
+		return -EINVAL;
+	}
+
+	udc->udc_phy = devm_of_phy_get_by_index(dev, dev->of_node, 0);
+	if (IS_ERR(udc->udc_phy)) {
+		dev_err(dev, "Failed to obtain phy from device tree\n");
+		return PTR_ERR(udc->udc_phy);
+	}
+
+	ret = phy_init(udc->udc_phy);
+	if (ret) {
+		dev_err(dev, "UDC phy init failed");
+		return ret;
+	}
+
+	ret = phy_power_on(udc->udc_phy);
+	if (ret) {
+		dev_err(dev, "UDC phy power on failed");
+		phy_exit(udc->udc_phy);
+		return ret;
+	}
+
+	/* Register for extcon if supported */
+	if (of_get_property(dev->of_node, "extcon", NULL)) {
+		udc->edev = extcon_get_edev_by_phandle(dev, 0);
+		if (IS_ERR(udc->edev)) {
+			if (PTR_ERR(udc->edev) == -EPROBE_DEFER)
+				return -EPROBE_DEFER;
+			dev_err(dev, "Invalid or missing extcon\n");
+			ret = PTR_ERR(udc->edev);
+			goto exit_phy;
+		}
+
+		udc->nb.notifier_call = usbd_connect_notify;
+		ret = extcon_register_notifier(udc->edev, EXTCON_USB,
+					       &udc->nb);
+		if (ret < 0) {
+			dev_err(dev, "Can't register extcon device\n");
+			goto exit_phy;
+		}
+
+		ret = extcon_get_cable_state_(udc->edev, EXTCON_USB);
+		if (ret < 0) {
+			dev_err(dev, "Can't get cable state\n");
+			goto exit_extcon;
+		} else if (ret) {
+			udc->conn_type = ret;
+		}
+		INIT_DELAYED_WORK(&udc->drd_work, udc_drd_work);
+	}
+
+	/* init dma pools */
+	if (use_dma) {
+		ret = init_dma_pools(udc);
+		if (ret != 0)
+			goto exit_extcon;
+	}
+
+	ret = devm_request_irq(dev, udc->irq, udc_irq, IRQF_SHARED,
+			       "snps-udc", udc);
+	if (ret < 0) {
+		dev_err(dev, "Request irq %d failed for UDC\n", udc->irq);
+		goto exit_dma;
+	}
+
+	platform_set_drvdata(pdev, udc);
+	udc->chiprev = UDC_BCM_REV;
+
+	if (udc_probe(udc)) {
+		ret = -ENODEV;
+		goto exit_dma;
+	}
+	dev_info(dev, "Synopsys UDC platform driver probe successful\n");
+
+	return 0;
+
+exit_dma:
+	if (use_dma)
+		free_dma_pools(udc);
+exit_extcon:
+	if (udc->edev)
+		extcon_unregister_notifier(udc->edev, EXTCON_USB, &udc->nb);
+exit_phy:
+	if (udc->udc_phy) {
+		phy_power_off(udc->udc_phy);
+		phy_exit(udc->udc_phy);
+	}
+	return ret;
+}
+
+static int udc_plat_remove(struct platform_device *pdev)
+{
+	struct udc *dev;
+
+	dev = platform_get_drvdata(pdev);
+
+	usb_del_gadget_udc(&udc->gadget);
+	/* gadget driver must not be registered */
+	if (WARN_ON(dev->driver))
+		return 0;
+
+	/* dma pool cleanup */
+	free_dma_pools(dev);
+
+	udc_remove(dev);
+
+	platform_set_drvdata(pdev, NULL);
+
+	if (udc->drd_wq) {
+		flush_workqueue(udc->drd_wq);
+		destroy_workqueue(udc->drd_wq);
+	}
+
+	/* free_udc_dma(pdev, udc); */
+	phy_power_off(udc->udc_phy);
+	phy_exit(udc->udc_phy);
+	extcon_unregister_notifier(udc->edev, EXTCON_USB, &udc->nb);
+
+	dev_info(&pdev->dev, "Synopsys UDC driver removed\n");
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int udc_plat_suspend(struct device *dev)
+{
+	struct udc *udc;
+
+	udc = dev_get_drvdata(dev);
+	usb_disconnect(udc);
+
+	if (extcon_get_cable_state_(udc->edev, EXTCON_USB) > 0) {
+		dev_dbg(udc->dev, "device -> idle\n");
+		stop_udc(udc);
+	}
+	phy_power_off(udc->udc_phy);
+	phy_exit(udc->udc_phy);
+
+	return 0;
+}
+
+static int udc_plat_resume(struct device *dev)
+{
+	struct udc *udc;
+	int ret;
+
+	udc = dev_get_drvdata(dev);
+
+	ret = phy_init(udc->udc_phy);
+	if (ret) {
+		dev_err(udc->dev, "UDC phy init failure");
+		return ret;
+	}
+
+	ret = phy_power_on(udc->udc_phy);
+	if (ret) {
+		dev_err(udc->dev, "UDC phy power on failure");
+		phy_exit(udc->udc_phy);
+		return ret;
+	}
+
+	if (extcon_get_cable_state_(udc->edev, EXTCON_USB) > 0) {
+		dev_dbg(udc->dev, "idle -> device\n");
+		start_udc(udc);
+	}
+
+	return 0;
+}
+static const struct dev_pm_ops udc_plat_pm_ops = {
+	.suspend	= udc_plat_suspend,
+	.resume		= udc_plat_resume,
+};
+#endif
+
+#if defined(CONFIG_OF)
+static const struct of_device_id of_udc_match[] = {
+	{ .compatible = "snps,bcm-ahb-udc", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, of_udc_match);
+#endif
+
+static struct platform_driver udc_plat_driver = {
+	.probe		= udc_plat_probe,
+	.remove		= udc_plat_remove,
+	.driver		= {
+		.name	= "snps-udc",
+		.of_match_table = of_match_ptr(of_udc_match),
+#ifdef CONFIG_PM_SLEEP
+		.pm	= &udc_plat_pm_ops,
+#endif
+	},
+};
+module_platform_driver(udc_plat_driver);
+
 MODULE_DESCRIPTION(UDC_MOD_DESCRIPTION);
 MODULE_AUTHOR("Thomas Dahlmann");
 MODULE_LICENSE("GPL");
diff --git a/drivers/usb/gadget/udc/amd5536udc.h b/drivers/usb/gadget/udc/amd5536udc.h
index 4638d70..88e1b75 100644
--- a/drivers/usb/gadget/udc/amd5536udc.h
+++ b/drivers/usb/gadget/udc/amd5536udc.h
@@ -22,6 +22,9 @@
 #define UDC_HSA0_REV 1
 #define UDC_HSB1_REV 2
 
+/* Broadcom chip rev. */
+#define UDC_BCM_REV 10
+
 /*
  * SETUP usb commands
  * needed, because some SETUP's are handled in hw, but must be passed to
@@ -106,6 +109,7 @@
 #define UDC_DEVCTL_BRLEN_MASK			0x00ff0000
 #define UDC_DEVCTL_BRLEN_OFS			16
 
+#define UDC_DEVCTL_SRX_FLUSH			14
 #define UDC_DEVCTL_CSR_DONE			13
 #define UDC_DEVCTL_DEVNAK			12
 #define UDC_DEVCTL_SD				10
@@ -518,6 +522,7 @@ struct udc_ep {
 					in : 1;
 };
 
+#define USBD_WQ_DELAY_MS		msecs_to_jiffies(100)
 /* device struct */
 struct udc {
 	struct usb_gadget		gadget;
@@ -557,6 +562,16 @@ struct udc {
 	u16				cur_config;
 	u16				cur_intf;
 	u16				cur_alt;
+
+	/* for platform device and extcon support */
+	struct device			*dev;
+	struct phy			*udc_phy;
+	struct extcon_dev		*edev;
+	struct extcon_specific_cable_nb	extcon_nb;
+	struct notifier_block		nb;
+	struct delayed_work		drd_work;
+	struct workqueue_struct		*drd_wq;
+	u32				conn_type;
 };
 
 #define to_amd5536_udc(g)	(container_of((g), struct udc, gadget))
@@ -603,7 +618,7 @@ union udc_setup_data {
 
 /* debug macros ------------------------------------------------------------*/
 
-#define DBG(udc , args...)	dev_dbg(&(udc)->pdev->dev, args)
+#define DBG(udc , args...)	dev_dbg(udc->dev, args)
 
 #ifdef UDC_VERBOSE
 #define VDBG			DBG
-- 
2.1.0
