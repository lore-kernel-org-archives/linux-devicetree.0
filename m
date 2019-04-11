Return-Path: <SRS0=HOgu=SN=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH 04/30] PCI: tegra: Add PCIe Gen2 link speed support
Date: Thu, 11 Apr 2019 22:33:29 +0530
Message-ID: <20190411170355.6882-5-mmaddireddy@nvidia.com>
In-Reply-To: <20190411170355.6882-1-mmaddireddy@nvidia.com>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Tegra124, 132, 210 and 186 support Gen2 link speed. After PCIe link is up
in Gen1, set target link speed as Gen2 and retrain link. Link switches to
Gen2 speed if Gen2 capable end point is connected, else link stays in Gen1.

Per PCIe 4.0r0.9 sec 7.6.3.7 implementation note, driver need to wait for
PCIe LTSSM to come back from recovery before retraining the link.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
 drivers/pci/controller/pci-tegra.c | 61 ++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index a61ce9d475b4..6ccda82735f8 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -191,6 +191,8 @@
 #define  RP_LINK_CONTROL_STATUS_DL_LINK_ACTIVE	0x20000000
 #define  RP_LINK_CONTROL_STATUS_LINKSTAT_MASK	0x3fff0000
 
+#define RP_LINK_CONTROL_STATUS_2		0x000000b0
+
 #define PADS_CTL_SEL		0x0000009c
 
 #define PADS_CTL		0x000000a0
@@ -2096,6 +2098,62 @@ static void tegra_pcie_apply_pad_settings(struct tegra_pcie *pcie)
 		pads_writel(pcie, soc->pads_refclk_cfg1, PADS_REFCLK_CFG1);
 }
 
+#define LINK_RETRAIN_TIMEOUT 100000
+
+static void tegra_pcie_change_link_speed(struct tegra_pcie *pcie)
+{
+	struct device *dev = pcie->dev;
+	struct tegra_pcie_port *port, *tmp;
+	ktime_t deadline;
+	u32 val;
+
+	list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
+		/*
+		 * Link Capabilities 2 register is hardwired to 0 in Tegra,
+		 * so no need to read it before setting target speed.
+		 */
+		val = readl(port->base + RP_LINK_CONTROL_STATUS_2);
+		val &= ~PCI_EXP_LNKSTA_CLS;
+		val |= PCI_EXP_LNKSTA_CLS_5_0GB;
+		writel(val, port->base + RP_LINK_CONTROL_STATUS_2);
+
+		/*
+		 * Poll until link comes back from recovery to avoid race
+		 * condition.
+		 */
+		deadline = ktime_add_us(ktime_get(), LINK_RETRAIN_TIMEOUT);
+		for (;;) {
+			val = readl(port->base + RP_LINK_CONTROL_STATUS);
+			if (!(val & PCI_EXP_LNKSTA_LT))
+				break;
+			if (ktime_after(ktime_get(), deadline))
+				break;
+			usleep_range(2000, 3000);
+		}
+		if (val & PCI_EXP_LNKSTA_LT)
+			dev_err(dev, "PCIe port %u link is still in recovery\n",
+				port->index);
+
+		/* Retrain the link */
+		val = readl(port->base + RP_LINK_CONTROL_STATUS);
+		val |= PCI_EXP_LNKCTL_RL;
+		writel(val, port->base + RP_LINK_CONTROL_STATUS);
+
+		deadline = ktime_add_us(ktime_get(), LINK_RETRAIN_TIMEOUT);
+		for (;;) {
+			val = readl(port->base + RP_LINK_CONTROL_STATUS);
+			if (!(val & PCI_EXP_LNKSTA_LT))
+				break;
+			if (ktime_after(ktime_get(), deadline))
+				break;
+			usleep_range(2000, 3000);
+		}
+		if (val & PCI_EXP_LNKSTA_LT)
+			dev_err(dev, "link retrain of PCIe port %u failed\n",
+				port->index);
+	}
+}
+
 static void tegra_pcie_enable_ports(struct tegra_pcie *pcie)
 {
 	struct device *dev = pcie->dev;
@@ -2122,6 +2180,9 @@ static void tegra_pcie_enable_ports(struct tegra_pcie *pcie)
 		tegra_pcie_port_disable(port);
 		tegra_pcie_port_free(port);
 	}
+
+	if (pcie->soc->has_gen2)
+		tegra_pcie_change_link_speed(pcie);
 }
 
 static void tegra_pcie_disable_ports(struct tegra_pcie *pcie)
-- 
2.17.1
