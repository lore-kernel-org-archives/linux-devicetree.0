Return-Path: <SRS0=9bdO=TN=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH V3 19/29] PCI: tegra: Change PRSNT_SENSE IRQ log to debug
Date: Mon, 13 May 2019 23:37:34 +0530
Message-ID: <20190513180744.16493-20-mmaddireddy@nvidia.com>
In-Reply-To: <20190513180744.16493-1-mmaddireddy@nvidia.com>
References: <20190513180744.16493-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

PRSNT_MAP bit field is programmed to update the slot present status.
PRSNT_SENSE IRQ is triggered when this bit field is programmed, which is
not an error. Add a new if condition to trap PRSNT_SENSE code and print it
with debug log level.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
V3: Correct typos in commit log

V2: If-else to switch-case conversion patch is dropped, this patch is
rebased to stay with if-else statements

 drivers/pci/controller/pci-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 0f02f54f8a61..ac57c5badd9b 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -864,7 +864,7 @@ static irqreturn_t tegra_pcie_isr(int irq, void *arg)
 	 * do not pollute kernel log with master abort reports since they
 	 * happen a lot during enumeration
 	 */
-	if (code == AFI_INTR_MASTER_ABORT)
+	if (code == AFI_INTR_MASTER_ABORT || code == AFI_INTR_PE_PRSNT_SENSE)
 		dev_dbg(dev, "%s, signature: %08x\n", err_msg[code], signature);
 	else
 		dev_err(dev, "%s, signature: %08x\n", err_msg[code], signature);
-- 
2.17.1
