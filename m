From: Songjun Wu <songjun.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] ARM: at91/dt: sama5d2: add pdmic node
Date: Tue, 22 Dec 2015 17:26:04 +0800
Message-ID: <1450776365-6373-1-git-send-email-songjun.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org
Cc: Ludovic.Desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, Songjun Wu <songjun.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add pdmic node.`

Signed-off-by: Songjun Wu <songjun.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---

 arch/arm/boot/dts/sama5d2.dtsi |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
index 545264b..3f750f6 100644
--- a/arch/arm/boot/dts/sama5d2.dtsi
+++ b/arch/arm/boot/dts/sama5d2.dtsi
@@ -637,6 +637,12 @@
 						atmel,clk-output-range = <0 83000000>;
 					};
 
+					pdmic_clk: pdmic_clk {
+						#clock-cells = <0>;
+						reg = <48>;
+						atmel,clk-output-range = <0 83000000>;
+					};
+
 					i2s0_clk: i2s0_clk {
 						#clock-cells = <0>;
 						reg = <54>;
@@ -763,6 +769,11 @@
 						atmel,clk-output-range = <0 83000000>;
 					};
 
+					pdmic_gclk: pdmic_gclk {
+						#clock-cells = <0>;
+						reg = <48>;
+					};
+
 					i2s0_gclk: i2s0_gclk {
 						#clock-cells = <0>;
 						reg = <54>;
@@ -852,6 +863,19 @@
 				clock-names = "t0_clk", "slow_clk";
 			};
 
+			pdmic: pdmic@f8018000 {
+				compatible = "atmel,sama5d2-pdmic";
+				reg = <0xf8018000 0x124>;
+				interrupts = <48 IRQ_TYPE_LEVEL_HIGH 7>;
+				dmas = <&dma0
+					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
+					| AT91_XDMAC_DT_PERID(50))>;
+				dma-names = "rx";
+				clocks = <&pdmic_clk>, <&pdmic_gclk>;
+				clock-names = "pclk", "gclk";
+				status = "disabled";
+			};
+
 			uart0: serial@f801c000 {
 				compatible = "atmel,at91sam9260-usart";
 				reg = <0xf801c000 0x100>;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
