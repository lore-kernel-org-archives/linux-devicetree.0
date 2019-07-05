From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Subject: [PATCHv6 16/28] PCI: mobiveil: Fix the returned error number
Date: Fri,  5 Jul 2019 17:56:44 +0800
Message-ID: <20190705095656.19191-17-Zhiqiang.Hou@nxp.com>
References: <20190705095656.19191-1-Zhiqiang.Hou@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190705095656.19191-1-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, l.subrahmanya@mobiveil.co.in, shawnguo@kernel.org, leoyang.li@nxp.com, lorenzo.pieralisi@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: Mingkai.Hu@nxp.com, Minghuan.Lian@nxp.com, Xiaowei.Bao@nxp.com, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch modified the returned error number by convention.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>
Reviewed-by: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
---
V6:
 - Splited from #3 of v5 patches, no functional change.

 drivers/pci/controller/pcie-mobiveil.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-mobiveil.c b/drivers/pci/controller/pcie-mobiveil.c
index 965f89a..51cbe53 100644
--- a/drivers/pci/controller/pcie-mobiveil.c
+++ b/drivers/pci/controller/pcie-mobiveil.c
@@ -822,7 +822,7 @@ static int mobiveil_pcie_init_irq_domain(struct mobiveil_pcie *pcie)
 
 	if (!pcie->intx_domain) {
 		dev_err(dev, "Failed to get a INTx IRQ domain\n");
-		return -ENODEV;
+		return -ENOMEM;
 	}
 
 	raw_spin_lock_init(&pcie->intx_mask_lock);
@@ -848,7 +848,7 @@ static int mobiveil_pcie_probe(struct platform_device *pdev)
 	/* allocate the PCIe port */
 	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
 	if (!bridge)
-		return -ENODEV;
+		return -ENOMEM;
 
 	pcie = pci_host_bridge_priv(bridge);
 	if (!pcie)
@@ -869,7 +869,7 @@ static int mobiveil_pcie_probe(struct platform_device *pdev)
 						    &pcie->resources, &iobase);
 	if (ret) {
 		dev_err(dev, "Getting bridge resources failed\n");
-		return -ENOMEM;
+		return ret;
 	}
 
 	/*
-- 
1.7.1
