From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv3 5/5] PCI: dwc: add prefetchable memory range support
Date: Tue, 18 Dec 2018 04:19:48 +0000
Message-ID: <20181218041956.41809-6-Zhiqiang.Hou@nxp.com>
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

The current code only support non-prefetchable memory range,
as the non-prefetchable memory range must not be greater than
4GiB, one viewport can cover it, which supports upto 4GiB.

To support prefetchable memory range, which is upto 64-bit
memory space and can be greater than 4GiB, so we need multiple
viewports. And added separate vars to store prefetchable memory
range info to prevent overriding the non-prefetchable memory
range info.

And this patch explicitly assigned the last (if there are only
2 viewports) or last 2 viewports for CFG and I/O windows and the
rests for MEM windows.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
V3:
 - Changed back to get num-viewport from DTS.
 - Added print info upon non-pref memory truncated.
 - Corrected typo.

 .../pci/controller/dwc/pcie-designware-host.c | 107 +++++++++++++++---
 drivers/pci/controller/dwc/pcie-designware.h  |   7 ++
 2 files changed, 97 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pc=
i/controller/dwc/pcie-designware-host.c
index 33b5a3815d24..2d1dd3dba1ba 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -346,6 +346,28 @@ int dw_pcie_host_init(struct pcie_port *pp)
 		dev_err(dev, "Missing *config* reg space\n");
 	}
=20
+	ret =3D of_property_read_u32(np, "num-viewport", &pci->num_viewport);
+	if (ret || pci->num_viewport < 2)
+		pci->num_viewport =3D 2;
+
+	/*
+	 * if there are only 2 viewports, assign the last viewport for
+	 * both CFG and IO window, otherwise assign the last 2 viewport
+	 * for CFG and IO window specific. And the rest viewports are
+	 * assigned to MEM windows.
+	 */
+	if (pci->num_viewport =3D=3D 2) {
+		pp->cfg_idx =3D pp->io_idx =3D PCIE_ATU_REGION_INDEX1;
+		pp->mem_wins =3D 1;
+	} else {
+		pp->cfg_idx =3D pci->num_viewport - 1;
+		pp->io_idx =3D pci->num_viewport - 2;
+		pp->mem_wins =3D pci->num_viewport - 2;
+	}
+
+	dev_dbg(dev, "CFG win id: %d, I/O win id: %d, Total MEM win: %d\n",
+		pp->cfg_idx, pp->io_idx, pp->mem_wins);
+
 	bridge =3D devm_pci_alloc_host_bridge(dev, 0);
 	if (!bridge)
 		return -ENOMEM;
@@ -377,10 +399,20 @@ int dw_pcie_host_init(struct pcie_port *pp)
 			}
 			break;
 		case IORESOURCE_MEM:
-			pp->mem =3D win->res;
-			pp->mem->name =3D "MEM";
-			pp->mem_size =3D resource_size(pp->mem);
-			pp->mem_bus_addr =3D pp->mem->start - win->offset;
+			if (win->res->flags & IORESOURCE_PREFETCH) {
+				pp->mem_pref =3D win->res;
+				pp->mem_pref->name =3D "MEM pref";
+				pp->mem_pref_size =3D resource_size(pp->mem_pref);
+				pp->mem_pref_bus_addr =3D pp->mem_pref->start -
+							win->offset;
+				pp->mem_pref_base =3D pp->mem_pref->start;
+			} else {
+				pp->mem =3D win->res;
+				pp->mem->name =3D "MEM";
+				pp->mem_size =3D resource_size(pp->mem);
+				pp->mem_bus_addr =3D pp->mem->start - win->offset;
+				pp->mem_base =3D pp->mem->start;
+			}
 			break;
 		case 0:
 			pp->cfg =3D win->res;
@@ -405,8 +437,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
 		}
 	}
=20
-	pp->mem_base =3D pp->mem->start;
-
 	if (!pp->va_cfg0_base) {
 		pp->va_cfg0_base =3D devm_pci_remap_cfgspace(dev,
 					pp->cfg0_base, pp->cfg0_size);
@@ -527,12 +557,12 @@ static int dw_pcie_rd_other_conf(struct pcie_port *pp=
, struct pci_bus *bus,
 		va_cfg_base =3D pp->va_cfg1_base;
 	}
=20
-	dw_pcie_prog_outbound_atu(pci, PCIE_ATU_REGION_INDEX1,
+	dw_pcie_prog_outbound_atu(pci, pp->cfg_idx,
 				  type, cpu_addr,
 				  busdev, cfg_size);
 	ret =3D dw_pcie_read(va_cfg_base + where, size, val);
-	if (pci->num_viewport <=3D 2)
-		dw_pcie_prog_outbound_atu(pci, PCIE_ATU_REGION_INDEX1,
+	if (pp->cfg_idx =3D=3D pp->io_idx)
+		dw_pcie_prog_outbound_atu(pci, pp->io_idx,
 					  PCIE_ATU_TYPE_IO, pp->io_base,
 					  pp->io_bus_addr, pp->io_size);
=20
@@ -566,12 +596,12 @@ static int dw_pcie_wr_other_conf(struct pcie_port *pp=
, struct pci_bus *bus,
 		va_cfg_base =3D pp->va_cfg1_base;
 	}
=20
-	dw_pcie_prog_outbound_atu(pci, PCIE_ATU_REGION_INDEX1,
+	dw_pcie_prog_outbound_atu(pci, pp->cfg_idx,
 				  type, cpu_addr,
 				  busdev, cfg_size);
 	ret =3D dw_pcie_write(va_cfg_base + where, size, val);
-	if (pci->num_viewport <=3D 2)
-		dw_pcie_prog_outbound_atu(pci, PCIE_ATU_REGION_INDEX1,
+	if (pp->cfg_idx =3D=3D pp->io_idx)
+		dw_pcie_prog_outbound_atu(pci, pp->io_idx,
 					  PCIE_ATU_TYPE_IO, pp->io_base,
 					  pp->io_bus_addr, pp->io_size);
=20
@@ -645,6 +675,9 @@ static u8 dw_pcie_iatu_unroll_enabled(struct dw_pcie *p=
ci)
 void dw_pcie_setup_rc(struct pcie_port *pp)
 {
 	u32 val, ctrl, num_ctrls;
+	u64 unmapped_size, base, win_size;
+	phys_addr_t bus_addr;
+	int i;
 	struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);
=20
 	dw_pcie_setup(pci);
@@ -693,13 +726,53 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
 		dev_dbg(pci->dev, "iATU unroll: %s\n",
 			pci->iatu_unroll_enabled ? "enabled" : "disabled");
=20
+		/*
+		 * The maximum region size is 4 GB, and a region
+		 * must not cross a 4 GB boundary.
+		 */
+		win_size =3D SZ_4G - (pp->mem_base & (SZ_4G - 1));
+		win_size =3D min(win_size, pp->mem_size);
+		if (win_size < pp->mem_size)
+			dev_info(pci->dev,
+				 "iATU: non-pref MEM size is truncated to 0x%llx\n",
+				 win_size);
+
 		dw_pcie_prog_outbound_atu(pci, PCIE_ATU_REGION_INDEX0,
 					  PCIE_ATU_TYPE_MEM, pp->mem_base,
-					  pp->mem_bus_addr, pp->mem_size);
-		if (pci->num_viewport > 2)
-			dw_pcie_prog_outbound_atu(pci, PCIE_ATU_REGION_INDEX2,
-						  PCIE_ATU_TYPE_IO, pp->io_base,
-						  pp->io_bus_addr, pp->io_size);
+					  pp->mem_bus_addr, win_size);
+		dev_dbg(pci->dev,
+			"iATU: non-pref MEM: win =3D %d: base =3D 0x%llx, bus_addr =3D %pa, siz=
e =3D 0x%llx\n",
+			0, pp->mem_base, &pp->mem_bus_addr, win_size);
+
+		/*
+		 * Prefetchable memory range can be 64bit space,
+		 * so may need multiple viewports.
+		 */
+		unmapped_size =3D pp->mem_pref_size;
+		base =3D pp->mem_pref_base;
+		bus_addr =3D pp->mem_pref_bus_addr;
+		for (i =3D PCIE_ATU_REGION_INDEX1;
+		     unmapped_size > 0 && i < pp->mem_wins; i++) {
+			win_size =3D SZ_4G - (base & (SZ_4G - 1));
+			win_size =3D min(win_size, unmapped_size);
+			dw_pcie_prog_outbound_atu(pci, i, PCIE_ATU_TYPE_MEM,
+						  base, bus_addr, win_size);
+			dev_dbg(pci->dev,
+				"iATU: pref MEM: win =3D %d: base =3D 0x%llx, bus_addr =3D %pa, size =
=3D 0x%llx\n",
+				i, base, &bus_addr, win_size);
+
+			base +=3D win_size;
+			bus_addr +=3D win_size;
+			unmapped_size -=3D win_size;
+		}
+
+		if (unmapped_size > 0)
+			dev_info(pci->dev,
+				 "iATU: can't cover pref memory range\n");
+
+		dw_pcie_prog_outbound_atu(pci, pp->io_idx, PCIE_ATU_TYPE_IO,
+					  pp->io_base, pp->io_bus_addr,
+					  pp->io_size);
 	}
=20
 	dw_pcie_wr_own_conf(pp, PCI_BASE_ADDRESS_0, 4, 0);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/con=
troller/dwc/pcie-designware.h
index 25604387d13e..1e87f18bc417 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -152,15 +152,22 @@ struct pcie_port {
 	u64			cfg1_base;
 	void __iomem		*va_cfg1_base;
 	u32			cfg1_size;
+	u32			cfg_idx;
 	resource_size_t		io_base;
 	phys_addr_t		io_bus_addr;
 	u32			io_size;
+	u32			io_idx;
 	u64			mem_base;
 	phys_addr_t		mem_bus_addr;
 	u64			mem_size;
+	phys_addr_t		mem_pref_base;
+	pci_bus_addr_t		mem_pref_bus_addr;
+	u64			mem_pref_size;
+	u32			mem_wins;
 	struct resource		*cfg;
 	struct resource		*io;
 	struct resource		*mem;
+	struct resource		*mem_pref;
 	struct resource		*busn;
 	int			irq;
 	const struct dw_pcie_host_ops *ops;
--=20
2.17.1
