From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv4 20/28] PCI: mobiveil: disabled IB and OB windows set by
 bootloader
Date: Mon, 11 Mar 2019 09:32:40 +0000
Message-ID: <20190311093130.7209-21-Zhiqiang.Hou@nxp.com>
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

Disabled all inbound and outbound windows before set up the windows
in kernel, in case transactions match the window set by bootloader.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>
Reviewed-by: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
---
V4:
 - no change

 .../controller/mobiveil/pcie-mobiveil-host.c   |  7 +++++++
 .../pci/controller/mobiveil/pcie-mobiveil.c    | 18 ++++++++++++++++++
 .../pci/controller/mobiveil/pcie-mobiveil.h    |  2 ++
 3 files changed, 27 insertions(+)

diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c b/drivers=
/pci/controller/mobiveil/pcie-mobiveil-host.c
index d1765d572f44..d028cdf31d0e 100644
--- a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
+++ b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
@@ -221,6 +221,13 @@ static int mobiveil_host_init(struct mobiveil_pcie *pc=
ie)
 {
 	u32 value, pab_ctrl, type;
 	struct resource_entry *win;
+	int i;
+
+	/* Disable all inbound/outbound windows */
+	for (i =3D 0; i < pcie->apio_wins; i++)
+		mobiveil_pcie_disable_ob_win(pcie, i);
+	for (i =3D 0; i < pcie->ppio_wins; i++)
+		mobiveil_pcie_disable_ib_win(pcie, i);
=20
 	/* setup bus numbers */
 	value =3D csr_readl(pcie, PCI_PRIMARY_BUS);
diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil.c b/drivers/pci/=
controller/mobiveil/pcie-mobiveil.c
index 370658d6546d..49d471b75925 100644
--- a/drivers/pci/controller/mobiveil/pcie-mobiveil.c
+++ b/drivers/pci/controller/mobiveil/pcie-mobiveil.c
@@ -226,3 +226,21 @@ int mobiveil_bringup_link(struct mobiveil_pcie *pcie)
=20
 	return -ETIMEDOUT;
 }
+
+void mobiveil_pcie_disable_ib_win(struct mobiveil_pcie *pci, int win_num)
+{
+	u32 val;
+
+	val =3D csr_readl(pci, PAB_PEX_AMAP_CTRL(win_num));
+	val &=3D ~(1 << AMAP_CTRL_EN_SHIFT);
+	csr_writel(pci, val, PAB_PEX_AMAP_CTRL(win_num));
+}
+
+void mobiveil_pcie_disable_ob_win(struct mobiveil_pcie *pci, int win_num)
+{
+	u32 val;
+
+	val =3D csr_readl(pci, PAB_AXI_AMAP_CTRL(win_num));
+	val &=3D ~(1 << WIN_ENABLE_SHIFT);
+	csr_writel(pci, val, PAB_AXI_AMAP_CTRL(win_num));
+}
diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil.h b/drivers/pci/=
controller/mobiveil/pcie-mobiveil.h
index eb4cb61291a8..81685840b378 100644
--- a/drivers/pci/controller/mobiveil/pcie-mobiveil.h
+++ b/drivers/pci/controller/mobiveil/pcie-mobiveil.h
@@ -171,6 +171,8 @@ void program_ob_windows(struct mobiveil_pcie *pcie, int=
 win_num, u64 cpu_addr,
 			u64 pci_addr, u32 type, u64 size);
 void program_ib_windows(struct mobiveil_pcie *pcie, int win_num, u64 cpu_a=
ddr,
 			u64 pci_addr, u32 type, u64 size);
+void mobiveil_pcie_disable_ob_win(struct mobiveil_pcie *pci, int win_num);
+void mobiveil_pcie_disable_ib_win(struct mobiveil_pcie *pci, int win_num);
 u32 csr_read(struct mobiveil_pcie *pcie, u32 off, size_t size);
 void csr_write(struct mobiveil_pcie *pcie, u32 val, u32 off, size_t size);
=20
--=20
2.17.1
