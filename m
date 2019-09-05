From: Jonathan Chocron <jonnyc@amazon.com>
Subject: [PATCH v5 7/7] PCI: dwc: Add validation that PCIe core is set to correct mode
Date: Thu, 5 Sep 2019 17:01:44 +0300
Message-ID: <20190905140144.7933-3-jonnyc@amazon.com>
References: <20190905140018.5139-1-jonnyc@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190905140018.5139-1-jonnyc@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: andrew.murray@arm.com, dwmw@amazon.co.uk, benh@kernel.crashing.org, alisaidi@amazon.com, ronenk@amazon.com, barakw@amazon.com, talel@amazon.com, hanochu@amazon.com, hhhawa@amazon.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jonnyc@amazon.com
List-Id: devicetree@vger.kernel.org

Some PCIe controllers can be set to either Host or EP according to some
early boot FW. To make sure there is no discrepancy (e.g. FW configured
the port to EP mode while the DT specifies it as a host bridge or vice
versa), a check has been added for each mode.

Signed-off-by: Jonathan Chocron <jonnyc@amazon.com>
Acked-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c  |  8 ++++++++
 .../pci/controller/dwc/pcie-designware-host.c    | 16 ++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 65f479250087..3dd2e2697294 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -498,6 +498,7 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	int ret;
 	u32 reg;
 	void *addr;
+	u8 hdr_type;
 	unsigned int nbars;
 	unsigned int offset;
 	struct pci_epc *epc;
@@ -562,6 +563,13 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	if (ep->ops->ep_init)
 		ep->ops->ep_init(ep);
 
+	hdr_type = dw_pcie_readb_dbi(pci, PCI_HEADER_TYPE);
+	if (hdr_type != PCI_HEADER_TYPE_NORMAL) {
+		dev_err(pci->dev, "PCIe controller is not set to EP mode (hdr_type:0x%x)!\n",
+			hdr_type);
+		return -EIO;
+	}
+
 	ret = of_property_read_u8(np, "max-functions", &epc->max_functions);
 	if (ret < 0)
 		epc->max_functions = 1;
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index d3156446ff27..0f36a926059a 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -323,6 +323,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
 	struct pci_bus *child;
 	struct pci_host_bridge *bridge;
 	struct resource *cfg_res;
+	u32 hdr_type;
 	int ret;
 
 	raw_spin_lock_init(&pci->pp.lock);
@@ -464,6 +465,21 @@ int dw_pcie_host_init(struct pcie_port *pp)
 			goto err_free_msi;
 	}
 
+	ret = dw_pcie_rd_own_conf(pp, PCI_HEADER_TYPE, 1, &hdr_type);
+	if (ret != PCIBIOS_SUCCESSFUL) {
+		dev_err(pci->dev, "Failed reading PCI_HEADER_TYPE cfg space reg (ret: 0x%x)\n",
+			ret);
+		ret = pcibios_err_to_errno(ret);
+		goto err_free_msi;
+	}
+	if (hdr_type != PCI_HEADER_TYPE_BRIDGE) {
+		dev_err(pci->dev,
+			"PCIe controller is not set to bridge type (hdr_type: 0x%x)!\n",
+			hdr_type);
+		ret = -EIO;
+		goto err_free_msi;
+	}
+
 	pp->root_bus_nr = pp->busn->start;
 
 	bridge->dev.parent = dev;
-- 
2.17.1
