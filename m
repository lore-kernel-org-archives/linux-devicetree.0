From: Pawel Laszczak <pawell@cadence.com>
Subject: [RFC PATCH v2 01/15] usb:cdns3: add pci to platform driver wrapper.
Date: Sun, 18 Nov 2018 10:08:57 +0000
Message-ID: <1542535751-16079-2-git-send-email-pawell@cadence.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542535751-16079-1-git-send-email-pawell@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, rogerq@ti.com, linux-kernel@vger.kernel.org, adouglas@cadence.com, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com, Pawel Laszczak <pawell@cadence.com>
List-Id: devicetree@vger.kernel.org

Patch adds PCI specific glue driver that creates and registers in-system
cdns-usb3 platform device. Thanks to that we will be able to use
the cdns-usb3 platform driver for USBSS-DEV controller
build on PCI board

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
 drivers/usb/Kconfig                |   2 +
 drivers/usb/Makefile               |   2 +
 drivers/usb/cdns3/Kconfig          |  24 +++++
 drivers/usb/cdns3/Makefile         |   3 +
 drivers/usb/cdns3/cdns3-pci-wrap.c | 157 +++++++++++++++++++++++++++++
 5 files changed, 188 insertions(+)
 create mode 100644 drivers/usb/cdns3/Kconfig
 create mode 100644 drivers/usb/cdns3/Makefile
 create mode 100644 drivers/usb/cdns3/cdns3-pci-wrap.c

diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
index 987fc5ba6321..5f9334019d04 100644
--- a/drivers/usb/Kconfig
+++ b/drivers/usb/Kconfig
@@ -112,6 +112,8 @@ source "drivers/usb/usbip/Kconfig"
 
 endif
 
+source "drivers/usb/cdns3/Kconfig"
+
 source "drivers/usb/mtu3/Kconfig"
 
 source "drivers/usb/musb/Kconfig"
diff --git a/drivers/usb/Makefile b/drivers/usb/Makefile
index 7d1b8c82b208..82093a60ea2c 100644
--- a/drivers/usb/Makefile
+++ b/drivers/usb/Makefile
@@ -8,6 +8,8 @@
 obj-$(CONFIG_USB)		+= core/
 obj-$(CONFIG_USB_SUPPORT)	+= phy/
 
+obj-$(CONFIG_USB_CDNS3)		+= cdns3/
+
 obj-$(CONFIG_USB_DWC3)		+= dwc3/
 obj-$(CONFIG_USB_DWC2)		+= dwc2/
 obj-$(CONFIG_USB_ISP1760)	+= isp1760/
diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
new file mode 100644
index 000000000000..eb22a8692991
--- /dev/null
+++ b/drivers/usb/cdns3/Kconfig
@@ -0,0 +1,24 @@
+config USB_CDNS3
+	tristate "Cadence USB3 Dual-Role Controller"
+	depends on USB_SUPPORT && (USB || USB_GADGET) && HAS_DMA
+	help
+	  Say Y here if your system has a cadence USB3 dual-role controller.
+	  It supports: dual-role switch, Host-only, and Peripheral-only.
+
+	  If you choose to build this driver is a dynamically linked
+	  module, the module will be called cdns3.ko.
+
+if USB_CDNS3
+
+config USB_CDNS3_PCI_WRAP
+	tristate "PCIe-based Platforms"
+	depends on USB_PCI && ACPI
+	default USB_CDNS3
+	help
+	  If you're using the USBSS Core IP with a PCIe, please say
+	  'Y' or 'M' here.
+
+	  If you choose to build this driver as module it will
+	  be dynamically linked and module will be called cdns3-pci.ko
+
+endif
diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
new file mode 100644
index 000000000000..dcdd62003c6a
--- /dev/null
+++ b/drivers/usb/cdns3/Makefile
@@ -0,0 +1,3 @@
+obj-$(CONFIG_USB_CDNS3_PCI_WRAP)	+= cdns3-pci.o
+
+cdns3-pci-y		 		:= cdns3-pci-wrap.o
diff --git a/drivers/usb/cdns3/cdns3-pci-wrap.c b/drivers/usb/cdns3/cdns3-pci-wrap.c
new file mode 100644
index 000000000000..d0a15cc0b738
--- /dev/null
+++ b/drivers/usb/cdns3/cdns3-pci-wrap.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cadence USBSS PCI Glue driver
+ *
+ * Copyright (C) 2018 Cadence.
+ *
+ * Author: Pawel Laszczak <pawell@cadence.com>
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
+#include <linux/slab.h>
+
+struct cdns3_wrap {
+	struct platform_device *plat_dev;
+	struct pci_dev *hg_dev;
+	struct resource dev_res[4];
+};
+
+struct cdns3_wrap wrap;
+
+#define RES_IRQ_ID		0
+#define RES_HOST_ID		1
+#define RES_DEV_ID		2
+#define RES_DRD_ID		3
+
+#define PCI_BAR_HOST		0
+#define PCI_BAR_DEV		2
+#define PCI_BAR_OTG		4
+
+#define PCI_DEV_FN_HOST_DEVICE	0
+#define PCI_DEV_FN_OTG		1
+
+#define PCI_DRIVER_NAME		"cdns3-pci-usbss"
+#define PLAT_DRIVER_NAME	"cdns-usb3"
+
+#define CDNS_VENDOR_ID 0x17cd
+#define CDNS_DEVICE_ID 0x0100
+
+/**
+ * cdns3_pci_probe - Probe function for Cadence USB wrapper driver
+ * @pdev: platform device object
+ * @id: pci device id
+ *
+ * Returns 0 on success otherwise negative errno
+ */
+static int cdns3_pci_probe(struct pci_dev *pdev,
+			   const struct pci_device_id *id)
+{
+	struct platform_device_info plat_info;
+	struct cdns3_wrap *wrap;
+	struct resource *res;
+	int err;
+
+	/*
+	 * for GADGET/HOST PCI (devfn) function number is 0,
+	 * for OTG PCI (devfn) function number is 1
+	 */
+	if (!id || pdev->devfn != PCI_DEV_FN_HOST_DEVICE)
+		return -EINVAL;
+
+	err = pcim_enable_device(pdev);
+	if (err) {
+		dev_err(&pdev->dev, "Enabling PCI device has failed %d\n", err);
+		return err;
+	}
+
+	pci_set_master(pdev);
+	wrap = devm_kzalloc(&pdev->dev, sizeof(*wrap), GFP_KERNEL);
+	if (!wrap) {
+		dev_err(&pdev->dev, "Failed to load PCI module\n");
+		return -ENOMEM;
+	}
+
+	/* function 0: host(BAR_0) + device(BAR_1) + otg(BAR_2)). */
+	memset(wrap->dev_res, 0x00,
+	       sizeof(struct resource) * ARRAY_SIZE(wrap->dev_res));
+	dev_dbg(&pdev->dev, "Initialize Device resources\n");
+	res = wrap->dev_res;
+
+	res[RES_DEV_ID].start = pci_resource_start(pdev, PCI_BAR_DEV);
+	res[RES_DEV_ID].end =   pci_resource_end(pdev, PCI_BAR_DEV);
+	res[RES_DEV_ID].name = "cdns3-dev-regs";
+	res[RES_DEV_ID].flags = IORESOURCE_MEM;
+	dev_dbg(&pdev->dev, "USBSS-DEV physical base addr: %pa\n",
+		&res[RES_DEV_ID].start);
+
+	res[RES_HOST_ID].start = pci_resource_start(pdev, PCI_BAR_HOST);
+	res[RES_HOST_ID].end = pci_resource_end(pdev, PCI_BAR_HOST);
+	res[RES_HOST_ID].name = "cdns3-xhci-regs";
+	res[RES_HOST_ID].flags = IORESOURCE_MEM;
+	dev_dbg(&pdev->dev, "USBSS-XHCI physical base addr: %pa\n",
+		&res[RES_HOST_ID].start);
+
+	res[RES_DRD_ID].start = pci_resource_start(pdev, PCI_BAR_OTG);
+	res[RES_DRD_ID].end =   pci_resource_end(pdev, PCI_BAR_OTG);
+	res[RES_DRD_ID].name = "cdns3-otg";
+	res[RES_DRD_ID].flags = IORESOURCE_MEM;
+	dev_dbg(&pdev->dev, "USBSS-DRD physical base addr: %pa\n",
+		&res[RES_DRD_ID].start);
+
+	/* Interrupt common for both device and XHCI */
+	wrap->dev_res[RES_IRQ_ID].start = pdev->irq;
+	wrap->dev_res[RES_IRQ_ID].name = "cdns3-irq";
+	wrap->dev_res[RES_IRQ_ID].flags = IORESOURCE_IRQ;
+
+	/* set up platform device info */
+	memset(&plat_info, 0, sizeof(plat_info));
+	plat_info.parent = &pdev->dev;
+	plat_info.fwnode = pdev->dev.fwnode;
+	plat_info.name = PLAT_DRIVER_NAME;
+	plat_info.id = pdev->devfn;
+	plat_info.res = wrap->dev_res;
+	plat_info.num_res = ARRAY_SIZE(wrap->dev_res);
+	plat_info.dma_mask = pdev->dma_mask;
+
+	/* register platform device */
+	wrap->plat_dev = platform_device_register_full(&plat_info);
+	if (IS_ERR(wrap->plat_dev)) {
+		err = PTR_ERR(wrap->plat_dev);
+		return err;
+	}
+
+	pci_set_drvdata(pdev, wrap);
+
+	return err;
+}
+
+void cdns3_pci_remove(struct pci_dev *pdev)
+{
+	struct cdns3_wrap *wrap = (struct cdns3_wrap *)pci_get_drvdata(pdev);
+
+	platform_device_unregister(wrap->plat_dev);
+}
+
+static const struct pci_device_id cdns3_pci_ids[] = {
+	{ PCI_DEVICE(CDNS_VENDOR_ID, CDNS_DEVICE_ID), },
+	{ 0, }
+};
+
+static struct pci_driver cdns3_pci_driver = {
+	.name = PCI_DRIVER_NAME,
+	.id_table = cdns3_pci_ids,
+	.probe = cdns3_pci_probe,
+	.remove = cdns3_pci_remove,
+};
+
+module_pci_driver(cdns3_pci_driver);
+MODULE_DEVICE_TABLE(pci, cdns3_pci_ids);
+
+MODULE_AUTHOR("Pawel Laszczak <pawell@cadence.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Cadence USBSS PCI wrapperr");
+
-- 
2.17.1
