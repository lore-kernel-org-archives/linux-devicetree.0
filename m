From: Jonathan Chocron <jonnyc@amazon.com>
Subject: [PATCH v5 2/7] PCI: Add ACS quirk for Amazon Annapurna Labs root ports
Date: Thu, 5 Sep 2019 17:00:16 +0300
Message-ID: <20190905140018.5139-3-jonnyc@amazon.com>
References: <20190905140018.5139-1-jonnyc@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190905140018.5139-1-jonnyc@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: andrew.murray@arm.com, dwmw@amazon.co.uk, benh@kernel.crashing.org, alisaidi@amazon.com, ronenk@amazon.com, barakw@amazon.com, talel@amazon.com, hanochu@amazon.com, hhhawa@amazon.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jonnyc@amazon.com
List-Id: devicetree@vger.kernel.org

From: Ali Saidi <alisaidi@amazon.com>

The Amazon's Annapurna Labs root ports don't advertise an ACS
capability, but they don't allow peer-to-peer transactions and do
validate bus numbers through the SMMU. Additionally, it's not possible
for one RP to pass traffic to another RP.

Signed-off-by: Ali Saidi <alisaidi@amazon.com>
Signed-off-by: Jonathan Chocron <jonnyc@amazon.com>
Reviewed-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Reviewed-by: Andrew Murray <andrew.murray@arm.com>
---
 drivers/pci/quirks.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index ded60757a573..8fe765592943 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -4418,6 +4418,24 @@ static int pci_quirk_qcom_rp_acs(struct pci_dev *dev, u16 acs_flags)
 	return ret;
 }
 
+static int pci_quirk_al_acs(struct pci_dev *dev, u16 acs_flags)
+{
+	/*
+	 * Amazon's Annapurna Labs root ports don't include an ACS capability,
+	 * but do include ACS-like functionality. The hardware doesn't support
+	 * peer-to-peer transactions via the root port and each has a unique
+	 * segment number.
+	 *
+	 * Additionally, the root ports cannot send traffic to each other.
+	 */
+	acs_flags &= ~(PCI_ACS_RR | PCI_ACS_CR | PCI_ACS_SV | PCI_ACS_UF);
+
+	if (pci_pcie_type(dev) != PCI_EXP_TYPE_ROOT_PORT)
+		return -ENOTTY;
+
+	return acs_flags ? 0 : 1;
+}
+
 /*
  * Sunrise Point PCH root ports implement ACS, but unfortunately as shown in
  * the datasheet (Intel 100 Series Chipset Family PCH Datasheet, Vol. 2,
@@ -4611,6 +4629,8 @@ static const struct pci_dev_acs_enabled {
 	{ PCI_VENDOR_ID_AMPERE, 0xE00A, pci_quirk_xgene_acs },
 	{ PCI_VENDOR_ID_AMPERE, 0xE00B, pci_quirk_xgene_acs },
 	{ PCI_VENDOR_ID_AMPERE, 0xE00C, pci_quirk_xgene_acs },
+	/* Amazon Annapurna Labs */
+	{ PCI_VENDOR_ID_AMAZON_ANNAPURNA_LABS, 0x0031, pci_quirk_al_acs },
 	{ 0 }
 };
 
-- 
2.17.1
