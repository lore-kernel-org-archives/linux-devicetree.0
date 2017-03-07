From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 3/15] clk: sunxi-ng: div: Switch to divider_round_rate
Date: Tue,  7 Mar 2017 09:56:22 +0100
Message-ID: <47f7cedf0c913045ccf248afdc7e772c80d8af08.1488876832.git-series.maxime.ripard@free-electrons.com>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBT7L7HCQKGQEJ445ZEQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
In-Reply-To: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

divider_round_rate already evaluates changing the parent rate if
CLK_SET_RATE_PARENT is set. Now that we can do that on muxes too, let's
just use it.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/clk/sunxi-ng/ccu_div.c | 25 ++-----------------------
 1 file changed, 2 insertions(+), 23 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index 7f8b06e38636..0ccdd3dcc20c 100644
--- a/drivers/clk/sunxi-ng/ccu_div.c
+++ b/drivers/clk/sunxi-ng/ccu_div.c
@@ -20,18 +20,9 @@ static unsigned long ccu_div_round_rate(struct ccu_mux_internal *mux,
 					void *data)
 {
 	struct ccu_div *cd = data;
-	unsigned long val;
-
-	/*
-	 * We can't use divider_round_rate that assumes that there's
-	 * several parents, while we might be called to evaluate
-	 * several different parents.
-	 */
-	val = divider_get_val(rate, *parent_rate, cd->div.table, cd->div.width,
-			      cd->div.flags);
 
-	return divider_recalc_rate(&cd->common.hw, *parent_rate, val,
-				   cd->div.table, cd->div.flags);
+	return divider_round_rate(&cd->common.hw, parent, rate, parent_rate,
+				  cd->div.table, cd->div.width, cd->div.flags);
 }
 
 static void ccu_div_disable(struct clk_hw *hw)
@@ -78,18 +69,6 @@ static int ccu_div_determine_rate(struct clk_hw *hw,
 {
 	struct ccu_div *cd = hw_to_ccu_div(hw);
 
-	if (clk_hw_get_num_parents(hw) == 1) {
-		req->rate = divider_round_rate(hw, clk_hw_get_parent(hw),
-					       req->rate,
-					       &req->best_parent_rate,
-					       cd->div.table, cd->div.width,
-					       cd->div.flags);
-
-		req->best_parent_hw = clk_hw_get_parent(hw);
-
-		return 0;
-	}
-
 	return ccu_mux_helper_determine_rate(&cd->common, &cd->mux,
 					     req, ccu_div_round_rate, cd);
 }
-- 
git-series 0.8.11
