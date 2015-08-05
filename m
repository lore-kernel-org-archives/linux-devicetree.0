From: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] ARM: dts: imx6sx: correct property name for wakeup source
Date: Wed, 5 Aug 2015 21:57:55 +0800
Message-ID: <1438783075-15133-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Commit(def56bb input: snvs_pwrkey: use "wakeup-source"
as deivce tree property name) replaces the property name
of "wakeup" with "wakeup-source", update this change
in i.MX6SX dtsi accordingly.

Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6sx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
index e391d63..dc7eaae 100644
--- a/arch/arm/boot/dts/imx6sx.dtsi
+++ b/arch/arm/boot/dts/imx6sx.dtsi
@@ -686,7 +686,7 @@
 					regmap = <&snvs>;
 					interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 					linux,keycode = <KEY_POWER>;
-					wakeup;
+					wakeup-source;
 				};
 			};
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
