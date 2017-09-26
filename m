From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH] clk: sunxi-ng: Implement reset control status readback
Date: Tue, 26 Sep 2017 10:36:20 +0800
Message-ID: <20170926023620.22284-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBJ72U3HAKGQEJXBJ74I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Until now we were not providing a way to read back the status of our
reset controls. Consumers had no real way to be certain whether a
peripheral was held in reset or not.

Implement the status callback to complete the API support.

Fixes: 1d80c14248d6 ("clk: sunxi-ng: Add common infrastructure")
Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/clk/sunxi-ng/ccu_reset.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_reset.c b/drivers/clk/sunxi-ng/ccu_reset.c
index 1dc4e98ea802..b67149143554 100644
--- a/drivers/clk/sunxi-ng/ccu_reset.c
+++ b/drivers/clk/sunxi-ng/ccu_reset.c
@@ -60,8 +60,22 @@ static int ccu_reset_reset(struct reset_controller_dev *rcdev,
 	return 0;
 }
 
+static int ccu_reset_status(struct reset_controller_dev *rcdev,
+			    unsigned long id)
+{
+	struct ccu_reset *ccu = rcdev_to_ccu_reset(rcdev);
+	const struct ccu_reset_map *map = &ccu->reset_map[id];
+
+	/*
+	 * The reset control API expects 0 if reset is not asserted,
+	 * which is the opposite of what our hardware uses.
+	 */
+	return !(map->bit & readl(ccu->base + map->reg));
+}
+
 const struct reset_control_ops ccu_reset_ops = {
 	.assert		= ccu_reset_assert,
 	.deassert	= ccu_reset_deassert,
 	.reset		= ccu_reset_reset,
+	.status		= ccu_reset_status,
 };
-- 
2.14.1
