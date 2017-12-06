From: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH 3/3] arm64: dts: rockchip: add extcon nodes and enable tcphy.
Date: Wed,  6 Dec 2017 12:10:08 +0100
Message-ID: <20171206111008.3079-3-enric.balletbo@collabora.com>
References: <20171206111008.3079-1-enric.balletbo@collabora.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171206111008.3079-1-enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Enable tcphy and create the cros-ec's extcon node for the USB Type-C port.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
index 470105d..03f1950 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
@@ -855,6 +855,20 @@ ap_i2c_audio: &i2c8 {
 			compatible = "google,cros-ec-pwm";
 			#pwm-cells = <1>;
 		};
+
+		usbc_extcon0: extcon@0 {
+			compatible = "google,extcon-usbc-cros-ec";
+			google,usb-port-id = <0>;
+
+			#extcon-cells = <0>;
+		};
+
+		usbc_extcon1: extcon@1 {
+			compatible = "google,extcon-usbc-cros-ec";
+			google,usb-port-id = <1>;
+
+			#extcon-cells = <0>;
+		};
 	};
 };
 
@@ -865,6 +879,16 @@ ap_i2c_audio: &i2c8 {
 	rockchip,hw-tshut-polarity = <1>; /* tshut polarity 0:LOW 1:HIGH */
 };
 
+&tcphy0 {
+	status = "okay";
+	extcon = <&usbc_extcon0>;
+};
+
+&tcphy1 {
+	status = "okay";
+	extcon = <&usbc_extcon1>;
+};
+
 &u2phy0 {
 	status = "okay";
 };
@@ -911,6 +935,7 @@ ap_i2c_audio: &i2c8 {
 
 &usbdrd3_0 {
 	status = "okay";
+	extcon = <&usbc_extcon0>;
 };
 
 &usbdrd_dwc3_0 {
@@ -920,6 +945,7 @@ ap_i2c_audio: &i2c8 {
 
 &usbdrd3_1 {
 	status = "okay";
+	extcon = <&usbc_extcon1>;
 };
 
 &usbdrd_dwc3_1 {
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
