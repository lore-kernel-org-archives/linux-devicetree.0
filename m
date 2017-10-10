From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v4 05/11] drm/sun4i: hdmi: Allow using second
 PLL as TMDS clk parent
Date: Tue, 10 Oct 2017 11:20:02 +0800
Message-ID: <20171010032008.682-6-wens@csie.org>
References: <20171010032008.682-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB3XY6DHAKGQEKHMWCTY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171010032008.682-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On SoCs with two display pipelines, it is possible that the two
pipelines are active at the same time, with potentially incompatible
dot clocks.

Let the HDMI encoder's TMDS clock go through all of its parents when
calculating possible clock rates. This allows usage of the second video
PLL as its parent.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c | 53 ++++++++++++++++-------------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
index 5cf2527bffc8..e8d4c311b80d 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
@@ -67,11 +67,11 @@ static unsigned long sun4i_tmds_calc_divider(unsigned long rate,
 static int sun4i_tmds_determine_rate(struct clk_hw *hw,
 				     struct clk_rate_request *req)
 {
-	struct clk_hw *parent;
+	struct clk_hw *parent = NULL;
 	unsigned long best_parent = 0;
 	unsigned long rate = req->rate;
 	int best_div = 1, best_half = 1;
-	int i, j;
+	int i, j, p;
 
 	/*
 	 * We only consider PLL3, since the TCON is very likely to be
@@ -79,32 +79,37 @@ static int sun4i_tmds_determine_rate(struct clk_hw *hw,
 	 * clock, so we should not need to do anything.
 	 */
 
-	parent = clk_hw_get_parent_by_index(hw, 0);
-	if (!parent)
-		return -EINVAL;
-
-	for (i = 1; i < 3; i++) {
-		for (j = 1; j < 16; j++) {
-			unsigned long ideal = rate * i * j;
-			unsigned long rounded;
-
-			rounded = clk_hw_round_rate(parent, ideal);
-
-			if (rounded == ideal) {
-				best_parent = rounded;
-				best_half = i;
-				best_div = j;
-				goto out;
-			}
-
-			if (abs(rate - rounded / i) <
-			    abs(rate - best_parent / best_div)) {
-				best_parent = rounded;
-				best_div = i;
+	for (p = 0; p < clk_hw_get_num_parents(hw); p++) {
+		parent = clk_hw_get_parent_by_index(hw, p);
+		if (!parent)
+			continue;
+
+		for (i = 1; i < 3; i++) {
+			for (j = 1; j < 16; j++) {
+				unsigned long ideal = rate * i * j;
+				unsigned long rounded;
+
+				rounded = clk_hw_round_rate(parent, ideal);
+
+				if (rounded == ideal) {
+					best_parent = rounded;
+					best_half = i;
+					best_div = j;
+					goto out;
+				}
+
+				if (abs(rate - rounded / i) <
+				    abs(rate - best_parent / best_div)) {
+					best_parent = rounded;
+					best_div = i;
+				}
 			}
 		}
 	}
 
+	if (!parent)
+		return -EINVAL;
+
 out:
 	req->rate = best_parent / best_half / best_div;
 	req->best_parent_rate = best_parent;
-- 
2.14.2
