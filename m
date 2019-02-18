From: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: [PATCH 4/6] PCI: mobiveil: Add workaround for unsupported request error
Date: Mon, 18 Feb 2019 17:46:41 +0800
Message-ID: <20190218094643.2692-4-xiaowei.bao@nxp.com>
References: <20190218094643.2692-1-xiaowei.bao@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218094643.2692-1-xiaowei.bao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bhelgaas@google.com, Zhiqiang.Hou@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, leoyang.li@nxp.com, kishon@ti.com, lorenzo.pieralisi@arm.com, gregkh@linuxfoundation.org, l.subrahmanya@mobiveil.co.in, arnd@arndb.de, Minghuan.Lian@nxp.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

Errata: unsupported request error on inbound posted write
transaction, PCIe controller reports advisory error instead
of uncorrectable error message to RC.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
---
depends on: http://patchwork.ozlabs.org/project/linux-pci/list/?series=88754

 .../controller/mobiveil/pci-layerscape-gen4-ep.c   |   14 +++++++++++++-
 drivers/pci/controller/mobiveil/pcie-mobiveil.h    |    4 ++++
 2 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/drivers/pci/controller/mobiveil/pci-layerscape-gen4-ep.c b/drivers/pci/controller/mobiveil/pci-layerscape-gen4-ep.c
index dc3589d..3d980f5 100644
--- a/drivers/pci/controller/mobiveil/pci-layerscape-gen4-ep.c
+++ b/drivers/pci/controller/mobiveil/pci-layerscape-gen4-ep.c
@@ -51,7 +51,19 @@ static void ls_pcie_g4_ep_init(struct mobiveil_pcie_ep *ep)
 	struct mobiveil_pcie *mv_pci = to_mobiveil_pcie_from_ep(ep);
 	struct pci_epc *epc = ep->epc;
 	enum pci_barno bar;
-	int win_idx;
+	int win_idx, val;
+
+	/*
+	 * Errata: unsupported request error on inbound posted write
+	 * transaction, PCIe controller reports advisory error instead
+	 * of uncorrectable error message to RC.
+	 * workaround: set the bit20(unsupported_request_Error_severity) with
+	 * value 1 in uncorrectable_Error_Severity_Register, make the
+	 * unsupported request error generate the fatal error.
+	 */
+	val =  csr_readl(mv_pci, CFG_UNCORRECTABLE_ERROR_SEVERITY);
+	val |= 1 << UNSUPPORTED_REQUEST_ERROR_SHIFT;
+	csr_writel(mv_pci, val, CFG_UNCORRECTABLE_ERROR_SEVERITY);
 
 	ls_pcie_g4_get_bar_num(ep);
 
diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil.h b/drivers/pci/controller/mobiveil/pcie-mobiveil.h
index 275c68f..7dc2a12 100644
--- a/drivers/pci/controller/mobiveil/pcie-mobiveil.h
+++ b/drivers/pci/controller/mobiveil/pcie-mobiveil.h
@@ -120,6 +120,10 @@
 #define GPEX_BAR_SIZE_UDW                       0x4DC
 #define GPEX_BAR_SELECT                         0x4E0
 
+#define CFG_UNCORRECTABLE_ERROR_SEVERITY	0x10c
+#define UNSUPPORTED_REQUEST_ERROR_SHIFT		20
+#define CFG_UNCORRECTABLE_ERROR_MASK		0x108
+
 /* starting offset of INTX bits in status register */
 #define PAB_INTX_START			5
 
-- 
1.7.1
