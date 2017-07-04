From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: [PATCH v5 1/6] clk: sunxi-ng: div: Add support for
 fixed post-divider
Date: Tue,  4 Jul 2017 23:04:56 +0300
Message-ID: <805048a548031cafc890e6ea06ee773bdfb199d0.1499197129.git-series.plaes@plaes.org>
References: <cover.23e9103a2becf2261d7e145bb1516221a5cfb8a4.1499197129.git-series.plaes@plaes.org>
Reply-To: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDJLTBEBXENBBQXK57FAKGQEWAGNHYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <cover.23e9103a2becf2261d7e145bb1516221a5cfb8a4.1499197129.git-series.plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
In-Reply-To: <cover.23e9103a2becf2261d7e145bb1516221a5cfb8a4.1499197129.git-series.plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
References: <cover.23e9103a2becf2261d7e145bb1516221a5cfb8a4.1499197129.git-series.plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SATA clock on sun4i/sun7i is of type (parent) / M / 6 where
6 is fixed post-divider.

Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
---
 drivers/clk/sunxi-ng/ccu_div.c | 18 ++++++++++++++++--
 drivers/clk/sunxi-ng/ccu_div.h |  3 ++-
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index c0e5c10..054b12a 100644
--- a/drivers/clk/sunxi-ng/ccu_div.c
+++ b/drivers/clk/sunxi-ng/ccu_div.c
@@ -21,6 +21,9 @@ static unsigned long ccu_div_round_rate(struct ccu_mux_internal *mux,
 {
 	struct ccu_div *cd = data;
 
+	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		rate /= cd->fixed_post_div;
+
 	return divider_round_rate_parent(&cd->common.hw, parent,
 					 rate, parent_rate,
 					 cd->div.table, cd->div.width,
@@ -62,8 +65,13 @@ static unsigned long ccu_div_recalc_rate(struct clk_hw *hw,
 	parent_rate = ccu_mux_helper_apply_prediv(&cd->common, &cd->mux, -1,
 						  parent_rate);
 
-	return divider_recalc_rate(hw, parent_rate, val, cd->div.table,
-				   cd->div.flags);
+	val = divider_recalc_rate(hw, parent_rate, val, cd->div.table,
+				  cd->div.flags);
+
+	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		val /= cd->fixed_post_div;
+
+	return val;
 }
 
 static int ccu_div_determine_rate(struct clk_hw *hw,
@@ -71,6 +79,9 @@ static int ccu_div_determine_rate(struct clk_hw *hw,
 {
 	struct ccu_div *cd = hw_to_ccu_div(hw);
 
+	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		req->rate *= cd->fixed_post_div;
+
 	return ccu_mux_helper_determine_rate(&cd->common, &cd->mux,
 					     req, ccu_div_round_rate, cd);
 }
@@ -89,6 +100,9 @@ static int ccu_div_set_rate(struct clk_hw *hw, unsigned long rate,
 	val = divider_get_val(rate, parent_rate, cd->div.table, cd->div.width,
 			      cd->div.flags);
 
+	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		val /= cd->fixed_post_div;
+
 	spin_lock_irqsave(cd->common.lock, flags);
 
 	reg = readl(cd->common.base + cd->common.reg);
diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_div.h
index 08d0744..f3a5028 100644
--- a/drivers/clk/sunxi-ng/ccu_div.h
+++ b/drivers/clk/sunxi-ng/ccu_div.h
@@ -86,9 +86,10 @@ struct ccu_div_internal {
 struct ccu_div {
 	u32			enable;
 
-	struct ccu_div_internal		div;
+	struct ccu_div_internal	div;
 	struct ccu_mux_internal	mux;
 	struct ccu_common	common;
+	unsigned int		fixed_post_div;
 };
 
 #define SUNXI_CCU_DIV_TABLE_WITH_GATE(_struct, _name, _parent, _reg,	\
-- 
git-series 0.9.1
