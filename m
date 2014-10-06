From: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
Subject: [PATCH 1/1] ARM: at91/dt: sam9263: Add CAN device nodes
Date: Mon,  6 Oct 2014 14:40:07 +0200
Message-ID: <1412599207-15676-1-git-send-email-alexander.stein@systec-electronic.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add the missing CAN devices node including their pin muxing. The required
clock node already exists.

Signed-off-by: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
---
 arch/arm/boot/dts/at91sam9263.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/at91sam9263.dtsi b/arch/arm/boot/dts/at91sam9263.dtsi
index bb23c2d..174ab77 100644
--- a/arch/arm/boot/dts/at91sam9263.dtsi
+++ b/arch/arm/boot/dts/at91sam9263.dtsi
@@ -672,6 +672,14 @@
 					};
 				};
 
+				can {
+					pinctrl_can_rx_tx: can_rx_tx {
+						atmel,pins =
+							<AT91_PIOA 14 AT91_PERIPH_A AT91_PINCTRL_NONE	/* CANRX, conflicts with IRQ0 */
+							 AT91_PIOA 13 AT91_PERIPH_A AT91_PINCTRL_NONE>;	/* CANTX, conflicts with PCK0 */
+					};
+				};
+
 				pioA: gpio@fffff200 {
 					compatible = "atmel,at91rm9200-gpio";
 					reg = <0xfffff200 0x200>;
@@ -898,6 +906,17 @@
 				clock-names = "pwm_clk";
 				status = "disabled";
 			};
+
+			can: can@fffac000 {
+				compatible = "atmel,at91sam9263-can";
+				reg = <0xfffac000 0x300>;
+				interrupts = <12 IRQ_TYPE_LEVEL_HIGH 3>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_can_rx_tx>;
+				clocks = <&can_clk>;
+				clock-names = "can_clk";
+				status = "disabled";
+			};
 		};
 
 		fb0: fb@0x00700000 {
-- 
2.0.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
