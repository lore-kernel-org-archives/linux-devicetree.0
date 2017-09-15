From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 2/9] clk: rockchip: use new cif/vdpu clock ids on rk3188
Date: Fri, 15 Sep 2017 10:33:50 +0200
Message-ID: <20170915083357.11296-3-heiko@sntech.de>
References: <20170915083357.11296-1-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170915083357.11296-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use the new clock-ids for cif, vdpu, vepu on rk3188

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 drivers/clk/rockchip/clk-rk3188.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3188.c b/drivers/clk/rockchip/clk-rk3188.c
index 00ad0e5f8d66..67e73fd71f09 100644
--- a/drivers/clk/rockchip/clk-rk3188.c
+++ b/drivers/clk/rockchip/clk-rk3188.c
@@ -290,15 +290,15 @@ static struct rockchip_clk_branch common_clk_branches[] __initdata = {
 			RK2928_CLKSEL_CON(0), 6, 2, DFLAGS | CLK_DIVIDER_READ_ONLY,
 			div_core_peri_t, RK2928_CLKGATE_CON(0), 0, GFLAGS),
 
-	COMPOSITE(0, "aclk_vepu", mux_pll_src_cpll_gpll_p, 0,
+	COMPOSITE(ACLK_VEPU, "aclk_vepu", mux_pll_src_cpll_gpll_p, 0,
 			RK2928_CLKSEL_CON(32), 7, 1, MFLAGS, 0, 5, DFLAGS,
 			RK2928_CLKGATE_CON(3), 9, GFLAGS),
-	GATE(0, "hclk_vepu", "aclk_vepu", 0,
+	GATE(HCLK_VEPU, "hclk_vepu", "aclk_vepu", 0,
 			RK2928_CLKGATE_CON(3), 10, GFLAGS),
-	COMPOSITE(0, "aclk_vdpu", mux_pll_src_cpll_gpll_p, 0,
+	COMPOSITE(ACLK_VDPU, "aclk_vdpu", mux_pll_src_cpll_gpll_p, 0,
 			RK2928_CLKSEL_CON(32), 15, 1, MFLAGS, 8, 5, DFLAGS,
 			RK2928_CLKGATE_CON(3), 11, GFLAGS),
-	GATE(0, "hclk_vdpu", "aclk_vdpu", 0,
+	GATE(HCLK_VDPU, "hclk_vdpu", "aclk_vdpu", 0,
 			RK2928_CLKGATE_CON(3), 12, GFLAGS),
 
 	GATE(0, "gpll_ddr", "gpll", CLK_IGNORE_UNUSED,
@@ -644,13 +644,13 @@ static struct rockchip_clk_branch rk3066a_clk_branches[] __initdata = {
 
 	GATE(HCLK_I2S1, "hclk_i2s1", "hclk_cpu", 0, RK2928_CLKGATE_CON(7), 3, GFLAGS),
 	GATE(HCLK_I2S2, "hclk_i2s2", "hclk_cpu", 0, RK2928_CLKGATE_CON(7), 4, GFLAGS),
-	GATE(0, "hclk_cif1", "hclk_cpu", 0, RK2928_CLKGATE_CON(6), 6, GFLAGS),
+	GATE(HCLK_CIF1, "hclk_cif1", "hclk_cpu", 0, RK2928_CLKGATE_CON(6), 6, GFLAGS),
 	GATE(0, "hclk_hdmi", "hclk_cpu", 0, RK2928_CLKGATE_CON(4), 14, GFLAGS),
 
 	GATE(HCLK_OTG1, "hclk_usbotg1", "hclk_peri", CLK_IGNORE_UNUSED,
 			RK2928_CLKGATE_CON(5), 14, GFLAGS),
 
-	GATE(0, "aclk_cif1", "aclk_vio1", 0, RK2928_CLKGATE_CON(6), 7, GFLAGS),
+	GATE(ACLK_CIF1, "aclk_cif1", "aclk_vio1", 0, RK2928_CLKGATE_CON(6), 7, GFLAGS),
 
 	GATE(PCLK_TIMER1, "pclk_timer1", "pclk_cpu", 0, RK2928_CLKGATE_CON(7), 8, GFLAGS),
 	GATE(PCLK_TIMER2, "pclk_timer2", "pclk_cpu", 0, RK2928_CLKGATE_CON(7), 9, GFLAGS),
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
