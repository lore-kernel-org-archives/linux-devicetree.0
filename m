From: Jonathan Chocron <jonnyc@amazon.com>
Subject: [PATCH v3 3/8] PCI/VPD: Add VPD release quirk for Amazon's Annapurna Labs Root Port
Date: Tue, 23 Jul 2019 12:25:28 +0300
Message-ID: <20190723092529.11310-4-jonnyc@amazon.com>
References: <20190723092529.11310-1-jonnyc@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190723092529.11310-1-jonnyc@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: dwmw@amazon.co.uk, benh@kernel.crashing.org, alisaidi@amazon.com, ronenk@amazon.com, barakw@amazon.com, talel@amazon.com, hanochu@amazon.com, hhhawa@amazon.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jonnyc@amazon.com
List-Id: devicetree@vger.kernel.org

The Amazon Annapurna Labs PCIe Root Port exposes the VPD capability,
but there is no actual support for it.

The reason for not using the already existing quirk_blacklist_vpd()
is that, although this fails pci_vpd_read/write, the 'vpd' sysfs
entry still exists. When running lspci -vv, for example, this
results in the following error:

pcilib: sysfs_read_vpd: read failed: Input/output error

This quirk removes the sysfs entry, which avoids the error print.

Signed-off-by: Jonathan Chocron <jonnyc@amazon.com>
Reviewed-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
---
 drivers/pci/vpd.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pci/vpd.c b/drivers/pci/vpd.c
index 4963c2e2bd4c..c23a8ec08db9 100644
--- a/drivers/pci/vpd.c
+++ b/drivers/pci/vpd.c
@@ -644,4 +644,20 @@ static void quirk_chelsio_extend_vpd(struct pci_dev *dev)
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_CHELSIO, PCI_ANY_ID,
 			quirk_chelsio_extend_vpd);
 
+static void quirk_al_vpd_release(struct pci_dev *dev)
+{
+	if (dev->vpd) {
+		pci_vpd_release(dev);
+		dev->vpd = NULL;
+		pci_warn(dev, FW_BUG "Releasing VPD capability (No support for VPD read/write transactions)\n");
+	}
+}
+
+/*
+ * The 0031 device id is reused for other non Root Port device types,
+ * therefore the quirk is registered for the PCI_CLASS_BRIDGE_PCI class.
+ */
+DECLARE_PCI_FIXUP_CLASS_FINAL(PCI_VENDOR_ID_AMAZON_ANNAPURNA_LABS, 0x0031,
+			      PCI_CLASS_BRIDGE_PCI, 8, quirk_al_vpd_release);
+
 #endif
-- 
2.17.1
