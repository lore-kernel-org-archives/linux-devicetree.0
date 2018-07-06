From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v2 2/9] phy: sun4i-usb: add support for H6 USB2 PHY
Date: Fri,  6 Jul 2018 23:37:58 +0800
Message-ID: <20180706153805.25842-3-icenowy@aosc.io>
References: <20180706153805.25842-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBHE473MQKGQEJTPOKLQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180706153805.25842-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The USB 2.0 PHY on Allwinner H6 SoC is similar to older Allwinner SoCs,
with some USB0 quirk like A83T and PHY index 1/2 missing.

Add support for it.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 881078ff73f6..ae16854a770a 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -115,6 +115,7 @@ enum sun4i_usb_phy_type {
 	sun8i_r40_phy,
 	sun8i_v3s_phy,
 	sun50i_a64_phy,
+	sun50i_h6_phy,
 };
 
 struct sun4i_usb_phy_cfg {
@@ -295,7 +296,8 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 		return ret;
 	}
 
-	if (data->cfg->type == sun8i_a83t_phy) {
+	if (data->cfg->type == sun8i_a83t_phy ||
+	    data->cfg->type == sun50i_h6_phy) {
 		if (phy->index == 0) {
 			val = readl(data->base + data->cfg->phyctl_offset);
 			val |= PHY_CTL_VBUSVLDEXT;
@@ -344,7 +346,8 @@ static int sun4i_usb_phy_exit(struct phy *_phy)
 	struct sun4i_usb_phy_data *data = to_sun4i_usb_phy_data(phy);
 
 	if (phy->index == 0) {
-		if (data->cfg->type == sun8i_a83t_phy) {
+		if (data->cfg->type == sun8i_a83t_phy ||
+		    data->cfg->type == sun50i_h6_phy) {
 			void __iomem *phyctl = data->base +
 				data->cfg->phyctl_offset;
 
@@ -959,6 +962,17 @@ static const struct sun4i_usb_phy_cfg sun50i_a64_cfg = {
 	.phy0_dual_route = true,
 };
 
+static const struct sun4i_usb_phy_cfg sun50i_h6_cfg = {
+	.num_phys = 4,
+	.type = sun50i_h6_phy,
+	.disc_thresh = 3,
+	.phyctl_offset = REG_PHYCTL_A33,
+	.dedicated_clocks = true,
+	.enable_pmu_unk1 = true,
+	.phy0_dual_route = true,
+	.missing_phys = BIT(1) | BIT(2),
+};
+
 static const struct of_device_id sun4i_usb_phy_of_match[] = {
 	{ .compatible = "allwinner,sun4i-a10-usb-phy", .data = &sun4i_a10_cfg },
 	{ .compatible = "allwinner,sun5i-a13-usb-phy", .data = &sun5i_a13_cfg },
@@ -972,6 +986,7 @@ static const struct of_device_id sun4i_usb_phy_of_match[] = {
 	{ .compatible = "allwinner,sun8i-v3s-usb-phy", .data = &sun8i_v3s_cfg },
 	{ .compatible = "allwinner,sun50i-a64-usb-phy",
 	  .data = &sun50i_a64_cfg},
+	{ .compatible = "allwinner,sun50i-h6-usb-phy", .data = &sun50i_h6_cfg },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, sun4i_usb_phy_of_match);
-- 
2.17.1
