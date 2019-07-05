From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Subject: [PATCHv6 21/28] PCI: mobiveil: Clear the target fields before updating the register
Date: Fri,  5 Jul 2019 17:56:49 +0800
Message-ID: <20190705095656.19191-22-Zhiqiang.Hou@nxp.com>
References: <20190705095656.19191-1-Zhiqiang.Hou@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190705095656.19191-1-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, l.subrahmanya@mobiveil.co.in, shawnguo@kernel.org, leoyang.li@nxp.com, lorenzo.pieralisi@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: Mingkai.Hu@nxp.com, Minghuan.Lian@nxp.com, Xiaowei.Bao@nxp.com, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
List-Id: devicetree@vger.kernel.org

Clear the target fields in the register before programming with
an new value.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>
Reviewed-by: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
---
V6:
 - Splited from #9 of v5 patches, no functional change.

 drivers/pci/controller/pcie-mobiveil.c |   17 ++++++++++++-----
 1 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/pcie-mobiveil.c b/drivers/pci/controller/pcie-mobiveil.c
index 0560344..7d18e59 100644
--- a/drivers/pci/controller/pcie-mobiveil.c
+++ b/drivers/pci/controller/pcie-mobiveil.c
@@ -65,6 +65,8 @@
 #define PAB_AXI_AMAP_CTRL(win)		PAB_REG_ADDR(0x0ba0, win)
 #define  WIN_ENABLE_SHIFT		0
 #define  WIN_TYPE_SHIFT			1
+#define  WIN_TYPE_MASK			0x3
+#define  WIN_SIZE_MASK			0xfffffc00
 
 #define PAB_EXT_AXI_AMAP_SIZE(win)	PAB_EXT_REG_ADDR(0xbaf0, win)
 
@@ -82,6 +84,7 @@
 #define PAB_PEX_AMAP_CTRL(win)		PAB_REG_ADDR(0x4ba0, win)
 #define  AMAP_CTRL_EN_SHIFT		0
 #define  AMAP_CTRL_TYPE_SHIFT		1
+#define  AMAP_CTRL_TYPE_MASK		3
 
 #define PAB_EXT_PEX_AMAP_SIZEN(win)	PAB_EXT_REG_ADDR(0xbef0, win)
 #define PAB_PEX_AMAP_AXI_WIN(win)	PAB_REG_ADDR(0x4ba4, win)
@@ -469,9 +472,9 @@ static void program_ib_windows(struct mobiveil_pcie *pcie, int win_num,
 	csr_writel(pcie, value, PAB_PEX_PIO_CTRL);
 
 	value = csr_readl(pcie, PAB_PEX_AMAP_CTRL(win_num));
-	value |= (type << AMAP_CTRL_TYPE_SHIFT) |
-			(1 << AMAP_CTRL_EN_SHIFT) |
-			lower_32_bits(size64);
+	value &= ~(AMAP_CTRL_TYPE_MASK << AMAP_CTRL_TYPE_SHIFT | WIN_SIZE_MASK);
+	value |= type << AMAP_CTRL_TYPE_SHIFT | 1 << AMAP_CTRL_EN_SHIFT |
+		 lower_32_bits(size64);
 	csr_writel(pcie, value, PAB_PEX_AMAP_CTRL(win_num));
 
 	csr_writel(pcie, upper_32_bits(size64),
@@ -490,6 +493,7 @@ static void program_ib_windows(struct mobiveil_pcie *pcie, int win_num,
 static void program_ob_windows(struct mobiveil_pcie *pcie, int win_num,
 			       u64 cpu_addr, u64 pci_addr, u32 type, u64 size)
 {
+	u32 value;
 	u64 size64 = ~(size - 1);
 
 	if (win_num >= pcie->apio_wins) {
@@ -502,8 +506,11 @@ static void program_ob_windows(struct mobiveil_pcie *pcie, int win_num,
 	 * program Enable Bit to 1, Type Bit to (00) base 2, AXI Window Size Bit
 	 * to 4 KB in PAB_AXI_AMAP_CTRL register
 	 */
-	csr_writel(pcie, 1 << WIN_ENABLE_SHIFT | type << WIN_TYPE_SHIFT |
-		   lower_32_bits(size64), PAB_AXI_AMAP_CTRL(win_num));
+	value = csr_readl(pcie, PAB_AXI_AMAP_CTRL(win_num));
+	value &= ~(WIN_TYPE_MASK << WIN_TYPE_SHIFT | WIN_SIZE_MASK);
+	value |= 1 << WIN_ENABLE_SHIFT | type << WIN_TYPE_SHIFT |
+		 lower_32_bits(size64);
+	csr_writel(pcie, value, PAB_AXI_AMAP_CTRL(win_num));
 
 	csr_writel(pcie, upper_32_bits(size64), PAB_EXT_AXI_AMAP_SIZE(win_num));
 
-- 
1.7.1
