From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 5/9] clk: sunxi-ng: mux: support fixed
 pre-dividers on multiple parents
Date: Tue, 26 Jul 2016 15:04:27 +0800
Message-ID: <1469516671-19377-6-git-send-email-wens@csie.org>
References: <1469516671-19377-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBC4X3S6AKGQEHY6Y2EY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1469516671-19377-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some clocks on the A31 have fixed pre-dividers on multiple parents.
Add support for them.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c |  9 +++++----
 drivers/clk/sunxi-ng/ccu_mux.c      |  6 ++++--
 drivers/clk/sunxi-ng/ccu_mux.h      | 10 ++++++----
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
index 9af359544110..5f5c900c235b 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
@@ -184,15 +184,16 @@ static SUNXI_CCU_MP_WITH_MUX(apb2_clk, "apb2", apb2_parents, 0x058,
 			     0);
 
 static const char * const ahb2_parents[] = { "ahb1" , "pll-periph0" };
+static const struct ccu_mux_fixed_prediv ahb2_fixed_predivs[] = {
+	{ .index = 1, .div = 2},
+	{ },
+};
 static struct ccu_mux ahb2_clk = {
 	.mux		= {
 		.shift	= 0,
 		.width	= 1,
 
-		.fixed_prediv	= {
-			.index	= 1,
-			.div	= 2,
-		},
+		.fixed_predivs	= ahb2_fixed_predivs,
 	},
 
 	.common		= {
diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 68b32f168a74..f96eabb5d1f3 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -20,6 +20,7 @@ void ccu_mux_helper_adjust_parent_for_prediv(struct ccu_common *common,
 {
 	u16 prediv = 1;
 	u32 reg;
+	int i;
 
 	if (!((common->features & CCU_FEATURE_FIXED_PREDIV) ||
 	      (common->features & CCU_FEATURE_VARIABLE_PREDIV)))
@@ -32,8 +33,9 @@ void ccu_mux_helper_adjust_parent_for_prediv(struct ccu_common *common,
 	}
 
 	if (common->features & CCU_FEATURE_FIXED_PREDIV)
-		if (parent_index == cm->fixed_prediv.index)
-			prediv = cm->fixed_prediv.div;
+		for (i = 0; cm->fixed_predivs[i].div; i++)
+			if (parent_index == cm->fixed_predivs[i].index)
+				prediv = cm->fixed_predivs[i].div;
 
 	if (common->features & CCU_FEATURE_VARIABLE_PREDIV)
 		if (parent_index == cm->variable_prediv.index) {
diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mux.h
index f0078de78712..28d16ec18d55 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.h
+++ b/drivers/clk/sunxi-ng/ccu_mux.h
@@ -5,15 +5,17 @@
 
 #include "ccu_common.h"
 
+struct ccu_mux_fixed_prediv {
+	u8	index;
+	u16	div;
+};
+
 struct ccu_mux_internal {
 	u8		shift;
 	u8		width;
 	const u8	*table;
 
-	struct {
-		u8	index;
-		u16	div;
-	} fixed_prediv;
+	const struct ccu_mux_fixed_prediv	*fixed_predivs;
 
 	struct {
 		u8	index;
-- 
2.8.1
