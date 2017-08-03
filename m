From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 3/8] phy: sun4i-usb: Support secondary clock for HSIC PHY
Date: Thu,  3 Aug 2017 16:14:06 +0800
Message-ID: <20170803081411.22389-4-wens@csie.org>
References: <20170803081411.22389-1-wens@csie.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170803081411.22389-1-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On the Allwinner A83T SoC, the last USB PHY is an HSIC PHY. It requires
two clocks instead of one.

On all Allwinner SoCs that share the common USB PHY design supported by
the phy-sun4i-usb driver, the first PHY is always tied to OTG, and there
is at most one HSIC PHY, typically the last.

In this patch we take advantage of these known constraints and store an
index in the compatible-string-related config structure describing which
PHY is HSIC, needing the extra hsic_12M clock.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index bbf06cfe5898..79157eced75a 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -107,6 +107,7 @@ enum sun4i_usb_phy_type {
 
 struct sun4i_usb_phy_cfg {
 	int num_phys;
+	int hsic_index;
 	enum sun4i_usb_phy_type type;
 	u32 disc_thresh;
 	u8 phyctl_offset;
@@ -126,6 +127,7 @@ struct sun4i_usb_phy_data {
 		struct regulator *vbus;
 		struct reset_control *reset;
 		struct clk *clk;
+		struct clk *clk2;
 		bool regulator_on;
 		int index;
 	} phys[MAX_PHYS];
@@ -261,8 +263,15 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 	if (ret)
 		return ret;
 
+	ret = clk_prepare_enable(phy->clk2);
+	if (ret) {
+		clk_disable_unprepare(phy->clk);
+		return ret;
+	}
+
 	ret = reset_control_deassert(phy->reset);
 	if (ret) {
+		clk_disable_unprepare(phy->clk2);
 		clk_disable_unprepare(phy->clk);
 		return ret;
 	}
@@ -315,6 +324,7 @@ static int sun4i_usb_phy_exit(struct phy *_phy)
 
 	sun4i_usb_phy_passby(phy, 0);
 	reset_control_assert(phy->reset);
+	clk_disable_unprepare(phy->clk2);
 	clk_disable_unprepare(phy->clk);
 
 	return 0;
@@ -706,6 +716,17 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
 			return PTR_ERR(phy->clk);
 		}
 
+		/* The first PHY is always tied to OTG, and never HSIC */
+		if (data->cfg->hsic_index && i == data->cfg->hsic_index) {
+			/* HSIC needs secondary clock */
+			snprintf(name, sizeof(name), "usb%d_hsic_12M", i);
+			phy->clk2 = devm_clk_get(dev, name);
+			if (IS_ERR(phy->clk2)) {
+				dev_err(dev, "failed to get clock %s\n", name);
+				return PTR_ERR(phy->clk2);
+			}
+		}
+
 		snprintf(name, sizeof(name), "usb%d_reset", i);
 		phy->reset = devm_reset_control_get(dev, name);
 		if (IS_ERR(phy->reset)) {
-- 
2.13.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
