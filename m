From: Ley Foon Tan <ley.foon.tan@intel.com>
Subject: [PATCH] PCI: altera-msi: Allow building as module
Date: Wed, 24 Apr 2019 12:57:15 +0800
Message-ID: <1556081835-12921-2-git-send-email-ley.foon.tan@intel.com>
References: <1556081835-12921-1-git-send-email-ley.foon.tan@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556081835-12921-1-git-send-email-ley.foon.tan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, lftan.linux@gmail.com, Ley Foon Tan <ley.foon.tan@intel.com>
List-Id: devicetree@vger.kernel.org

Altera MSI IP is a soft IP and is only available after
FPGA image is programmed.

Make driver modulable to support use case FPGA image is programmed
after kernel is booted. User proram FPGA image in kernel then only load
MSI driver module.

Signed-off-by: Ley Foon Tan <ley.foon.tan@intel.com>
---
 drivers/pci/controller/Kconfig           |  2 +-
 drivers/pci/controller/pcie-altera-msi.c | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 4b550f9cdd56..920546cb84e2 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -181,7 +181,7 @@ config PCIE_ALTERA
 	  FPGA.
 
 config PCIE_ALTERA_MSI
-	bool "Altera PCIe MSI feature"
+	tristate "Altera PCIe MSI feature"
 	depends on PCIE_ALTERA
 	depends on PCI_MSI_IRQ_DOMAIN
 	help
diff --git a/drivers/pci/controller/pcie-altera-msi.c b/drivers/pci/controller/pcie-altera-msi.c
index 025ef7d9a046..16d938920ca5 100644
--- a/drivers/pci/controller/pcie-altera-msi.c
+++ b/drivers/pci/controller/pcie-altera-msi.c
@@ -10,6 +10,7 @@
 #include <linux/interrupt.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/init.h>
+#include <linux/module.h>
 #include <linux/msi.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
@@ -288,4 +289,13 @@ static int __init altera_msi_init(void)
 {
 	return platform_driver_register(&altera_msi_driver);
 }
+
+static void __exit altera_msi_exit(void)
+{
+	platform_driver_unregister(&altera_msi_driver);
+}
+
 subsys_initcall(altera_msi_init);
+MODULE_DEVICE_TABLE(of, altera_msi_of_match);
+module_exit(altera_msi_exit);
+MODULE_LICENSE("GPL v2");
-- 
2.19.0
