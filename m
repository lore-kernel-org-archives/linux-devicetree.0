From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv3 24/27] PCI: mobiveil: ls_pcie_g4: add Workaround for
 A-011577
Date: Tue, 29 Jan 2019 08:11:01 +0000
Message-ID: <20190129080926.36773-25-Zhiqiang.Hou@nxp.com>
References: <20190129080926.36773-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129080926.36773-1-Zhiqiang.Hou@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>
Cc: Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>, "Z.q. Hou" <zhiqiang.hou@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

PCIe configuration access to non-existent function triggered
SERROR interrupt exception.

Workaround:
Disable error reporting on AXI bus during the Vendor ID read
transactions in enumeration.

This ERRATA is only for LX2160A Rev1.0, and it will be fixed
in Rev2.0.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
V3:
 - Integrated without change from http://patchwork.ozlabs.org/patch/1006790=
/

 .../controller/mobiveil/pci-layerscape-gen4.c | 37 +++++++++++++++++++
 .../controller/mobiveil/pcie-mobiveil-host.c  | 17 ++++++++-
 .../pci/controller/mobiveil/pcie-mobiveil.h   |  3 ++
 3 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/mobiveil/pci-layerscape-gen4.c b/driver=
s/pci/controller/mobiveil/pci-layerscape-gen4.c
index 174cbcac4059..d2c5dbbd5e3c 100644
--- a/drivers/pci/controller/mobiveil/pci-layerscape-gen4.c
+++ b/drivers/pci/controller/mobiveil/pci-layerscape-gen4.c
@@ -22,8 +22,13 @@
=20
 #include "pcie-mobiveil.h"
=20
+#define REV_1_0				(0x10)
+
 /* LUT and PF control registers */
 #define PCIE_LUT_OFF			(0x80000)
+#define PCIE_LUT_GCR			(0x28)
+#define PCIE_LUT_GCR_RRE		(0)
+
 #define PCIE_PF_OFF			(0xc0000)
 #define PCIE_PF_INT_STAT		(0x18)
 #define PF_INT_STAT_PABRST		(31)
@@ -41,6 +46,7 @@ struct ls_pcie_g4 {
 	struct mobiveil_pcie *pci;
 	struct delayed_work dwork;
 	int irq;
+	u8 rev;
 };
=20
 static inline u32 ls_pcie_g4_lut_readl(struct ls_pcie_g4 *pcie, u32 off)
@@ -76,6 +82,15 @@ static bool ls_pcie_g4_is_bridge(struct ls_pcie_g4 *pcie=
)
 	return header_type =3D=3D PCI_HEADER_TYPE_BRIDGE;
 }
=20
+static int ls_pcie_g4_host_init(struct mobiveil_pcie *pci)
+{
+	struct ls_pcie_g4 *pcie =3D to_ls_pcie_g4(pci);
+
+	pcie->rev =3D csr_readb(pci, PCI_REVISION_ID);
+
+	return 0;
+}
+
 static int ls_pcie_g4_link_up(struct mobiveil_pcie *pci)
 {
 	struct ls_pcie_g4 *pcie =3D to_ls_pcie_g4(pci);
@@ -188,12 +203,34 @@ static void ls_pcie_g4_reset(struct work_struct *work=
)
 	ls_pcie_g4_reinit_hw(pcie);
 }
=20
+static int ls_pcie_g4_read_other_conf(struct pci_bus *bus, unsigned int de=
vfn,
+				   int where, int size, u32 *val)
+{
+	struct mobiveil_pcie *pci =3D bus->sysdata;
+	struct ls_pcie_g4 *pcie =3D to_ls_pcie_g4(pci);
+	int ret;
+
+	if (pcie->rev =3D=3D REV_1_0 && where =3D=3D PCI_VENDOR_ID)
+		ls_pcie_g4_lut_writel(pcie, PCIE_LUT_GCR,
+				      0 << PCIE_LUT_GCR_RRE);
+
+	ret =3D pci_generic_config_read(bus, devfn, where, size, val);
+
+	if (pcie->rev =3D=3D REV_1_0 && where =3D=3D PCI_VENDOR_ID)
+		ls_pcie_g4_lut_writel(pcie, PCIE_LUT_GCR,
+				      1 << PCIE_LUT_GCR_RRE);
+
+	return ret;
+}
+
 static struct mobiveil_rp_ops ls_pcie_g4_rp_ops =3D {
 	.interrupt_init =3D ls_pcie_g4_interrupt_init,
+	.read_other_conf =3D ls_pcie_g4_read_other_conf,
 };
=20
 static const struct mobiveil_pab_ops ls_pcie_g4_pab_ops =3D {
 	.link_up =3D ls_pcie_g4_link_up,
+	.host_init =3D ls_pcie_g4_host_init,
 };
=20
 static int __init ls_pcie_g4_probe(struct platform_device *pdev)
diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c b/drivers=
/pci/controller/mobiveil/pcie-mobiveil-host.c
index e8d0c4989013..5f51bc2dd6d7 100644
--- a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
+++ b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
@@ -79,9 +79,20 @@ static void __iomem *mobiveil_pcie_map_bus(struct pci_bu=
s *bus,
 	return pcie->rp.config_axi_slave_base + where;
 }
=20
+static int mobiveil_pcie_config_read(struct pci_bus *bus, unsigned int dev=
fn,
+				     int where, int size, u32 *val)
+{
+	struct mobiveil_pcie *pcie =3D bus->sysdata;
+	struct root_port *rp =3D &pcie->rp;
+
+	if (bus->number > rp->root_bus_nr && rp->ops->read_other_conf)
+		return rp->ops->read_other_conf(bus, devfn, where, size, val);
+
+	return pci_generic_config_read(bus, devfn, where, size, val);
+}
 static struct pci_ops mobiveil_pcie_ops =3D {
 	.map_bus =3D mobiveil_pcie_map_bus,
-	.read =3D pci_generic_config_read,
+	.read =3D mobiveil_pcie_config_read,
 	.write =3D pci_generic_config_write,
 };
=20
@@ -309,6 +320,10 @@ int mobiveil_host_init(struct mobiveil_pcie *pcie, boo=
l reinit)
 	value |=3D (PCI_CLASS_BRIDGE_PCI << 16);
 	csr_writel(pcie, value, PAB_INTP_AXI_PIO_CLASS);
=20
+	/* Platform specific host init */
+	if (pcie->ops->host_init)
+		return pcie->ops->host_init(pcie);
+
 	return 0;
 }
=20
diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil.h b/drivers/pci/=
controller/mobiveil/pcie-mobiveil.h
index 0ccd6cee5f8f..ab43de5e4b2b 100644
--- a/drivers/pci/controller/mobiveil/pcie-mobiveil.h
+++ b/drivers/pci/controller/mobiveil/pcie-mobiveil.h
@@ -145,6 +145,8 @@ struct mobiveil_msi {			/* MSI information */
=20
 struct mobiveil_rp_ops {
 	int (*interrupt_init)(struct mobiveil_pcie *pcie);
+	int (*read_other_conf)(struct pci_bus *bus, unsigned int devfn,
+			       int where, int size, u32 *val);
 };
=20
 struct root_port {
@@ -160,6 +162,7 @@ struct root_port {
=20
 struct mobiveil_pab_ops {
 	int (*link_up)(struct mobiveil_pcie *pcie);
+	int (*host_init)(struct mobiveil_pcie *pcie);
 };
=20
 struct mobiveil_pcie {
--=20
2.17.1
