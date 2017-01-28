From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 02/10] clk: sunxi-ng: mux: honor
 CLK_SET_RATE_NO_REPARENT flag
Date: Sat, 28 Jan 2017 20:22:31 +0800
Message-ID: <20170128122239.4480-3-wens@csie.org>
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

This patch adds support for the CLK_SET_RATE_NO_REPARENT flag to the
mux determine_rate helper, based on examples from clk-composite and
clk-mux.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/clk/sunxi-ng/ccu_mux.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index eb66adb28807..d0d69c7eb516 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -70,6 +70,21 @@ int ccu_mux_helper_determine_rate(struct ccu_common *common,
 	struct clk_hw *best_parent, *hw = &common->hw;
 	unsigned int i;
 
+	if (clk_hw_get_flags(hw) & CLK_SET_RATE_NO_REPARENT) {
+		unsigned long adj_parent_rate;
+
+		best_parent = clk_hw_get_parent(hw);
+		best_parent_rate = clk_hw_get_rate(best_parent);
+
+		adj_parent_rate = best_parent_rate;
+		ccu_mux_helper_adjust_parent_for_prediv(common, cm, -1,
+							&adj_parent_rate);
+
+		best_rate = round(cm, adj_parent_rate, req->rate, data);
+
+		goto out;
+	}
+
 	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
 		unsigned long tmp_rate, parent_rate, adj_parent_rate;
 		struct clk_hw *parent;
-- 
2.11.0
