From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] xilinx_pcipr: Added Xilinx reconfigurable PCI endpoint driver.
Date: Mon, 28 Jun 2010 10:47:59 -0700
Message-ID: <eab0dbb2-2819-4d1e-b8fd-630fb0912b31@SG2EHSMHS006.ehs.local>
References: <1277747279-9236-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1277747279-9236-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<1277747279-9236-3-git-send-email-stephen.neuendorffer@xilinx.com>
	<1277747279-9236-4-git-send-email-stephen.neuendorffer@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1277747279-9236-4-git-send-email-stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This bus has an internal bus which contains some devices, which
are described in a device tree.  This code is *very* preliminary
and mainly exists to exercise the device tree code on an arbitrary
architecture.
---
 drivers/pci/Kconfig        |    9 ++
 drivers/pci/Makefile       |    2 +
 drivers/pci/xilinx_pcipr.c |  203 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 214 insertions(+), 0 deletions(-)
 create mode 100644 drivers/pci/xilinx_pcipr.c

diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
index 34ef70d..ec9b25d 100644
--- a/drivers/pci/Kconfig
+++ b/drivers/pci/Kconfig
@@ -65,3 +65,12 @@ config PCI_IOAPIC
 	depends on ACPI
 	depends on HOTPLUG
 	default y
+
+config XILINX_PCIPR
+	tristate "Xilinx OF-based PCI endpoint"
+	depends on PCI
+	select OF
+	select OF_FLATTREE
+        select OF_DEVICE
+	help
+	  Enable support for Xilinx PCIPR endpoint
\ No newline at end of file
diff --git a/drivers/pci/Makefile b/drivers/pci/Makefile
index 0b51857..ec44c21 100644
--- a/drivers/pci/Makefile
+++ b/drivers/pci/Makefile
@@ -62,6 +62,8 @@ obj-$(CONFIG_PCI_SYSCALL) += syscall.o
 
 obj-$(CONFIG_PCI_STUB) += pci-stub.o
 
+obj-$(CONFIG_XILINX_PCIPR) += xilinx_pcipr.o
+
 ifeq ($(CONFIG_PCI_DEBUG),y)
 EXTRA_CFLAGS += -DDEBUG
 endif
diff --git a/drivers/pci/xilinx_pcipr.c b/drivers/pci/xilinx_pcipr.c
new file mode 100644
index 0000000..17fde0b
--- /dev/null
+++ b/drivers/pci/xilinx_pcipr.c
@@ -0,0 +1,203 @@
+/*
+ *  Copyright 2010 Xilinx, Inc.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/pci.h>
+#include <linux/ide.h>
+#include <linux/init.h>
+#include <linux/dmi.h>
+
+#include <linux/of_fdt.h>
+#include <linux/of_platform.h>
+
+
+#include <asm/io.h>
+
+#define DRV_NAME "xilinx_pcipr"
+
+
+unsigned char pcipr_dtb[] = {
+  0xd0, 0x0d, 0xfe, 0xed, 0x00, 0x00, 0x01, 0x6a, 0x00, 0x00, 0x00, 0x38,
+  0x00, 0x00, 0x01, 0x24, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x11,
+  0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46,
+  0x00, 0x00, 0x00, 0xec, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01,
+  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04,
+  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03,
+  0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x0f, 0x00, 0x00, 0x00, 0x01,
+  0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x1b,
+  0x78, 0x6c, 0x6e, 0x78, 0x2c, 0x70, 0x6c, 0x62, 0x2d, 0x76, 0x34, 0x36,
+  0x2d, 0x31, 0x2e, 0x30, 0x33, 0x2e, 0x61, 0x00, 0x78, 0x6c, 0x6e, 0x78,
+  0x2c, 0x70, 0x6c, 0x62, 0x2d, 0x76, 0x34, 0x36, 0x2d, 0x31, 0x2e, 0x30,
+  0x30, 0x2e, 0x61, 0x00, 0x73, 0x69, 0x6d, 0x70, 0x6c, 0x65, 0x2d, 0x62,
+  0x75, 0x73, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x78, 0x70, 0x73, 0x2d,
+  0x68, 0x77, 0x69, 0x63, 0x61, 0x70, 0x40, 0x38, 0x30, 0x30, 0x33, 0x30,
+  0x30, 0x30, 0x30, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x17,
+  0x00, 0x00, 0x00, 0x1b, 0x78, 0x6c, 0x6e, 0x78, 0x2c, 0x78, 0x70, 0x73,
+  0x2d, 0x68, 0x77, 0x69, 0x63, 0x61, 0x70, 0x2d, 0x31, 0x2e, 0x30, 0x30,
+  0x2e, 0x61, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x08,
+  0x00, 0x00, 0x00, 0x26, 0x80, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00,
+  0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x2a,
+  0x76, 0x69, 0x72, 0x74, 0x65, 0x78, 0x35, 0x00, 0x00, 0x00, 0x00, 0x03,
+  0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x36, 0x66, 0x61, 0x6c, 0x73,
+  0x65, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02,
+  0x00, 0x00, 0x00, 0x09, 0x23, 0x61, 0x64, 0x64, 0x72, 0x65, 0x73, 0x73,
+  0x2d, 0x63, 0x65, 0x6c, 0x6c, 0x73, 0x00, 0x23, 0x73, 0x69, 0x7a, 0x65,
+  0x2d, 0x63, 0x65, 0x6c, 0x6c, 0x73, 0x00, 0x63, 0x6f, 0x6d, 0x70, 0x61,
+  0x74, 0x69, 0x62, 0x6c, 0x65, 0x00, 0x72, 0x65, 0x67, 0x00, 0x78, 0x6c,
+  0x6e, 0x78, 0x2c, 0x66, 0x61, 0x6d, 0x69, 0x6c, 0x79, 0x00, 0x78, 0x6c,
+  0x6e, 0x78, 0x2c, 0x73, 0x69, 0x6d, 0x75, 0x6c, 0x61, 0x74, 0x69, 0x6f,
+  0x6e, 0x00
+};
+unsigned int pcipr_dtb_len = 362;
+
+
+struct xilinx_pcipr_drvdata {
+	unsigned long *blob;
+	struct device_node *child_nodes;
+};
+
+/**
+ *	xilinx_pcipr_probe - Setup the endpoint
+ *	@dev: PCI device to set up
+ */
+static int __devinit xilinx_pcipr_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+  int ret;
+  struct xilinx_pcipr_drvdata *drvdata;
+	dev_dbg(&pdev->dev, "xilinx_pcipr_probe\n");
+
+	drvdata = kzalloc(sizeof(struct xilinx_pcipr_drvdata), GFP_KERNEL);
+	if (!drvdata) {
+		dev_err(&pdev->dev, "Couldn't allocate device private record\n");
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	dev_set_drvdata(&pdev->dev, (void *)drvdata);
+
+/* 	/\* */
+/* 	 * If we failed to assign proper bus numbers for this cardbus */
+/* 	 * controller during PCI probe, its subordinate pci_bus is NULL. */
+/* 	 * Bail out if so. */
+/* 	 *\/ */
+/* 	if (!dev->subordinate) { */
+/* 		dev_printk(KERN_ERR, &dev->dev, "no bus associated! " */
+/* 			   "(try 'pci=assign-busses')\n"); */
+/* 		return -ENODEV; */
+/* 	} */
+
+	/*
+	 * Do some basic sanity checking..
+	 */
+	if (pci_enable_device(pdev)) {
+		ret = -EBUSY;
+		goto free;
+	}
+
+	ret = pci_request_regions(pdev, "xilinx_pcipr");
+	if (ret)
+		goto disable;
+
+	if (!pci_resource_start(pdev, 0)) {
+		dev_printk(KERN_ERR, &pdev->dev, "No cardbus resource!\n");
+		ret = -ENODEV;
+		goto release;
+	}
+
+	drvdata->blob = pcipr_dtb;
+
+/* 	/\* */
+/* 	 * Ok, start setup.. Map the cardbus registers, */
+/* 	 * and request the IRQ. */
+/* 	 *\/ */
+/* 	socket->base = ioremap(pci_resource_start(pdev, 0), 0x1000); */
+/* 	if (!socket->base) { */
+/* 		ret = -ENOMEM; */
+/* 		goto release; */
+/* 	} */
+
+	/*
+	 * report the subsystem vendor and device for help debugging
+	 * the irq stuff...
+	 */
+	dev_printk(KERN_INFO, &pdev->dev, "Xilinx PCIPR bridge found [%04x:%04x]\n",
+		   pdev->subsystem_vendor, pdev->subsystem_device);
+
+
+	//	yenta_fixup_parent_bridge(dev->subordinate);
+
+	// initialize our sub-devices.
+
+	
+	unflatten_partial_device_tree(drvdata->blob, &drvdata->child_nodes);
+	of_platform_bus_probe(drvdata->child_nodes, NULL, &pdev->dev);
+
+/* 	printk(KERN_CRIT DRIVER_NAME ": Discovered %d devices.\n", */
+/* 	       devices->num_devices); */
+/* 	for (i = 0; i < devices->num_devices; i++) { */
+/* 		printk(KERN_CRIT DRIVER_NAME ": Adding device %s.\n", */
+/* 		       devices->device[i].name); */
+/* 		devices->device[i].dev.release = do_nothing_release; */
+/* 		platform_device_register(&(devices->device[i])); */
+/* 		// sysfs_create_link(&(xilinx_socket_dev.dev->kobj), &(xilinx_socket_dev.dev->kobj), "x"); */
+/* 	} */
+
+/* 	printk(KERN_CRIT DRIVER_NAME ": Done probing socket.\n"); */
+
+
+ release:
+	pci_release_regions(pdev);
+ disable:
+	pci_disable_device(pdev);
+ free:
+	kfree(drvdata);
+ out:
+	return ret;
+}
+
+static int __devexit xilinx_pcipr_remove(struct pci_dev *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct xilinx_pcipr_drvdata *drvdata = dev_get_drvdata(dev);
+
+	return 0;
+}
+
+
+static const struct pci_device_id xilinx_pcipr_ids[] = {
+	{ PCI_VDEVICE(XILINX, 0x0505), 0 },
+	{ PCI_VDEVICE(AL, PCI_DEVICE_ID_AL_M5228), 1 },
+	{ 0, },
+};
+MODULE_DEVICE_TABLE(pci, xilinx_pcipr_ids);
+
+static struct pci_driver  xilinx_pcipr_driver = {
+	.name		= "XILINX_PCIPR",
+	.id_table	= xilinx_pcipr_ids,
+	.probe		= xilinx_pcipr_probe,
+	.remove		= xilinx_pcipr_remove,
+	//	.suspend	= ide_pci_suspend,
+	//	.resume		= ide_pci_resume,
+};
+
+static int __init xilinx_pcipr_init(void)
+{
+  return ide_pci_register_driver(&xilinx_pcipr_driver);
+}
+
+static void __exit xilinx_pcipr_exit(void)
+{
+	pci_unregister_driver(&xilinx_pcipr_driver);
+}
+
+module_init(xilinx_pcipr_init);
+module_exit(xilinx_pcipr_exit);
+
+MODULE_AUTHOR("Xilinx Research Labs");
+MODULE_DESCRIPTION("PCI driver for PCI reconfigurable endpoint");
+MODULE_LICENSE("GPL");
-- 
1.5.6.6



This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
