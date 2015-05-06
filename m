From: Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: [PATCH 1/2] ARM: mvebu: add alias for mdio on Armada 38x
Date: Wed,  6 May 2015 15:13:59 +0200
Message-ID: <1430918040-17307-2-git-send-email-kaloz@openwrt.org>
References: <1430918040-17307-1-git-send-email-kaloz@openwrt.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430918040-17307-1-git-send-email-kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org
List-Id: devicetree@vger.kernel.org

This allows us to reference it later.

Signed-off-by: Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
---
 arch/arm/boot/dts/armada-38x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
index ed2dd8b..839e5bf 100644
--- a/arch/arm/boot/dts/armada-38x.dtsi
+++ b/arch/arm/boot/dts/armada-38x.dtsi
@@ -495,7 +495,7 @@
 				status = "disabled";
 			};
 
-			mdio@72004 {
+			mdio: mdio@72004 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "marvell,orion-mdio";
-- 
2.1.0
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
