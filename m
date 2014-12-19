From: Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 2/2] CHROMIUM: clk: rockchip: add PVTM clocks on rk3288
Date: Thu, 18 Dec 2014 16:13:46 -0800
Message-ID: <1418948026-3463-2-git-send-email-dtor@chromium.org>
References: <1418948026-3463-1-git-send-email-dtor@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418948026-3463-1-git-send-email-dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: huang lin <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Process-Voltage-Temperatiure Monitor block on RK3288 has two clocks:
PVTM_CORE and PVTM_GPU.

Signed-off-by: Huang Lin <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Signed-off-by: Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 drivers/clk/rockchip/clk-rk3288.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
index ac6be7c..4632bb3 100644
--- a/drivers/clk/rockchip/clk-rk3288.c
+++ b/drivers/clk/rockchip/clk-rk3288.c
@@ -704,8 +704,8 @@ static struct rockchip_clk_branch rk3288_clk_branches[] __initdata = {
 
 	GATE(SCLK_LCDC_PWM0, "sclk_lcdc_pwm0", "xin24m", 0, RK3288_CLKGATE_CON(13), 10, GFLAGS),
 	GATE(SCLK_LCDC_PWM1, "sclk_lcdc_pwm1", "xin24m", 0, RK3288_CLKGATE_CON(13), 11, GFLAGS),
-	GATE(0, "sclk_pvtm_core", "xin24m", 0, RK3288_CLKGATE_CON(5), 9, GFLAGS),
-	GATE(0, "sclk_pvtm_gpu", "xin24m", 0, RK3288_CLKGATE_CON(5), 10, GFLAGS),
+	GATE(SCLK_PVTM_CORE, "sclk_pvtm_core", "xin24m", 0, RK3288_CLKGATE_CON(5), 9, GFLAGS),
+	GATE(SCLK_PVTM_GPU, "sclk_pvtm_gpu", "xin24m", 0, RK3288_CLKGATE_CON(5), 10, GFLAGS),
 	GATE(0, "sclk_mipidsi_24m", "xin24m", 0, RK3288_CLKGATE_CON(5), 15, GFLAGS),
 
 	/* sclk_gpu gates */
-- 
2.2.0.rc0.207.ga3a616c

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
