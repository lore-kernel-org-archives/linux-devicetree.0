From: andy.tang@nxp.com
Subject: [PATCH 2/2] clk: qoriq: add more PLL divider clocks support
Date: Mon, 22 Apr 2019 17:15:09 +0800
Message-ID: <20190422091509.3181-2-andy.tang@nxp.com>
References: <20190422091509.3181-1-andy.tang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190422091509.3181-1-andy.tang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com
Cc: sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Yuantian Tang <andy.tang@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Yuantian Tang <andy.tang@nxp.com>

More PLL divider clocks are needed by clock consumer IP. So enlarge
the PLL divider array to accommodate more divider clocks.

Signed-off-by: Yuantian Tang <andy.tang@nxp.com>
---
 drivers/clk/clk-qoriq.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
index 1212a9b..5e2b3ac 100644
--- a/drivers/clk/clk-qoriq.c
+++ b/drivers/clk/clk-qoriq.c
@@ -34,6 +34,7 @@
 #define CGA_PLL4	4	/* only on clockgen-1.0, which lacks CGB */
 #define CGB_PLL1	4
 #define CGB_PLL2	5
+#define MAX_PLL_DIV	16
 
 struct clockgen_pll_div {
 	struct clk *clk;
@@ -41,7 +42,7 @@ struct clockgen_pll_div {
 };
 
 struct clockgen_pll {
-	struct clockgen_pll_div div[8];
+	struct clockgen_pll_div div[MAX_PLL_DIV];
 };
 
 #define CLKSEL_VALID	1
@@ -1128,7 +1129,7 @@ static void __init create_one_pll(struct clockgen *cg, int idx)
 		int ret;
 
 		/*
-		 * For platform PLL, there are 8 divider clocks.
+		 * For platform PLL, there are MAX_PLL_DIV divider clocks.
 		 * For core PLL, there are 4 divider clocks at most.
 		 */
 		if (idx != PLATFORM_PLL && i >= 4)
-- 
1.7.1
