From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC v3 13/22] clk: renesas: rcar-gen2: Obtain mode pin values using RST driver
Date: Wed,  1 Jun 2016 21:21:11 +0200
Message-ID: <1464808880-343-14-git-send-email-geert+renesas@glider.be>
References: <1464808880-343-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1464808880-343-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Dirk Behme <dirk.behme@de.bosch.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Obtain the values of the mode pins from the R-Car RST driver, which
relies on the presence in DT of a device node for the RST module.

Fall back to calling rcar_gen2_read_mode_pins() in the R-Car Gen2
platform code for backward-compatibility with old DTs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  -  Use the R-Car RST driver instead of syscon/regmap and the
     "renesas,modemr" property in DT,

v2:
  - drivers/clk/shmobile/ was renamed to drivers/clk/renesas/.
---
 drivers/clk/renesas/clk-rcar-gen2.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/renesas/clk-rcar-gen2.c b/drivers/clk/renesas/clk-rcar-gen2.c
index 00e6aba4b9c09596..436fc7a7714e4bd7 100644
--- a/drivers/clk/renesas/clk-rcar-gen2.c
+++ b/drivers/clk/renesas/clk-rcar-gen2.c
@@ -19,6 +19,7 @@
 #include <linux/of_address.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/soc/renesas/rcar-rst.h>
 
 struct rcar_gen2_cpg {
 	struct clk_onecell_data data;
@@ -372,6 +373,15 @@ static void __init rcar_gen2_cpg_clocks_init(struct device_node *np)
 	unsigned int i;
 	int num_clks;
 
+	if (rcar_rst_read_mode_pins(&cpg_mode)) {
+		/* Backward-compatibility with old DT */
+		extern u32 rcar_gen2_read_mode_pins(void);
+
+		pr_warn("%s: failed to obtain mode pins from RST\n",
+			np->full_name);
+		cpg_mode = rcar_gen2_read_mode_pins();
+	}
+
 	num_clks = of_property_count_strings(np, "clock-output-names");
 	if (num_clks < 0) {
 		pr_err("%s: failed to count clocks\n", __func__);
-- 
1.9.1
