From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 12/23] clk: renesas: r8a7778: Obtain mode pin values using R-Car RST driver
Date: Fri, 21 Oct 2016 15:17:26 +0200
Message-ID: <1477055857-17936-13-git-send-email-geert+renesas@glider.be>
References: <1477055857-17936-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1477055857-17936-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Obtain the values of the mode pins from the R-Car RST driver, which
relies on the presence in DT of a device node for the RESET/WDT module.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Dirk Behme <dirk.behme@de.bosch.com>
---
v4:
  - Add Acked-by,

v3:
  - New.
---
 drivers/clk/renesas/clk-r8a7778.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/renesas/clk-r8a7778.c b/drivers/clk/renesas/clk-r8a7778.c
index 40e3a501a50e200f..07ea411098a75ad1 100644
--- a/drivers/clk/renesas/clk-r8a7778.c
+++ b/drivers/clk/renesas/clk-r8a7778.c
@@ -12,6 +12,7 @@
 #include <linux/clk/renesas.h>
 #include <linux/of_address.h>
 #include <linux/slab.h>
+#include <linux/soc/renesas/rcar-rst.h>
 
 struct r8a7778_cpg {
 	struct clk_onecell_data data;
@@ -83,6 +84,18 @@ static void __init r8a7778_cpg_clocks_init(struct device_node *np)
 	struct clk **clks;
 	unsigned int i;
 	int num_clks;
+	u32 mode;
+
+	if (rcar_rst_read_mode_pins(&mode))
+		return;
+
+	BUG_ON(!(mode & BIT(19)));
+
+	cpg_mode_rates = (!!(mode & BIT(18)) << 2) |
+			 (!!(mode & BIT(12)) << 1) |
+			 (!!(mode & BIT(11)));
+	cpg_mode_divs = (!!(mode & BIT(2)) << 1) |
+			(!!(mode & BIT(1)));
 
 	num_clks = of_property_count_strings(np, "clock-output-names");
 	if (num_clks < 0) {
-- 
1.9.1
