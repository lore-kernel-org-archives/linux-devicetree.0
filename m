From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Subject: [PATCHv6 09/28] PCI: mobiveil: Move IRQ chained handler setup out of DT parse
Date: Fri,  5 Jul 2019 17:56:37 +0800
Message-ID: <20190705095656.19191-10-Zhiqiang.Hou@nxp.com>
References: <20190705095656.19191-1-Zhiqiang.Hou@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190705095656.19191-1-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, l.subrahmanya@mobiveil.co.in, shawnguo@kernel.org, leoyang.li@nxp.com, lorenzo.pieralisi@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: Mingkai.Hu@nxp.com, Minghuan.Lian@nxp.com, Xiaowei.Bao@nxp.com, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
List-Id: devicetree@vger.kernel.org

The irq_set_chained_handler_and_data() call is not dependent on device
tree firmware so it should be moved out of the DT parsing function for
clarity.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
[lorenzo.pieralisi@arm.com: rewritten commit log]
Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>
Reviewed-by: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
---
V6:
 - Rebased the patch, no functional change.

 drivers/pci/controller/pcie-mobiveil.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mobiveil.c b/drivers/pci/controller/pcie-mobiveil.c
index 8f92f05..cdf15cc 100644
--- a/drivers/pci/controller/pcie-mobiveil.c
+++ b/drivers/pci/controller/pcie-mobiveil.c
@@ -446,8 +446,6 @@ static int mobiveil_pcie_parse_dt(struct mobiveil_pcie *pcie)
 		return -ENODEV;
 	}
 
-	irq_set_chained_handler_and_data(pcie->irq, mobiveil_pcie_isr, pcie);
-
 	return 0;
 }
 
@@ -872,6 +870,8 @@ static int mobiveil_pcie_probe(struct platform_device *pdev)
 		goto error;
 	}
 
+	irq_set_chained_handler_and_data(pcie->irq, mobiveil_pcie_isr, pcie);
+
 	ret = devm_request_pci_bus_resources(dev, &pcie->resources);
 	if (ret)
 		goto error;
-- 
1.7.1
