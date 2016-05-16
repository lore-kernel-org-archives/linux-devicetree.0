From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 02/20] clk: multiplier: Prevent the multiplier from under / over flowing
Date: Mon, 16 May 2016 14:47:02 +0200
Message-ID: <1463402840-17062-3-git-send-email-maxime.ripard@free-electrons.com>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463402840-17062-1-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In the current multiplier base clock implementation, if the
CLK_SET_RATE_PARENT flag isn't set, the code will not make sure that the
multiplier computed remains within the boundaries of our clock.

This means that if the clock we want to reach is below the parent rate,
or if the multiplier is above the maximum that we can reach, we will end up
with a completely bogus one that the clock cannot achieve.

Fixes: f2e0a53271a4 ("clk: Add a basic multiplier clock")
Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/clk/clk-multiplier.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-multiplier.c b/drivers/clk/clk-multiplier.c
index 9e449c7b751c..dc037c957acd 100644
--- a/drivers/clk/clk-multiplier.c
+++ b/drivers/clk/clk-multiplier.c
@@ -52,14 +52,28 @@ static unsigned long __bestmult(struct clk_hw *hw, unsigned long rate,
 				unsigned long *best_parent_rate,
 				u8 width, unsigned long flags)
 {
+	struct clk_multiplier *mult = to_clk_multiplier(hw);
 	unsigned long orig_parent_rate = *best_parent_rate;
 	unsigned long parent_rate, current_rate, best_rate = ~0;
 	unsigned int i, bestmult = 0;
+	unsigned int maxmult = (1 << width) - 1;
+
+	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
+		bestmult = rate / orig_parent_rate;
+
+		/* Make sure we don't end up with a 0 multiplier */
+		if ((bestmult == 0) &&
+		    !(mult->flags & CLK_MULTIPLIER_ZERO_BYPASS))
+			bestmult = 1;
 
-	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT))
-		return rate / *best_parent_rate;
+		/* Make sure we don't overflow the multiplier */
+		if (bestmult > maxmult)
+			bestmult = maxmult;
+
+		return bestmult;
+	}
 
-	for (i = 1; i < ((1 << width) - 1); i++) {
+	for (i = 1; i < maxmult; i++) {
 		if (rate == orig_parent_rate * i) {
 			/*
 			 * This is the best case for us if we have a
-- 
2.8.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
