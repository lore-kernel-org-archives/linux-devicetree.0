From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 3/7] clk: at91: sckc: handle different RC startup time
Date: Tue, 19 Feb 2019 18:01:56 +0100
Message-ID: <20190219170200.3608-4-alexandre.belloni@bootlin.com>
References: <20190219170200.3608-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190219170200.3608-1-alexandre.belloni@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The sama5d3 slow RC oscillator as a different startup time than all the
previous SoCs. Handle that using its own compatible.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/clk/at91/sckc.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/at91/sckc.c b/drivers/clk/at91/sckc.c
index 470aef586f57..e76b1d64e905 100644
--- a/drivers/clk/at91/sckc.c
+++ b/drivers/clk/at91/sckc.c
@@ -321,7 +321,8 @@ at91_clk_register_sam9x5_slow(void __iomem *sckcr,
 	return hw;
 }
 
-static void __init of_at91sam9x5_sckc_setup(struct device_node *np)
+static void __init at91sam9x5_sckc_register(struct device_node *np,
+					    unsigned int rc_osc_startup_us)
 {
 	const char *parent_names[2] = { "slow_rc_osc", "slow_osc" };
 	void __iomem *regbase = of_iomap(np, 0);
@@ -334,7 +335,7 @@ static void __init of_at91sam9x5_sckc_setup(struct device_node *np)
 		return;
 
 	hw = at91_clk_register_slow_rc_osc(regbase, parent_names[0], 32768,
-					   50000000, 75);
+					   50000000, rc_osc_startup_us);
 	if (IS_ERR(hw))
 		return;
 
@@ -371,9 +372,21 @@ static void __init of_at91sam9x5_sckc_setup(struct device_node *np)
 	if (child)
 		of_clk_add_hw_provider(child, of_clk_hw_simple_get, hw);
 }
+
+static void __init of_at91sam9x5_sckc_setup(struct device_node *np)
+{
+	at91sam9x5_sckc_register(np, 75);
+}
 CLK_OF_DECLARE(at91sam9x5_clk_sckc, "atmel,at91sam9x5-sckc",
 	       of_at91sam9x5_sckc_setup);
 
+static void __init of_sama5d3_sckc_setup(struct device_node *np)
+{
+	at91sam9x5_sckc_register(np, 500);
+}
+CLK_OF_DECLARE(sama5d3_clk_sckc, "atmel,sama5d3-sckc",
+	       of_sama5d3_sckc_setup);
+
 static int clk_sama5d4_slow_osc_prepare(struct clk_hw *hw)
 {
 	struct clk_sama5d4_slow_osc *osc = to_clk_sama5d4_slow_osc(hw);
-- 
2.20.1
