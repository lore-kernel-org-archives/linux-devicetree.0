From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 6/7] clk: rockchip: add flags for rk3328 dclk_lcdc
Date: Mon, 22 Jan 2018 15:15:29 +0100
Message-ID: <20180122141530.12398-7-heiko@sntech.de>
References: <20180122141530.12398-1-heiko@sntech.de>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20180122141530.12398-1-heiko@sntech.de>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, yang.zheng@rock-chips.com, zhangqing@rock-chips.com, Zheng Yang <zhengyang@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

From: Zheng Yang <zhengyang@rock-chips.com>

dclk_lcdc can be sourced from a general pll source as well
as the hdmiphy's pll output. We will want to set this source
by hand (to the system-pll-source in most cases) and also
want rate changes to this clock to be able to also touch
the pll source clock if needed, so add CLK_SET_RATE_PARENT
and CLK_SET_RATE_NO_REPARENT for dclk_lcdc.

Signed-off-by: Zheng Yang <zhengyang@rock-chips.com>
[ammended commit message]
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3328.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3328.c b/drivers/clk/rockchip/clk-rk3328.c
index 983ad5760ce0..f680b421b6d5 100644
--- a/drivers/clk/rockchip/clk-rk3328.c
+++ b/drivers/clk/rockchip/clk-rk3328.c
@@ -602,7 +602,7 @@ static struct rockchip_clk_branch rk3328_clk_branches[] __initdata = {
 			RK3328_CLKGATE_CON(5), 6, GFLAGS),
 	DIV(DCLK_HDMIPHY, "dclk_hdmiphy", "dclk_lcdc_src", 0,
 			RK3328_CLKSEL_CON(40), 3, 3, DFLAGS),
-	MUX(DCLK_LCDC, "dclk_lcdc", mux_dclk_lcdc_p, 0,
+	MUX(DCLK_LCDC, "dclk_lcdc", mux_dclk_lcdc_p,  CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
 			RK3328_CLKSEL_CON(40), 1, 1, MFLAGS),
 
 	/*
-- 
2.14.2

