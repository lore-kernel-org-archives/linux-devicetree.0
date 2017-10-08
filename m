From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH 1/6] phy: sun4i-usb: add support for R40 USB PHY
Date: Sun,  8 Oct 2017 12:29:01 +0800
Message-ID: <20171008042906.46779-2-icenowy@aosc.io>
References: <20171008042906.46779-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBU6T43HAKGQESEEPJUI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171008042906.46779-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allwinner R40 features a USB PHY like the one in A64, but with 3 PHYs.

Add support for it.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
 Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt |  1 +
 drivers/phy/allwinner/phy-sun4i-usb.c                   | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
index cbc7847dbf6c..0f00abd40a50 100644
--- a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
+++ b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
@@ -11,6 +11,7 @@ Required properties:
   * allwinner,sun8i-a33-usb-phy
   * allwinner,sun8i-a83t-usb-phy
   * allwinner,sun8i-h3-usb-phy
+  * allwinner,sun8i-r40-usb-phy
   * allwinner,sun8i-v3s-usb-phy
   * allwinner,sun50i-a64-usb-phy
 - reg : a list of offset + length pairs
diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 1161e11fb3cf..9df7a2c9ca75 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -112,6 +112,7 @@ enum sun4i_usb_phy_type {
 	sun8i_a33_phy,
 	sun8i_a83t_phy,
 	sun8i_h3_phy,
+	sun8i_r40_phy,
 	sun8i_v3s_phy,
 	sun50i_a64_phy,
 };
@@ -919,6 +920,16 @@ static const struct sun4i_usb_phy_cfg sun8i_h3_cfg = {
 	.phy0_dual_route = true,
 };
 
+static const struct sun4i_usb_phy_cfg sun8i_r40_cfg = {
+	.num_phys = 3,
+	.type = sun8i_r40_phy,
+	.disc_thresh = 3,
+	.phyctl_offset = REG_PHYCTL_A33,
+	.dedicated_clocks = true,
+	.enable_pmu_unk1 = true,
+	.phy0_dual_route = true,
+};
+
 static const struct sun4i_usb_phy_cfg sun8i_v3s_cfg = {
 	.num_phys = 1,
 	.type = sun8i_v3s_phy,
@@ -947,6 +958,7 @@ static const struct of_device_id sun4i_usb_phy_of_match[] = {
 	{ .compatible = "allwinner,sun8i-a33-usb-phy", .data = &sun8i_a33_cfg },
 	{ .compatible = "allwinner,sun8i-a83t-usb-phy", .data = &sun8i_a83t_cfg },
 	{ .compatible = "allwinner,sun8i-h3-usb-phy", .data = &sun8i_h3_cfg },
+	{ .compatible = "allwinner,sun8i-r40-usb-phy", .data = &sun8i_r40_cfg },
 	{ .compatible = "allwinner,sun8i-v3s-usb-phy", .data = &sun8i_v3s_cfg },
 	{ .compatible = "allwinner,sun50i-a64-usb-phy",
 	  .data = &sun50i_a64_cfg},
-- 
2.13.6
