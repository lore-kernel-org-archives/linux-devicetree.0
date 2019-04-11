Return-Path: <SRS0=HOgu=SN=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH 17/30] PCI: tegra: Use switch statements in tegra_pcie_isr()
Date: Thu, 11 Apr 2019 22:33:42 +0530
Message-ID: <20190411170355.6882-18-mmaddireddy@nvidia.com>
In-Reply-To: <20190411170355.6882-1-mmaddireddy@nvidia.com>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Use switch statements in tegra_pcie_isr() for better code readability.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
 drivers/pci/controller/pci-tegra.c | 37 ++++++++++++++++--------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index cdaaf13a9fd7..cf2715065a53 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -842,36 +842,39 @@ static irqreturn_t tegra_pcie_isr(int irq, void *arg)
 	};
 	struct tegra_pcie *pcie = arg;
 	struct device *dev = pcie->dev;
-	u32 code, signature;
+	u32 code, signature, fpci;
+	u64 address;
 
 	code = afi_readl(pcie, AFI_INTR_CODE) & AFI_INTR_CODE_MASK;
 	signature = afi_readl(pcie, AFI_INTR_SIGNATURE);
 	afi_writel(pcie, 0, AFI_INTR_CODE);
 
-	if (code == AFI_INTR_LEGACY)
-		return IRQ_NONE;
-
 	if (code >= ARRAY_SIZE(err_msg))
-		code = 0;
+		return IRQ_NONE;
 
+	switch (code) {
+	case AFI_INTR_LEGACY:
+		return IRQ_NONE;
 	/*
 	 * do not pollute kernel log with master abort reports since they
 	 * happen a lot during enumeration
 	 */
-	if (code == AFI_INTR_MASTER_ABORT)
+	case AFI_INTR_MASTER_ABORT:
 		dev_dbg(dev, "%s, signature: %08x\n", err_msg[code], signature);
-	else
+		fpci = afi_readl(pcie, AFI_UPPER_FPCI_ADDRESS) & 0xff;
+		address = (u64)fpci << 32 | (signature & 0xfffffffc);
+		dev_dbg(dev, "  FPCI address: %10llx\n", address);
+		break;
+	case AFI_INTR_TARGET_ABORT:
+	case AFI_INTR_FPCI_DECODE_ERROR:
 		dev_err(dev, "%s, signature: %08x\n", err_msg[code], signature);
-
-	if (code == AFI_INTR_TARGET_ABORT || code == AFI_INTR_MASTER_ABORT ||
-	    code == AFI_INTR_FPCI_DECODE_ERROR) {
-		u32 fpci = afi_readl(pcie, AFI_UPPER_FPCI_ADDRESS) & 0xff;
-		u64 address = (u64)fpci << 32 | (signature & 0xfffffffc);
-
-		if (code == AFI_INTR_MASTER_ABORT)
-			dev_dbg(dev, "  FPCI address: %10llx\n", address);
-		else
-			dev_err(dev, "  FPCI address: %10llx\n", address);
+		fpci = afi_readl(pcie, AFI_UPPER_FPCI_ADDRESS) & 0xff;
+		address = (u64)fpci << 32 | (signature & 0xfffffffc);
+		dev_err(dev, "  FPCI address: %10llx\n", address);
+		break;
+	default:
+		dev_err(dev, "%s, signature: %08x\n", err_msg[code], signature);
+		break;
 	}
 
 	return IRQ_HANDLED;
-- 
2.17.1
