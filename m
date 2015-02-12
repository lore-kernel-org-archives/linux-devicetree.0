From: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/4] ARM: at91: at91sam9x5ek/dts: add ov2640 support
Date: Thu, 12 Feb 2015 16:06:24 +0800
Message-ID: <1423728386-24544-3-git-send-email-josh.wu@atmel.com>
References: <1423728386-24544-1-git-send-email-josh.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423728386-24544-1-git-send-email-josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the camera sensor ov2640 dt support. And connect sensor to isi node
as well.

Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---

 arch/arm/boot/dts/at91sam9x5ek.dtsi | 48 +++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/at91sam9x5ek.dtsi b/arch/arm/boot/dts/at91sam9x5ek.dtsi
index bd16bd3..b633b0f 100644
--- a/arch/arm/boot/dts/at91sam9x5ek.dtsi
+++ b/arch/arm/boot/dts/at91sam9x5ek.dtsi
@@ -66,9 +66,47 @@
 					compatible = "wm8731";
 					reg = <0x1a>;
 				};
+
+				ov2640: camera@0x30 {
+					compatible = "ovti,ov2640";
+					reg = <0x30>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_pck0_as_isi_mck &pinctrl_sensor_power &pinctrl_sensor_reset>;
+					resetb-gpios = <&pioA 7 GPIO_ACTIVE_LOW>;
+					pwdn-gpios = <&pioA 13 GPIO_ACTIVE_HIGH>;
+					clocks = <&pck0>;
+					clock-names = "xvclk";
+					assigned-clocks = <&pck0>;
+					assigned-clock-rates = <25000000>;
+					status = "disabled";
+
+					port {
+						ov2640_0: endpoint {
+							remote-endpoint = <&isi_0>;
+							bus-width = <8>;
+						};
+					};
+				};
 			};
 
 			pinctrl@fffff400 {
+				camera_sensor {
+					pinctrl_pck0_as_isi_mck: pck0_as_isi_mck-0 {
+						atmel,pins =
+							<AT91_PIOC 15 AT91_PERIPH_C AT91_PINCTRL_NONE>;			/* PC15 periph C ISI_MCK */
+					};
+
+					pinctrl_sensor_reset: sensor_reset-0 {
+						atmel,pins =
+							<AT91_PIOA 7 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;		/* PA7 gpio */
+					};
+
+					pinctrl_sensor_power: sensor_power-0 {
+						atmel,pins =
+							<AT91_PIOA 13 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;		/* PA13 gpio */
+					};
+				};
+
 				mmc0 {
 					pinctrl_board_mmc0: mmc0-board {
 						atmel,pins =
@@ -122,6 +160,16 @@
 		usb1: ehci@00700000 {
 			status = "okay";
 		};
+
+		isi: isi@f8048000 {
+			status = "disabled";
+			port {
+				isi_0: endpoint@0 {
+					remote-endpoint = <&ov2640_0>;
+					bus-width = <8>;
+				};
+			};
+		};
 	};
 
 	sound {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
