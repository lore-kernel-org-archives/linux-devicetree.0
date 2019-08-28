From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 2/2] clk: mediatek: add pericfg clocks for MT8183
Date: Wed, 28 Aug 2019 13:55:55 +0800
Message-ID: <1566971755-21217-2-git-send-email-chunfeng.yun@mediatek.com>
References: <1566971755-21217-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566971755-21217-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, Erin Lo <erin.lo@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add pericfg clocks for MT8183, it's used when support USB
remote wakeup

Cc: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8183.c      | 35 ++++++++++++++++++++++++++
 include/dt-bindings/clock/mt8183-clk.h |  4 +++
 2 files changed, 39 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
index 1aa5f4059251..b19221bad0c9 100644
--- a/drivers/clk/mediatek/clk-mt8183.c
+++ b/drivers/clk/mediatek/clk-mt8183.c
@@ -999,6 +999,25 @@ static const struct mtk_gate infra_clks[] = {
 		"msdc50_0_sel", 24),
 };
 
+static const struct mtk_gate_regs peri_cg_regs = {
+	.set_ofs = 0x20c,
+	.clr_ofs = 0x20c,
+	.sta_ofs = 0x20c,
+};
+
+#define GATE_PERI(_id, _name, _parent, _shift) {	\
+	.id = _id,				\
+	.name = _name,				\
+	.parent_name = _parent,			\
+	.regs = &peri_cg_regs,			\
+	.shift = _shift,			\
+	.ops = &mtk_clk_gate_ops_no_setclr_inv,	\
+}
+
+static const struct mtk_gate peri_clks[] = {
+	GATE_PERI(CLK_PERI_AXI, "periaxi", "axi_sel", 31),
+};
+
 static const struct mtk_gate_regs apmixed_cg_regs = {
 	.set_ofs = 0x20,
 	.clr_ofs = 0x20,
@@ -1194,6 +1213,19 @@ static int clk_mt8183_infra_probe(struct platform_device *pdev)
 	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 }
 
+static int clk_mt8183_peri_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+
+	clk_data = mtk_alloc_clk_data(CLK_PERI_NR_CLK);
+
+	mtk_clk_register_gates(node, peri_clks, ARRAY_SIZE(peri_clks),
+			       clk_data);
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
 static int clk_mt8183_mcu_probe(struct platform_device *pdev)
 {
 	struct clk_onecell_data *clk_data;
@@ -1223,6 +1255,9 @@ static const struct of_device_id of_match_clk_mt8183[] = {
 	}, {
 		.compatible = "mediatek,mt8183-infracfg",
 		.data = clk_mt8183_infra_probe,
+	}, {
+		.compatible = "mediatek,mt8183-pericfg",
+		.data = clk_mt8183_peri_probe,
 	}, {
 		.compatible = "mediatek,mt8183-mcucfg",
 		.data = clk_mt8183_mcu_probe,
diff --git a/include/dt-bindings/clock/mt8183-clk.h b/include/dt-bindings/clock/mt8183-clk.h
index 0046506eb24c..a7b470b0ec8a 100644
--- a/include/dt-bindings/clock/mt8183-clk.h
+++ b/include/dt-bindings/clock/mt8183-clk.h
@@ -284,6 +284,10 @@
 #define CLK_INFRA_FBIST2FPC		100
 #define CLK_INFRA_NR_CLK		101
 
+/* PERICFG */
+#define CLK_PERI_AXI			0
+#define CLK_PERI_NR_CLK			1
+
 /* MFGCFG */
 #define CLK_MFG_BG3D			0
 #define CLK_MFG_NR_CLK			1
-- 
2.23.0
