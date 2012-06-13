From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [Patch v5 11/13] ARM: dts: imx6q-sabrelite: add usb devices
Date: Wed, 13 Jun 2012 20:34:21 +0800
Message-ID: <1339590863-10564-12-git-send-email-richard.zhao@freescale.com>
References: <1339590863-10564-1-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1339590863-10564-1-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

- add usbphy devices
- add usb host controller and otg devices
- add on-board hub reset gpio pinctrl
- add usb h1 vbus regulator

Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6q-sabrelite.dts |   28 +++++++++++++++++++++++++
 arch/arm/boot/dts/imx6q.dtsi          |   36 +++++++++++++++++++++++++++++++--
 2 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q-sabrelite.dts b/arch/arm/boot/dts/imx6q-sabrelite.dts
index 1dd2261..06a5d00 100644
--- a/arch/arm/boot/dts/imx6q-sabrelite.dts
+++ b/arch/arm/boot/dts/imx6q-sabrelite.dts
@@ -48,10 +48,29 @@
 					status = "okay";
 				};
 			};
+			iomuxc@020e0000 {
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_gpio_hog>;
 
+				gpios {
+					pinctrl_gpio_hog: gpiohog {
+						fsl,pins = <1044 0x80000000	/* MX6Q_PAD_GPIO_17__GPIO_7_12 */
+							   144  0x80000000>;	/* MX6Q_PAD_EIM_D22__GPIO_3_22 */
+					};
+				};
+			};
 		};
 
 		aips-bus@02100000 { /* AIPS2 */
+			usb@02184000 { /* USB OTG */
+				vbus-supply = <&reg_usb_otg_vbus>;
+				status = "okay";
+			};
+
+			usb@02184200 { /* USB1 */
+				status = "okay";
+			};
+
 			ethernet@02188000 {
 				phy-mode = "rgmii";
 				phy-reset-gpios = <&gpio3 23 0>;
@@ -118,6 +137,15 @@
 			regulator-max-microvolt = <3300000>;
 			regulator-always-on;
 		};
+
+		reg_usb_otg_vbus: usb_otg_vbus {
+			compatible = "regulator-fixed";
+			regulator-name = "usb_otg_vbus";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			gpio = <&gpio3 22 0>;
+			enable-active-high;
+		};
 	};
 
 	sound {
diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
index 8c90cba..ccc8a5f 100644
--- a/arch/arm/boot/dts/imx6q.dtsi
+++ b/arch/arm/boot/dts/imx6q.dtsi
@@ -444,12 +444,14 @@
 				};
 			};
 
-			usbphy@020c9000 { /* USBPHY1 */
+			usbphy1: usbphy@020c9000 {
+				compatible = "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
 				reg = <0x020c9000 0x1000>;
 				interrupts = <0 44 0x04>;
 			};
 
-			usbphy@020ca000 { /* USBPHY2 */
+			usbphy2: usbphy@020ca000 {
+				compatible = "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
 				reg = <0x020ca000 0x1000>;
 				interrupts = <0 45 0x04>;
 			};
@@ -573,6 +575,36 @@
 				reg = <0x0217c000 0x4000>;
 			};
 
+			usb@02184000 { /* USB OTG */
+				compatible = "fsl,imx6q-usb", "fsl,imx31-usb";
+				reg = <0x02184000 0x200>;
+				interrupts = <0 43 0x04>;
+				fsl,usbphy = <&usbphy1>;
+				status = "disabled";
+			};
+
+			usb@02184200 { /* USB1 */
+				compatible = "fsl,imx6q-usb", "fsl,imx31-usb";
+				reg = <0x02184200 0x200>;
+				interrupts = <0 40 0x04>;
+				fsl,usbphy = <&usbphy2>;
+				status = "disabled";
+			};
+
+			usb@02184400 { /* USB2 */
+				compatible = "fsl,imx6q-usb", "fsl,imx31-usb";
+				reg = <0x02184400 0x200>;
+				interrupts = <0 41 0x04>;
+				status = "disabled";
+			};
+
+			usb@02184600 { /* USB3 */
+				compatible = "fsl,imx6q-usb", "fsl,imx31-usb";
+				reg = <0x02184600 0x200>;
+				interrupts = <0 42 0x04>;
+				status = "disabled";
+			};
+
 			ethernet@02188000 {
 				compatible = "fsl,imx6q-fec";
 				reg = <0x02188000 0x4000>;
-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
