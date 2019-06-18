Return-Path: <SRS0=nfyP=UR=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH V6 20/27] PCI: tegra: Disable MSI for Tegra PCIe root port
Date: Tue, 18 Jun 2019 23:31:59 +0530
Message-ID: <20190618180206.4908-21-mmaddireddy@nvidia.com>
In-Reply-To: <20190618180206.4908-1-mmaddireddy@nvidia.com>
References: <20190618180206.4908-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Tegra PCIe generates PME and AER events over legacy interrupt line. Disable
MSI to avoid service drivers registering interrupt routine over MSI IRQ
line.

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
---
V6: Replaced pcie_pme_disable_msi() with no_msi quirk

V5: No change

V4: No change

V3: Corrected typo in commit log

V2: No change

 drivers/pci/quirks.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index a59ad09ce911..20dcad421991 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -2576,6 +2576,45 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA,
 			PCI_DEVICE_ID_NVIDIA_NVENET_15,
 			nvenet_msi_disable);
 
+/*
+ * Tegra PCIe generates PME and AER events over legacy interrupt line.
+ * So disable msi for Tegra PCIe root ports.
+ */
+static void pci_quirk_nvidia_tegra_disable_rp_msi(struct pci_dev *dev)
+{
+	dev->no_msi = 1;
+}
+DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0bf0,
+			      PCI_CLASS_BRIDGE_PCI, 8,
+			      pci_quirk_nvidia_tegra_disable_rp_msi);
+DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0bf1,
+			      PCI_CLASS_BRIDGE_PCI, 8,
+			      pci_quirk_nvidia_tegra_disable_rp_msi);
+DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0e1c,
+			      PCI_CLASS_BRIDGE_PCI, 8,
+			      pci_quirk_nvidia_tegra_disable_rp_msi);
+DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0e1d,
+			      PCI_CLASS_BRIDGE_PCI, 8,
+			      pci_quirk_nvidia_tegra_disable_rp_msi);
+DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0e12,
+			      PCI_CLASS_BRIDGE_PCI, 8,
+			      pci_quirk_nvidia_tegra_disable_rp_msi);
+DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0e13,
+			      PCI_CLASS_BRIDGE_PCI, 8,
+			      pci_quirk_nvidia_tegra_disable_rp_msi);
+DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0fae,
+			      PCI_CLASS_BRIDGE_PCI, 8,
+			      pci_quirk_nvidia_tegra_disable_rp_msi);
+DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0faf,
+			      PCI_CLASS_BRIDGE_PCI, 8,
+			      pci_quirk_nvidia_tegra_disable_rp_msi);
+DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_NVIDIA, 0x10e5,
+			      PCI_CLASS_BRIDGE_PCI, 8,
+			      pci_quirk_nvidia_tegra_disable_rp_msi);
+DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_NVIDIA, 0x10e6,
+			      PCI_CLASS_BRIDGE_PCI, 8,
+			      pci_quirk_nvidia_tegra_disable_rp_msi);
+
 /*
  * Some versions of the MCP55 bridge from Nvidia have a legacy IRQ routing
  * config register.  This register controls the routing of legacy
-- 
2.17.1
