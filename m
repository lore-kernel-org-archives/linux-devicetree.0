From: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH 3/4] ARM: dts: uniphier: add dwc3 usb node for PXs2
Date: Tue, 23 Jan 2018 22:00:53 +0900
Message-ID: <1516712454-2915-4-git-send-email-hayashi.kunihiko@socionext.com>
References: <1516712454-2915-1-git-send-email-hayashi.kunihiko@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516712454-2915-1-git-send-email-hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Masami Hiramatsu <masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add usb node for PXs2 SoC which has 2 dwc3 controller instances, and
enable this for PXs2 boards.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---
 arch/arm/boot/dts/uniphier-pxs2-gentil.dts |  8 ++++++
 arch/arm/boot/dts/uniphier-pxs2-vodka.dts  |  4 +++
 arch/arm/boot/dts/uniphier-pxs2.dtsi       | 43 ++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)

diff --git a/arch/arm/boot/dts/uniphier-pxs2-gentil.dts b/arch/arm/boot/dts/uniphier-pxs2-gentil.dts
index 7dfae26..91cc7c5 100644
--- a/arch/arm/boot/dts/uniphier-pxs2-gentil.dts
+++ b/arch/arm/boot/dts/uniphier-pxs2-gentil.dts
@@ -53,3 +53,11 @@
 &i2c2 {
 	status = "okay";
 };
+
+&usb0 {
+	status = "okay";
+};
+
+&usb1 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/uniphier-pxs2-vodka.dts b/arch/arm/boot/dts/uniphier-pxs2-vodka.dts
index 0cf6154..ed5395b 100644
--- a/arch/arm/boot/dts/uniphier-pxs2-vodka.dts
+++ b/arch/arm/boot/dts/uniphier-pxs2-vodka.dts
@@ -41,3 +41,7 @@
 &i2c0 {
 	status = "okay";
 };
+
+&usb0 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/uniphier-pxs2.dtsi b/arch/arm/boot/dts/uniphier-pxs2.dtsi
index c083468..b65bf1c 100644
--- a/arch/arm/boot/dts/uniphier-pxs2.dtsi
+++ b/arch/arm/boot/dts/uniphier-pxs2.dtsi
@@ -446,6 +446,49 @@
 			};
 		};
 
+		usb0: usb@65b00000 {
+			compatible = "socionext,uniphier-pxs2-dwc3";
+			status = "disabled";
+			reg = <0x65b00000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_usb0>, <&pinctrl_usb2>;
+			clocks = <&sys_clk 14>, <&sys_clk 16>;
+			resets = <&sys_rst 14>, <&sys_rst 16>,
+				 <&sys_rst 17>, <&sys_rst 18>;
+			ranges;
+
+			dwc3@65a00000 {
+				compatible = "snps,dwc3";
+				reg = <0x65a00000 0xcd00>;
+				interrupt-names = "host", "peripheral";
+				interrupts = <0 134 4>, <0 135 4>;
+				dr_mode = "host";
+			};
+		};
+
+		usb1: usb@65d00000 {
+			compatible = "socionext,uniphier-pxs2-dwc3";
+			status = "disabled";
+			reg = <0x65d00000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_usb1>, <&pinctrl_usb3>;
+			clocks = <&sys_clk 15>, <&sys_clk 20>;
+			resets = <&sys_rst 15>, <&sys_rst 20>, <&sys_rst 21>;
+			ranges;
+
+			dwc3@65c00000 {
+				compatible = "snps,dwc3";
+				reg = <0x65c00000 0xcd00>;
+				interrupt-names = "host", "peripheral";
+				interrupts = <0 137 4>, <0 138 4>;
+				dr_mode = "host";
+			};
+		};
+
 		nand: nand@68000000 {
 			compatible = "socionext,uniphier-denali-nand-v5b";
 			status = "disabled";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
