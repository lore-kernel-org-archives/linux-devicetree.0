From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 1/7] clk: sunxi-ng: sun50i: h6: Fix MMC clock mux width
Date: Thu,  1 Nov 2018 00:06:28 +0530
Message-ID: <20181031183634.29640-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Cc: Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

MUX bits for MMC clock register range are 25:24 where 24 is shift
and 2 is width So fix the width number from 3 to 2.

Fixes: 524353ea480b ("clk: sunxi-ng: add support for the Allwinner H6 CCU")
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
index 2193e1495086..e2bc612f1d3e 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
@@ -411,7 +411,7 @@ static const char * const mmc_parents[] = { "osc24M", "pll-periph0-2x",
 static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc0_clk, "mmc0", mmc_parents, 0x830,
 					  0, 4,		/* M */
 					  8, 2,		/* N */
-					  24, 3,	/* mux */
+					  24, 2,	/* mux */
 					  BIT(31),	/* gate */
 					  2,		/* post-div */
 					  0);
@@ -419,7 +419,7 @@ static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc0_clk, "mmc0", mmc_parents, 0x830,
 static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc1_clk, "mmc1", mmc_parents, 0x834,
 					  0, 4,		/* M */
 					  8, 2,		/* N */
-					  24, 3,	/* mux */
+					  24, 2,	/* mux */
 					  BIT(31),	/* gate */
 					  2,		/* post-div */
 					  0);
@@ -427,7 +427,7 @@ static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc1_clk, "mmc1", mmc_parents, 0x834,
 static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc2_clk, "mmc2", mmc_parents, 0x838,
 					  0, 4,		/* M */
 					  8, 2,		/* N */
-					  24, 3,	/* mux */
+					  24, 2,	/* mux */
 					  BIT(31),	/* gate */
 					  2,		/* post-div */
 					  0);
-- 
2.18.0.321.gffc6fa0e3
