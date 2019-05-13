Return-Path: <SRS0=gR28=TN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:13551 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732296AbfEMSJP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 May 2019 14:09:15 -0400
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH V3 20/29] PCI: tegra: Use legacy IRQ for port service drivers
Date: Mon, 13 May 2019 23:37:35 +0530
Message-ID: <20190513180744.16493-21-mmaddireddy@nvidia.com>
In-Reply-To: <20190513180744.16493-1-mmaddireddy@nvidia.com>
References: <20190513180744.16493-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Tegra signals PCIe services like AER, PME, etc. over legacy IRQ line.
By default, service drivers register interrupt routine over MSI IRQ line.
Use pcie_pme_disable_msi() function to disable MSI for service drivers.

PME and AER interrupts registered to MSI without this change,
cat /proc/interrupts | grep -i pci
36: 21 0 0 0 0 0 GICv2 104 Level       PCIE
37: 35 0 0 0 0 0 GICv2 105 Level       Tegra PCIe MSI
76: 0  0 0 0 0 0 Tegra PCIe MSI 0 Edge PCIe PME, aerdrv, PCIe BW notif

PME and AER interrupts registered to legacy IRQ with this change,
cat /proc/interrupts | grep -i pci
36: 33 0 0 0 0 0 GICv2 104 Level      PCIE, PCIe PME, aerdrv, PCIe BW notif
37: 52 0 0 0 0 0 GICv2 105 Level      Tegra PCIe MSI

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
V3: Corrected typo in commit log

V2: No change

 drivers/pci/controller/pci-tegra.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index ac57c5badd9b..0024bc42b400 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -41,6 +41,7 @@
 #include <soc/tegra/pmc.h>
 
 #include "../pci.h"
+#include "../pcie/portdrv.h"
 
 #define INT_PCI_MSI_NR (8 * 32)
 
@@ -2725,6 +2726,9 @@ static int tegra_pcie_probe(struct platform_device *pdev)
 		goto put_resources;
 	}
 
+	/* Switch to legacy IRQ for PCIe services like AER, PME*/
+	pcie_pme_disable_msi();
+
 	pm_runtime_enable(pcie->dev);
 	err = pm_runtime_get_sync(pcie->dev);
 	if (err) {
-- 
2.17.1
