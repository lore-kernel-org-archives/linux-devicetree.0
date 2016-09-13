From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: [PATCH 1/4] ARM: dts: imx23: Remove fake "reg" properties from bus nodes
Date: Tue, 13 Sep 2016 17:51:03 +0000
Message-ID: <1473789066-8955-2-git-send-email-stefan.wahren@i2se.com>
References: <1473789066-8955-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473789066-8955-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <lw-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause-L1vi/lXTdtsfGbAt6QbQcg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There is no need to specify fake "reg" properties for the internal
bus nodes based on the registers of its child devices. This also
avoids overlapping issues on adding the sram node.

Suggested-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
---
 arch/arm/boot/dts/imx23-evk.dts           |    8 ++++----
 arch/arm/boot/dts/imx23-olinuxino.dts     |    8 ++++----
 arch/arm/boot/dts/imx23-sansa.dts         |    8 ++++----
 arch/arm/boot/dts/imx23-stmp378x_devb.dts |    6 +++---
 arch/arm/boot/dts/imx23-xfi3.dts          |    8 ++++----
 arch/arm/boot/dts/imx23.dtsi              |   10 ++++------
 6 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/imx23-evk.dts b/arch/arm/boot/dts/imx23-evk.dts
index bd06402..c74c648 100644
--- a/arch/arm/boot/dts/imx23-evk.dts
+++ b/arch/arm/boot/dts/imx23-evk.dts
@@ -21,8 +21,8 @@
 		reg = <0x40000000 0x08000000>;
 	};
 
-	apb@80000000 {
-		apbh@80000000 {
+	apb {
+		apbh {
 			gpmi-nand@8000c000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&gpmi_pins_a &gpmi_pins_fixup>;
@@ -90,7 +90,7 @@
 			};
 		};
 
-		apbx@80040000 {
+		apbx {
 			lradc@80050000 {
 				status = "okay";
 				fsl,lradc-touchscreen-wires = <4>;
@@ -120,7 +120,7 @@
 		};
 	};
 
-	ahb@80080000 {
+	ahb {
 		usb0: usb@80080000 {
 			status = "okay";
 		};
diff --git a/arch/arm/boot/dts/imx23-olinuxino.dts b/arch/arm/boot/dts/imx23-olinuxino.dts
index 109f516..ae7538b 100644
--- a/arch/arm/boot/dts/imx23-olinuxino.dts
+++ b/arch/arm/boot/dts/imx23-olinuxino.dts
@@ -24,8 +24,8 @@
 		reg = <0x40000000 0x04000000>;
 	};
 
-	apb@80000000 {
-		apbh@80000000 {
+	apb {
+		apbh {
 			ssp0: ssp@80010000 {
 				compatible = "fsl,imx23-mmc";
 				pinctrl-names = "default";
@@ -70,7 +70,7 @@
 			};
 		};
 
-		apbx@80040000 {
+		apbx {
 			lradc@80050000 {
 				status = "okay";
 			};
@@ -99,7 +99,7 @@
 		};
 	};
 
-	ahb@80080000 {
+	ahb {
 		usb0: usb@80080000 {
 			dr_mode = "host";
 			vbus-supply = <&reg_usb0_vbus>;
diff --git a/arch/arm/boot/dts/imx23-sansa.dts b/arch/arm/boot/dts/imx23-sansa.dts
index 9cf40d3..65fb08b 100644
--- a/arch/arm/boot/dts/imx23-sansa.dts
+++ b/arch/arm/boot/dts/imx23-sansa.dts
@@ -53,8 +53,8 @@
 		reg = <0x40000000 0x04000000>;
 	};
 
-	apb@80000000 {
-		apbh@80000000 {
+	apb {
+		apbh {
 			ssp0: ssp@80010000 {
 				compatible = "fsl,imx23-mmc";
 				pinctrl-names = "default";
@@ -99,7 +99,7 @@
 			};
 		};
 
-		apbx@80040000 {
+		apbx {
 			pwm: pwm@80064000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&pwm2_pins_a>;
@@ -122,7 +122,7 @@
 		};
 	};
 
-	ahb@80080000 {
+	ahb {
 		usb0: usb@80080000 {
 			dr_mode = "peripheral";
 			status = "okay";
diff --git a/arch/arm/boot/dts/imx23-stmp378x_devb.dts b/arch/arm/boot/dts/imx23-stmp378x_devb.dts
index aab0293..d9b1758 100644
--- a/arch/arm/boot/dts/imx23-stmp378x_devb.dts
+++ b/arch/arm/boot/dts/imx23-stmp378x_devb.dts
@@ -21,8 +21,8 @@
 		reg = <0x40000000 0x04000000>;
 	};
 
-	apb@80000000 {
-		apbh@80000000 {
+	apb {
+		apbh {
 			ssp0: ssp@80010000 {
 				compatible = "fsl,imx23-mmc";
 				pinctrl-names = "default";
@@ -50,7 +50,7 @@
 			};
 		};
 
-		apbx@80040000 {
+		apbx {
 			auart0: serial@8006c000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&auart0_pins_a>;
diff --git a/arch/arm/boot/dts/imx23-xfi3.dts b/arch/arm/boot/dts/imx23-xfi3.dts
index 2b5df8d..1eb1196 100644
--- a/arch/arm/boot/dts/imx23-xfi3.dts
+++ b/arch/arm/boot/dts/imx23-xfi3.dts
@@ -53,8 +53,8 @@
 		reg = <0x40000000 0x04000000>;
 	};
 
-	apb@80000000 {
-		apbh@80000000 {
+	apb {
+		apbh {
 			ssp0: ssp@80010000 {
 				compatible = "fsl,imx23-mmc";
 				pinctrl-names = "default";
@@ -101,7 +101,7 @@
 			};
 		};
 
-		apbx@80040000 {
+		apbx {
 			i2c: i2c@80058000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&i2c_pins_a>;
@@ -136,7 +136,7 @@
 		};
 	};
 
-	ahb@80080000 {
+	ahb {
 		usb0: usb@80080000 {
 			dr_mode = "peripheral";
 			status = "okay";
diff --git a/arch/arm/boot/dts/imx23.dtsi b/arch/arm/boot/dts/imx23.dtsi
index 9d0e9e1..c0a59d2 100644
--- a/arch/arm/boot/dts/imx23.dtsi
+++ b/arch/arm/boot/dts/imx23.dtsi
@@ -38,14 +38,13 @@
 		};
 	};
 
-	apb@80000000 {
+	apb {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-		reg = <0x80000000 0x80000>;
 		ranges;
 
-		apbh@80000000 {
+		apbh {
 			compatible = "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -468,7 +467,7 @@
 			};
                 };
 
-		apbx@80040000 {
+		apbx {
 			compatible = "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -602,11 +601,10 @@
 		};
 	};
 
-	ahb@80080000 {
+	ahb {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-		reg = <0x80080000 0x80000>;
 		ranges;
 
 		usb0: usb@80080000 {
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
