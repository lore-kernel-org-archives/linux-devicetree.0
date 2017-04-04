From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH 1/3] phy: sun4i-usb: enable PHY0 dual route switching for A64 USB PHY
Date: Wed,  5 Apr 2017 02:45:16 +0800
Message-ID: <20170404184518.33610-1-icenowy@aosc.io>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allwinner A64 SoC features a switchable PHY0 like the one in H3, which
can switch between a MUSB controller and a pair of OHCI/EHCI controller.

Enable PHY0 route auto switching for A64.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
 drivers/phy/phy-sun4i-usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/phy-sun4i-usb.c b/drivers/phy/phy-sun4i-usb.c
index f86a2574b953..bbf06cfe5898 100644
--- a/drivers/phy/phy-sun4i-usb.c
+++ b/drivers/phy/phy-sun4i-usb.c
@@ -858,6 +858,7 @@ static const struct sun4i_usb_phy_cfg sun50i_a64_cfg = {
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
 	.enable_pmu_unk1 = true,
+	.phy0_dual_route = true,
 };
 
 static const struct of_device_id sun4i_usb_phy_of_match[] = {
-- 
2.12.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
