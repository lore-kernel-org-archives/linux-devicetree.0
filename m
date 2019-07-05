From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Subject: [PATCHv6 02/28] PCI: mobiveil: Remove the flag MSI_FLAG_MULTI_PCI_MSI
Date: Fri,  5 Jul 2019 17:56:30 +0800
Message-ID: <20190705095656.19191-3-Zhiqiang.Hou@nxp.com>
References: <20190705095656.19191-1-Zhiqiang.Hou@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190705095656.19191-1-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, l.subrahmanya@mobiveil.co.in, shawnguo@kernel.org, leoyang.li@nxp.com, lorenzo.pieralisi@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: Mingkai.Hu@nxp.com, Minghuan.Lian@nxp.com, Xiaowei.Bao@nxp.com, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
List-Id: devicetree@vger.kernel.org

The Mobiveil internal MSI controller requires separate target addresses,
one per MSI vector; this is clearly incompatible with the Multiple MSI
feature, which requires the same target address for all vectors
requested by an endpoint (ie the Message Address field in the MSI
Capability structure), so the multi MSI feature is clearly not
supported by the host controller driver.

Remove the flag MSI_FLAG_MULTI_PCI_MSI and with it multi MSI support,
fixing the misconfiguration.

Fixes: 1e913e58335f ("PCI: mobiveil: Add MSI support")
Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
[lorenzo.pieralisi@arm.com: commit log]
Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>
---
V6:
 - Rebased the patch, no functional change.

 drivers/pci/controller/pcie-mobiveil.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/pci/controller/pcie-mobiveil.c b/drivers/pci/controller/pcie-mobiveil.c
index d55c7e7..e581902 100644
--- a/drivers/pci/controller/pcie-mobiveil.c
+++ b/drivers/pci/controller/pcie-mobiveil.c
@@ -692,7 +692,7 @@ static int mobiveil_pcie_intx_map(struct irq_domain *domain, unsigned int irq,
 
 static struct msi_domain_info mobiveil_msi_domain_info = {
 	.flags	= (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-		MSI_FLAG_MULTI_PCI_MSI | MSI_FLAG_PCI_MSIX),
+		   MSI_FLAG_PCI_MSIX),
 	.chip	= &mobiveil_msi_irq_chip,
 };
 
-- 
1.7.1
