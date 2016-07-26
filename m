From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 04/13] clk: sunxi-ng: sun8i: Fix register offset
Date: Tue, 26 Jul 2016 22:30:32 +0200
Message-ID: <20160726203041.29366-5-maxime.ripard@free-electrons.com>
References: <20160726203041.29366-1-maxime.ripard@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160726203041.29366-1-maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Some registers offset were having one 0 too many compared to the others.
Remove it.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
index 68492808e5fc..3c236eefbb3a 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
@@ -70,7 +70,7 @@ static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK(pll_video0_clk, "pll-video0",
 					0);
 
 static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK(pll_ve_clk, "pll-ve",
-					"osc24M", 0x0018,
+					"osc24M", 0x018,
 					8, 7,		/* N */
 					0, 4,		/* M */
 					BIT(24),	/* frac enable */
@@ -100,7 +100,7 @@ static SUNXI_CCU_NK_WITH_GATE_LOCK_POSTDIV(pll_periph0_clk, "pll-periph0",
 					   0);
 
 static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK(pll_gpu_clk, "pll-gpu",
-					"osc24M", 0x0038,
+					"osc24M", 0x038,
 					8, 7,		/* N */
 					0, 4,		/* M */
 					BIT(24),	/* frac enable */
@@ -121,7 +121,7 @@ static SUNXI_CCU_NK_WITH_GATE_LOCK_POSTDIV(pll_periph1_clk, "pll-periph1",
 					   0);
 
 static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK(pll_de_clk, "pll-de",
-					"osc24M", 0x0048,
+					"osc24M", 0x048,
 					8, 7,		/* N */
 					0, 4,		/* M */
 					BIT(24),	/* frac enable */
-- 
2.9.2
