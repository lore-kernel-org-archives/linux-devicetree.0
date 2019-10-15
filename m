From: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: [PATCH v2 6/6] misc: pci_endpoint_test: Add the layerscape PCIe GEN4 EP device support
Date: Tue, 15 Oct 2019 16:37:02 +0800
Message-ID: <20191015083702.21792-7-xiaowei.bao@nxp.com>
References: <20191015083702.21792-1-xiaowei.bao@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191015083702.21792-1-xiaowei.bao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhiqiang.Hou@nxp.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, leoyang.li@nxp.com, kishon@ti.com, lorenzo.pieralisi@arm.com, Minghuan.Lian@nxp.com, andrew.murray@arm.com, mingkai.hu@nxp.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

Add the layerscape PCIE GEN4 EP device support in pci_endpoint_test driver.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
---
v2: 
 - No change.

 drivers/misc/pci_endpoint_test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
index 6e208a0..8b145a7 100644
--- a/drivers/misc/pci_endpoint_test.c
+++ b/drivers/misc/pci_endpoint_test.c
@@ -65,6 +65,7 @@
 #define PCI_ENDPOINT_TEST_IRQ_NUMBER		0x28
 
 #define PCI_DEVICE_ID_TI_AM654			0xb00c
+#define PCI_DEVICE_ID_LX2160A			0x8d80
 
 #define is_am654_pci_dev(pdev)		\
 		((pdev)->device == PCI_DEVICE_ID_TI_AM654)
@@ -793,6 +794,7 @@ static const struct pci_device_id pci_endpoint_test_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_DRA74x) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_DRA72x) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_FREESCALE, 0x81c0) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_FREESCALE, PCI_DEVICE_ID_LX2160A) },
 	{ PCI_DEVICE_DATA(SYNOPSYS, EDDA, NULL) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_AM654),
 	  .driver_data = (kernel_ulong_t)&am654_data
-- 
2.9.5
