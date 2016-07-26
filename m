From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 7/9] clk: sunxi-ng: mux: Add clk notifier functions
Date: Tue, 26 Jul 2016 15:04:29 +0800
Message-ID: <1469516671-19377-8-git-send-email-wens@csie.org>
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

On sunxi we support cpufreq by changing the clock rate of PLL-CPU.
It's possible the clock output of the PLL goes out of the CPU's
operational limits when the PLL's multipliers / dividers are changed
and it hasn't stabilized yet. This would result in the CPU hanging.

To circumvent this, we temporarily switch the CPU mux clock to another
stable clock before the rate change, and switch it back after the PLL
stabilizes. This is done with clk notifiers registered on the PLL.

This patch adds common functions for notifiers to reparent mux clocks.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/clk/sunxi-ng/ccu_mux.c | 36 ++++++++++++++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_mux.h | 14 ++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index f96eabb5d1f3..8a6e9065cb85 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -8,7 +8,9 @@
  * the License, or (at your option) any later version.
  */
 
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/delay.h>
 
 #include "ccu_gate.h"
 #include "ccu_mux.h"
@@ -199,3 +201,37 @@ const struct clk_ops ccu_mux_ops = {
 	.determine_rate	= __clk_mux_determine_rate,
 	.recalc_rate	= ccu_mux_recalc_rate,
 };
+
+/*
+ * This clock notifier is called when the frequency of the of the parent
+ * PLL clock is to be changed. The idea is to switch the parent to a
+ * stable clock, such as the main oscillator, while the PLL frequency
+ * stabilizes.
+ */
+static int ccu_mux_notifier_cb(struct notifier_block *nb,
+			       unsigned long event, void *data)
+{
+	struct ccu_mux_nb *mux = to_ccu_mux_nb(nb);
+	int ret = 0;
+
+	if (event == PRE_RATE_CHANGE) {
+		mux->original_index = ccu_mux_helper_get_parent(mux->common,
+								mux->cm);
+		ret = ccu_mux_helper_set_parent(mux->common, mux->cm,
+						mux->bypass_index);
+	} else if (event == POST_RATE_CHANGE) {
+		ret = ccu_mux_helper_set_parent(mux->common, mux->cm,
+						mux->original_index);
+	}
+
+	udelay(mux->delay_us);
+
+	return notifier_from_errno(ret);
+}
+
+int ccu_mux_notifier_register(struct clk *clk, struct ccu_mux_nb *mux_nb)
+{
+	mux_nb->clk_nb.notifier_call = ccu_mux_notifier_cb;
+
+	return clk_notifier_register(clk, &mux_nb->clk_nb);
+}
diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mux.h
index 28d16ec18d55..7ddd9b2c6dbc 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.h
+++ b/drivers/clk/sunxi-ng/ccu_mux.h
@@ -98,4 +98,18 @@ int ccu_mux_helper_set_parent(struct ccu_common *common,
 			      struct ccu_mux_internal *cm,
 			      u8 index);
 
+struct ccu_mux_nb {
+	struct notifier_block	clk_nb;
+	struct ccu_common	*common;
+	struct ccu_mux_internal	*cm;
+
+	u32	delay_us;	/* How many us to wait after reparenting */
+	u8	bypass_index;	/* Which parent to temporarily use */
+	u8	original_index;	/* This is set by the notifier callback */
+};
+
+#define to_ccu_mux_nb(_nb) container_of(_nb, struct ccu_mux_nb, clk_nb)
+
+int ccu_mux_notifier_register(struct clk *clk, struct ccu_mux_nb *mux_nb);
+
 #endif /* _CCU_MUX_H_ */
-- 
2.8.1
