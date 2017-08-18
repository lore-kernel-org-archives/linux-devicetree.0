From: Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v1 2/2] clk: rockchip: rk3228: add SCLK_SDIO_SRC clk id
Date: Fri, 18 Aug 2017 11:49:25 +0800
Message-ID: <1503028165-27072-3-git-send-email-zhangqing@rock-chips.com>
References: <1503028165-27072-1-git-send-email-zhangqing@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503028165-27072-1-git-send-email-zhangqing@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@codeaurora.org, heiko@sntech.de
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com, frank.wang@rock-chips.com, cl@rock-chips.com, Elaine Zhang <zhangqing@rock-chips.com>
List-Id: devicetree@vger.kernel.org

In some special circumstances, may be need to reparent clk for sclk_sdio_src.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 drivers/clk/rockchip/clk-rk3228.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3228.c b/drivers/clk/rockchip/clk-rk3228.c
index bb405d9044a3..11e7f2d1c054 100644
--- a/drivers/clk/rockchip/clk-rk3228.c
+++ b/drivers/clk/rockchip/clk-rk3228.c
@@ -391,7 +391,7 @@ enum rk3228_plls {
 			RK2928_CLKSEL_CON(11), 8, 2, MFLAGS, 0, 8, DFLAGS,
 			RK2928_CLKGATE_CON(2), 11, GFLAGS),
 
-	COMPOSITE_NODIV(0, "sclk_sdio_src", mux_mmc_src_p, 0,
+	COMPOSITE_NODIV(SCLK_SDIO_SRC, "sclk_sdio_src", mux_mmc_src_p, 0,
 			RK2928_CLKSEL_CON(11), 10, 2, MFLAGS,
 			RK2928_CLKGATE_CON(2), 13, GFLAGS),
 	DIV(SCLK_SDIO, "sclk_sdio", "sclk_sdio_src", 0,
-- 
1.9.1
