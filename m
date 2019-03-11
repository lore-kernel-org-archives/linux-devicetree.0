From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv4 26/28] PCI: mobiveil: ls_pcie_g4: add Workaround for
 A-011451
Date: Mon, 11 Mar 2019 09:33:32 +0000
Message-ID: <20190311093130.7209-27-Zhiqiang.Hou@nxp.com>
References: <20190311093130.7209-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311093130.7209-1-Zhiqiang.Hou@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>
Cc: Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>, "Z.q. Hou" <zhiqiang.hou@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

When LX2 PCIe controller is sending multiple split completions and
ACK latency expires indicating that ACK should be send at priority.
But because of large number of split completions and FC update DLLP,
the controller does not give priority to ACK transmission. This
results into ACK latency timer timeout error at the link partner and
the pending TLPs are replayed by the link partner again.

Workaround:
1. Reduce the ACK latency timeout value to a very small value.
2. Restrict the number of completions from the LX2 PCIe controller
   to 1, by changing the Max Read Request Size (MRRS) of link partner
   to the same value as Max Packet size (MPS).

This patch implemented part 1, the part 2 can be set by kernel parameter
'pci=3Dpcie_bus_perf'

This ERRATA is only for LX2160A Rev1.0, and it will be fixed
in Rev2.0.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
V4:
 - no change

 .../pci/controller/mobiveil/pci-layerscape-gen4.c | 15 +++++++++++++++
 drivers/pci/controller/mobiveil/pcie-mobiveil.h   |  4 ++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/pci/controller/mobiveil/pci-layerscape-gen4.c b/driver=
s/pci/controller/mobiveil/pci-layerscape-gen4.c
index d2c5dbbd5e3c..20ce146788ca 100644
--- a/drivers/pci/controller/mobiveil/pci-layerscape-gen4.c
+++ b/drivers/pci/controller/mobiveil/pci-layerscape-gen4.c
@@ -82,12 +82,27 @@ static bool ls_pcie_g4_is_bridge(struct ls_pcie_g4 *pci=
e)
 	return header_type =3D=3D PCI_HEADER_TYPE_BRIDGE;
 }
=20
+static void workaround_A011451(struct ls_pcie_g4 *pcie)
+{
+	struct mobiveil_pcie *mv_pci =3D pcie->pci;
+	u32 val;
+
+	/* Set ACK latency timeout */
+	val =3D csr_readl(mv_pci, GPEX_ACK_REPLAY_TO);
+	val &=3D ~(ACK_LAT_TO_VAL_MASK << ACK_LAT_TO_VAL_SHIFT);
+	val |=3D (4 << ACK_LAT_TO_VAL_SHIFT);
+	csr_writel(mv_pci, val, GPEX_ACK_REPLAY_TO);
+}
+
 static int ls_pcie_g4_host_init(struct mobiveil_pcie *pci)
 {
 	struct ls_pcie_g4 *pcie =3D to_ls_pcie_g4(pci);
=20
 	pcie->rev =3D csr_readb(pci, PCI_REVISION_ID);
=20
+	if (pcie->rev =3D=3D REV_1_0)
+		workaround_A011451(pcie);
+
 	return 0;
 }
=20
diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil.h b/drivers/pci/=
controller/mobiveil/pcie-mobiveil.h
index ab43de5e4b2b..f0e2e4ae09b5 100644
--- a/drivers/pci/controller/mobiveil/pcie-mobiveil.h
+++ b/drivers/pci/controller/mobiveil/pcie-mobiveil.h
@@ -85,6 +85,10 @@
 #define PAB_AXI_AMAP_PEX_WIN_H(win)	PAB_REG_ADDR(0x0bac, win)
 #define PAB_INTP_AXI_PIO_CLASS		0x474
=20
+#define GPEX_ACK_REPLAY_TO		0x438
+#define  ACK_LAT_TO_VAL_MASK		0x1fff
+#define  ACK_LAT_TO_VAL_SHIFT		0
+
 #define PAB_PEX_AMAP_CTRL(win)		PAB_REG_ADDR(0x4ba0, win)
 #define  AMAP_CTRL_EN_SHIFT		0
 #define  AMAP_CTRL_TYPE_SHIFT		1
--=20
2.17.1
