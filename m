From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 6/6] ARM: dts: sun5i: q8-common: Enable display pipeline and LCD display
Date: Tue, 17 May 2016 23:56:11 +0800
Message-ID: <1463500571-28970-7-git-send-email-wens@csie.org>
References: <1463500571-28970-1-git-send-email-wens@csie.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463500571-28970-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Q8 form factor A13 tablets have a 7" LCD panel. Unfortunately we
don't know the exact model of the panel. Just pick a panel with
display timings close to what we know.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun5i-q8-common.dtsi | 36 ++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/sun5i-q8-common.dtsi b/arch/arm/boot/dts/sun5i-q8-common.dtsi
index 5b065fd542f0..a5de28d12b16 100644
--- a/arch/arm/boot/dts/sun5i-q8-common.dtsi
+++ b/arch/arm/boot/dts/sun5i-q8-common.dtsi
@@ -59,6 +59,29 @@
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	panel: panel {
+		compatible = "urt,umsh-8596md-t", "simple-panel";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			/* TODO: lcd panel uses axp gpio0 as enable pin */
+			backlight = <&backlight>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			panel_input: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&tcon0_out_lcd>;
+			};
+		};
+	};
+};
+
+&be0 {
+	status = "okay";
 };
 
 &codec {
@@ -179,6 +202,19 @@
 	status = "okay";
 };
 
+&tcon0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&lcd_rgb666_pins>;
+	status = "okay";
+};
+
+&tcon0_out {
+	tcon0_out_lcd: endpoint@0 {
+		reg = <0>;
+		remote-endpoint = <&panel_input>;
+	};
+};
+
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart1_pins_b>;
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
