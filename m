From: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 5/5] ARM: dts: rockchip: enable adc key for rk3288-evb
Date: Sat,  1 Jul 2017 10:02:47 +0800
Message-ID: <1498874567-11219-6-git-send-email-jacob-chen@iotwrt.com>
References: <1498874567-11219-1-git-send-email-jacob-chen@iotwrt.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1498874567-11219-1-git-send-email-jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

rk3288-evb have many tablet-used adc buttons.

Signed-off-by: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/rk3288-evb.dtsi | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-evb.dtsi b/arch/arm/boot/dts/rk3288-evb.dtsi
index 9cee856..835ddb8 100644
--- a/arch/arm/boot/dts/rk3288-evb.dtsi
+++ b/arch/arm/boot/dts/rk3288-evb.dtsi
@@ -48,6 +48,43 @@
 		reg = <0x0 0x80000000>;
 	};
 
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 1>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+
+		button-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			press-threshold-microvolt = <100000>;
+		};
+
+		button-down {
+			label = "Volume Down";
+			linux,code = <KEY_VOLUMEDOWN>;
+			press-threshold-microvolt = <300000>;
+		};
+
+		menu {
+			label = "Menu";
+			linux,code = <KEY_MENU>;
+			press-threshold-microvolt = <640000>;
+		};
+
+		esc {
+			label = "Esc";
+			linux,code = <KEY_ESC>;
+			press-threshold-microvolt = <1000000>;
+		};
+
+		home  {
+			label = "Home";
+			linux,code = <KEY_HOME>;
+			press-threshold-microvolt = <1300000>;
+		};
+	};
+
 	backlight: backlight {
 		compatible = "pwm-backlight";
 		brightness-levels = <
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
