From: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v3 5/6] ARM: dts: stm32f429: Add adc support
Date: Tue, 15 Nov 2016 16:31:00 +0100
Message-ID: <1479223861-21747-6-git-send-email-fabrice.gasnier@st.com>
References: <1479223861-21747-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479223861-21747-1-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, fabrice.gasnier-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add adc support & pinctrl analog phandle (adc3_in8) to stm32f429.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
---
 arch/arm/boot/dts/stm32f429.dtsi | 49 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index 336ee4f..f198132 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -172,6 +172,49 @@
 			status = "disabled";
 		};
 
+		adc: adc@40012000 {
+			compatible = "st,stm32f4-adc-core";
+			reg = <0x40012000 0x400>;
+			interrupts = <18>;
+			clocks = <&rcc 0 168>;
+			clock-names = "adc";
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			adc1: adc@0 {
+				compatible = "st,stm32f4-adc";
+				#io-channel-cells = <1>;
+				reg = <0x0>;
+				clocks = <&rcc 0 168>;
+				interrupt-parent = <&adc>;
+				interrupts = <0>;
+				status = "disabled";
+			};
+
+			adc2: adc@100 {
+				compatible = "st,stm32f4-adc";
+				#io-channel-cells = <1>;
+				reg = <0x100>;
+				clocks = <&rcc 0 169>;
+				interrupt-parent = <&adc>;
+				interrupts = <1>;
+				status = "disabled";
+			};
+
+			adc3: adc@200 {
+				compatible = "st,stm32f4-adc";
+				#io-channel-cells = <1>;
+				reg = <0x200>;
+				clocks = <&rcc 0 170>;
+				interrupt-parent = <&adc>;
+				interrupts = <2>;
+				status = "disabled";
+			};
+		};
+
 		syscfg: system-config@40013800 {
 			compatible = "syscon";
 			reg = <0x40013800 0x400>;
@@ -332,6 +375,12 @@
 					slew-rate = <2>;
 				};
 			};
+
+			adc3_in8_pin: adc@200 {
+				pins {
+					pinmux = <STM32F429_PF10_FUNC_ANALOG>;
+				};
+			};
 		};
 
 		rcc: rcc@40023810 {
-- 
1.9.1
