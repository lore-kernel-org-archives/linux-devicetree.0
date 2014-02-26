From: <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: at91: sama5d3: get rid of atmel_tsadcc driver
Date: Wed, 26 Feb 2014 17:29:50 +0100
Message-ID: <1393432190-8799-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Touchscreen support for at91_adc has been introduced so we can get rid of
atmel_tsadcc.

Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/sama5d3.dtsi    |   14 +-------------
 arch/arm/boot/dts/sama5d3xdm.dtsi |    7 +++----
 2 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5d3.dtsi
index 3d5faf8..26d7ed5 100644
--- a/arch/arm/boot/dts/sama5d3.dtsi
+++ b/arch/arm/boot/dts/sama5d3.dtsi
@@ -239,7 +239,7 @@
 			};
 
 			adc0: adc@f8018000 {
-				compatible = "atmel,at91sam9260-adc";
+				compatible = "atmel,at91sam9x5-adc";
 				reg = <0xf8018000 0x100>;
 				interrupts = <29 IRQ_TYPE_LEVEL_HIGH 5>;
 				pinctrl-names = "default";
@@ -295,18 +295,6 @@
 				};
 			};
 
-			tsadcc: tsadcc@f8018000 {
-				compatible = "atmel,at91sam9x5-tsadcc";
-				reg = <0xf8018000 0x4000>;
-				interrupts = <29 IRQ_TYPE_LEVEL_HIGH 5>;
-				atmel,tsadcc_clock = <300000>;
-				atmel,filtering_average = <0x03>;
-				atmel,pendet_debounce = <0x08>;
-				atmel,pendet_sensitivity = <0x02>;
-				atmel,ts_sample_hold_time = <0x0a>;
-				status = "disabled";
-			};
-
 			i2c2: i2c@f801c000 {
 				compatible = "atmel,at91sam9x5-i2c";
 				reg = <0xf801c000 0x4000>;
diff --git a/arch/arm/boot/dts/sama5d3xdm.dtsi b/arch/arm/boot/dts/sama5d3xdm.dtsi
index f9bdde5..0b8f5d1 100644
--- a/arch/arm/boot/dts/sama5d3xdm.dtsi
+++ b/arch/arm/boot/dts/sama5d3xdm.dtsi
@@ -23,10 +23,9 @@
 			};
 
 			adc0: adc@f8018000 {
-				status = "disabled";
-			};
-
-			tsadcc: tsadcc@f8018000 {
+				atmel,adc-clock-rate = <1000000>;
+				atmel,adc-ts-wires = <4>;
+				atmel,adc-ts-pressure-threshold = <10000>;
 				status = "okay";
 			};
 
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
