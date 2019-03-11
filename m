From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv4 09/28] PCI: mobiveil: correct inbound/outbound window setup
 routines
Date: Mon, 11 Mar 2019 09:31:08 +0000
Message-ID: <20190311093130.7209-10-Zhiqiang.Hou@nxp.com>
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

Outbound window routine:
 - Removed unused var definition and register read operations.
 - Added the upper 32-bit cpu address setup of the window.
 - Instead of blindly write, only change the fields specified.
 - Masked the lower bits of window size in case override the
   control bits.
 - Check if the passing window number is available, instead of
   the total number of the initialized windows.

Inbound window routine:
 - Added parameter 'u64 cpu_addr' to specify the cpu address
   of the window instead of using 'pci_addr'.
 - Changed 'int pci_addr' to 'u64 pci_addr', and added setup
   of the upper 32-bit pci address of the window.
 - Moved the PCIe PIO master enablement to mobiveil_host_init().
 - Instead of blindly write, only change the fields specified.
 - Masked the lower bits of window size in case override the
   control bits.
 - Check if the passing window number is available, instead of
   the total number of the initialized windows.
 - And added the statistic of initialized inbound windows.

Fixes: 9af6bcb11e12 ("PCI: mobiveil: Add Mobiveil PCIe Host
Bridge IP driver")
Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>
Reviewed-by: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
---
V4:
 - no change

 drivers/pci/controller/pcie-mobiveil.c | 70 +++++++++++++++-----------
 1 file changed, 42 insertions(+), 28 deletions(-)

diff --git a/drivers/pci/controller/pcie-mobiveil.c b/drivers/pci/controlle=
r/pcie-mobiveil.c
index e88afc792a5c..4ba458474e42 100644
--- a/drivers/pci/controller/pcie-mobiveil.c
+++ b/drivers/pci/controller/pcie-mobiveil.c
@@ -65,9 +65,13 @@
 #define PAB_AXI_AMAP_CTRL(win)		PAB_REG_ADDR(0x0ba0, win)
 #define  WIN_ENABLE_SHIFT		0
 #define  WIN_TYPE_SHIFT			1
+#define  WIN_TYPE_MASK			0x3
+#define  WIN_SIZE_SHIFT			10
+#define  WIN_SIZE_MASK			0x3fffff
=20
 #define PAB_EXT_AXI_AMAP_SIZE(win)	PAB_EXT_REG_ADDR(0xbaf0, win)
=20
+#define PAB_EXT_AXI_AMAP_AXI_WIN(win)	PAB_EXT_REG_ADDR(0x80a0, win)
 #define PAB_AXI_AMAP_AXI_WIN(win)	PAB_REG_ADDR(0x0ba4, win)
 #define  AXI_WINDOW_ALIGN_MASK		3
=20
@@ -82,8 +86,10 @@
 #define PAB_PEX_AMAP_CTRL(win)		PAB_REG_ADDR(0x4ba0, win)
 #define  AMAP_CTRL_EN_SHIFT		0
 #define  AMAP_CTRL_TYPE_SHIFT		1
+#define  AMAP_CTRL_TYPE_MASK		3
=20
 #define PAB_EXT_PEX_AMAP_SIZEN(win)	PAB_EXT_REG_ADDR(0xbef0, win)
+#define PAB_EXT_PEX_AMAP_AXI_WIN(win)	PAB_EXT_REG_ADDR(0xb4a0, win)
 #define PAB_PEX_AMAP_AXI_WIN(win)	PAB_REG_ADDR(0x4ba4, win)
 #define PAB_PEX_AMAP_PEX_WIN_L(win)	PAB_REG_ADDR(0x4ba8, win)
 #define PAB_PEX_AMAP_PEX_WIN_H(win)	PAB_REG_ADDR(0x4bac, win)
@@ -455,49 +461,51 @@ static int mobiveil_pcie_parse_dt(struct mobiveil_pci=
e *pcie)
 }
=20
 static void program_ib_windows(struct mobiveil_pcie *pcie, int win_num,
-			       int pci_addr, u32 type, u64 size)
+			       u64 cpu_addr, u64 pci_addr, u32 type, u64 size)
 {
-	int pio_ctrl_val;
-	int amap_ctrl_dw;
+	u32 value;
 	u64 size64 =3D ~(size - 1);
=20
-	if ((pcie->ib_wins_configured + 1) > pcie->ppio_wins) {
+	if (win_num >=3D pcie->ppio_wins) {
 		dev_err(&pcie->pdev->dev,
 			"ERROR: max inbound windows reached !\n");
 		return;
 	}
=20
-	pio_ctrl_val =3D csr_readl(pcie, PAB_PEX_PIO_CTRL);
-	pio_ctrl_val |=3D 1 << PIO_ENABLE_SHIFT;
-	csr_writel(pcie, pio_ctrl_val, PAB_PEX_PIO_CTRL);
-
-	amap_ctrl_dw =3D csr_readl(pcie, PAB_PEX_AMAP_CTRL(win_num));
-	amap_ctrl_dw |=3D (type << AMAP_CTRL_TYPE_SHIFT) |
-			(1 << AMAP_CTRL_EN_SHIFT) |
-			lower_32_bits(size64);
-	csr_writel(pcie, amap_ctrl_dw, PAB_PEX_AMAP_CTRL(win_num));
+	value =3D csr_readl(pcie, PAB_PEX_AMAP_CTRL(win_num));
+	value &=3D ~(AMAP_CTRL_TYPE_MASK << AMAP_CTRL_TYPE_SHIFT |
+		 WIN_SIZE_MASK << WIN_SIZE_SHIFT);
+	value |=3D (type << AMAP_CTRL_TYPE_SHIFT) | (1 << AMAP_CTRL_EN_SHIFT) |
+		 (lower_32_bits(size64) & WIN_SIZE_MASK << WIN_SIZE_SHIFT);
+	csr_writel(pcie, value, PAB_PEX_AMAP_CTRL(win_num));
=20
 	csr_writel(pcie, upper_32_bits(size64),
 		   PAB_EXT_PEX_AMAP_SIZEN(win_num));
=20
-	csr_writel(pcie, pci_addr, PAB_PEX_AMAP_AXI_WIN(win_num));
+	csr_writel(pcie, lower_32_bits(cpu_addr),
+		   PAB_PEX_AMAP_AXI_WIN(win_num));
+	csr_writel(pcie, upper_32_bits(cpu_addr),
+		   PAB_EXT_PEX_AMAP_AXI_WIN(win_num));
+
+	csr_writel(pcie, lower_32_bits(pci_addr),
+		   PAB_PEX_AMAP_PEX_WIN_L(win_num));
+	csr_writel(pcie, upper_32_bits(pci_addr),
+		   PAB_PEX_AMAP_PEX_WIN_H(win_num));
=20
-	csr_writel(pcie, pci_addr, PAB_PEX_AMAP_PEX_WIN_L(win_num));
-	csr_writel(pcie, 0, PAB_PEX_AMAP_PEX_WIN_H(win_num));
+	pcie->ib_wins_configured++;
 }
=20
 /*
  * routine to program the outbound windows
  */
 static void program_ob_windows(struct mobiveil_pcie *pcie, int win_num,
-			       u64 cpu_addr, u64 pci_addr,
-			       u32 config_io_bit, u64 size)
+			       u64 cpu_addr, u64 pci_addr, u32 type, u64 size)
 {
=20
-	u32 value, type;
+	u32 value;
 	u64 size64 =3D ~(size - 1);
=20
-	if ((pcie->ob_wins_configured + 1) > pcie->apio_wins) {
+	if (win_num >=3D pcie->apio_wins) {
 		dev_err(&pcie->pdev->dev,
 			"ERROR: max outbound windows reached !\n");
 		return;
@@ -507,10 +515,12 @@ static void program_ob_windows(struct mobiveil_pcie *=
pcie, int win_num,
 	 * program Enable Bit to 1, Type Bit to (00) base 2, AXI Window Size Bit
 	 * to 4 KB in PAB_AXI_AMAP_CTRL register
 	 */
-	type =3D config_io_bit;
 	value =3D csr_readl(pcie, PAB_AXI_AMAP_CTRL(win_num));
-	csr_writel(pcie, 1 << WIN_ENABLE_SHIFT | type << WIN_TYPE_SHIFT |
-		   lower_32_bits(size64), PAB_AXI_AMAP_CTRL(win_num));
+	value &=3D ~(WIN_TYPE_MASK << WIN_TYPE_SHIFT |
+		 WIN_SIZE_MASK << WIN_SIZE_SHIFT);
+	value |=3D 1 << WIN_ENABLE_SHIFT | type << WIN_TYPE_SHIFT |
+		 (lower_32_bits(size64) & WIN_SIZE_MASK << WIN_SIZE_SHIFT);
+	csr_writel(pcie, value, PAB_AXI_AMAP_CTRL(win_num));
=20
 	csr_writel(pcie, upper_32_bits(size64), PAB_EXT_AXI_AMAP_SIZE(win_num));
=20
@@ -518,11 +528,10 @@ static void program_ob_windows(struct mobiveil_pcie *=
pcie, int win_num,
 	 * program AXI window base with appropriate value in
 	 * PAB_AXI_AMAP_AXI_WIN0 register
 	 */
-	value =3D csr_readl(pcie, PAB_AXI_AMAP_AXI_WIN(win_num));
-	csr_writel(pcie, cpu_addr & (~AXI_WINDOW_ALIGN_MASK),
+	csr_writel(pcie, lower_32_bits(cpu_addr) & (~AXI_WINDOW_ALIGN_MASK),
 		   PAB_AXI_AMAP_AXI_WIN(win_num));
-
-	value =3D csr_readl(pcie, PAB_AXI_AMAP_PEX_WIN_H(win_num));
+	csr_writel(pcie, upper_32_bits(cpu_addr),
+		   PAB_EXT_AXI_AMAP_AXI_WIN(win_num));
=20
 	csr_writel(pcie, lower_32_bits(pci_addr),
 		   PAB_AXI_AMAP_PEX_WIN_L(win_num));
@@ -604,6 +613,11 @@ static int mobiveil_host_init(struct mobiveil_pcie *pc=
ie)
 	value |=3D APIO_EN_MASK;
 	csr_writel(pcie, value, PAB_AXI_PIO_CTRL);
=20
+	/* Enable PCIe PIO master */
+	value =3D csr_readl(pcie, PAB_PEX_PIO_CTRL);
+	value |=3D 1 << PIO_ENABLE_SHIFT;
+	csr_writel(pcie, value, PAB_PEX_PIO_CTRL);
+
 	/*
 	 * we'll program one outbound window for config reads and
 	 * another default inbound window for all the upstream traffic
@@ -616,7 +630,7 @@ static int mobiveil_host_init(struct mobiveil_pcie *pci=
e)
 			   CFG_WINDOW_TYPE, resource_size(pcie->ob_io_res));
=20
 	/* memory inbound translation window */
-	program_ib_windows(pcie, WIN_NUM_0, 0, MEM_WINDOW_TYPE, IB_WIN_SIZE);
+	program_ib_windows(pcie, WIN_NUM_0, 0, 0, MEM_WINDOW_TYPE, IB_WIN_SIZE);
=20
 	/* Get the I/O and memory ranges from DT */
 	resource_list_for_each_entry(win, &pcie->resources) {
--=20
2.17.1
