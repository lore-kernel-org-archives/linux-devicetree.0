From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 5/7] clk: rockchip: remove ignore_unused flag from rk3328
 vio_h2p clocks
Date: Mon, 22 Jan 2018 15:15:28 +0100
Message-ID: <20180122141530.12398-6-heiko@sntech.de>
References: <20180122141530.12398-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180122141530.12398-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, yang.zheng-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

These are already marked as critical, so there is no need for an
additional ignore_unused flag.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 drivers/clk/rockchip/clk-rk3328.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3328.c b/drivers/clk/rockchip/clk-rk3328.c
index c5b381ab23b1..983ad5760ce0 100644
--- a/drivers/clk/rockchip/clk-rk3328.c
+++ b/drivers/clk/rockchip/clk-rk3328.c
@@ -724,8 +724,8 @@ static struct rockchip_clk_branch rk3328_clk_branches[] __initdata = {
 	GATE(HCLK_CIF, "hclk_cif", "hclk_vio_pre", 0, RK3328_CLKGATE_CON(21), 9, GFLAGS),
 	GATE(HCLK_RGA, "hclk_rga", "hclk_vio_pre", 0, RK3328_CLKGATE_CON(21), 11, GFLAGS),
 	GATE(0, "hclk_ahb1tom", "hclk_vio_pre", CLK_IGNORE_UNUSED, RK3328_CLKGATE_CON(21), 12, GFLAGS),
-	GATE(0, "pclk_vio_h2p", "hclk_vio_pre", CLK_IGNORE_UNUSED, RK3328_CLKGATE_CON(21), 13, GFLAGS),
-	GATE(0, "hclk_vio_h2p", "hclk_vio_pre", CLK_IGNORE_UNUSED, RK3328_CLKGATE_CON(21), 14, GFLAGS),
+	GATE(0, "pclk_vio_h2p", "hclk_vio_pre", 0, RK3328_CLKGATE_CON(21), 13, GFLAGS),
+	GATE(0, "hclk_vio_h2p", "hclk_vio_pre", 0, RK3328_CLKGATE_CON(21), 14, GFLAGS),
 	GATE(HCLK_HDCP, "hclk_hdcp", "hclk_vio_pre", 0, RK3328_CLKGATE_CON(22), 0, GFLAGS),
 	GATE(0, "hclk_vio_niu", "hclk_vio_pre", 0, RK3328_CLKGATE_CON(22), 1, GFLAGS),
 	GATE(PCLK_HDMI, "pclk_hdmi", "hclk_vio_pre", 0, RK3328_CLKGATE_CON(22), 4, GFLAGS),
-- 
2.14.2
