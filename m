From: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [RFC v2 5/5] UDC: Add Synopsys UDC Platform driver
Date: Tue, 17 Jan 2017 13:35:08 +0530
Message-ID: <1484640308-25976-6-git-send-email-raviteja.garimella@broadcom.com>
References: <1484640308-25976-1-git-send-email-raviteja.garimella@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484640308-25976-1-git-send-email-raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds platform driver support for Synopsys UDC.

A new driver file (snps_udc_plat.c) is created for this purpose,
where the platform driver registration is done based on the OF
node.

New members are added to the UDC data structure for having platform
device support along with extcon and phy support.

Kconfig and Makefile have the required changes to compile the same.

Signed-off-by: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 drivers/usb/gadget/udc/Kconfig         |  15 ++
 drivers/usb/gadget/udc/Makefile        |   1 +
 drivers/usb/gadget/udc/amd5536udc.h    |  14 ++
 drivers/usb/gadget/udc/snps_udc_core.c |  54 ++++--
 drivers/usb/gadget/udc/snps_udc_plat.c | 342 +++++++++++++++++++++++++++++++++
 5 files changed, 407 insertions(+), 19 deletions(-)
 create mode 100644 drivers/usb/gadget/udc/snps_udc_plat.c

diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index 9d889bb..44a2058 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -252,6 +252,21 @@ config USB_SNP_CORE
 	  This IP is different to the High Speed OTG IP that can be enabled
 	  by selecting USB_DWC2 or USB_DWC3 options.
 
+config USB_SNP_UDC_PLAT
+	tristate "Synopsys USB 2.0 Device controller"
+	select USB_SNP_CORE
+	select USB_GADGET_DUALSPEED
+	depends on (USB_GADGET && OF)
+	default ARCH_BCM_IPROC
+	help
+	  This adds Platform Device support for Synopsys Designware core
+	  AHB subsystem USB2.0 Device Controller (UDC).
+
+	  This driver works with UDCs integrated into Broadcom's Northstar2
+	  and Cygnus SoCs.
+
+	  If unsure, say N.
+
 #
 # Controllers available in both integrated and discrete versions
 #
diff --git a/drivers/usb/gadget/udc/Makefile b/drivers/usb/gadget/udc/Makefile
index 3929f6f1..7451516 100644
--- a/drivers/usb/gadget/udc/Makefile
+++ b/drivers/usb/gadget/udc/Makefile
@@ -37,4 +37,5 @@ obj-$(CONFIG_USB_FOTG210_UDC)	+= fotg210-udc.o
 obj-$(CONFIG_USB_MV_U3D)	+= mv_u3d_core.o
 obj-$(CONFIG_USB_GR_UDC)	+= gr_udc.o
 obj-$(CONFIG_USB_GADGET_XILINX)	+= udc-xilinx.o
+obj-$(CONFIG_USB_SNP_UDC_PLAT)	+= snps_udc_plat.o
 obj-$(CONFIG_USB_BDC_UDC)	+= bdc/
diff --git a/drivers/usb/gadget/udc/amd5536udc.h b/drivers/usb/gadget/udc/amd5536udc.h
index c252457..7884281 100644
--- a/drivers/usb/gadget/udc/amd5536udc.h
+++ b/drivers/usb/gadget/udc/amd5536udc.h
@@ -16,6 +16,7 @@
 /* debug control */
 /* #define UDC_VERBOSE */
 
+#include <linux/extcon.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
 
@@ -28,6 +29,9 @@
 #define UDC_HSA0_REV 1
 #define UDC_HSB1_REV 2
 
+/* Broadcom chip rev. */
+#define UDC_BCM_REV 10
+
 /*
  * SETUP usb commands
  * needed, because some SETUP's are handled in hw, but must be passed to
@@ -112,6 +116,7 @@
 #define UDC_DEVCTL_BRLEN_MASK			0x00ff0000
 #define UDC_DEVCTL_BRLEN_OFS			16
 
+#define UDC_DEVCTL_SRX_FLUSH			14
 #define UDC_DEVCTL_CSR_DONE			13
 #define UDC_DEVCTL_DEVNAK			12
 #define UDC_DEVCTL_SD				10
@@ -564,7 +569,15 @@ struct udc {
 	u16				cur_intf;
 	u16				cur_alt;
 
+	/* for platform device and extcon support */
 	struct device			*dev;
+	struct phy			*udc_phy;
+	struct extcon_dev		*edev;
+	struct extcon_specific_cable_nb	extcon_nb;
+	struct notifier_block		nb;
+	struct delayed_work		drd_work;
+	struct workqueue_struct		*drd_wq;
+	u32				conn_type;
 };
 
 #define to_amd5536_udc(g)	(container_of((g), struct udc, gadget))
@@ -580,6 +593,7 @@ int udc_enable_dev_setup_interrupts(struct udc *dev);
 int udc_mask_unused_interrupts(struct udc *dev);
 irqreturn_t udc_irq(int irq, void *pdev);
 void gadget_release(struct device *pdev);
+void empty_req_queue(struct udc_ep *ep);
 void udc_basic_init(struct udc *dev);
 void free_dma_pools(struct udc *dev);
 int init_dma_pools(struct udc *dev);
diff --git a/drivers/usb/gadget/udc/snps_udc_core.c b/drivers/usb/gadget/udc/snps_udc_core.c
index 556fa0e..59e2d6a 100644
--- a/drivers/usb/gadget/udc/snps_udc_core.c
+++ b/drivers/usb/gadget/udc/snps_udc_core.c
@@ -34,7 +34,6 @@
 #include "amd5536udc.h"
 
 static void udc_tasklet_disconnect(unsigned long);
-static void empty_req_queue(struct udc_ep *);
 static void udc_setup_endpoints(struct udc *dev);
 static void udc_soft_reset(struct udc *dev);
 static struct udc_request *udc_alloc_bna_dummy(struct udc_ep *ep);
@@ -1241,7 +1240,7 @@ udc_queue(struct usb_ep *usbep, struct usb_request *usbreq, gfp_t gfp)
 }
 
 /* Empty request queue of an endpoint; caller holds spinlock */
-static void empty_req_queue(struct udc_ep *ep)
+void empty_req_queue(struct udc_ep *ep)
 {
 	struct udc_request	*req;
 
@@ -1253,6 +1252,7 @@ static void empty_req_queue(struct udc_ep *ep)
 		complete_req(ep, req, -ESHUTDOWN);
 	}
 }
+EXPORT_SYMBOL_GPL(empty_req_queue);
 
 /* Dequeues a request packet, called by gadget driver */
 static int udc_dequeue(struct usb_ep *usbep, struct usb_request *usbreq)
@@ -1620,6 +1620,9 @@ static void udc_setup_endpoints(struct udc *dev)
 /* Bringup after Connect event, initial bringup to be ready for ep0 events */
 static void usb_connect(struct udc *dev)
 {
+	/* Return if already connected */
+	if (dev->connected)
+		return;
 
 	dev_info(dev->dev, "USB Connect\n");
 
@@ -1638,6 +1641,9 @@ static void usb_connect(struct udc *dev)
  */
 static void usb_disconnect(struct udc *dev)
 {
+	/* Return if already disconnected */
+	if (!dev->connected)
+		return;
 
 	dev_info(dev->dev, "USB Disconnect\n");
 
@@ -1712,11 +1718,15 @@ static void udc_soft_reset(struct udc *dev)
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
@@ -3168,21 +3178,27 @@ int udc_probe(struct udc *dev)
 	dev_info(dev->dev, "%s\n", mod_desc);
 
 	snprintf(tmp, sizeof(tmp), "%d", dev->irq);
-	dev_info(dev->dev,
-		 "irq %s, pci mem %08lx, chip rev %02x(Geode5536 %s)\n",
-		 tmp, dev->phys_addr, dev->chiprev,
-		 (dev->chiprev == UDC_HSA0_REV) ? "A0" : "B1");
-	strcpy(tmp, UDC_DRIVER_VERSION_STRING);
-	if (dev->chiprev == UDC_HSA0_REV) {
-		dev_err(dev->dev, "chip revision is A0; too old\n");
-		retval = -ENODEV;
-		goto finished;
+
+	/* Print this device info for AMD chips only*/
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
-	dev_info(dev->dev,
-		 "driver version: %s(for Geode5536 B1)\n", tmp);
+
 	udc = dev;
 
-	retval = usb_add_gadget_udc_release(&udc->pdev->dev, &dev->gadget,
+	retval = usb_add_gadget_udc_release(udc->dev, &dev->gadget,
 					    gadget_release);
 	if (retval)
 		goto finished;
diff --git a/drivers/usb/gadget/udc/snps_udc_plat.c b/drivers/usb/gadget/udc/snps_udc_plat.c
new file mode 100644
index 0000000..f5ee2f8
--- /dev/null
+++ b/drivers/usb/gadget/udc/snps_udc_plat.c
@@ -0,0 +1,342 @@
+/*
+ * snps_udc_plat.c - Synopsys UDC Platform Driver
+ *
+ * Copyright (C) 2016 Broadcom
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation version 2.
+ *
+ * This program is distributed "as is" WITHOUT ANY WARRANTY of any
+ * kind, whether express or implied; without even the implied warranty
+ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/extcon.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/of_gpio.h>
+#include <linux/platform_device.h>
+#include <linux/phy/phy.h>
+#include <linux/module.h>
+#include <linux/dmapool.h>
+#include <linux/interrupt.h>
+#include <linux/moduleparam.h>
+#include "amd5536udc.h"
+
+/* description */
+#define UDC_MOD_DESCRIPTION     "Synopsys UDC platform driver"
+
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
+	int tmp;
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
+		for (tmp = 0; tmp < UDC_EP_NUM; tmp++)
+			empty_req_queue(&udc->ep[tmp]);
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
+	usb_del_gadget_udc(&dev->gadget);
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
+	if (dev->drd_wq) {
+		flush_workqueue(dev->drd_wq);
+		destroy_workqueue(dev->drd_wq);
+	}
+
+	phy_power_off(dev->udc_phy);
+	phy_exit(dev->udc_phy);
+	extcon_unregister_notifier(dev->edev, EXTCON_USB, &dev->nb);
+
+	dev_info(&pdev->dev, "Synopsys UDC platform driver removed\n");
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
+	{ .compatible = "snps,dw-ahb-udc", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, of_udc_match);
+#endif
+
+static struct platform_driver udc_plat_driver = {
+	.probe		= udc_plat_probe,
+	.remove		= udc_plat_remove,
+	.driver		= {
+		.name	= "snps-udc-plat",
+		.of_match_table = of_match_ptr(of_udc_match),
+#ifdef CONFIG_PM_SLEEP
+		.pm	= &udc_plat_pm_ops,
+#endif
+	},
+};
+module_platform_driver(udc_plat_driver);
+
+MODULE_DESCRIPTION(UDC_MOD_DESCRIPTION);
+MODULE_AUTHOR("Broadcom");
+MODULE_LICENSE("GPL v2");
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
