From: Erin Lo <erin.lo@mediatek.com>
Subject: [PATCH] clk: mediatek: Remove MT8183 unused clock
Date: Tue, 21 May 2019 11:40:01 +0800
Message-ID: <20190521034001.53365-1-erin.lo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, srv_heupstream <srv_heupstream@mediatek.com>, Erin Lo <erin.lo@mediatek.com>
List-Id: devicetree@vger.kernel.org

Remove MT8183 sspm clock

Signed-off-by: Erin Lo <erin.lo@mediatek.com>
---
This clock should only be set in secure world.
---
 drivers/clk/mediatek/clk-mt8183.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
index 9d8651033ae9..1aa5f4059251 100644
--- a/drivers/clk/mediatek/clk-mt8183.c
+++ b/drivers/clk/mediatek/clk-mt8183.c
@@ -395,14 +395,6 @@ static const char * const atb_parents[] = {
 	"syspll_d5"
 };
 
-static const char * const sspm_parents[] = {
-	"clk26m",
-	"univpll_d2_d4",
-	"syspll_d2_d2",
-	"univpll_d2_d2",
-	"syspll_d3"
-};
-
 static const char * const dpi0_parents[] = {
 	"clk26m",
 	"tvdpll_d2",
@@ -606,9 +598,6 @@ static const struct mtk_mux top_muxes[] = {
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_MUX_ATB, "atb_sel",
 		atb_parents, 0xa0,
 		0xa4, 0xa8, 0, 2, 7, 0x004, 24),
-	MUX_GATE_CLR_SET_UPD(CLK_TOP_MUX_SSPM, "sspm_sel",
-		sspm_parents, 0xa0,
-		0xa4, 0xa8, 8, 3, 15, 0x004, 25),
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_MUX_DPI0, "dpi0_sel",
 		dpi0_parents, 0xa0,
 		0xa4, 0xa8, 16, 4, 23, 0x004, 26),
@@ -947,12 +936,8 @@ static const struct mtk_gate infra_clks[] = {
 		"fufs_sel", 13),
 	GATE_INFRA2(CLK_INFRA_MD32_BCLK, "infra_md32_bclk",
 		"axi_sel", 14),
-	GATE_INFRA2(CLK_INFRA_SSPM, "infra_sspm",
-		"sspm_sel", 15),
 	GATE_INFRA2(CLK_INFRA_UNIPRO_MBIST, "infra_unipro_mbist",
 		"axi_sel", 16),
-	GATE_INFRA2(CLK_INFRA_SSPM_BUS_HCLK, "infra_sspm_bus_hclk",
-		"axi_sel", 17),
 	GATE_INFRA2(CLK_INFRA_I2C5, "infra_i2c5",
 		"i2c_sel", 18),
 	GATE_INFRA2(CLK_INFRA_I2C5_ARBITER, "infra_i2c5_arbiter",
@@ -986,10 +971,6 @@ static const struct mtk_gate infra_clks[] = {
 		"msdc50_0_sel", 1),
 	GATE_INFRA3(CLK_INFRA_MSDC2_SELF, "infra_msdc2_self",
 		"msdc50_0_sel", 2),
-	GATE_INFRA3(CLK_INFRA_SSPM_26M_SELF, "infra_sspm_26m_self",
-		"f_f26m_ck", 3),
-	GATE_INFRA3(CLK_INFRA_SSPM_32K_SELF, "infra_sspm_32k_self",
-		"f_f26m_ck", 4),
 	GATE_INFRA3(CLK_INFRA_UFS_AXI, "infra_ufs_axi",
 		"axi_sel", 5),
 	GATE_INFRA3(CLK_INFRA_I2C6, "infra_i2c6",
-- 
2.18.0
