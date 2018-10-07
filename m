From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v2 06/29] clk: sunxi-ng: Add support for H6 DE3 clocks
Date: Sun,  7 Oct 2018 11:38:42 +0200
Message-ID: <20181007093905.11253-7-jernej.skrabec@siol.net>
References: <20181007093905.11253-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBVNI47OQKGQEESCEYVQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181007093905.11253-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Support for mixer0, mixer1, writeback and rotation units is added.

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 71 ++++++++++++++++++++++++++--
 drivers/clk/sunxi-ng/ccu-sun8i-de2.h |  4 +-
 2 files changed, 71 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index bae5ee67a797..1c9ae0a319c1 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -31,6 +31,8 @@ static SUNXI_CCU_GATE(bus_mixer1_clk,	"bus-mixer1",	"bus-de",
 		      0x04, BIT(1), 0);
 static SUNXI_CCU_GATE(bus_wb_clk,	"bus-wb",	"bus-de",
 		      0x04, BIT(2), 0);
+static SUNXI_CCU_GATE(bus_rot_clk,	"bus-rot",	"bus-de",
+		      0x04, BIT(3), 0);
 
 static SUNXI_CCU_GATE(mixer0_clk,	"mixer0",	"mixer0-div",
 		      0x00, BIT(0), CLK_SET_RATE_PARENT);
@@ -38,6 +40,8 @@ static SUNXI_CCU_GATE(mixer1_clk,	"mixer1",	"mixer1-div",
 		      0x00, BIT(1), CLK_SET_RATE_PARENT);
 static SUNXI_CCU_GATE(wb_clk,		"wb",		"wb-div",
 		      0x00, BIT(2), CLK_SET_RATE_PARENT);
+static SUNXI_CCU_GATE(rot_clk,		"rot",		"rot-div",
+		      0x00, BIT(3), CLK_SET_RATE_PARENT);
 
 static SUNXI_CCU_M(mixer0_div_clk, "mixer0-div", "de", 0x0c, 0, 4,
 		   CLK_SET_RATE_PARENT);
@@ -45,6 +49,8 @@ static SUNXI_CCU_M(mixer1_div_clk, "mixer1-div", "de", 0x0c, 4, 4,
 		   CLK_SET_RATE_PARENT);
 static SUNXI_CCU_M(wb_div_clk, "wb-div", "de", 0x0c, 8, 4,
 		   CLK_SET_RATE_PARENT);
+static SUNXI_CCU_M(rot_div_clk, "rot-div", "de", 0x0c, 0x0c, 4,
+		   CLK_SET_RATE_PARENT);
 
 static SUNXI_CCU_M(mixer0_div_a83_clk, "mixer0-div", "pll-de", 0x0c, 0, 4,
 		   CLK_SET_RATE_PARENT);
@@ -53,6 +59,24 @@ static SUNXI_CCU_M(mixer1_div_a83_clk, "mixer1-div", "pll-de", 0x0c, 4, 4,
 static SUNXI_CCU_M(wb_div_a83_clk, "wb-div", "pll-de", 0x0c, 8, 4,
 		   CLK_SET_RATE_PARENT);
 
+static struct ccu_common *sun50i_h6_de3_clks[] = {
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
+
+	&bus_rot_clk.common,
+	&rot_clk.common,
+	&rot_div_clk.common,
+};
+
 static struct ccu_common *sun8i_a83t_de2_clks[] = {
 	&mixer0_clk.common,
 	&mixer1_clk.common,
@@ -106,7 +130,7 @@ static struct clk_hw_onecell_data sun8i_a83t_de2_hw_clks = {
 		[CLK_MIXER1_DIV]	= &mixer1_div_a83_clk.common.hw,
 		[CLK_WB_DIV]		= &wb_div_a83_clk.common.hw,
 	},
-	.num	= CLK_NUMBER,
+	.num	= CLK_NUMBER_WITHOUT_ROT,
 };
 
 static struct clk_hw_onecell_data sun8i_h3_de2_hw_clks = {
@@ -123,7 +147,7 @@ static struct clk_hw_onecell_data sun8i_h3_de2_hw_clks = {
 		[CLK_MIXER1_DIV]	= &mixer1_div_clk.common.hw,
 		[CLK_WB_DIV]		= &wb_div_clk.common.hw,
 	},
-	.num	= CLK_NUMBER,
+	.num	= CLK_NUMBER_WITHOUT_ROT,
 };
 
 static struct clk_hw_onecell_data sun8i_v3s_de2_hw_clks = {
@@ -137,7 +161,27 @@ static struct clk_hw_onecell_data sun8i_v3s_de2_hw_clks = {
 		[CLK_MIXER0_DIV]	= &mixer0_div_clk.common.hw,
 		[CLK_WB_DIV]		= &wb_div_clk.common.hw,
 	},
-	.num	= CLK_NUMBER,
+	.num	= CLK_NUMBER_WITHOUT_ROT,
+};
+
+static struct clk_hw_onecell_data sun50i_h6_de3_hw_clks = {
+	.hws	= {
+		[CLK_MIXER0]		= &mixer0_clk.common.hw,
+		[CLK_MIXER1]		= &mixer1_clk.common.hw,
+		[CLK_WB]		= &wb_clk.common.hw,
+		[CLK_ROT]		= &rot_clk.common.hw,
+
+		[CLK_BUS_MIXER0]	= &bus_mixer0_clk.common.hw,
+		[CLK_BUS_MIXER1]	= &bus_mixer1_clk.common.hw,
+		[CLK_BUS_WB]		= &bus_wb_clk.common.hw,
+		[CLK_BUS_ROT]		= &bus_rot_clk.common.hw,
+
+		[CLK_MIXER0_DIV]	= &mixer0_div_clk.common.hw,
+		[CLK_MIXER1_DIV]	= &mixer1_div_clk.common.hw,
+		[CLK_WB_DIV]		= &wb_div_clk.common.hw,
+		[CLK_ROT_DIV]		= &rot_div_clk.common.hw,
+	},
+	.num	= CLK_NUMBER_WITH_ROT,
 };
 
 static struct ccu_reset_map sun8i_a83t_de2_resets[] = {
@@ -156,6 +200,13 @@ static struct ccu_reset_map sun50i_a64_de2_resets[] = {
 	[RST_WB]	= { 0x08, BIT(2) },
 };
 
+static struct ccu_reset_map sun50i_h6_de3_resets[] = {
+	[RST_MIXER0]	= { 0x08, BIT(0) },
+	[RST_MIXER1]	= { 0x08, BIT(1) },
+	[RST_WB]	= { 0x08, BIT(2) },
+	[RST_ROT]	= { 0x08, BIT(3) },
+};
+
 static const struct sunxi_ccu_desc sun8i_a83t_de2_clk_desc = {
 	.ccu_clks	= sun8i_a83t_de2_clks,
 	.num_ccu_clks	= ARRAY_SIZE(sun8i_a83t_de2_clks),
@@ -186,6 +237,16 @@ static const struct sunxi_ccu_desc sun50i_a64_de2_clk_desc = {
 	.num_resets	= ARRAY_SIZE(sun50i_a64_de2_resets),
 };
 
+static const struct sunxi_ccu_desc sun50i_h6_de3_clk_desc = {
+	.ccu_clks	= sun50i_h6_de3_clks,
+	.num_ccu_clks	= ARRAY_SIZE(sun50i_h6_de3_clks),
+
+	.hw_clks	= &sun50i_h6_de3_hw_clks,
+
+	.resets		= sun50i_h6_de3_resets,
+	.num_resets	= ARRAY_SIZE(sun50i_h6_de3_resets),
+};
+
 static const struct sunxi_ccu_desc sun8i_v3s_de2_clk_desc = {
 	.ccu_clks	= sun8i_v3s_de2_clks,
 	.num_ccu_clks	= ARRAY_SIZE(sun8i_v3s_de2_clks),
@@ -296,6 +357,10 @@ static const struct of_device_id sunxi_de2_clk_ids[] = {
 		.compatible = "allwinner,sun50i-h5-de2-clk",
 		.data = &sun50i_a64_de2_clk_desc,
 	},
+	{
+		.compatible = "allwinner,sun50i-h6-de3-clk",
+		.data = &sun50i_h6_de3_clk_desc,
+	},
 	{ }
 };
 
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.h b/drivers/clk/sunxi-ng/ccu-sun8i-de2.h
index 530c006e0ae9..fc9c6b4c89a8 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.h
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.h
@@ -22,7 +22,9 @@
 #define CLK_MIXER0_DIV	3
 #define CLK_MIXER1_DIV	4
 #define CLK_WB_DIV	5
+#define CLK_ROT_DIV	11
 
-#define CLK_NUMBER	(CLK_WB + 1)
+#define CLK_NUMBER_WITH_ROT	(CLK_ROT_DIV + 1)
+#define CLK_NUMBER_WITHOUT_ROT	(CLK_WB + 1)
 
 #endif /* _CCU_SUN8I_DE2_H_ */
-- 
2.19.0
