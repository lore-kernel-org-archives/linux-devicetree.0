From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 01/10] clk: sunxi-ng: mux: Fix determine_rate
 for mux clocks with pre-dividers
Date: Sat, 28 Jan 2017 20:22:30 +0800
Message-ID: <20170128122239.4480-2-wens@csie.org>
References: <20170128122239.4480-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBFM2WLCAKGQEITLTYII-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170128122239.4480-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The determine_rate helper used ccu_mux_helper_adjust_parent_for_prediv()
to adjust the parent_rate to account for pre-dividers, but then passed
the pristine parent clock rate from clk_hw_get_rate() to the round()
callback, thereby ignoring the pre-divider adjustment. In addition,
it was saving the adjusted parent rate back into struct
clk_rate_request.

This patch fixes this by saving the pristine parent clock rate, and
adding a copy that is adjusted and passed to the round() callback.
The pristine copy, if it is the best solution, would be saved back
to struct clk_rate_request.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/clk/sunxi-ng/ccu_mux.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 858a48621631..eb66adb28807 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -71,7 +71,7 @@ int ccu_mux_helper_determine_rate(struct ccu_common *common,
 	unsigned int i;
 
 	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
-		unsigned long tmp_rate, parent_rate;
+		unsigned long tmp_rate, parent_rate, adj_parent_rate;
 		struct clk_hw *parent;
 
 		parent = clk_hw_get_parent_by_index(hw, i);
@@ -79,10 +79,11 @@ int ccu_mux_helper_determine_rate(struct ccu_common *common,
 			continue;
 
 		parent_rate = clk_hw_get_rate(parent);
+		adj_parent_rate = parent_rate;
 		ccu_mux_helper_adjust_parent_for_prediv(common, cm, i,
-							&parent_rate);
+							&adj_parent_rate);
 
-		tmp_rate = round(cm, clk_hw_get_rate(parent), req->rate, data);
+		tmp_rate = round(cm, adj_parent_rate, req->rate, data);
 		if (tmp_rate == req->rate) {
 			best_parent = parent;
 			best_parent_rate = parent_rate;
-- 
2.11.0
