From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 3/4] ARM64: dts: meson-gxbb: add I2C nodes
Date: Wed, 14 Sep 2016 12:06:07 +0200
Message-ID: <1473847568-20163-4-git-send-email-jbrunet@baylibre.com>
References: <1473847568-20163-1-git-send-email-jbrunet@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473847568-20163-1-git-send-email-jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Signed-off-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 40 +++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 75aca5013e61..4aa59dc2beb9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -242,6 +242,36 @@
 				clocks = <&clkc CLKID_SPI>;
 				status = "disabled";
 			};
+
+			i2c_A: i2c@8500 {
+				compatible = "amlogic,meson-gxbb-i2c";
+				reg = <0x0 0x08500 0x0 0x20>;
+				interrupts = <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc CLKID_I2C>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c_B: i2c@87c0 {
+				compatible = "amlogic,meson-gxbb-i2c";
+				reg = <0x0 0x087c0 0x0 0x20>;
+				interrupts = <GIC_SPI 214 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc CLKID_I2C>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c_C: i2c@87e0 {
+				compatible = "amlogic,meson-gxbb-i2c";
+				reg = <0x0 0x087e0 0x0 0x20>;
+				interrupts = <GIC_SPI 215 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc CLKID_I2C>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		gic: interrupt-controller@c4301000 {
@@ -358,6 +388,16 @@
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
+
+			i2c_AO: i2c@500 {
+				compatible = "amlogic,meson-gxbb-i2c";
+				reg = <0x0 0x500 0x0 0x20>;
+				interrupts = <GIC_SPI 195 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc CLKID_AO_I2C>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		periphs: periphs@c8834000 {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
