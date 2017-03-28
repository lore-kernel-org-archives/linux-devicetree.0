From: Raviteja Garimella <raviteja.garimella@broadcom.com>
Subject: [PATCH v3 1/7] UDC: Split the driver into amd (pci) and Synopsys core IP driver
Date: Tue, 28 Mar 2017 16:32:03 +0530
Message-ID: <1490698929-10915-2-git-send-email-raviteja.garimella@broadcom.com>
References: <1490698929-10915-1-git-send-email-raviteja.garimella@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1490698929-10915-1-git-send-email-raviteja.garimella@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch splits the amd5536udc driver into two -- one that does
pci device registration and the other file that does the rest of
the driver tasks like the gadget/ep ops etc for Synopsys UDC.

This way of splitting helps in exporting core driver symbols which
can be used by any other platform/pci driver that is written for
the same Synopsys USB device controller.

The current patch also includes a change in the Kconfig and Makefile.
A new config option USB_SNP_CORE will be selected automatically when
any one of the platform or pci driver for the same UDC is selected.

Main changes:
- amd5536udc_pci.c: PCI device registration is moved to this file.

- amd5536udc.c:
  This file does rest of the core UDC fucntionality.
  9 symbols are exported so as to be used by amd5536udc_pci.c.
  Module parameter definitions are moved to header file.

- amd5536udc.h:
  Function declarations, module parameters definitions and few common
  header file includes are added to this file

- Kconfig:
  New USB_SNP_CORE option is added which will be auto selected when
  any pci or platform driver config option for the UDC is chosen.

- Makefile:
  Compiles the core and pci files separately.

Signed-off-by: Raviteja Garimella <raviteja.garimella@broadcom.com>
---
 drivers/usb/gadget/udc/Kconfig          |  18 +++
 drivers/usb/gadget/udc/Makefile         |   3 +-
 drivers/usb/gadget/udc/amd5536udc.c     | 238 ++++----------------------------
 drivers/usb/gadget/udc/amd5536udc.h     |  36 +++++
 drivers/usb/gadget/udc/amd5536udc_pci.c | 217 +++++++++++++++++++++++++++++
 5 files changed, 297 insertions(+), 215 deletions(-)
 create mode 100644 drivers/usb/gadget/udc/amd5536udc_pci.c

diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index 4b69f28..2cee076 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -253,6 +253,20 @@ config USB_MV_U3D
 	  MARVELL PXA2128 Processor series include a super speed USB3.0 device
 	  controller, which support super speed USB peripheral.
 
+config USB_SNP_CORE
+	depends on USB_AMD5536UDC
+	tristate
+	help
+	  This enables core driver support for Synopsys USB 2.0 Device
+	  controller.
+
+	  This will be enabled when PCI or Platform driver for this UDC is
+	  selected. Currently, this will be enabled by USB_SNP_UDC_PLAT or
+	  USB_AMD5536UDC options.
+
+	  This IP is different to the High Speed OTG IP that can be enabled
+	  by selecting USB_DWC2 or USB_DWC3 options.
+
 #
 # Controllers available in both integrated and discrete versions
 #
@@ -278,6 +292,7 @@ source "drivers/usb/gadget/udc/bdc/Kconfig"
 config USB_AMD5536UDC
 	tristate "AMD5536 UDC"
 	depends on PCI
+	select USB_SNP_CORE
 	help
 	   The AMD5536 UDC is part of the AMD Geode CS5536, an x86 southbridge.
 	   It is a USB Highspeed DMA capable USB device controller. Beside ep0
@@ -285,6 +300,9 @@ config USB_AMD5536UDC
 	   The UDC port supports OTG operation, and may be used as a host port
 	   if it's not being used to implement peripheral or OTG roles.
 
+	   This UDC is based on Synopsys USB device controller IP and selects
+	   CONFIG_USB_SNP_CORE option to build the core driver.
+
 	   Say "y" to link the driver statically, or "m" to build a
 	   dynamically linked module called "amd5536udc" and force all
 	   gadget drivers to also be dynamically linked.
diff --git a/drivers/usb/gadget/udc/Makefile b/drivers/usb/gadget/udc/Makefile
index 98e74ed..626e1f1 100644
--- a/drivers/usb/gadget/udc/Makefile
+++ b/drivers/usb/gadget/udc/Makefile
@@ -10,7 +10,8 @@ obj-$(CONFIG_USB_GADGET)	+= udc-core.o
 obj-$(CONFIG_USB_DUMMY_HCD)	+= dummy_hcd.o
 obj-$(CONFIG_USB_NET2272)	+= net2272.o
 obj-$(CONFIG_USB_NET2280)	+= net2280.o
-obj-$(CONFIG_USB_AMD5536UDC)	+= amd5536udc.o
+obj-$(CONFIG_USB_SNP_CORE)	+= amd5536udc.o
+obj-$(CONFIG_USB_AMD5536UDC)	+= amd5536udc_pci.o
 obj-$(CONFIG_USB_PXA25X)	+= pxa25x_udc.o
 obj-$(CONFIG_USB_PXA27X)	+= pxa27x_udc.o
 obj-$(CONFIG_USB_GOKU)		+= goku_udc.o
diff --git a/drivers/usb/gadget/udc/amd5536udc.c b/drivers/usb/gadget/udc/amd5536udc.c
index ea03ca7..72f3c8f 100644
--- a/drivers/usb/gadget/udc/amd5536udc.c
+++ b/drivers/usb/gadget/udc/amd5536udc.c
@@ -11,27 +11,15 @@
  */
 
 /*
- * The AMD5536 UDC is part of the x86 southbridge AMD Geode CS5536.
- * It is a USB Highspeed DMA capable USB device controller. Beside ep0 it
- * provides 4 IN and 4 OUT endpoints (bulk or interrupt type).
- *
- * Make sure that UDC is assigned to port 4 by BIOS settings (port can also
- * be used as host port) and UOC bits PAD_EN and APU are set (should be done
- * by BIOS init).
- *
- * UDC DMA requires 32-bit aligned buffers so DMA with gadget ether does not
- * work without updating NET_IP_ALIGN. Or PIO mode (module param "use_dma=0")
- * can be used with gadget ether.
+ * This file does the core driver implementation for the UDC that is based
+ * on Synopsys device controller IP (different than HS OTG IP) that is either
+ * connected through PCI bus or integrated to SoC platforms.
  */
 
-/* debug control */
-/* #define UDC_VERBOSE */
-
 /* Driver strings */
-#define UDC_MOD_DESCRIPTION		"AMD 5536 UDC - USB Device Controller"
+#define UDC_MOD_DESCRIPTION		"Synopsys USB Device Controller"
 #define UDC_DRIVER_VERSION_STRING	"01.00.0206"
 
-/* system */
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/kernel.h>
@@ -46,23 +34,12 @@
 #include <linux/ioctl.h>
 #include <linux/fs.h>
 #include <linux/dmapool.h>
-#include <linux/moduleparam.h>
-#include <linux/device.h>
-#include <linux/io.h>
-#include <linux/irq.h>
 #include <linux/prefetch.h>
-
+#include <linux/moduleparam.h>
 #include <asm/byteorder.h>
 #include <asm/unaligned.h>
-
-/* gadget stack */
-#include <linux/usb/ch9.h>
-#include <linux/usb/gadget.h>
-
-/* udc specific */
 #include "amd5536udc.h"
 
-
 static void udc_tasklet_disconnect(unsigned long);
 static void empty_req_queue(struct udc_ep *);
 static void udc_setup_endpoints(struct udc *dev);
@@ -72,7 +49,7 @@ static void udc_free_request(struct usb_ep *usbep, struct usb_request *usbreq);
 
 /* description */
 static const char mod_desc[] = UDC_MOD_DESCRIPTION;
-static const char name[] = "amd5536udc";
+static const char name[] = "udc";
 
 /* structure to hold endpoint function pointers */
 static const struct usb_ep_ops udc_ep_ops;
@@ -208,30 +185,11 @@ static const struct {
 #undef EP_INFO
 };
 
-/* DMA usage flag */
-static bool use_dma = 1;
-/* packet per buffer dma */
-static bool use_dma_ppb = 1;
-/* with per descr. update */
-static bool use_dma_ppb_du;
 /* buffer fill mode */
 static int use_dma_bufferfill_mode;
-/* full speed only mode */
-static bool use_fullspeed;
 /* tx buffer size for high speed */
 static unsigned long hs_tx_buf = UDC_EPIN_BUFF_SIZE;
 
-/* module parameters */
-module_param(use_dma, bool, S_IRUGO);
-MODULE_PARM_DESC(use_dma, "true for DMA");
-module_param(use_dma_ppb, bool, S_IRUGO);
-MODULE_PARM_DESC(use_dma_ppb, "true for DMA in packet per buffer mode");
-module_param(use_dma_ppb_du, bool, S_IRUGO);
-MODULE_PARM_DESC(use_dma_ppb_du,
-	"true for DMA in packet per buffer mode with descriptor update");
-module_param(use_fullspeed, bool, S_IRUGO);
-MODULE_PARM_DESC(use_fullspeed, "true for fullspeed only");
-
 /*---------------------------------------------------------------------------*/
 /* Prints UDC device registers and endpoint irq registers */
 static void print_regs(struct udc *dev)
@@ -267,7 +225,7 @@ static void print_regs(struct udc *dev)
 }
 
 /* Masks unused interrupts */
-static int udc_mask_unused_interrupts(struct udc *dev)
+int udc_mask_unused_interrupts(struct udc *dev)
 {
 	u32 tmp;
 
@@ -287,6 +245,7 @@ static int udc_mask_unused_interrupts(struct udc *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(udc_mask_unused_interrupts);
 
 /* Enables endpoint 0 interrupts */
 static int udc_enable_ep0_interrupts(struct udc *dev)
@@ -306,7 +265,7 @@ static int udc_enable_ep0_interrupts(struct udc *dev)
 }
 
 /* Enables device interrupts for SET_INTF and SET_CONFIG */
-static int udc_enable_dev_setup_interrupts(struct udc *dev)
+int udc_enable_dev_setup_interrupts(struct udc *dev)
 {
 	u32 tmp;
 
@@ -325,6 +284,7 @@ static int udc_enable_dev_setup_interrupts(struct udc *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(udc_enable_dev_setup_interrupts);
 
 /* Calculates fifo start of endpoint based on preceding endpoints */
 static int udc_set_txfifo_addr(struct udc_ep *ep)
@@ -1507,7 +1467,7 @@ static void make_ep_lists(struct udc *dev)
 }
 
 /* Inits UDC context */
-static void udc_basic_init(struct udc *dev)
+void udc_basic_init(struct udc *dev)
 {
 	u32	tmp;
 
@@ -1543,6 +1503,7 @@ static void udc_basic_init(struct udc *dev)
 	dev->data_ep_enabled = 0;
 	dev->data_ep_queued = 0;
 }
+EXPORT_SYMBOL_GPL(udc_basic_init);
 
 /* init registers at driver load time */
 static int startup_registers(struct udc *dev)
@@ -3031,7 +2992,7 @@ __acquires(dev->lock)
 }
 
 /* Interrupt Service Routine, see Linux Kernel Doc for parameters */
-static irqreturn_t udc_irq(int irq, void *pdev)
+irqreturn_t udc_irq(int irq, void *pdev)
 {
 	struct udc *dev = pdev;
 	u32 reg;
@@ -3083,16 +3044,18 @@ static irqreturn_t udc_irq(int irq, void *pdev)
 	spin_unlock(&dev->lock);
 	return ret_val;
 }
+EXPORT_SYMBOL_GPL(udc_irq);
 
 /* Tears down device */
-static void gadget_release(struct device *pdev)
+void gadget_release(struct device *pdev)
 {
 	struct amd5536udc *dev = dev_get_drvdata(pdev);
 	kfree(dev);
 }
+EXPORT_SYMBOL_GPL(gadget_release);
 
 /* Cleanup on device remove */
-static void udc_remove(struct udc *dev)
+void udc_remove(struct udc *dev)
 {
 	/* remove timer */
 	stop_timer++;
@@ -3108,9 +3071,10 @@ static void udc_remove(struct udc *dev)
 		del_timer_sync(&udc_pollstall_timer);
 	udc = NULL;
 }
+EXPORT_SYMBOL_GPL(udc_remove);
 
 /* free all the dma pools */
-static void free_dma_pools(struct udc *dev)
+void free_dma_pools(struct udc *dev)
 {
 	dma_pool_free(dev->stp_requests, dev->ep[UDC_EP0OUT_IX].td,
 		      dev->ep[UDC_EP0OUT_IX].td_phys);
@@ -3119,35 +3083,10 @@ static void free_dma_pools(struct udc *dev)
 	dma_pool_destroy(dev->stp_requests);
 	dma_pool_destroy(dev->data_requests);
 }
-
-/* Reset all pci context */
-static void udc_pci_remove(struct pci_dev *pdev)
-{
-	struct udc		*dev;
-
-	dev = pci_get_drvdata(pdev);
-
-	usb_del_gadget_udc(&udc->gadget);
-	/* gadget driver must not be registered */
-	if (WARN_ON(dev->driver))
-		return;
-
-	/* dma pool cleanup */
-	free_dma_pools(dev);
-
-	/* reset controller */
-	writel(AMD_BIT(UDC_DEVCFG_SOFTRESET), &dev->regs->cfg);
-	free_irq(pdev->irq, dev);
-	iounmap(dev->virt_addr);
-	release_mem_region(pci_resource_start(pdev, 0),
-			   pci_resource_len(pdev, 0));
-	pci_disable_device(pdev);
-
-	udc_remove(dev);
-}
+EXPORT_SYMBOL_GPL(free_dma_pools);
 
 /* create dma pools on init */
-static int init_dma_pools(struct udc *dev)
+int init_dma_pools(struct udc *dev)
 {
 	struct udc_stp_dma	*td_stp;
 	struct udc_data_dma	*td_data;
@@ -3210,9 +3149,10 @@ static int init_dma_pools(struct udc *dev)
 	dev->data_requests = NULL;
 	return retval;
 }
+EXPORT_SYMBOL_GPL(init_dma_pools);
 
 /* general probe */
-static int udc_probe(struct udc *dev)
+int udc_probe(struct udc *dev)
 {
 	char		tmp[128];
 	u32		reg;
@@ -3276,137 +3216,7 @@ static int udc_probe(struct udc *dev)
 finished:
 	return retval;
 }
-
-/* Called by pci bus driver to init pci context */
-static int udc_pci_probe(
-	struct pci_dev *pdev,
-	const struct pci_device_id *id
-)
-{
-	struct udc		*dev;
-	unsigned long		resource;
-	unsigned long		len;
-	int			retval = 0;
-
-	/* one udc only */
-	if (udc) {
-		dev_dbg(&pdev->dev, "already probed\n");
-		return -EBUSY;
-	}
-
-	/* init */
-	dev = kzalloc(sizeof(struct udc), GFP_KERNEL);
-	if (!dev)
-		return -ENOMEM;
-
-	/* pci setup */
-	if (pci_enable_device(pdev) < 0) {
-		retval = -ENODEV;
-		goto err_pcidev;
-	}
-
-	/* PCI resource allocation */
-	resource = pci_resource_start(pdev, 0);
-	len = pci_resource_len(pdev, 0);
-
-	if (!request_mem_region(resource, len, name)) {
-		dev_dbg(&pdev->dev, "pci device used already\n");
-		retval = -EBUSY;
-		goto err_memreg;
-	}
-
-	dev->virt_addr = ioremap_nocache(resource, len);
-	if (!dev->virt_addr) {
-		dev_dbg(&pdev->dev, "start address cannot be mapped\n");
-		retval = -EFAULT;
-		goto err_ioremap;
-	}
-
-	if (!pdev->irq) {
-		dev_err(&pdev->dev, "irq not set\n");
-		retval = -ENODEV;
-		goto err_irq;
-	}
-
-	spin_lock_init(&dev->lock);
-	/* udc csr registers base */
-	dev->csr = dev->virt_addr + UDC_CSR_ADDR;
-	/* dev registers base */
-	dev->regs = dev->virt_addr + UDC_DEVCFG_ADDR;
-	/* ep registers base */
-	dev->ep_regs = dev->virt_addr + UDC_EPREGS_ADDR;
-	/* fifo's base */
-	dev->rxfifo = (u32 __iomem *)(dev->virt_addr + UDC_RXFIFO_ADDR);
-	dev->txfifo = (u32 __iomem *)(dev->virt_addr + UDC_TXFIFO_ADDR);
-
-	if (request_irq(pdev->irq, udc_irq, IRQF_SHARED, name, dev) != 0) {
-		dev_dbg(&pdev->dev, "request_irq(%d) fail\n", pdev->irq);
-		retval = -EBUSY;
-		goto err_irq;
-	}
-
-	pci_set_drvdata(pdev, dev);
-
-	/* chip revision for Hs AMD5536 */
-	dev->chiprev = pdev->revision;
-
-	pci_set_master(pdev);
-	pci_try_set_mwi(pdev);
-
-	/* init dma pools */
-	if (use_dma) {
-		retval = init_dma_pools(dev);
-		if (retval != 0)
-			goto err_dma;
-	}
-
-	dev->phys_addr = resource;
-	dev->irq = pdev->irq;
-	dev->pdev = pdev;
-
-	/* general probing */
-	if (udc_probe(dev)) {
-		retval = -ENODEV;
-		goto err_probe;
-	}
-	return 0;
-
-err_probe:
-	if (use_dma)
-		free_dma_pools(dev);
-err_dma:
-	free_irq(pdev->irq, dev);
-err_irq:
-	iounmap(dev->virt_addr);
-err_ioremap:
-	release_mem_region(resource, len);
-err_memreg:
-	pci_disable_device(pdev);
-err_pcidev:
-	kfree(dev);
-	return retval;
-}
-
-/* PCI device parameters */
-static const struct pci_device_id pci_id[] = {
-	{
-		PCI_DEVICE(PCI_VENDOR_ID_AMD, 0x2096),
-		.class =	PCI_CLASS_SERIAL_USB_DEVICE,
-		.class_mask =	0xffffffff,
-	},
-	{},
-};
-MODULE_DEVICE_TABLE(pci, pci_id);
-
-/* PCI functions */
-static struct pci_driver udc_pci_driver = {
-	.name =		(char *) name,
-	.id_table =	pci_id,
-	.probe =	udc_pci_probe,
-	.remove =	udc_pci_remove,
-};
-
-module_pci_driver(udc_pci_driver);
+EXPORT_SYMBOL_GPL(udc_probe);
 
 MODULE_DESCRIPTION(UDC_MOD_DESCRIPTION);
 MODULE_AUTHOR("Thomas Dahlmann");
diff --git a/drivers/usb/gadget/udc/amd5536udc.h b/drivers/usb/gadget/udc/amd5536udc.h
index 4638d70..bd2a18e 100644
--- a/drivers/usb/gadget/udc/amd5536udc.h
+++ b/drivers/usb/gadget/udc/amd5536udc.h
@@ -13,6 +13,12 @@
 #ifndef AMD5536UDC_H
 #define AMD5536UDC_H
 
+/* debug control */
+/* #define UDC_VERBOSE */
+
+#include <linux/usb/ch9.h>
+#include <linux/usb/gadget.h>
+
 /* various constants */
 #define UDC_RDE_TIMER_SECONDS		1
 #define UDC_RDE_TIMER_DIV		10
@@ -567,6 +573,36 @@ union udc_setup_data {
 	struct usb_ctrlrequest	request;
 };
 
+/* Function declarations */
+int udc_enable_dev_setup_interrupts(struct udc *dev);
+int udc_mask_unused_interrupts(struct udc *dev);
+irqreturn_t udc_irq(int irq, void *pdev);
+void gadget_release(struct device *pdev);
+void udc_basic_init(struct udc *dev);
+void free_dma_pools(struct udc *dev);
+int init_dma_pools(struct udc *dev);
+void udc_remove(struct udc *dev);
+int udc_probe(struct udc *dev);
+
+/* DMA usage flag */
+static bool use_dma = 1;
+/* packet per buffer dma */
+static bool use_dma_ppb = 1;
+/* with per descr. update */
+static bool use_dma_ppb_du;
+/* full speed only mode */
+static bool use_fullspeed;
+
+/* module parameters */
+module_param(use_dma, bool, S_IRUGO);
+MODULE_PARM_DESC(use_dma, "true for DMA");
+module_param(use_dma_ppb, bool, S_IRUGO);
+MODULE_PARM_DESC(use_dma_ppb, "true for DMA in packet per buffer mode");
+module_param(use_dma_ppb_du, bool, S_IRUGO);
+MODULE_PARM_DESC(use_dma_ppb_du,
+	"true for DMA in packet per buffer mode with descriptor update");
+module_param(use_fullspeed, bool, S_IRUGO);
+MODULE_PARM_DESC(use_fullspeed, "true for fullspeed only");
 /*
  *---------------------------------------------------------------------------
  * SET and GET bitfields in u32 values
diff --git a/drivers/usb/gadget/udc/amd5536udc_pci.c b/drivers/usb/gadget/udc/amd5536udc_pci.c
new file mode 100644
index 0000000..2a2d0a9
--- /dev/null
+++ b/drivers/usb/gadget/udc/amd5536udc_pci.c
@@ -0,0 +1,217 @@
+/*
+ * amd5536udc_pci.c -- AMD 5536 UDC high/full speed USB device controller
+ *
+ * Copyright (C) 2005-2007 AMD (http://www.amd.com)
+ * Author: Thomas Dahlmann
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+/*
+ * The AMD5536 UDC is part of the x86 southbridge AMD Geode CS5536.
+ * It is a USB Highspeed DMA capable USB device controller. Beside ep0 it
+ * provides 4 IN and 4 OUT endpoints (bulk or interrupt type).
+ *
+ * Make sure that UDC is assigned to port 4 by BIOS settings (port can also
+ * be used as host port) and UOC bits PAD_EN and APU are set (should be done
+ * by BIOS init).
+ *
+ * UDC DMA requires 32-bit aligned buffers so DMA with gadget ether does not
+ * work without updating NET_IP_ALIGN. Or PIO mode (module param "use_dma=0")
+ * can be used with gadget ether.
+ *
+ * This file does pci device registration, and the core driver implementation
+ * is done in amd5536udc.c
+ *
+ * The driver is split so as to use the core UDC driver which is based on
+ * Synopsys device controller IP (different than HS OTG IP) in UDCs
+ * integrated to SoC platforms.
+ *
+ */
+
+/* Driver strings */
+#define UDC_MOD_DESCRIPTION		"AMD 5536 UDC - USB Device Controller"
+
+/* system */
+#include <linux/device.h>
+#include <linux/dmapool.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/prefetch.h>
+#include <linux/pci.h>
+
+/* udc specific */
+#include "amd5536udc.h"
+
+/* pointer to device object */
+static struct udc *udc;
+
+/* description */
+static const char mod_desc[] = UDC_MOD_DESCRIPTION;
+static const char name[] = "amd5536udc-pci";
+
+/* Reset all pci context */
+static void udc_pci_remove(struct pci_dev *pdev)
+{
+	struct udc		*dev;
+
+	dev = pci_get_drvdata(pdev);
+
+	usb_del_gadget_udc(&udc->gadget);
+	/* gadget driver must not be registered */
+	if (WARN_ON(dev->driver))
+		return;
+
+	/* dma pool cleanup */
+	free_dma_pools(dev);
+
+	/* reset controller */
+	writel(AMD_BIT(UDC_DEVCFG_SOFTRESET), &dev->regs->cfg);
+	free_irq(pdev->irq, dev);
+	iounmap(dev->virt_addr);
+	release_mem_region(pci_resource_start(pdev, 0),
+			   pci_resource_len(pdev, 0));
+	pci_disable_device(pdev);
+
+	udc_remove(dev);
+}
+
+/* Called by pci bus driver to init pci context */
+static int udc_pci_probe(
+	struct pci_dev *pdev,
+	const struct pci_device_id *id
+)
+{
+	struct udc		*dev;
+	unsigned long		resource;
+	unsigned long		len;
+	int			retval = 0;
+
+	/* one udc only */
+	if (udc) {
+		dev_dbg(&pdev->dev, "already probed\n");
+		return -EBUSY;
+	}
+
+	/* init */
+	dev = kzalloc(sizeof(struct udc), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	/* pci setup */
+	if (pci_enable_device(pdev) < 0) {
+		retval = -ENODEV;
+		goto err_pcidev;
+	}
+
+	/* PCI resource allocation */
+	resource = pci_resource_start(pdev, 0);
+	len = pci_resource_len(pdev, 0);
+
+	if (!request_mem_region(resource, len, name)) {
+		dev_dbg(&pdev->dev, "pci device used already\n");
+		retval = -EBUSY;
+		goto err_memreg;
+	}
+
+	dev->virt_addr = ioremap_nocache(resource, len);
+	if (!dev->virt_addr) {
+		dev_dbg(&pdev->dev, "start address cannot be mapped\n");
+		retval = -EFAULT;
+		goto err_ioremap;
+	}
+
+	if (!pdev->irq) {
+		dev_err(&pdev->dev, "irq not set\n");
+		retval = -ENODEV;
+		goto err_irq;
+	}
+
+	spin_lock_init(&dev->lock);
+	/* udc csr registers base */
+	dev->csr = dev->virt_addr + UDC_CSR_ADDR;
+	/* dev registers base */
+	dev->regs = dev->virt_addr + UDC_DEVCFG_ADDR;
+	/* ep registers base */
+	dev->ep_regs = dev->virt_addr + UDC_EPREGS_ADDR;
+	/* fifo's base */
+	dev->rxfifo = (u32 __iomem *)(dev->virt_addr + UDC_RXFIFO_ADDR);
+	dev->txfifo = (u32 __iomem *)(dev->virt_addr + UDC_TXFIFO_ADDR);
+
+	if (request_irq(pdev->irq, udc_irq, IRQF_SHARED, name, dev) != 0) {
+		dev_dbg(&pdev->dev, "request_irq(%d) fail\n", pdev->irq);
+		retval = -EBUSY;
+		goto err_irq;
+	}
+
+	pci_set_drvdata(pdev, dev);
+
+	/* chip revision for Hs AMD5536 */
+	dev->chiprev = pdev->revision;
+
+	pci_set_master(pdev);
+	pci_try_set_mwi(pdev);
+
+	/* init dma pools */
+	if (use_dma) {
+		retval = init_dma_pools(dev);
+		if (retval != 0)
+			goto err_dma;
+	}
+
+	dev->phys_addr = resource;
+	dev->irq = pdev->irq;
+	dev->pdev = pdev;
+
+	/* general probing */
+	if (udc_probe(dev)) {
+		retval = -ENODEV;
+		goto err_probe;
+	}
+	return 0;
+
+err_probe:
+	if (use_dma)
+		free_dma_pools(dev);
+err_dma:
+	free_irq(pdev->irq, dev);
+err_irq:
+	iounmap(dev->virt_addr);
+err_ioremap:
+	release_mem_region(resource, len);
+err_memreg:
+	pci_disable_device(pdev);
+err_pcidev:
+	kfree(dev);
+	return retval;
+}
+
+/* PCI device parameters */
+static const struct pci_device_id pci_id[] = {
+	{
+		PCI_DEVICE(PCI_VENDOR_ID_AMD, 0x2096),
+		.class =	PCI_CLASS_SERIAL_USB_DEVICE,
+		.class_mask =	0xffffffff,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(pci, pci_id);
+
+/* PCI functions */
+static struct pci_driver udc_pci_driver = {
+	.name =		(char *) name,
+	.id_table =	pci_id,
+	.probe =	udc_pci_probe,
+	.remove =	udc_pci_remove,
+};
+module_pci_driver(udc_pci_driver);
+
+MODULE_DESCRIPTION(UDC_MOD_DESCRIPTION);
+MODULE_AUTHOR("Thomas Dahlmann");
+MODULE_LICENSE("GPL");
-- 
2.1.0
