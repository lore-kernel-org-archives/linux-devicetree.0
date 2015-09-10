From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: sun5i: Add emac_pins_b definition
Date: Thu, 10 Sep 2015 15:05:58 +0200
Message-ID: <1441890359-4675-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>

The emac pins on an A10s can also be routed to the outside through
PORTD rather then through PORTA, add a pinctrl node for this.

Signed-off-by: Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>
Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun5i-a10s.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/sun5i-a10s.dtsi b/arch/arm/boot/dts/sun5i-a10s.dtsi
index 6ff2139..45ca0c5 100644
--- a/arch/arm/boot/dts/sun5i-a10s.dtsi
+++ b/arch/arm/boot/dts/sun5i-a10s.dtsi
@@ -215,6 +215,17 @@
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 
+	emac_pins_b: emac0@1 {
+		allwinner,pins = "PD6", "PD7", "PD10",
+				"PD11", "PD12", "PD13", "PD14",
+				"PD15", "PD18", "PD19", "PD20",
+				"PD21", "PD22", "PD23", "PD24",
+				"PD25", "PD26", "PD27";
+		allwinner,function = "emac";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+	};
+
 	mmc1_pins_a: mmc1@0 {
 		allwinner,pins = "PG3", "PG4", "PG5",
 				 "PG6", "PG7", "PG8";
-- 
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
