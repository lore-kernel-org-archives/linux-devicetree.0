From: Yangbo Lu <yangbo.lu@nxp.com>
Subject: [v3, 8/9] enetc: add PTP clock driver
Date: Tue, 12 Feb 2019 12:24:03 +0800
Message-ID: <20190212042404.15575-9-yangbo.lu@nxp.com>
References: <20190212042404.15575-1-yangbo.lu@nxp.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190212042404.15575-1-yangbo.lu@nxp.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>, Claudiu Manoil <claudiu.manoil@nxp.com>, Yangbo Lu <yangbo.lu@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch is to add PTP clock driver for ENETC.
The driver reused QorIQ PTP clock driver.

Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
---
Changes for v2:
	- None.
Changes for v3:
	- Converted to use ptp_qoriq_free().
---
 drivers/net/ethernet/freescale/enetc/Kconfig     |   12 ++
 drivers/net/ethernet/freescale/enetc/Makefile    |    3 +
 drivers/net/ethernet/freescale/enetc/enetc_hw.h  |    5 +-
 drivers/net/ethernet/freescale/enetc/enetc_ptp.c |  144 ++++++++++++++++++++++
 4 files changed, 162 insertions(+), 2 deletions(-)
 create mode 100644 drivers/net/ethernet/freescale/enetc/enetc_ptp.c

diff --git a/drivers/net/ethernet/freescale/enetc/Kconfig b/drivers/net/ethernet/freescale/enetc/Kconfig
index f9dd26f..8429f5c 100644
--- a/drivers/net/ethernet/freescale/enetc/Kconfig
+++ b/drivers/net/ethernet/freescale/enetc/Kconfig
@@ -17,3 +17,15 @@ config FSL_ENETC_VF
 	  virtual function (VF) devices enabled by the ENETC PF driver.
 
 	  If compiled as module (M), the module name is fsl-enetc-vf.
+
+config FSL_ENETC_PTP_CLOCK
+	tristate "ENETC PTP clock driver"
+	depends on PTP_1588_CLOCK_QORIQ && (FSL_ENETC || FSL_ENETC_VF)
+	default y
+	help
+	  This driver adds support for using the ENETC 1588 timer
+	  as a PTP clock. This clock is only useful if your PTP
+	  programs are getting hardware time stamps on the PTP Ethernet
+	  packets using the SO_TIMESTAMPING API.
+
+	  If compiled as module (M), the module name is fsl-enetc-ptp.
diff --git a/drivers/net/ethernet/freescale/enetc/Makefile b/drivers/net/ethernet/freescale/enetc/Makefile
index 9529b01..6976602 100644
--- a/drivers/net/ethernet/freescale/enetc/Makefile
+++ b/drivers/net/ethernet/freescale/enetc/Makefile
@@ -13,3 +13,6 @@ fsl-enetc-vf-$(CONFIG_FSL_ENETC_VF) += enetc.o enetc_cbdr.o \
 				       enetc_ethtool.o
 fsl-enetc-vf-objs := enetc_vf.o $(fsl-enetc-vf-y)
 endif
+
+obj-$(CONFIG_FSL_ENETC_PTP_CLOCK) += fsl-enetc-ptp.o
+fsl-enetc-ptp-$(CONFIG_FSL_ENETC_PTP_CLOCK) += enetc_ptp.o
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_hw.h b/drivers/net/ethernet/freescale/enetc/enetc_hw.h
index efa0b1a..df8eb88 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_hw.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_hw.h
@@ -4,8 +4,9 @@
 #include <linux/bitops.h>
 
 /* ENETC device IDs */
-#define ENETC_DEV_ID_PF	0xe100
-#define ENETC_DEV_ID_VF	0xef00
+#define ENETC_DEV_ID_PF		0xe100
+#define ENETC_DEV_ID_VF		0xef00
+#define ENETC_DEV_ID_PTP	0xee02
 
 /* ENETC register block BAR */
 #define ENETC_BAR_REGS	0
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ptp.c b/drivers/net/ethernet/freescale/enetc/enetc_ptp.c
new file mode 100644
index 0000000..dc2f58a
--- /dev/null
+++ b/drivers/net/ethernet/freescale/enetc/enetc_ptp.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/* Copyright 2019 NXP */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/fsl/ptp_qoriq.h>
+
+#include "enetc.h"
+
+static struct ptp_clock_info enetc_ptp_caps = {
+	.owner		= THIS_MODULE,
+	.name		= "ENETC PTP clock",
+	.max_adj	= 512000,
+	.n_alarm	= 0,
+	.n_ext_ts	= 2,
+	.n_per_out	= 0,
+	.n_pins		= 0,
+	.pps		= 1,
+	.adjfine	= ptp_qoriq_adjfine,
+	.adjtime	= ptp_qoriq_adjtime,
+	.gettime64	= ptp_qoriq_gettime,
+	.settime64	= ptp_qoriq_settime,
+	.enable		= ptp_qoriq_enable,
+};
+
+static int enetc_ptp_probe(struct pci_dev *pdev,
+			   const struct pci_device_id *ent)
+{
+	struct ptp_qoriq *ptp_qoriq;
+	void __iomem *base;
+	int err, len, n;
+
+	if (pdev->dev.of_node && !of_device_is_available(pdev->dev.of_node)) {
+		dev_info(&pdev->dev, "device is disabled, skipping\n");
+		return -ENODEV;
+	}
+
+	err = pci_enable_device_mem(pdev);
+	if (err) {
+		dev_err(&pdev->dev, "device enable failed\n");
+		return err;
+	}
+
+	/* set up for high or low dma */
+	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	if (err) {
+		err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+		if (err) {
+			dev_err(&pdev->dev,
+				"DMA configuration failed: 0x%x\n", err);
+			goto err_dma;
+		}
+	}
+
+	err = pci_request_mem_regions(pdev, KBUILD_MODNAME);
+	if (err) {
+		dev_err(&pdev->dev, "pci_request_regions failed err=%d\n", err);
+		goto err_pci_mem_reg;
+	}
+
+	pci_set_master(pdev);
+
+	ptp_qoriq = kzalloc(sizeof(*ptp_qoriq), GFP_KERNEL);
+	if (!ptp_qoriq) {
+		err = -ENOMEM;
+		goto err_alloc_ptp;
+	}
+
+	len = pci_resource_len(pdev, ENETC_BAR_REGS);
+
+	base = ioremap(pci_resource_start(pdev, ENETC_BAR_REGS), len);
+	if (!base) {
+		err = -ENXIO;
+		dev_err(&pdev->dev, "ioremap() failed\n");
+		goto err_ioremap;
+	}
+
+	/* Allocate 1 interrupt */
+	n = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSIX);
+	if (n != 1) {
+		err = -EPERM;
+		goto err_irq;
+	}
+
+	ptp_qoriq->irq = pci_irq_vector(pdev, 0);
+
+	err = request_irq(ptp_qoriq->irq, ptp_qoriq_isr, 0, DRIVER, ptp_qoriq);
+	if (err) {
+		dev_err(&pdev->dev, "request_irq() failed!\n");
+		goto err_irq;
+	}
+
+	ptp_qoriq->dev = &pdev->dev;
+
+	err = ptp_qoriq_init(ptp_qoriq, base, enetc_ptp_caps);
+	if (err)
+		goto err_no_clock;
+
+	pci_set_drvdata(pdev, ptp_qoriq);
+
+	return 0;
+
+err_no_clock:
+	free_irq(ptp_qoriq->irq, ptp_qoriq);
+err_irq:
+	iounmap(base);
+err_ioremap:
+	kfree(ptp_qoriq);
+err_alloc_ptp:
+	pci_release_mem_regions(pdev);
+err_pci_mem_reg:
+err_dma:
+	pci_disable_device(pdev);
+
+	return err;
+}
+
+static void enetc_ptp_remove(struct pci_dev *pdev)
+{
+	struct ptp_qoriq *ptp_qoriq = pci_get_drvdata(pdev);
+
+	ptp_qoriq_free(ptp_qoriq);
+	kfree(ptp_qoriq);
+
+	pci_release_mem_regions(pdev);
+	pci_disable_device(pdev);
+}
+
+static const struct pci_device_id enetc_ptp_id_table[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_FREESCALE, ENETC_DEV_ID_PTP) },
+	{ 0, } /* End of table. */
+};
+MODULE_DEVICE_TABLE(pci, enetc_ptp_id_table);
+
+static struct pci_driver enetc_ptp_driver = {
+	.name = KBUILD_MODNAME,
+	.id_table = enetc_ptp_id_table,
+	.probe = enetc_ptp_probe,
+	.remove = enetc_ptp_remove,
+};
+module_pci_driver(enetc_ptp_driver);
+
+MODULE_DESCRIPTION("ENETC PTP clock driver");
+MODULE_LICENSE("Dual BSD/GPL");
-- 
1.7.1
