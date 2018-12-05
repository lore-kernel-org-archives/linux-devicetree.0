From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH] clk: mediatek: fix the PCIe MAC clock parent
Date: Wed, 5 Dec 2018 14:41:10 +0800
Message-ID: <2e828830d051ae641cfd55a6590cb243539d6ca8.1543991319.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Weijie Gao <weijie.gao@mediatek.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>
List-Id: devicetree@vger.kernel.org

The PCIe function doesn't work as the clock tree of MAC layer is wrong.
Hence fix the clock table.

Fixes: 3b5e748615e7 ("clk: mediatek: add clock support for MT7629 SoC")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/clk/mediatek/clk-mt7629.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index 200ba14..d623399 100644
--- a/drivers/clk/mediatek/clk-mt7629.c
+++ b/drivers/clk/mediatek/clk-mt7629.c
@@ -446,8 +446,8 @@
 	FACTOR(CLK_TOP_TO_USB3_DMA, "to_usb3_dma", "hif_sel", 1, 1),
 	FACTOR(CLK_TOP_FROM_TOP_AHB, "from_top_ahb", "axi_sel", 1, 1),
 	FACTOR(CLK_TOP_FROM_TOP_AXI, "from_top_axi", "hif_sel", 1, 1),
-	FACTOR(CLK_TOP_PCIE1_MAC_EN, "pcie1_mac_en", "univpll1_d4", 1, 1),
-	FACTOR(CLK_TOP_PCIE0_MAC_EN, "pcie0_mac_en", "univpll1_d4", 1, 1),
+	FACTOR(CLK_TOP_PCIE1_MAC_EN, "pcie1_mac_en", "sata_sel", 1, 1),
+	FACTOR(CLK_TOP_PCIE0_MAC_EN, "pcie0_mac_en", "sata_sel", 1, 1),
 };
 
 static const struct mtk_gate peri_clks[] = {
-- 
1.9.1
