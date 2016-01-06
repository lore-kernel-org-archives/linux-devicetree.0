From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 3/5] ARM: at91/dt: sama5d2: add adc device
Date: Wed, 6 Jan 2016 17:12:37 +0100
Message-ID: <1452096759-19438-4-git-send-email-ludovic.desroches@atmel.com>
References: <1452096759-19438-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452096759-19438-1-git-send-email-ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the ADC device, and remove the adc_op_clk which is useless since the
adc sampling frequency is configured with sysfs.

Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/sama5d2.dtsi | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
index 3f750f6..1bd8899 100644
--- a/arch/arm/boot/dts/sama5d2.dtsi
+++ b/arch/arm/boot/dts/sama5d2.dtsi
@@ -88,12 +88,6 @@
 			#clock-cells = <0>;
 			clock-frequency = <0>;
 		};
-
-		adc_op_clk: adc_op_clk{
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <1000000>;
-		};
 	};
 
 	ns_sram: sram@00200000 {
@@ -1085,6 +1079,18 @@
 				status = "disabled";
 			};
 
+			adc: adc@fc030000 {
+				compatible = "atmel,sama5d2-adc";
+				reg = <0xfc030000 0x100>;
+				interrupts = <40 IRQ_TYPE_LEVEL_HIGH 7>;
+				clocks = <&adc_clk>;
+				clock-names = "adc_clk";
+				atmel,min-sample-rate = <200000>;
+				atmel,max-sample-rate = <20000000>;
+				atmel,startup-time-ms = <4>;
+				status = "disabled";
+			};
+
 			pioA: pinctrl@fc038000 {
 				compatible = "atmel,sama5d2-pinctrl";
 				reg = <0xfc038000 0x600>;
-- 
2.5.0
