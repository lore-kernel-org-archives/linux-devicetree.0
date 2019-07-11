From: Jonathan Chocron <jonnyc@amazon.com>
Subject: [PATCH 8/8] PCI: dw: Add support for
 PCI_PROBE_ONLY/PCI_REASSIGN_ALL_BUS flags
Date: Thu, 11 Jul 2019 17:57:54 +0300
Message-ID: <20190710164519.17883-9-jonnyc@amazon.com>
References: <20190710164519.17883-1-jonnyc@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190710164519.17883-1-jonnyc@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: dwmw@amazon.co.uk, benh@kernel.crashing.org, alisaidi@amazon.com, ronenk@amazon.com, barakw@amazon.com, talel@amazon.com, hanochu@amazon.com, hhhawa@amazon.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jonnyc@amazon.com
List-Id: devicetree@vger.kernel.org

This basically aligns the usage of PCI_PROBE_ONLY and
PCI_REASSIGN_ALL_BUS in dw_pcie_host_init() with the logic in
pci_host_common_probe().

Now it will be possible to control via the devicetree whether to just
probe the PCI bus (in cases where FW already configured it) or to fully
configure it.

Signed-off-by: Jonathan Chocron <jonnyc@amazon.com>
---
 .../pci/controller/dwc/pcie-designware-host.c | 23 +++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pc=
i/controller/dwc/pcie-designware-host.c
index d2ca748e4c85..0a294d8aa21a 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -342,6 +342,8 @@ int dw_pcie_host_init(struct pcie_port *pp)
 	if (!bridge)
 		return -ENOMEM;
=20
+	of_pci_check_probe_only();
+
 	ret =3D devm_of_pci_get_host_bridge_resources(dev, 0, 0xff,
 					&bridge->windows, &pp->io_base);
 	if (ret)
@@ -474,6 +476,10 @@ int dw_pcie_host_init(struct pcie_port *pp)
=20
 	pp->root_bus_nr =3D pp->busn->start;
=20
+	/* Do not reassign bus nums if probe only */
+	if (!pci_has_flag(PCI_PROBE_ONLY))
+		pci_add_flags(PCI_REASSIGN_ALL_BUS);
+
 	bridge->dev.parent =3D dev;
 	bridge->sysdata =3D pp;
 	bridge->busnr =3D pp->root_bus_nr;
@@ -490,11 +496,20 @@ int dw_pcie_host_init(struct pcie_port *pp)
 	if (pp->ops->scan_bus)
 		pp->ops->scan_bus(pp);
=20
-	pci_bus_size_bridges(pp->root_bus);
-	pci_bus_assign_resources(pp->root_bus);
+	/*
+	 * We insert PCI resources into the iomem_resource and
+	 * ioport_resource trees in either pci_bus_claim_resources()
+	 * or pci_bus_assign_resources().
+	 */
+	if (pci_has_flag(PCI_PROBE_ONLY)) {
+		pci_bus_claim_resources(pp->root_bus);
+	} else {
+		pci_bus_size_bridges(pp->root_bus);
+		pci_bus_assign_resources(pp->root_bus);
=20
-	list_for_each_entry(child, &pp->root_bus->children, node)
-		pcie_bus_configure_settings(child);
+		list_for_each_entry(child, &pp->root_bus->children, node)
+			pcie_bus_configure_settings(child);
+	}
=20
 	pci_bus_add_devices(pp->root_bus);
 	return 0;
--=20
2.17.1
