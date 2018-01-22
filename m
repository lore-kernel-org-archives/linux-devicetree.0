From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 1/7] clk: rockchip: fix hclk_vio_niu on rk3328
Date: Mon, 22 Jan 2018 15:15:24 +0100
Message-ID: <20180122141530.12398-2-heiko@sntech.de>
References: <20180122141530.12398-1-heiko@sntech.de>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20180122141530.12398-1-heiko@sntech.de>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, yang.zheng@rock-chips.com, zhangqing@rock-chips.com, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

The clock wrongly was called hclk_vio and exported, while it actually is
a clock of the interconnect-vio connection and should therefore be always
on till we actually model the interconnect.

So fix that and don't export it as HCLK_VIO.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3328.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3328.c b/drivers/clk/rockchip/clk-rk3328.c
index b04f29774ee7..17816aec206a 100644
--- a/drivers/clk/rockchip/clk-rk3328.c
+++ b/drivers/clk/rockchip/clk-rk3328.c
@@ -727,7 +727,7 @@ static struct rockchip_clk_branch rk3328_clk_branches[] __initdata = {
 	GATE(0, "pclk_vio_h2p", "hclk_vio_pre", CLK_IGNORE_UNUSED, RK3328_CLKGATE_CON(21), 13, GFLAGS),
 	GATE(0, "hclk_vio_h2p", "hclk_vio_pre", CLK_IGNORE_UNUSED, RK3328_CLKGATE_CON(21), 14, GFLAGS),
 	GATE(HCLK_HDCP, "hclk_hdcp", "hclk_vio_pre", 0, RK3328_CLKGATE_CON(22), 0, GFLAGS),
-	GATE(HCLK_VIO, "hclk_vio", "hclk_vio_pre", 0, RK3328_CLKGATE_CON(22), 1, GFLAGS),
+	GATE(0, "hclk_vio_niu", "hclk_vio_pre", 0, RK3328_CLKGATE_CON(22), 1, GFLAGS),
 	GATE(PCLK_HDMI, "pclk_hdmi", "hclk_vio_pre", 0, RK3328_CLKGATE_CON(22), 4, GFLAGS),
 	GATE(PCLK_HDCP, "pclk_hdcp", "hclk_vio_pre", 0, RK3328_CLKGATE_CON(22), 5, GFLAGS),
 
@@ -861,6 +861,7 @@ static const char *const rk3328_critical_clocks[] __initconst = {
 	"aclk_rga_niu",
 	"pclk_vio_h2p",
 	"hclk_vio_h2p",
+	"hclk_vio_niu",
 };
 
 static void __init rk3328_clk_init(struct device_node *np)
-- 
2.14.2

