From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Subject: [PATCHv6 22/28] PCI: mobiveil: Mask out the lower 10-bit hardcode window size
Date: Fri,  5 Jul 2019 17:56:50 +0800
Message-ID: <20190705095656.19191-23-Zhiqiang.Hou@nxp.com>
References: <20190705095656.19191-1-Zhiqiang.Hou@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190705095656.19191-1-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, l.subrahmanya@mobiveil.co.in, shawnguo@kernel.org, leoyang.li@nxp.com, lorenzo.pieralisi@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: Mingkai.Hu@nxp.com, Minghuan.Lian@nxp.com, Xiaowei.Bao@nxp.com, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
List-Id: devicetree@vger.kernel.org

The lower 10-bit of window size field is hardcode to zero,
and then the lower 10-bit of PAB_AXI_AMAP_CTRL register are
used to control fields, so mask out the lower 10-bit of
window size in case override the control bits.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>
Reviewed-by: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
---
V6:
 - Splited from #9 of v5 patches, no functional change.

 drivers/pci/controller/pcie-mobiveil.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mobiveil.c b/drivers/pci/controller/pcie-mobiveil.c
index 7d18e59..4f50fe6 100644
--- a/drivers/pci/controller/pcie-mobiveil.c
+++ b/drivers/pci/controller/pcie-mobiveil.c
@@ -474,7 +474,7 @@ static void program_ib_windows(struct mobiveil_pcie *pcie, int win_num,
 	value = csr_readl(pcie, PAB_PEX_AMAP_CTRL(win_num));
 	value &= ~(AMAP_CTRL_TYPE_MASK << AMAP_CTRL_TYPE_SHIFT | WIN_SIZE_MASK);
 	value |= type << AMAP_CTRL_TYPE_SHIFT | 1 << AMAP_CTRL_EN_SHIFT |
-		 lower_32_bits(size64);
+		 (lower_32_bits(size64) & WIN_SIZE_MASK);
 	csr_writel(pcie, value, PAB_PEX_AMAP_CTRL(win_num));
 
 	csr_writel(pcie, upper_32_bits(size64),
@@ -509,7 +509,7 @@ static void program_ob_windows(struct mobiveil_pcie *pcie, int win_num,
 	value = csr_readl(pcie, PAB_AXI_AMAP_CTRL(win_num));
 	value &= ~(WIN_TYPE_MASK << WIN_TYPE_SHIFT | WIN_SIZE_MASK);
 	value |= 1 << WIN_ENABLE_SHIFT | type << WIN_TYPE_SHIFT |
-		 lower_32_bits(size64);
+		 (lower_32_bits(size64) & WIN_SIZE_MASK);
 	csr_writel(pcie, value, PAB_AXI_AMAP_CTRL(win_num));
 
 	csr_writel(pcie, upper_32_bits(size64), PAB_EXT_AXI_AMAP_SIZE(win_num));
-- 
1.7.1
