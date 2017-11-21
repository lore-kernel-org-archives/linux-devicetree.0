From: <andy.tang@nxp.com>
Subject: [PATCH v2] clk: qoriq: add more divider clocks support
Date: Tue, 21 Nov 2017 14:13:00 +0800
Message-ID: <20171121061300.23464-1-andy.tang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Yuantian Tang <andy.tang@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Yuantian Tang <andy.tang@nxp.com>

More divider clocks are needed by IP. So enlarge the PLL divider
array to accommodate more divider clocks.

Signed-off-by: Tang Yuantian <andy.tang@nxp.com>
---
v2:
  - fix a logical error

 Documentation/devicetree/bindings/clock/qoriq-clock.txt | 1 +
 drivers/clk/clk-qoriq.c                                 | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qoriq-clock.txt b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
index 6498e1fdbb33..97f46adac85f 100644
--- a/Documentation/devicetree/bindings/clock/qoriq-clock.txt
+++ b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
@@ -78,6 +78,7 @@ second cell is the clock index for the specified type.
 	2	hwaccel		index (n in CLKCGnHWACSR)
 	3	fman		0 for fm1, 1 for fm2
 	4	platform pll	0=pll, 1=pll/2, 2=pll/3, 3=pll/4
+				4=pll/5, 5=pll/6, 6=pll/7, 7=pll/8
 	5	coreclk		must be 0
 
 3. Example
diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
index b0ea753b8709..3a1812f65e5d 100644
--- a/drivers/clk/clk-qoriq.c
+++ b/drivers/clk/clk-qoriq.c
@@ -41,7 +41,7 @@ struct clockgen_pll_div {
 };
 
 struct clockgen_pll {
-	struct clockgen_pll_div div[4];
+	struct clockgen_pll_div div[8];
 };
 
 #define CLKSEL_VALID	1
@@ -1127,6 +1127,13 @@ static void __init create_one_pll(struct clockgen *cg, int idx)
 		struct clk *clk;
 		int ret;
 
+		/*
+		 * For platform PLL, there are 8 divider clocks.
+		 * For core PLL, there are 4 divider clocks at most.
+		 */
+		if (idx != PLATFORM_PLL && i >= 4)
+			break;
+
 		snprintf(pll->div[i].name, sizeof(pll->div[i].name),
 			 "cg-pll%d-div%d", idx, i + 1);
 
-- 
2.14.1

