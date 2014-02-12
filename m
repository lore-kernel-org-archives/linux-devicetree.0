From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: dts: imx6qdl-sabresd: Do not place regulator nodes under simple-bus
Date: Tue, 11 Feb 2014 22:31:18 -0200
Message-ID: <1392165078-25794-1-git-send-email-festevam@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

According to Documentation/devicetree/bindings/regulator/regulator.txt 
regulator nodes should not be placed under 'simple-bus'.

Mark Rutland also explains about it at:
http://www.spinics.net/lists/linux-usb/msg101497.html 
 
Signed-off-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
Shawn,

I can convert other dts files if you are fine with this approach.

 arch/arm/boot/dts/imx6qdl-sabresd.dtsi | 51 ++++++++++++++--------------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
index 0d816d3..d7df5b2 100644
--- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
@@ -18,38 +18,29 @@
 		reg = <0x10000000 0x40000000>;
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		reg_usb_otg_vbus: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "usb_otg_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio3 22 0>;
-			enable-active-high;
-		};
+	reg_usb_otg_vbus: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb_otg_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio3 22 0>;
+		enable-active-high;
+	};
 
-		reg_usb_h1_vbus: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "usb_h1_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio1 29 0>;
-			enable-active-high;
-		};
+	reg_usb_h1_vbus: regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb_h1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio1 29 0>;
+		enable-active-high;
+	};
 
-		reg_audio: regulator@2 {
-			compatible = "regulator-fixed";
-			reg = <2>;
-			regulator-name = "wm8962-supply";
-			gpio = <&gpio4 10 0>;
-			enable-active-high;
-		};
+	reg_audio: regulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "wm8962-supply";
+		gpio = <&gpio4 10 0>;
+		enable-active-high;
 	};
 
 	gpio-keys {
-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
