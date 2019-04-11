Return-Path: <SRS0=HOgu=SN=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH 18/30] PCI: tegra: Change PRSNT_SENSE irq log to debug
Date: Thu, 11 Apr 2019 22:33:43 +0530
Message-ID: <20190411170355.6882-19-mmaddireddy@nvidia.com>
In-Reply-To: <20190411170355.6882-1-mmaddireddy@nvidia.com>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

PRSNT_MAP bit field is programmed to update the slot present status.
PRSNT_SENSE irq is triggered when this bit field is programmed, which is
not an error. Add a new switch case to trap RSNT_SENSE code and print it
with debug log level.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
 drivers/pci/controller/pci-tegra.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index cf2715065a53..dcfe97711cb5 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -855,6 +855,9 @@ static irqreturn_t tegra_pcie_isr(int irq, void *arg)
 	switch (code) {
 	case AFI_INTR_LEGACY:
 		return IRQ_NONE;
+	case AFI_INTR_PE_PRSNT_SENSE:
+		dev_dbg(dev, "%s, signature: %08x\n", err_msg[code], signature);
+		break;
 	/*
 	 * do not pollute kernel log with master abort reports since they
 	 * happen a lot during enumeration
-- 
2.17.1
