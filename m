From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] ARM: at91/dt: sama5d4: add pioD controller
Date: Wed, 14 Jan 2015 11:08:08 +0100
Message-ID: <1421230089-1418-3-git-send-email-ludovic.desroches@atmel.com>
References: <1421230089-1418-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421230089-1418-1-git-send-email-ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

PioD controller was not described in the device tree since we don't use
it. As pinctrl-at91 allows disabled gpio controllers in the device
tree, we can add it to complete the device description.

Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/sama5d4.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5d4.dtsi
index 1b0f30c..368973e 100644
--- a/arch/arm/boot/dts/sama5d4.dtsi
+++ b/arch/arm/boot/dts/sama5d4.dtsi
@@ -62,6 +62,7 @@
 		gpio0 = &pioA;
 		gpio1 = &pioB;
 		gpio2 = &pioC;
+		gpio3 = &pioD;
 		gpio4 = &pioE;
 		tcb0 = &tcb0;
 		tcb1 = &tcb1;
@@ -1111,6 +1112,18 @@
 					clocks = <&pioC_clk>;
 				};
 
+				pioD: gpio@fc068000 {
+					compatible = "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
+					reg = <0xfc068000 0x100>;
+					interrupts = <5 IRQ_TYPE_LEVEL_HIGH 1>;
+					#gpio-cells = <2>;
+					gpio-controller;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+					clocks = <&pioD_clk>;
+					status = "disabled";
+				};
+
 				pioE: gpio@fc06d000 {
 					compatible = "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
 					reg = <0xfc06d000 0x100>;
-- 
2.2.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
