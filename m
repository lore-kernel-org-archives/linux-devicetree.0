From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 3/9] clk: sunxi-ng: mux: Increase fixed pre-divider div size
Date: Tue, 26 Jul 2016 15:04:25 +0800
Message-ID: <1469516671-19377-4-git-send-email-wens@csie.org>
References: <1469516671-19377-1-git-send-email-wens@csie.org>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1469516671-19377-1-git-send-email-wens@csie.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: dev@linux-sunxi.org, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Some clocks have a predivider value that is larger than what u8 can
store. One such example is the OUT clk found on A20/A31, which has
a /750 pre-divider on one of the osc24M parents.

Increase the size of the div field to u16.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu_mux.c | 2 +-
 drivers/clk/sunxi-ng/ccu_mux.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 58fc36e7dcce..1329b9ab481e 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -18,7 +18,7 @@ void ccu_mux_helper_adjust_parent_for_prediv(struct ccu_common *common,
 					     int parent_index,
 					     unsigned long *parent_rate)
 {
-	u8 prediv = 1;
+	u16 prediv = 1;
 	u32 reg;
 
 	if (!((common->features & CCU_FEATURE_FIXED_PREDIV) ||
diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mux.h
index 945082631e7d..d35ce5e93840 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.h
+++ b/drivers/clk/sunxi-ng/ccu_mux.h
@@ -11,7 +11,7 @@ struct ccu_mux_internal {
 
 	struct {
 		u8	index;
-		u8	div;
+		u16	div;
 	} fixed_prediv;
 
 	struct {
-- 
2.8.1

