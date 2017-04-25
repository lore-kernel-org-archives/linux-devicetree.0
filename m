From: Eddie Cai <eddie.cai.linux@gmail.com>
Subject: [PATCH V2  2/2] clk: rockchip: fix the incorrect ids
Date: Tue, 25 Apr 2017 14:41:10 +0800
Message-ID: <1493102470-22965-3-git-send-email-eddie.cai.linux@gmail.com>
References: <1493102470-22965-1-git-send-email-eddie.cai.linux@gmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1493102470-22965-1-git-send-email-eddie.cai.linux@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, heiko@sntech.de, zhengxing@rock-chips.com, mturquette@baylibre.com, sboyd@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, Eddie Cai <eddie.cai.linux@gmail.com>
List-Id: devicetree@vger.kernel.org

the ids of clk_testout1 and clk_testout2 is incorrect now. let's correct it

Signed-off-by: Eddie Cai <eddie.cai.linux@gmail.com>
---
 drivers/clk/rockchip/clk-rk3399.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
index 73121b14..f3656ba 100644
--- a/drivers/clk/rockchip/clk-rk3399.c
+++ b/drivers/clk/rockchip/clk-rk3399.c
@@ -1066,13 +1066,13 @@ enum rk3399_pmu_plls {
 	/* cif_testout */
 	MUX(0, "clk_testout1_pll_src", mux_pll_src_cpll_gpll_npll_p, 0,
 			RK3399_CLKSEL_CON(38), 6, 2, MFLAGS),
-	COMPOSITE(0, "clk_testout1", mux_clk_testout1_p, 0,
+	COMPOSITE(SCLK_TESTCLKOUT1, "clk_testout1", mux_clk_testout1_p, 0,
 			RK3399_CLKSEL_CON(38), 5, 1, MFLAGS, 0, 5, DFLAGS,
 			RK3399_CLKGATE_CON(13), 14, GFLAGS),
 
 	MUX(0, "clk_testout2_pll_src", mux_pll_src_cpll_gpll_npll_p, 0,
 			RK3399_CLKSEL_CON(38), 14, 2, MFLAGS),
-	COMPOSITE(0, "clk_testout2", mux_clk_testout2_p, 0,
+	COMPOSITE(SCLK_TESTCLKOUT2, "clk_testout2", mux_clk_testout2_p, 0,
 			RK3399_CLKSEL_CON(38), 13, 1, MFLAGS, 8, 5, DFLAGS,
 			RK3399_CLKGATE_CON(13), 15, GFLAGS),
 
-- 
1.9.1

