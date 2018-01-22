From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 3/7] clk: rockchip: export sclk_hdmi_sfc on rk3328
Date: Mon, 22 Jan 2018 15:15:26 +0100
Message-ID: <20180122141530.12398-4-heiko@sntech.de>
References: <20180122141530.12398-1-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180122141530.12398-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yang.zheng-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This clock is one of the dw-hdmi supplying clocks and thus
needs to be exported.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 drivers/clk/rockchip/clk-rk3328.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3328.c b/drivers/clk/rockchip/clk-rk3328.c
index 17816aec206a..b7a28f2814e2 100644
--- a/drivers/clk/rockchip/clk-rk3328.c
+++ b/drivers/clk/rockchip/clk-rk3328.c
@@ -588,7 +588,7 @@ static struct rockchip_clk_branch rk3328_clk_branches[] __initdata = {
 	COMPOSITE(ACLK_VOP_PRE, "aclk_vop_pre", mux_4plls_p, 0,
 			RK3328_CLKSEL_CON(39), 6, 2, MFLAGS, 0, 5, DFLAGS,
 			RK3328_CLKGATE_CON(5), 5, GFLAGS),
-	GATE(0, "clk_hdmi_sfc", "xin24m", 0,
+	GATE(SCLK_HDMI_SFC, "sclk_hdmi_sfc", "xin24m", 0,
 			RK3328_CLKGATE_CON(5), 4, GFLAGS),
 
 	COMPOSITE_NODIV(0, "clk_cif_src", mux_2plls_p, 0,
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
