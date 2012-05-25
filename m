From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v3 12/12] ARM: dts: imx28-evk: add usb devices
Date: Fri, 25 May 2012 10:24:25 +0800
Message-ID: <1337912665-16615-13-git-send-email-richard.zhao@freescale.com>
References: <1337912665-16615-1-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1337912665-16615-1-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

- add usb phy devices
- add usb controller devices
- add usb vbus regulators

Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx28-evk.dts |   36 ++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx28.dtsi    |   12 ++++++++++--
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx28-evk.dts b/arch/arm/boot/dts/imx28-evk.dts
index ee520a5..a06d86a 100644
--- a/arch/arm/boot/dts/imx28-evk.dts
+++ b/arch/arm/boot/dts/imx28-evk.dts
@@ -73,10 +73,28 @@
 				pinctrl-0 = <&duart_pins_a>;
 				status = "okay";
 			};
+
+			usbphy0: usbphy@8007c000 {
+				status = "okay";
+			};
+
+			usbphy1: usbphy@8007e000 {
+				status = "okay";
+			};
 		};
 	};
 
 	ahb@80080000 {
+		usb0: usb@80080000 {
+			vbus-supply = <&reg_usb0_vbus>;
+			status = "okay";
+		};
+
+		usb1: usb@80090000 {
+			vbus-supply = <&reg_usb1_vbus>;
+			status = "okay";
+		};
+
 		mac0: ethernet@800f0000 {
 			phy-mode = "rmii";
 			pinctrl-names = "default";
@@ -102,6 +120,24 @@
 			regulator-max-microvolt = <3300000>;
 			regulator-always-on;
 		};
+
+		reg_usb0_vbus: usb0_vbus {
+			compatible = "regulator-fixed";
+			regulator-name = "usb0_vbus";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			gpio = <&gpio3 9 0>;
+			enable-active-high;
+		};
+
+		reg_usb1_vbus: usb1_vbus {
+			compatible = "regulator-fixed";
+			regulator-name = "usb1_vbus";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			gpio = <&gpio3 8 0>;
+			enable-active-high;
+		};
 	};
 
 	sound {
diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
index 4634cb8..502ad05 100644
--- a/arch/arm/boot/dts/imx28.dtsi
+++ b/arch/arm/boot/dts/imx28.dtsi
@@ -441,11 +441,13 @@
 			};
 
 			usbphy0: usbphy@8007c000 {
+				compatible = "fsl,imx28-usbphy", "fsl,imx23-usbphy";
 				reg = <0x8007c000 0x2000>;
 				status = "disabled";
 			};
 
 			usbphy1: usbphy@8007e000 {
+				compatible = "fsl,imx28-usbphy", "fsl,imx23-usbphy";
 				reg = <0x8007e000 0x2000>;
 				status = "disabled";
 			};
@@ -459,13 +461,19 @@
 		reg = <0x80080000 0x80000>;
 		ranges;
 
-		usbctrl0: usbctrl@80080000 {
+		usb0: usb@80080000 {
+			compatible = "fsl,imx28-usb", "fsl,imx31-usb";
 			reg = <0x80080000 0x10000>;
+			interrupts = <93>;
+			fsl,usbphy = <&usbphy0>;
 			status = "disabled";
 		};
 
-		usbctrl1: usbctrl@80090000 {
+		usb1: usb@80090000 {
+			compatible = "fsl,imx28-usb", "fsl,imx31-usb";
 			reg = <0x80090000 0x10000>;
+			interrupts = <92>;
+			fsl,usbphy = <&usbphy1>;
 			status = "disabled";
 		};
 
-- 
1.7.5.4


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
