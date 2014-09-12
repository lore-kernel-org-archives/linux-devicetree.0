From: Mark yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH] clk: rockchip: rk3288: Document eDP clock names
Date: Fri, 12 Sep 2014 18:20:58 +0800
Message-ID: <1410517258-18789-1-git-send-email-mark.yao@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dkl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xjq-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kfx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org, yxj-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cym-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org, caesar.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Mark yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds clock names for rk3288 eDP.

Signed-off-by: Mark yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 drivers/clk/rockchip/clk-rk3288.c      | 6 +++---
 include/dt-bindings/clock/rk3288-cru.h | 3 +++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
index 2e1d790..bfe18b5 100644
--- a/drivers/clk/rockchip/clk-rk3288.c
+++ b/drivers/clk/rockchip/clk-rk3288.c
@@ -320,10 +320,10 @@ static struct rockchip_clk_branch rk3288_clk_branches[] __initdata = {
 			RK3288_CLKSEL_CON(29), 6, 2, MFLAGS, 8, 8, DFLAGS,
 			RK3288_CLKGATE_CON(3), 3, GFLAGS),
 
-	COMPOSITE_NODIV(0, "sclk_edp_24m", mux_edp_24m_p, 0,
+	COMPOSITE_NODIV(SCLK_EDP_24M, "sclk_edp_24m", mux_edp_24m_p, 0,
 			RK3288_CLKSEL_CON(28), 15, 1, MFLAGS,
 			RK3288_CLKGATE_CON(3), 12, GFLAGS),
-	COMPOSITE(0, "sclk_edp", mux_pll_src_cpll_gpll_npll_p, 0,
+	COMPOSITE(SCLK_EDP, "sclk_edp", mux_pll_src_cpll_gpll_npll_p, 0,
 			RK3288_CLKSEL_CON(28), 6, 2, MFLAGS, 0, 6, DFLAGS,
 			RK3288_CLKGATE_CON(3), 13, GFLAGS),
 
@@ -653,7 +653,7 @@ static struct rockchip_clk_branch rk3288_clk_branches[] __initdata = {
 	GATE(0, "pclk_mipi_dsi1", "hclk_vio", 0, RK3288_CLKGATE_CON(16), 5, GFLAGS),
 	GATE(0, "pclk_mipi_csi", "hclk_vio", 0, RK3288_CLKGATE_CON(16), 6, GFLAGS),
 	GATE(0, "pclk_lvds_phy", "hclk_vio", 0, RK3288_CLKGATE_CON(16), 7, GFLAGS),
-	GATE(0, "pclk_edp_ctrl", "hclk_vio", 0, RK3288_CLKGATE_CON(16), 8, GFLAGS),
+	GATE(PCLK_EDP_CTRL, "pclk_edp_ctrl", "hclk_vio", 0, RK3288_CLKGATE_CON(16), 8, GFLAGS),
 	GATE(0, "pclk_hdmi_ctrl", "hclk_vio", 0, RK3288_CLKGATE_CON(16), 9, GFLAGS),
 	GATE(0, "pclk_vio2_h2p", "hclk_vio", 0, RK3288_CLKGATE_CON(16), 11, GFLAGS),
 
diff --git a/include/dt-bindings/clock/rk3288-cru.h b/include/dt-bindings/clock/rk3288-cru.h
index 4d65959..0f7369d 100644
--- a/include/dt-bindings/clock/rk3288-cru.h
+++ b/include/dt-bindings/clock/rk3288-cru.h
@@ -61,6 +61,8 @@
 #define SCLK_LCDC_PWM1		101
 #define SCLK_MAC_RX		102
 #define SCLK_MAC_TX		103
+#define SCLK_EDP_24M		104
+#define SCLK_EDP		105
 
 #define DCLK_VOP0		190
 #define DCLK_VOP1		191
@@ -112,6 +114,7 @@
 #define PCLK_PS2C		352
 #define PCLK_TIMER		353
 #define PCLK_TZPC		354
+#define PCLK_EDP_CTRL		355
 
 /* hclk gates */
 #define HCLK_GPS		448
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
