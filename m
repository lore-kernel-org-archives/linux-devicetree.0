From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v2 2/7] clk: rockchip: rk3188: add CLK_SET_RATE_PARENT for lcdc dclk
Date: Sat, 29 Dec 2018 14:33:13 +0100
Message-ID: <20181229133318.18128-3-jbx6244@gmail.com>
References: <20181229133318.18128-1-jbx6244@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181229133318.18128-1-jbx6244@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: hjc@rock-chips.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Finley Xiao <finley.xiao@rock-chips.com>

Add CLK_SET_RATE_PARENT for lcdc dclk.

Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 drivers/clk/rockchip/clk-rk3188.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3188.c b/drivers/clk/rockchip/clk-rk3188.c
index 7ea20341e..5ecf28854 100644
--- a/drivers/clk/rockchip/clk-rk3188.c
+++ b/drivers/clk/rockchip/clk-rk3188.c
@@ -586,12 +586,12 @@ static struct rockchip_clk_branch rk3066a_clk_branches[] __initdata = {
 	COMPOSITE(0, "dclk_lcdc0_src", mux_pll_src_cpll_gpll_p, 0,
 			RK2928_CLKSEL_CON(27), 0, 1, MFLAGS, 8, 8, DFLAGS,
 			RK2928_CLKGATE_CON(3), 1, GFLAGS),
-	MUX(DCLK_LCDC0, "dclk_lcdc0", mux_rk3066_lcdc0_p, 0,
+	MUX(DCLK_LCDC0, "dclk_lcdc0", mux_rk3066_lcdc0_p, CLK_SET_RATE_PARENT,
 			RK2928_CLKSEL_CON(27), 4, 1, MFLAGS),
 	COMPOSITE(0, "dclk_lcdc1_src", mux_pll_src_cpll_gpll_p, 0,
 			RK2928_CLKSEL_CON(28), 0, 1, MFLAGS, 8, 8, DFLAGS,
 			RK2928_CLKGATE_CON(3), 2, GFLAGS),
-	MUX(DCLK_LCDC1, "dclk_lcdc1", mux_rk3066_lcdc1_p, 0,
+	MUX(DCLK_LCDC1, "dclk_lcdc1", mux_rk3066_lcdc1_p, CLK_SET_RATE_PARENT,
 			RK2928_CLKSEL_CON(28), 4, 1, MFLAGS),
 
 	COMPOSITE_NOMUX(0, "cif1_pre", "cif_src", 0,
-- 
2.11.0
