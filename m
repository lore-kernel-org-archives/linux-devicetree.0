From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC v3 20/22] clk: renesas: r8a7778: Remove obsolete r8a7778_clocks_init()
Date: Wed,  1 Jun 2016 21:21:18 +0200
Message-ID: <1464808880-343-21-git-send-email-geert+renesas@glider.be>
References: <1464808880-343-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1464808880-343-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Dirk Behme <dirk.behme@de.bosch.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

The R-Car M1A board code no longer calls r8a7778_clocks_init().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - New.
---
 drivers/clk/renesas/clk-r8a7778.c | 13 -------------
 include/linux/clk/renesas.h       |  1 -
 2 files changed, 14 deletions(-)

diff --git a/drivers/clk/renesas/clk-r8a7778.c b/drivers/clk/renesas/clk-r8a7778.c
index 07ea411098a75ad1..886a8380e91247a1 100644
--- a/drivers/clk/renesas/clk-r8a7778.c
+++ b/drivers/clk/renesas/clk-r8a7778.c
@@ -143,16 +143,3 @@ static void __init r8a7778_cpg_clocks_init(struct device_node *np)
 
 CLK_OF_DECLARE(r8a7778_cpg_clks, "renesas,r8a7778-cpg-clocks",
 	       r8a7778_cpg_clocks_init);
-
-void __init r8a7778_clocks_init(u32 mode)
-{
-	BUG_ON(!(mode & BIT(19)));
-
-	cpg_mode_rates = (!!(mode & BIT(18)) << 2) |
-			 (!!(mode & BIT(12)) << 1) |
-			 (!!(mode & BIT(11)));
-	cpg_mode_divs = (!!(mode & BIT(2)) << 1) |
-			(!!(mode & BIT(1)));
-
-	of_clk_init(NULL);
-}
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index ba6fa4148515e5c9..2b663bba1adcc7c1 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -20,7 +20,6 @@ struct device;
 struct device_node;
 struct generic_pm_domain;
 
-void r8a7778_clocks_init(u32 mode);
 void r8a7779_clocks_init(u32 mode);
 void rcar_gen2_clocks_init(u32 mode);
 
-- 
1.9.1
