From: Pawel Laszczak <pawell@cadence.com>
Subject: [RFC PATCH v2 06/15] usb:cdns3: Adds Host support
Date: Sun, 18 Nov 2018 10:09:02 +0000
Message-ID: <1542535751-16079-7-git-send-email-pawell@cadence.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542535751-16079-1-git-send-email-pawell@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, rogerq@ti.com, linux-kernel@vger.kernel.org, adouglas@cadence.com, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com, Pawel Laszczak <pawell@cadence.com>
List-Id: devicetree@vger.kernel.org

Patch adds host-export.h and host.c file and mplements functions that
allow to initialize, start and stop XHCI host driver.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
 drivers/usb/cdns3/Kconfig       |  10 ++
 drivers/usb/cdns3/Makefile      |   1 +
 drivers/usb/cdns3/core.c        |   7 +-
 drivers/usb/cdns3/host-export.h |  30 ++++
 drivers/usb/cdns3/host.c        | 256 ++++++++++++++++++++++++++++++++
 5 files changed, 302 insertions(+), 2 deletions(-)
 create mode 100644 drivers/usb/cdns3/host-export.h
 create mode 100644 drivers/usb/cdns3/host.c

diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
index eb22a8692991..d92bc3d68eb0 100644
--- a/drivers/usb/cdns3/Kconfig
+++ b/drivers/usb/cdns3/Kconfig
@@ -10,6 +10,16 @@ config USB_CDNS3
 
 if USB_CDNS3
 
+config USB_CDNS3_HOST
+        bool "Cadence USB3 host controller"
+        depends on USB_XHCI_HCD
+        help
+          Say Y here to enable host controller functionality of the
+          cadence driver.
+
+          Host controller is compliance with XHCI so it will use
+          standard XHCI driver.
+
 config USB_CDNS3_PCI_WRAP
 	tristate "PCIe-based Platforms"
 	depends on USB_PCI && ACPI
diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
index e779b2a2f8eb..976117ba67ff 100644
--- a/drivers/usb/cdns3/Makefile
+++ b/drivers/usb/cdns3/Makefile
@@ -2,4 +2,5 @@ obj-$(CONFIG_USB_CDNS3)			+= cdns3.o
 obj-$(CONFIG_USB_CDNS3_PCI_WRAP)	+= cdns3-pci.o
 
 cdns3-y					:= core.o drd.o
+cdns3-$(CONFIG_USB_CDNS3_HOST)          += host.o
 cdns3-pci-y		 		:= cdns3-pci-wrap.o
diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index dbee4325da7f..4cb820be9ff3 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -17,6 +17,7 @@
 
 #include "gadget.h"
 #include "core.h"
+#include "host-export.h"
 #include "drd.h"
 
 static inline struct cdns3_role_driver *cdns3_get_current_role_driver(struct cdns3 *cdns)
@@ -98,7 +99,8 @@ static int cdns3_core_init_role(struct cdns3 *cdns)
 	}
 
 	if (dr_mode == USB_DR_MODE_OTG || dr_mode == USB_DR_MODE_HOST) {
-		//TODO: implements host initialization
+		if (cdns3_host_init(cdns))
+			dev_info(dev, "doesn't support host\n");
 	}
 
 	if (dr_mode == USB_DR_MODE_OTG || dr_mode == USB_DR_MODE_PERIPHERAL) {
@@ -142,7 +144,7 @@ static irqreturn_t cdns3_irq(int irq, void *data)
 
 static void cdns3_remove_roles(struct cdns3 *cdns)
 {
-	//TODO: implements this function
+	cdns3_host_remove(cdns);
 }
 
 static int cdns3_do_role_switch(struct cdns3 *cdns, enum cdns3_roles role)
@@ -410,6 +412,7 @@ static struct platform_driver cdns3_driver = {
 
 static int __init cdns3_driver_platform_register(void)
 {
+	cdns3_host_driver_init();
 	return platform_driver_register(&cdns3_driver);
 }
 module_init(cdns3_driver_platform_register);
diff --git a/drivers/usb/cdns3/host-export.h b/drivers/usb/cdns3/host-export.h
new file mode 100644
index 000000000000..f8f3b230b472
--- /dev/null
+++ b/drivers/usb/cdns3/host-export.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Cadence USBSS DRD Driver -Host Export APIs
+ *
+ * Copyright (C) 2017 NXP
+ *
+ * Authors: Peter Chen <peter.chen@nxp.com>
+ */
+#ifndef __LINUX_CDNS3_HOST_EXPORT
+#define __LINUX_CDNS3_HOST_EXPORT
+
+#ifdef CONFIG_USB_CDNS3_HOST
+
+int cdns3_host_init(struct cdns3 *cdns);
+void cdns3_host_remove(struct cdns3 *cdns);
+void cdns3_host_driver_init(void);
+
+#else
+
+static inline int cdns3_host_init(struct cdns3 *cdns)
+{
+	return -ENXIO;
+}
+
+static inline void cdns3_host_remove(struct cdns3 *cdns) { }
+static inline void cdns3_host_driver_init(void) {}
+
+#endif /* CONFIG_USB_CDNS3_HOST */
+
+#endif /* __LINUX_CDNS3_HOST_EXPORT */
diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
new file mode 100644
index 000000000000..0dd47976cb28
--- /dev/null
+++ b/drivers/usb/cdns3/host.c
@@ -0,0 +1,256 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cadence USBSS DRD Driver - host side
+ *
+ * Copyright (C) 2018 Cadence Design Systems.
+ * Copyright (C) 2018 NXP
+ *
+ * Authors: Peter Chen <peter.chen@nxp.com>
+ *	    Pawel Laszczak <pawell@cadence.com>
+ */
+
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/dma-mapping.h>
+#include <linux/usb.h>
+#include <linux/usb/hcd.h>
+#include <linux/pm_runtime.h>
+#include <linux/usb/of.h>
+
+#include "../host/xhci.h"
+#include "core.h"
+#include "host-export.h"
+
+static struct hc_driver __read_mostly xhci_cdns3_hc_driver;
+
+static void xhci_cdns3_quirks(struct device *dev, struct xhci_hcd *xhci)
+{
+	/*
+	 * As of now platform drivers don't provide MSI support so we ensure
+	 * here that the generic code does not try to make a pci_dev from our
+	 * dev struct in order to setup MSI
+	 */
+	xhci->quirks |= XHCI_PLAT;
+}
+
+static int xhci_cdns3_setup(struct usb_hcd *hcd)
+{
+	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
+	u32 command;
+	int ret;
+
+	ret = xhci_gen_setup(hcd, xhci_cdns3_quirks);
+	if (ret)
+		return ret;
+
+	/* set usbcmd.EU3S */
+	command = readl(&xhci->op_regs->command);
+	command |= CMD_PM_INDEX;
+	writel(command, &xhci->op_regs->command);
+
+	return 0;
+}
+
+static const struct xhci_driver_overrides xhci_cdns3_overrides __initconst = {
+	.extra_priv_size = sizeof(struct xhci_hcd),
+	.reset = xhci_cdns3_setup,
+};
+
+struct cdns3_host {
+	struct device dev;
+	struct usb_hcd *hcd;
+};
+
+static irqreturn_t cdns3_host_irq(struct cdns3 *cdns)
+{
+	struct device *dev = cdns->host_dev;
+	struct usb_hcd	*hcd;
+
+	if (dev)
+		hcd = dev_get_drvdata(dev);
+	else
+		return IRQ_NONE;
+
+	if (hcd)
+		return usb_hcd_irq(cdns->irq, hcd);
+	else
+		return IRQ_NONE;
+}
+
+static void cdns3_host_release(struct device *dev)
+{
+	struct cdns3_host *host = container_of(dev, struct cdns3_host, dev);
+
+	kfree(host);
+}
+
+static int cdns3_host_start(struct cdns3 *cdns)
+{
+	struct cdns3_host *host;
+	struct device *dev;
+	struct device *sysdev;
+	struct xhci_hcd	*xhci;
+	int ret;
+
+	host = kzalloc(sizeof(*host), GFP_KERNEL);
+	if (!host)
+		return -ENOMEM;
+
+	dev = &host->dev;
+	dev->release = cdns3_host_release;
+	dev->parent = cdns->dev;
+	dev_set_name(dev, "xhci-cdns3");
+	cdns->host_dev = dev;
+	ret = device_register(dev);
+	if (ret)
+		goto err1;
+
+	sysdev = cdns->dev;
+	/* Try to set 64-bit DMA first */
+	if (WARN_ON(!sysdev->dma_mask))
+		/* Platform did not initialize dma_mask */
+		ret = dma_coerce_mask_and_coherent(sysdev,
+						   DMA_BIT_MASK(64));
+	else
+		ret = dma_set_mask_and_coherent(sysdev, DMA_BIT_MASK(64));
+
+	/* If setting 64-bit DMA mask fails, fall back to 32-bit DMA mask */
+	if (ret) {
+		ret = dma_set_mask_and_coherent(sysdev, DMA_BIT_MASK(32));
+		if (ret)
+			return ret;
+	}
+
+	pm_runtime_set_active(dev);
+	pm_runtime_no_callbacks(dev);
+	pm_runtime_enable(dev);
+	host->hcd = __usb_create_hcd(&xhci_cdns3_hc_driver, sysdev, dev,
+				     dev_name(dev), NULL);
+	if (!host->hcd) {
+		ret = -ENOMEM;
+		goto err2;
+	}
+
+	host->hcd->regs = cdns->xhci_regs;
+	host->hcd->rsrc_start = cdns->xhci_res->start;
+	host->hcd->rsrc_len = resource_size(cdns->xhci_res);
+
+	device_wakeup_enable(host->hcd->self.controller);
+	xhci = hcd_to_xhci(host->hcd);
+
+	xhci->main_hcd = host->hcd;
+	xhci->shared_hcd = __usb_create_hcd(&xhci_cdns3_hc_driver, sysdev, dev,
+					    dev_name(dev), host->hcd);
+	if (!xhci->shared_hcd) {
+		ret = -ENOMEM;
+		goto err3;
+	}
+
+	host->hcd->tpl_support = of_usb_host_tpl_support(sysdev->of_node);
+	xhci->shared_hcd->tpl_support = host->hcd->tpl_support;
+	ret = usb_add_hcd(host->hcd, 0, IRQF_SHARED);
+	if (ret)
+		goto err4;
+
+	ret = usb_add_hcd(xhci->shared_hcd, 0, IRQF_SHARED);
+	if (ret)
+		goto err5;
+
+	device_set_wakeup_capable(dev, true);
+
+	return 0;
+
+err5:
+	usb_remove_hcd(host->hcd);
+err4:
+	usb_put_hcd(xhci->shared_hcd);
+err3:
+	usb_put_hcd(host->hcd);
+err2:
+	device_del(dev);
+err1:
+	put_device(dev);
+	cdns->host_dev = NULL;
+	return ret;
+}
+
+static void cdns3_host_stop(struct cdns3 *cdns)
+{
+	struct device *dev = cdns->host_dev;
+	struct xhci_hcd	*xhci;
+	struct usb_hcd	*hcd;
+
+	if (dev) {
+		hcd = dev_get_drvdata(dev);
+		xhci = hcd_to_xhci(hcd);
+		usb_remove_hcd(xhci->shared_hcd);
+		usb_remove_hcd(hcd);
+		synchronize_irq(cdns->irq);
+		usb_put_hcd(xhci->shared_hcd);
+		usb_put_hcd(hcd);
+		cdns->host_dev = NULL;
+		pm_runtime_set_suspended(dev);
+		pm_runtime_disable(dev);
+		device_del(dev);
+		put_device(dev);
+	}
+}
+
+#if CONFIG_PM
+static int cdns3_host_suspend(struct cdns3 *cdns, bool do_wakeup)
+{
+	struct device *dev = cdns->host_dev;
+	struct xhci_hcd	*xhci;
+
+	if (!dev)
+		return 0;
+
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	return xhci_suspend(xhci, do_wakeup);
+}
+
+static int cdns3_host_resume(struct cdns3 *cdns, bool hibernated)
+{
+	struct device *dev = cdns->host_dev;
+	struct xhci_hcd	*xhci;
+
+	if (!dev)
+		return 0;
+
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	return xhci_resume(xhci, hibernated);
+}
+#endif /* CONFIG_PM */
+
+int cdns3_host_init(struct cdns3 *cdns)
+{
+	struct cdns3_role_driver *rdrv;
+
+	rdrv = devm_kzalloc(cdns->dev, sizeof(*rdrv), GFP_KERNEL);
+	if (!rdrv)
+		return -ENOMEM;
+
+	rdrv->start	= cdns3_host_start;
+	rdrv->stop	= cdns3_host_stop;
+	rdrv->irq	= cdns3_host_irq;
+#if CONFIG_PM
+	rdrv->suspend	= cdns3_host_suspend;
+	rdrv->resume	= cdns3_host_resume;
+#endif /* CONFIG_PM */
+	rdrv->name	= "host";
+	cdns->roles[CDNS3_ROLE_HOST] = rdrv;
+
+	return 0;
+}
+
+void cdns3_host_remove(struct cdns3 *cdns)
+{
+	cdns3_host_stop(cdns);
+}
+
+void __init cdns3_host_driver_init(void)
+{
+	xhci_init_driver(&xhci_cdns3_hc_driver, &xhci_cdns3_overrides);
+}
-- 
2.17.1
