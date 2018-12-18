From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv3 3/5] PCI: dwc: fix potential memory leak
Date: Tue, 18 Dec 2018 04:19:37 +0000
Message-ID: <20181218041956.41809-4-Zhiqiang.Hou@nxp.com>
References: <20181218041956.41809-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181218041956.41809-1-Zhiqiang.Hou@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>, Leo Li <leoyang.li@nxp.com>
Cc: Roy Zang <roy.zang@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, "Z.q. Hou" <zhiqiang.hou@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

To avoid memory leak on error return of the adjacent function
devm_of_pci_get_host_bridge_resources(), change to use
devm_pci_alloc_host_bridge() to allocate host bridge structure,
then it will be managed automatically.

Fixes: 295aeb98a322 ("PCI: designware: Convert PCI scan API to
pci_scan_root_bus_bridge()")
Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
V3:
 - Changed to use devm_* to allocate host bridge.=20
 - Added Fixes info.

 .../pci/controller/dwc/pcie-designware-host.c | 28 ++++++++-----------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pc=
i/controller/dwc/pcie-designware-host.c
index 29a05759a294..33b5a3815d24 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -346,7 +346,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
 		dev_err(dev, "Missing *config* reg space\n");
 	}
=20
-	bridge =3D pci_alloc_host_bridge(0);
+	bridge =3D devm_pci_alloc_host_bridge(dev, 0);
 	if (!bridge)
 		return -ENOMEM;
=20
@@ -357,7 +357,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
=20
 	ret =3D devm_request_pci_bus_resources(dev, &bridge->windows);
 	if (ret)
-		goto error;
+		return ret;
=20
 	/* Get the I/O and memory ranges from DT */
 	resource_list_for_each_entry_safe(win, tmp, &bridge->windows) {
@@ -401,8 +401,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
 						resource_size(pp->cfg));
 		if (!pci->dbi_base) {
 			dev_err(dev, "Error with ioremap\n");
-			ret =3D -ENOMEM;
-			goto error;
+			return -ENOMEM;
 		}
 	}
=20
@@ -413,8 +412,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
 					pp->cfg0_base, pp->cfg0_size);
 		if (!pp->va_cfg0_base) {
 			dev_err(dev, "Error with ioremap in function\n");
-			ret =3D -ENOMEM;
-			goto error;
+			return -ENOMEM;
 		}
 	}
=20
@@ -424,8 +422,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
 						pp->cfg1_size);
 		if (!pp->va_cfg1_base) {
 			dev_err(dev, "Error with ioremap\n");
-			ret =3D -ENOMEM;
-			goto error;
+			return -ENOMEM;
 		}
 	}
=20
@@ -448,14 +445,14 @@ int dw_pcie_host_init(struct pcie_port *pp)
 			    pp->num_vectors =3D=3D 0) {
 				dev_err(dev,
 					"Invalid number of vectors\n");
-				goto error;
+				return -EINVAL;
 			}
 		}
=20
 		if (!pp->ops->msi_host_init) {
 			ret =3D dw_pcie_allocate_domains(pp);
 			if (ret)
-				goto error;
+				return ret;
=20
 			if (pp->msi_irq)
 				irq_set_chained_handler_and_data(pp->msi_irq,
@@ -464,14 +461,14 @@ int dw_pcie_host_init(struct pcie_port *pp)
 		} else {
 			ret =3D pp->ops->msi_host_init(pp);
 			if (ret < 0)
-				goto error;
+				return ret;
 		}
 	}
=20
 	if (pp->ops->host_init) {
 		ret =3D pp->ops->host_init(pp);
 		if (ret)
-			goto error;
+			return ret;
 	}
=20
 	pp->root_bus_nr =3D pp->busn->start;
@@ -485,7 +482,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
=20
 	ret =3D pci_scan_root_bus_bridge(bridge);
 	if (ret)
-		goto error;
+		return ret;
=20
 	bus =3D bridge->bus;
=20
@@ -499,11 +496,8 @@ int dw_pcie_host_init(struct pcie_port *pp)
 		pcie_bus_configure_settings(child);
=20
 	pci_bus_add_devices(bus);
-	return 0;
=20
-error:
-	pci_free_host_bridge(bridge);
-	return ret;
+	return 0;
 }
=20
 static int dw_pcie_rd_other_conf(struct pcie_port *pp, struct pci_bus *bus=
,
--=20
2.17.1
