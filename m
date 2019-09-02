From: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: [PATCH v3 11/11] misc: pci_endpoint_test: Add LS1088a in pci_device_id table
Date: Mon,  2 Sep 2019 11:17:16 +0800
Message-ID: <20190902031716.43195-12-xiaowei.bao@nxp.com>
References: <20190902031716.43195-1-xiaowei.bao@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190902031716.43195-1-xiaowei.bao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, leoyang.li@nxp.com, kishon@ti.com, lorenzo.pieralisi@arm.com, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, zhiqiang.hou@nxp.com, Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

Add LS1088a in pci_device_id table so that pci-epf-test can be used
for testing PCIe EP in LS1088a.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
---
v2:
 - No change.
v3:
 - No change.
 
 drivers/misc/pci_endpoint_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
index 6e208a0..d531951 100644
--- a/drivers/misc/pci_endpoint_test.c
+++ b/drivers/misc/pci_endpoint_test.c
@@ -793,6 +793,7 @@ static const struct pci_device_id pci_endpoint_test_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_DRA74x) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_DRA72x) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_FREESCALE, 0x81c0) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_FREESCALE, 0x80c0) },
 	{ PCI_DEVICE_DATA(SYNOPSYS, EDDA, NULL) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_AM654),
 	  .driver_data = (kernel_ulong_t)&am654_data
-- 
2.9.5
