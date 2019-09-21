From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 4/6] clk: meson: meson8b: add the ddr_pll input for the audio clocks
Date: Sat, 21 Sep 2019 17:18:33 +0200
Message-ID: <20190921151835.770263-5-martin.blumenstingl@googlemail.com>
References: <20190921151835.770263-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190921151835.770263-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: narmstrong@baylibre.com, jbrunet@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, khilman@baylibre.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

The two audio muxes cts_amclk_sel and cts_mclk_i958_sel use ddr_pll as
input at index 0. Update the muxes to use clk_parent_data and add
"ddr_pll" as input using clk_parent_data.fw_name because the DDR clock
controller is actually separate from the main clock controller.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index fefb4b7185d0..3987f4ea7378 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -2429,28 +2429,25 @@ static struct clk_regmap meson8b_vdec_hevc = {
 	},
 };
 
-/* TODO: the clock at index 0 is "DDR_PLL" which we don't support yet */
-static const struct clk_hw *meson8b_cts_amclk_parent_hws[] = {
-	&meson8b_mpll0.hw,
-	&meson8b_mpll1.hw,
-	&meson8b_mpll2.hw
+static const struct clk_parent_data meson8b_cts_amclk_parent_data[] = {
+	{ .fw_name = "ddr_pll", },
+	{ .hw = &meson8b_mpll0.hw, },
+	{ .hw = &meson8b_mpll1.hw, },
+	{ .hw = &meson8b_mpll2.hw, },
 };
 
-static u32 meson8b_cts_amclk_mux_table[] = { 1, 2, 3 };
-
 static struct clk_regmap meson8b_cts_amclk_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_AUD_CLK_CNTL,
 		.mask = 0x3,
 		.shift = 9,
-		.table = meson8b_cts_amclk_mux_table,
 		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_amclk_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = meson8b_cts_amclk_parent_hws,
-		.num_parents = ARRAY_SIZE(meson8b_cts_amclk_parent_hws),
+		.parent_data = meson8b_cts_amclk_parent_data,
+		.num_parents = ARRAY_SIZE(meson8b_cts_amclk_parent_data),
 	},
 };
 
@@ -2488,28 +2485,25 @@ static struct clk_regmap meson8b_cts_amclk = {
 	},
 };
 
-/* TODO: the clock at index 0 is "DDR_PLL" which we don't support yet */
-static const struct clk_hw *meson8b_cts_mclk_i958_parent_hws[] = {
-	&meson8b_mpll0.hw,
-	&meson8b_mpll1.hw,
-	&meson8b_mpll2.hw
+static const struct clk_parent_data meson8b_cts_mclk_i958_parent_data[] = {
+	{ .fw_name = "ddr_pll", },
+	{ .hw = &meson8b_mpll0.hw, },
+	{ .hw = &meson8b_mpll1.hw, },
+	{ .hw = &meson8b_mpll2.hw, },
 };
 
-static u32 meson8b_cts_mclk_i958_mux_table[] = { 1, 2, 3 };
-
 static struct clk_regmap meson8b_cts_mclk_i958_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_AUD_CLK_CNTL2,
 		.mask = 0x3,
 		.shift = 25,
-		.table = meson8b_cts_mclk_i958_mux_table,
 		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data) {
 		.name = "cts_mclk_i958_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = meson8b_cts_mclk_i958_parent_hws,
-		.num_parents = ARRAY_SIZE(meson8b_cts_mclk_i958_parent_hws),
+		.parent_data = meson8b_cts_mclk_i958_parent_data,
+		.num_parents = ARRAY_SIZE(meson8b_cts_mclk_i958_parent_data),
 	},
 };
 
-- 
2.23.0
