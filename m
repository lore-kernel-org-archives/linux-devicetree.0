From: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v3 8/9] clk: rockchip: rename some of clks for rv1108 SoC
Date: Tue,  8 Aug 2017 15:19:17 +0800
Message-ID: <1502176757-32369-1-git-send-email-zhangqing@rock-chips.com>
References: <1502176547-30817-1-git-send-email-zhangqing@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502176547-30817-1-git-send-email-zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rename some of clks to keep the consistency with the TRM.

Signed-off-by: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 drivers/clk/rockchip/clk-rv1108.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rv1108.c b/drivers/clk/rockchip/clk-rv1108.c
index 829beef82cff..b845c5d8e792 100644
--- a/drivers/clk/rockchip/clk-rv1108.c
+++ b/drivers/clk/rockchip/clk-rv1108.c
@@ -276,24 +276,24 @@ enum rv1108_plls {
 	COMPOSITE_NOMUX(0, "pmu_24m_ena", "gpll", CLK_IGNORE_UNUSED,
 			RV1108_CLKSEL_CON(38), 0, 5, DFLAGS,
 			RV1108_CLKGATE_CON(8), 12, GFLAGS),
-	GATE(0, "pmu", "pmu_24m_ena", CLK_IGNORE_UNUSED,
+	GATE(0, "pclk_pmu", "pmu_24m_ena", CLK_IGNORE_UNUSED,
 			RV1108_CLKGATE_CON(10), 0, GFLAGS),
-	GATE(0, "intmem1", "pmu_24m_ena", CLK_IGNORE_UNUSED,
+	GATE(0, "pclk_intmem1", "pmu_24m_ena", CLK_IGNORE_UNUSED,
 			RV1108_CLKGATE_CON(10), 1, GFLAGS),
-	GATE(0, "gpio0_pmu", "pmu_24m_ena", CLK_IGNORE_UNUSED,
+	GATE(PCLK_GPIO0_PMU, "pclk_gpio0_pmu", "pmu_24m_ena", 0,
 			RV1108_CLKGATE_CON(10), 2, GFLAGS),
-	GATE(0, "pmugrf", "pmu_24m_ena", CLK_IGNORE_UNUSED,
+	GATE(0, "pclk_pmugrf", "pmu_24m_ena", CLK_IGNORE_UNUSED,
 			RV1108_CLKGATE_CON(10), 3, GFLAGS),
-	GATE(0, "pmu_noc", "pmu_24m_ena", CLK_IGNORE_UNUSED,
+	GATE(0, "pclk_pmu_niu", "pmu_24m_ena", CLK_IGNORE_UNUSED,
 			RV1108_CLKGATE_CON(10), 4, GFLAGS),
-	GATE(0, "i2c0_pmu_pclk", "pmu_24m_ena", CLK_IGNORE_UNUSED,
+	GATE(PCLK_I2C0_PMU, "pclk_i2c0_pmu", "pmu_24m_ena", 0,
 			RV1108_CLKGATE_CON(10), 5, GFLAGS),
-	GATE(0, "pwm0_pmu_pclk", "pmu_24m_ena", CLK_IGNORE_UNUSED,
+	GATE(PCLK_PWM0_PMU, "pclk_pwm0_pmu", "pmu_24m_ena", 0,
 			RV1108_CLKGATE_CON(10), 6, GFLAGS),
-	COMPOSITE(0, "pwm0_pmu_clk", mux_pll_src_2plls_p, CLK_IGNORE_UNUSED,
+	COMPOSITE(SCLK_PWM0_PMU, "sclk_pwm0_pmu", mux_pll_src_2plls_p, 0,
 			RV1108_CLKSEL_CON(12), 7, 1, MFLAGS, 0, 7, DFLAGS,
 			RV1108_CLKGATE_CON(8), 15, GFLAGS),
-	COMPOSITE(0, "i2c0_pmu_clk", mux_pll_src_2plls_p, CLK_IGNORE_UNUSED,
+	COMPOSITE(SCLK_I2C0_PMU, "sclk_i2c0_pmu", mux_pll_src_2plls_p, 0,
 			RV1108_CLKSEL_CON(19), 7, 1, MFLAGS, 0, 7, DFLAGS,
 			RV1108_CLKGATE_CON(8), 14, GFLAGS),
 	GATE(0, "pvtm_pmu", "xin24m", CLK_IGNORE_UNUSED,
@@ -410,10 +410,10 @@ enum rv1108_plls {
 	/*
 	 * Clock-Architecture Diagram 4
 	 */
-	COMPOSITE(0, "aclk_vio0_2wrap_occ", mux_pll_src_4plls_p, CLK_IGNORE_UNUSED,
+	COMPOSITE(0, "aclk_vio0_pre", mux_pll_src_4plls_p, CLK_IGNORE_UNUSED,
 			RV1108_CLKSEL_CON(28), 6, 2, MFLAGS, 0, 5, DFLAGS,
 			RV1108_CLKGATE_CON(6), 0, GFLAGS),
-	GATE(0, "aclk_vio0_pre", "aclk_vio0_2wrap_occ", CLK_IGNORE_UNUSED,
+	GATE(ACLK_VIO0, "aclk_vio0", "aclk_vio0_pre", 0,
 			RV1108_CLKGATE_CON(17), 0, GFLAGS),
 	COMPOSITE_NOMUX(0, "hclk_vio_pre", "aclk_vio0_pre", 0,
 			RV1108_CLKSEL_CON(29), 0, 5, DFLAGS,
@@ -632,10 +632,10 @@ enum rv1108_plls {
 			RV1108_CLKGATE_CON(13), 1, GFLAGS),
 	GATE(PCLK_I2C3, "pclk_i2c3", "pclk_bus_pre", 0,
 			RV1108_CLKGATE_CON(13), 2, GFLAGS),
-	COMPOSITE(SCLK_PWM, "clk_pwm1", mux_pll_src_2plls_p, 0,
+	COMPOSITE(SCLK_PWM, "clk_pwm", mux_pll_src_2plls_p, 0,
 			RV1108_CLKSEL_CON(12), 15, 2, MFLAGS, 8, 7, DFLAGS,
 			RV1108_CLKGATE_CON(3), 10, GFLAGS),
-	GATE(PCLK_PWM, "pclk_pwm1", "pclk_bus_pre", 0,
+	GATE(PCLK_PWM, "pclk_pwm", "pclk_bus_pre", 0,
 			RV1108_CLKGATE_CON(13), 6, GFLAGS),
 	GATE(PCLK_WDT, "pclk_wdt", "pclk_bus_pre", 0,
 			RV1108_CLKGATE_CON(13), 3, GFLAGS),
@@ -720,7 +720,7 @@ enum rv1108_plls {
 			RV1108_CLKSEL_CON(23), 15, 1, MFLAGS, 0, 5, DFLAGS,
 			RV1108_CLKGATE_CON(15), 11, GFLAGS),
 
-	COMPOSITE(SCLK_SDMMC, "sclk_sdmmc0", mux_mmc_src_p, 0,
+	COMPOSITE(SCLK_SDMMC, "sclk_sdmmc", mux_mmc_src_p, 0,
 			RV1108_CLKSEL_CON(25), 8, 2, MFLAGS, 0, 8, DFLAGS,
 			RV1108_CLKGATE_CON(5), 0, GFLAGS),
 
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
