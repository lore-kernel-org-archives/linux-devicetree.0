From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH V2 1/2] ARM: dts: Add sound node for Snow board
Date: Wed,  7 May 2014 10:22:27 +0530
Message-ID: <1399438348-10819-2-git-send-email-tushar.behera@linaro.org>
References: <1399438348-10819-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1399438348-10819-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

The audio codec on Snow board, MAX98095 is connected on I2C7 bus.
Also it requires the GPX1-7 line to be pulled up.

Updated Snow DTS file to incorporate above changes and added a
sound node to instantiate the I2S-based sound card.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
Changes for V2:
1. GPX1-7 gpio is now configured through pincontrol, earlier
it was configured through a fixed-regualtor.

 arch/arm/boot/dts/exynos5250-snow.dts |   27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index 1ce1088..809af33 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -37,6 +37,13 @@
 		sd3_bus4: sd3-bus-width4 {
 			samsung,pin-drv = <0>;
 		};
+
+		max98095_en: max98095-en {
+			samsung,pins = "gpx1-7";
+			samsung,pin-function = <0>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <0>;
+		};
 	};
 
 	gpio-keys {
@@ -196,6 +203,26 @@
 		};
 	};
 
+	i2c@12CD0000 {
+		max98095: codec@11 {
+			compatible = "maxim,max98095";
+			reg = <0x11>;
+			pinctrl-0 = <&max98095_en>;
+			pinctrl-names = "default";
+		};
+	};
+
+	i2s0: i2s@03830000 {
+		status = "okay";
+	};
+
+	sound {
+		compatible = "google,snow-audio-max98095";
+
+		samsung,i2s-controller = <&i2s0>;
+		samsung,audio-codec = <&max98095>;
+	};
+
 	usb@12110000 {
 		samsung,vbus-gpio = <&gpx1 1 0>;
 	};
-- 
1.7.9.5
