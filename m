From: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: [PATCH 6/6] misc: pci_endpoint_test: Add the layerscape PCIe GEN4 EP device support
Date: Mon, 18 Feb 2019 17:46:43 +0800
Message-ID: <20190218094643.2692-6-xiaowei.bao@nxp.com>
References: <20190218094643.2692-1-xiaowei.bao@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218094643.2692-1-xiaowei.bao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bhelgaas@google.com, Zhiqiang.Hou@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, leoyang.li@nxp.com, kishon@ti.com, lorenzo.pieralisi@arm.com, gregkh@linuxfoundation.org, l.subrahmanya@mobiveil.co.in, arnd@arndb.de, Minghuan.Lian@nxp.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

Add the layerscape PCIE GEN4 EP device support in pci_endpoint_test driver.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
---
 drivers/misc/pci_endpoint_test.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
index 896e2df..8c3435b 100644
--- a/drivers/misc/pci_endpoint_test.c
+++ b/drivers/misc/pci_endpoint_test.c
@@ -789,6 +789,7 @@ static void pci_endpoint_test_remove(struct pci_dev *pdev)
 	{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_DRA74x) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_DRA72x) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_SYNOPSYS, 0xedda) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_FREESCALE, 0x8d80) },
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, pci_endpoint_test_tbl);
-- 
1.7.1
