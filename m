From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 6/9] [Xilinx] xilinx_pcipr: Added Xilinx reconfigurable PCI
	endpoint driver.
Date: Fri, 23 Jul 2010 13:57:40 -0700
Message-ID: <fad5faaa-1fab-4d9f-b41e-236b874e9c08@SG2EHSMHS006.ehs.local>
References: <1279918663-29960-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-3-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-4-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-5-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-6-git-send-email-stephen.neuendorffer@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1279918663-29960-6-git-send-email-stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
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

This device has an internal bus which contains multiple devices, which
are described in a device tree.

Signed-off-by: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

----

This is probably still preliminary, although it actually works now.
1) It should probably correctly deallocate and free all the contained
devices.
2) It should probably handle different device trees for multiple boards
in the same system.  How to do this?
---
 drivers/pci/Kconfig        |    8 ++
 drivers/pci/Makefile       |    2 +
 drivers/pci/xilinx_pcipr.c |  197 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 207 insertions(+), 0 deletions(-)
 create mode 100644 drivers/pci/xilinx_pcipr.c

diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
index 34ef70d..69616b6 100644
--- a/drivers/pci/Kconfig
+++ b/drivers/pci/Kconfig
@@ -65,3 +65,11 @@ config PCI_IOAPIC
 	depends on ACPI
 	depends on HOTPLUG
 	default y
+
+config XILINX_PCIPR
+	tristate "Xilinx OF-based PCI endpoint"
+	depends on PCI
+	select OF
+	select OF_FLATTREE
+	help
+	  Enable support for Xilinx PCIPR endpoint
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
index 0000000..80f8f1a
--- /dev/null
+++ b/drivers/pci/xilinx_pcipr.c
@@ -0,0 +1,197 @@
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
+#include <linux/firmware.h>
+
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+#include <linux/of_platform.h>
+
+#include <linux/io.h>
+
+#define DRV_NAME "xilinx_pcipr"
+
+struct xilinx_pcipr_drvdata {
+	struct device_node *child_nodes;
+	struct firmware *fw_entry;
+};
+
+/**
+ *	xilinx_pcipr_probe - Setup the endpoint
+ *	@dev: PCI device to set up
+ */
+static int __devinit xilinx_pcipr_probe(struct pci_dev *pdev,
+					const struct pci_device_id *id)
+{
+	int ret;
+	struct xilinx_pcipr_drvdata *drvdata;
+	resource_size_t start, len;
+	struct property *ranges_prop;
+	unsigned long *value;
+	struct device_node *bus_node;
+
+	dev_dbg(&pdev->dev, "xilinx_pcipr_probe\n");
+
+	drvdata = kzalloc(sizeof(struct xilinx_pcipr_drvdata), GFP_KERNEL);
+	if (!drvdata) {
+		dev_err(&pdev->dev,
+			"Couldn't allocate device private record\n");
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	dev_set_drvdata(&pdev->dev, (void *)drvdata);
+
+	/*
+	 * Do some basic sanity checking..
+	 */
+	if (pci_enable_device(pdev)) {
+		ret = -EBUSY;
+		goto free;
+	}
+
+	/* Enable the board to bus master. */
+	pci_set_master(pdev);
+
+	if (request_firmware(&drvdata->fw_entry,
+			    "xilinx_pcipr.dtb", &pdev->dev)) {
+		dev_err(&pdev->dev, "Couldn't get dtb\n");
+		ret = -ENODEV;
+		goto disable;
+	}
+
+
+	ret = pci_request_regions(pdev, "xilinx_pcipr");
+	if (ret)
+		goto release_dtb;
+
+	if (!pci_resource_start(pdev, 0)) {
+		dev_printk(KERN_ERR, &pdev->dev, "No cardbus resource!\n");
+		ret = -ENODEV;
+		goto release;
+	}
+
+
+	/*
+	 * report the subsystem vendor and device for help debugging
+	 * the irq stuff...
+	 */
+	dev_printk(KERN_INFO, &pdev->dev,
+		   "Xilinx PCIPR bridge found [%04x:%04x]\n",
+		   pdev->subsystem_vendor, pdev->subsystem_device);
+
+	/* Stuff the ranges property into the toplevel bus of the device
+	   tree, according to how the BARs are programmed */
+	start = pci_resource_start(pdev, 0);
+	len = pci_resource_len(pdev, 0);
+
+	dev_printk(KERN_INFO, &pdev->dev,
+		   "Xilinx PCIPR bridge range %llx %llx",
+		   (unsigned long long) start, (unsigned long long) len);
+
+	ranges_prop = kzalloc(sizeof(struct property), GFP_KERNEL);
+	ranges_prop->value = kzalloc(sizeof(unsigned long) * 3, GFP_KERNEL);
+	ranges_prop->name = "ranges";
+	ranges_prop->length = sizeof(unsigned long) * 3;
+	value = (unsigned long *)ranges_prop->value;
+	/* FIXME: gotta get this from the bridge */
+	value[0] = cpu_to_be32(0x80000000);
+	value[1] = cpu_to_be32(start);
+	value[2] = cpu_to_be32(len);
+
+	unflatten_partial_device_tree((unsigned long *)drvdata->fw_entry->data,
+				      &drvdata->child_nodes);
+	of_node_get(drvdata->child_nodes);
+	bus_node = of_find_node_by_name(drvdata->child_nodes, "plb");
+	prom_add_property(bus_node, ranges_prop);
+
+	/* Generate child devices from the device tree */
+	of_platform_bus_probe(drvdata->child_nodes, NULL, &pdev->dev);
+
+	pci_release_regions(pdev);
+
+	goto out; /* Success */
+
+ release:
+	pci_release_regions(pdev);
+
+ release_dtb:
+	release_firmware(drvdata->fw_entry);
+
+ disable:
+	pci_disable_device(pdev);
+ free:
+	kfree(drvdata);
+	dev_set_drvdata(&pdev->dev, NULL);
+ out:
+	return ret;
+}
+
+static int __devexit xilinx_pcipr_remove(struct pci_dev *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct xilinx_pcipr_drvdata *drvdata = dev_get_drvdata(dev);
+
+	/* FIXME: Release the contained devices. There should probably
+be a device-tree method to free a whole tree of devices, essentially
+the inverse of of_platform_bus_probe
+	*/
+
+	release_firmware(drvdata->fw_entry);
+	pci_disable_device(pdev);
+	kfree(drvdata);
+	dev_set_drvdata(dev, NULL);
+	return 0;
+}
+
+
+static const struct pci_device_id xilinx_pcipr_ids[] = {
+	{ PCI_VDEVICE(XILINX, 0x0505), 0 },
+	{ 0, },
+};
+MODULE_DEVICE_TABLE(pci, xilinx_pcipr_ids);
+
+pci_ers_result_t *xilinx_pcipr_error_detected(struct pci_dev *pdev,
+					      enum pci_channel_state error) {
+	dev_printk(KERN_INFO, &pdev->dev, "Error detected!\n");
+	return PCI_ERS_RESULT_NEED_RESET;
+}
+
+static struct pci_error_handlers xilinx_pcipr_error_handlers = {
+	/* PCI bus error detected on this device */
+	.error_detected = xilinx_pcipr_error_detected,
+};
+
+static struct pci_driver  xilinx_pcipr_driver = {
+	.name		= "XILINX_PCIPR",
+	.id_table	= xilinx_pcipr_ids,
+	.probe		= xilinx_pcipr_probe,
+	.remove		= __devexit_p(xilinx_pcipr_remove),
+	.err_handler    = &xilinx_pcipr_error_handlers,
+};
+
+static int __init xilinx_pcipr_init(void)
+{
+	return ide_pci_register_driver(&xilinx_pcipr_driver);
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
