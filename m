From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 09/10] ARM: ux500: register the tc35892 GPIO on the TVK UIB
Date: Thu,  3 Oct 2013 13:31:21 +0200
Message-ID: <1380799881-26048-1-git-send-email-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The TVK1281618 UIB has a TC35892 GPIO expander on it, which has
in the past probably been confused with the GPIO expander on the
older HREF plus previous to v60, which is on an entirely different
part of the system with another I2C address. Register the expander
in the right place.

Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/ste-href-tvk1281618.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/ste-href-tvk1281618.dtsi b/arch/arm/boot/dts/ste-href-tvk1281618.dtsi
index 89e1485..76d3ef1 100644
--- a/arch/arm/boot/dts/ste-href-tvk1281618.dtsi
+++ b/arch/arm/boot/dts/ste-href-tvk1281618.dtsi
@@ -16,5 +16,26 @@
 / {
 	soc {
 		/* Add Synaptics touch screen, TC35892 keypad etc here */
+		i2c@80004000 {
+			tc3589x@44 {
+				compatible = "tc3589x";
+				reg = <0x44>;
+				interrupt-parent = <&gpio6>;
+				interrupts = <26 IRQ_TYPE_EDGE_RISING>;
+
+				interrupt-controller;
+				#interrupt-cells = <2>;
+
+				tc3589x_gpio {
+					compatible = "tc3589x-gpio";
+					interrupts = <0 IRQ_TYPE_EDGE_RISING>;
+
+					interrupt-controller;
+					#interrupt-cells = <2>;
+					gpio-controller;
+					#gpio-cells = <2>;
+				};
+			};
+		};
 	};
 };
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
