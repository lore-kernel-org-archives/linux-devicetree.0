From: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v5 1/4] clk: at91: sckc: sama5d4 has no bypass support
Date: Thu, 27 Jun 2019 17:47:18 +0300
Message-ID: <1561646841-7663-2-git-send-email-claudiu.beznea@microchip.com>
References: <1561646841-7663-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561646841-7663-1-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: devicetree@vger.kernel.org

The slow clock of SAMA5D4 has no bypass support thus remove it.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/clk/at91/sckc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/clk/at91/sckc.c b/drivers/clk/at91/sckc.c
index e76b1d64e905..6c55a7a86f79 100644
--- a/drivers/clk/at91/sckc.c
+++ b/drivers/clk/at91/sckc.c
@@ -429,7 +429,6 @@ static void __init of_sama5d4_sckc_setup(struct device_node *np)
 	struct clk_init_data init;
 	const char *xtal_name;
 	const char *parent_names[2] = { "slow_rc_osc", "slow_osc" };
-	bool bypass;
 	int ret;
 
 	if (!regbase)
@@ -443,8 +442,6 @@ static void __init of_sama5d4_sckc_setup(struct device_node *np)
 
 	xtal_name = of_clk_get_parent_name(np, 0);
 
-	bypass = of_property_read_bool(np, "atmel,osc-bypass");
-
 	osc = kzalloc(sizeof(*osc), GFP_KERNEL);
 	if (!osc)
 		return;
@@ -459,9 +456,6 @@ static void __init of_sama5d4_sckc_setup(struct device_node *np)
 	osc->sckcr = regbase;
 	osc->startup_usec = 1200000;
 
-	if (bypass)
-		writel((readl(regbase) | AT91_SCKC_OSC32BYP), regbase);
-
 	hw = &osc->hw;
 	ret = clk_hw_register(NULL, &osc->hw);
 	if (ret) {
-- 
2.7.4
