From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH 1/2] clk: sunxi-ng: add missing hdmi-slow clock
 for H6 CCU
Date: Mon, 19 Mar 2018 16:11:07 +0800
Message-ID: <20180319081108.23496-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB3PBXXKQKGQEFC6YDGQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Allwinner H6 CCU has a "HDMI Slow Clock", which is currently missing
in the ccu-sun50i-h6 driver.

Add this missing clock to the driver.

Fixes: 542353ea ("clk: sunxi-ng: add support for the Allwinner H6 CCU")
Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c      | 4 ++++
 drivers/clk/sunxi-ng/ccu-sun50i-h6.h      | 2 +-
 include/dt-bindings/clock/sun50i-h6-ccu.h | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
index d5eab49e6350..bdbfe78fe133 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
@@ -643,6 +643,8 @@ static SUNXI_CCU_M_WITH_MUX_GATE(hdmi_clk, "hdmi", hdmi_parents, 0xb00,
 				 BIT(31),	/* gate */
 				 0);
 
+static SUNXI_CCU_GATE(hdmi_slow_clk, "hdmi-slow", "osc24M", 0xb04, BIT(31), 0);
+
 static const char * const hdmi_cec_parents[] = { "osc32k", "pll-periph0-2x" };
 static const struct ccu_mux_fixed_prediv hdmi_cec_predivs[] = {
 	{ .index = 1, .div = 36621 },
@@ -876,6 +878,7 @@ static struct ccu_common *sun50i_h6_ccu_clks[] = {
 	&pcie_aux_clk.common,
 	&bus_pcie_clk.common,
 	&hdmi_clk.common,
+	&hdmi_slow_clk.common,
 	&hdmi_cec_clk.common,
 	&bus_hdmi_clk.common,
 	&bus_tcon_top_clk.common,
@@ -1017,6 +1020,7 @@ static struct clk_hw_onecell_data sun50i_h6_hw_clks = {
 		[CLK_PCIE_AUX]		= &pcie_aux_clk.common.hw,
 		[CLK_BUS_PCIE]		= &bus_pcie_clk.common.hw,
 		[CLK_HDMI]		= &hdmi_clk.common.hw,
+		[CLK_HDMI_SLOW]		= &hdmi_slow_clk.common.hw,
 		[CLK_HDMI_CEC]		= &hdmi_cec_clk.common.hw,
 		[CLK_BUS_HDMI]		= &bus_hdmi_clk.common.hw,
 		[CLK_BUS_TCON_TOP]	= &bus_tcon_top_clk.common.hw,
diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.h b/drivers/clk/sunxi-ng/ccu-sun50i-h6.h
index ad6da4aa733c..ef499a7d45f2 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.h
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.h
@@ -51,6 +51,6 @@
 
 #define CLK_BUS_DRAM		60
 
-#define CLK_NUMBER		137
+#define CLK_NUMBER		(CLK_HDMI_SLOW + 1)
 
 #endif /* _CCU_SUN50I_H6_H_ */
diff --git a/include/dt-bindings/clock/sun50i-h6-ccu.h b/include/dt-bindings/clock/sun50i-h6-ccu.h
index 6045735a2821..205d09d3dc72 100644
--- a/include/dt-bindings/clock/sun50i-h6-ccu.h
+++ b/include/dt-bindings/clock/sun50i-h6-ccu.h
@@ -107,6 +107,7 @@
 #define CLK_PCIE_AUX		121
 #define CLK_BUS_PCIE		122
 #define CLK_HDMI		123
+#define CLK_HDMI_SLOW		137
 #define CLK_HDMI_CEC		124
 #define CLK_BUS_HDMI		125
 #define CLK_BUS_TCON_TOP	126
-- 
2.15.1
