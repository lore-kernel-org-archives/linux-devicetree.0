From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 5/5] ARM64: dts: meson-gx-p23x-q20x: enable USB on P23x and Q20x boards
Date: Sat, 26 Nov 2016 15:56:35 +0100
Message-ID: <20161126145635.24488-6-martin.blumenstingl@googlemail.com>
References: <20161126145635.24488-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161126145635.24488-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

All four devices are only using the dwc3 controller. The actual ports
are provided by dwc3's internal USB hub.
The implementation on P230, P231 and Q201 seems identical: the USB VBUS
supply seems to be hard-wired, while on Q200 the USB VBUS is provided
by GPIOAO_5.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi | 12 ++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxm-s912-q200.dts | 17 +++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
index 7a078be..360c91d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
@@ -188,3 +188,15 @@
 &ethmac {
 	status = "okay";
 };
+
+&usb2_phys {
+	status = "okay";
+};
+
+&usb3_phy0 {
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-s912-q200.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-s912-q200.dts
index 5dbc660..6c28e87 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-s912-q200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-s912-q200.dts
@@ -49,6 +49,19 @@
 / {
 	compatible = "amlogic,q200", "amlogic,s912", "amlogic,meson-gxm";
 	model = "Amlogic Meson GXM (S912) Q200 Development Board";
+
+	usb_pwr: regulator-usb-pwrs {
+		compatible = "regulator-fixed";
+
+		regulator-name = "USB_PWR";
+
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		/* signal name in schematic: USB_PWR_EN */
+		gpio = <&gpio GPIODV_24 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 /* Q200 has exclusive choice between internal or external PHY */
@@ -75,3 +88,7 @@
 		max-speed = <1000>;
 	};
 };
+
+&usb3_phy0 {
+	phy-supply = <&usb_pwr>;
+};
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
