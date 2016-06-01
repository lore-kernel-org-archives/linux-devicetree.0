From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC v3 22/22] clk: renesas: rcar-gen2: Remove obsolete rcar_gen2_clocks_init()
Date: Wed,  1 Jun 2016 21:21:20 +0200
Message-ID: <1464808880-343-23-git-send-email-geert+renesas@glider.be>
References: <1464808880-343-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1464808880-343-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Dirk Behme <dirk.behme@de.bosch.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

The R-Car Gen2 board code no longer calls rcar_gen2_clocks_init().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - rebased,

v2:
  - No changes.
---
 drivers/clk/renesas/clk-rcar-gen2.c | 7 -------
 include/linux/clk/renesas.h         | 2 --
 2 files changed, 9 deletions(-)

diff --git a/drivers/clk/renesas/clk-rcar-gen2.c b/drivers/clk/renesas/clk-rcar-gen2.c
index 436fc7a7714e4bd7..4860022627bb455f 100644
--- a/drivers/clk/renesas/clk-rcar-gen2.c
+++ b/drivers/clk/renesas/clk-rcar-gen2.c
@@ -430,10 +430,3 @@ static void __init rcar_gen2_cpg_clocks_init(struct device_node *np)
 }
 CLK_OF_DECLARE(rcar_gen2_cpg_clks, "renesas,rcar-gen2-cpg-clocks",
 	       rcar_gen2_cpg_clocks_init);
-
-void __init rcar_gen2_clocks_init(u32 mode)
-{
-	cpg_mode = mode;
-
-	of_clk_init(NULL);
-}
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index 9e969941f3f62878..9ebf1f8243bb57af 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -20,8 +20,6 @@ struct device;
 struct device_node;
 struct generic_pm_domain;
 
-void rcar_gen2_clocks_init(u32 mode);
-
 void cpg_mstp_add_clk_domain(struct device_node *np);
 #ifdef CONFIG_CLK_RENESAS_CPG_MSTP
 int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev);
-- 
1.9.1
