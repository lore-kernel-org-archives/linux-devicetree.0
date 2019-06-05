From: "Leonidas P. Papadakos" <papadakospan@gmail.com>
Subject: [PATCH 1/2] clk: rockchip: add clock for the watchdog pclk on rk3328
Date: Thu,  6 Jun 2019 02:57:13 +0300
Message-ID: <20190605235714.22432-1-papadakospan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-rockchip@lists.infradead.org, "Leonidas P. Papadakos" <papadakospan@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: <itdaniher@gmail.com>

Following the discussion here:
https://github.com/rockchip-linux/kernel/issues/123

it can be seen that these are the changes needed to enable the use of the hardware watchdog in the rk3328 SoC.

This is in line with past changes for the rk3288:
http://lists.infradead.org/pipermail/linux-rockchip/2015-January/002314.html

Signed-off-by: Leonidas P. Papadakos <papadakospan@gmail.com>
---
 drivers/clk/rockchip/clk-rk3328.c      | 9 +++++++++
 include/dt-bindings/clock/rk3328-cru.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rk3328.c b/drivers/clk/rockchip/clk-rk3328.c
index 076b9777a..546ee0ab7 100644
--- a/drivers/clk/rockchip/clk-rk3328.c
+++ b/drivers/clk/rockchip/clk-rk3328.c
@@ -876,6 +876,8 @@ static const char *const rk3328_critical_clocks[] __initconst = {
 
 static void __init rk3328_clk_init(struct device_node *np)
 {
+	struct clk *clk;
+
 	struct rockchip_clk_provider *ctx;
 	void __iomem *reg_base;
 
@@ -892,6 +894,13 @@ static void __init rk3328_clk_init(struct device_node *np)
 		return;
 	}
 
+	clk = clk_register_fixed_factor(NULL, "pclk_wdt", "pclk_bus", 0, 1, 1);
+	if (IS_ERR(clk))
+		pr_warn("%s: could not register clock pclk_wdt: %ld\n",
+			__func__, PTR_ERR(clk));
+	else
+		rockchip_clk_add_lookup(ctx, clk, PCLK_WDT);
+
 	rockchip_clk_register_plls(ctx, rk3328_pll_clks,
 				   ARRAY_SIZE(rk3328_pll_clks),
 				   RK3328_GRF_SOC_STATUS0);
diff --git a/include/dt-bindings/clock/rk3328-cru.h b/include/dt-bindings/clock/rk3328-cru.h
index afb811340..555b4ff66 100644
--- a/include/dt-bindings/clock/rk3328-cru.h
+++ b/include/dt-bindings/clock/rk3328-cru.h
@@ -164,6 +164,7 @@
 #define PCLK_DCF		233
 #define PCLK_SARADC		234
 #define PCLK_ACODECPHY		235
+#define PCLK_WDT		236
 
 /* hclk gates */
 #define HCLK_PERI		308
-- 
2.21.0
