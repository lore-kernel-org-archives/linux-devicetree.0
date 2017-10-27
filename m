From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v2 02/10] clk: sunxi-ng: add support for Allwinner H3 DE2 CCU
Date: Fri, 27 Oct 2017 23:06:50 +0800
Message-ID: <20171027150658.18509-3-icenowy@aosc.io>
References: <20171027150658.18509-1-icenowy@aosc.io>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171027150658.18509-1-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allwinner H3 features a DE2 CCU like the one on A83T, however the
parent of the clocks is the DE module clock, not the PLL_DE clock.

Add support for it.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 47 ++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index 5cc9d9952121..2db5d4e00ea7 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -41,6 +41,8 @@ static SUNXI_CCU_GATE(wb_clk,		"wb",		"wb-div",
 
 static SUNXI_CCU_M(mixer0_div_clk, "mixer0-div", "de", 0x0c, 0, 4,
 		   CLK_SET_RATE_PARENT);
+static SUNXI_CCU_M(mixer1_div_clk, "mixer1-div", "de", 0x0c, 4, 4,
+		   CLK_SET_RATE_PARENT);
 static SUNXI_CCU_M(wb_div_clk, "wb-div", "de", 0x0c, 8, 4,
 		   CLK_SET_RATE_PARENT);
 
@@ -65,6 +67,20 @@ static struct ccu_common *sun8i_a83t_de2_clks[] = {
 	&wb_div_a83_clk.common,
 };
 
+static struct ccu_common *sun8i_h3_de2_clks[] = {
+	&mixer0_clk.common,
+	&mixer1_clk.common,
+	&wb_clk.common,
+
+	&bus_mixer0_clk.common,
+	&bus_mixer1_clk.common,
+	&bus_wb_clk.common,
+
+	&mixer0_div_clk.common,
+	&mixer1_div_clk.common,
+	&wb_div_clk.common,
+};
+
 static struct ccu_common *sun8i_v3s_de2_clks[] = {
 	&mixer0_clk.common,
 	&wb_clk.common,
@@ -93,6 +109,23 @@ static struct clk_hw_onecell_data sun8i_a83t_de2_hw_clks = {
 	.num	= CLK_NUMBER,
 };
 
+static struct clk_hw_onecell_data sun8i_h3_de2_hw_clks = {
+	.hws	= {
+		[CLK_MIXER0]		= &mixer0_clk.common.hw,
+		[CLK_MIXER1]		= &mixer1_clk.common.hw,
+		[CLK_WB]		= &wb_clk.common.hw,
+
+		[CLK_BUS_MIXER0]	= &bus_mixer0_clk.common.hw,
+		[CLK_BUS_MIXER1]	= &bus_mixer1_clk.common.hw,
+		[CLK_BUS_WB]		= &bus_wb_clk.common.hw,
+
+		[CLK_MIXER0_DIV]	= &mixer0_div_clk.common.hw,
+		[CLK_MIXER1_DIV]	= &mixer1_div_clk.common.hw,
+		[CLK_WB_DIV]		= &wb_div_clk.common.hw,
+	},
+	.num	= CLK_NUMBER,
+};
+
 static struct clk_hw_onecell_data sun8i_v3s_de2_hw_clks = {
 	.hws	= {
 		[CLK_MIXER0]		= &mixer0_clk.common.hw,
@@ -133,6 +166,16 @@ static const struct sunxi_ccu_desc sun8i_a83t_de2_clk_desc = {
 	.num_resets	= ARRAY_SIZE(sun8i_a83t_de2_resets),
 };
 
+static const struct sunxi_ccu_desc sun8i_h3_de2_clk_desc = {
+	.ccu_clks	= sun8i_h3_de2_clks,
+	.num_ccu_clks	= ARRAY_SIZE(sun8i_h3_de2_clks),
+
+	.hw_clks	= &sun8i_h3_de2_hw_clks,
+
+	.resets		= sun8i_a83t_de2_resets,
+	.num_resets	= ARRAY_SIZE(sun8i_a83t_de2_resets),
+};
+
 static const struct sunxi_ccu_desc sun50i_a64_de2_clk_desc = {
 	.ccu_clks	= sun8i_a83t_de2_clks,
 	.num_ccu_clks	= ARRAY_SIZE(sun8i_a83t_de2_clks),
@@ -238,6 +281,10 @@ static const struct of_device_id sunxi_de2_clk_ids[] = {
 		.data = &sun8i_a83t_de2_clk_desc,
 	},
 	{
+		.compatible = "allwinner,sun8i-h3-de2-clk",
+		.data = &sun8i_h3_de2_clk_desc,
+	},
+	{
 		.compatible = "allwinner,sun8i-v3s-de2-clk",
 		.data = &sun8i_v3s_de2_clk_desc,
 	},
-- 
2.13.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
