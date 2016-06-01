From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC v3 15/22] clk: renesas: r8a7796: Obtain mode pin values from R-Car RST driver
Date: Wed,  1 Jun 2016 21:21:13 +0200
Message-ID: <1464808880-343-16-git-send-email-geert+renesas@glider.be>
References: <1464808880-343-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1464808880-343-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Dirk Behme <dirk.behme@de.bosch.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Obtain the values of the mode pins from the R-Car RST driver, which
relies on the presence in DT of a device node for the RST module.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - New.
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index c84b549c14d2e57d..3db2d1cfc8cd788e 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -16,6 +16,7 @@
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/soc/renesas/rcar-rst.h>
 
 #include <dt-bindings/clock/r8a7796-cpg-mssr.h>
 
@@ -159,7 +160,12 @@ static const struct rcar_gen3_cpg_pll_config cpg_pll_configs[16] __initconst = {
 static int __init r8a7796_cpg_mssr_init(struct device *dev)
 {
 	const struct rcar_gen3_cpg_pll_config *cpg_pll_config;
-	u32 cpg_mode = rcar_gen3_read_mode_pins();
+	u32 cpg_mode;
+	int error;
+
+	error = rcar_rst_read_mode_pins(&cpg_mode);
+	if (error)
+		return error;
 
 	cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
 	if (!cpg_pll_config->extal_div) {
-- 
1.9.1
