From: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 08/10] ARM: dts: stm32f429: Add adc support
Date: Tue, 25 Oct 2016 18:25:20 +0200
Message-ID: <1477412722-24061-9-git-send-email-fabrice.gasnier@st.com>
References: <1477412722-24061-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477412722-24061-1-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, fabrice.gasnier-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add adc support & pinctrl analog phandle (adc3_in8) to stm32f429.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
---
 arch/arm/boot/dts/stm32f429.dtsi | 62 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index 336ee4f..3fcd941 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -172,6 +172,62 @@
 			status = "disabled";
 		};
 
+		adc: adc@40012000 {
+			compatible = "st,stm32f4-adc";
+			reg = <0x40012000 0x400>;
+			interrupts = <18>;
+			clocks = <&rcc 0 168>;
+			clock-names = "adc";
+			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+			adc1: adc1-master@0 {
+				#io-channel-cells = <1>;
+				reg = <0x0>;
+				clocks = <&rcc 0 168>;
+				status = "disabled";
+			};
+
+			jadc1: adc1-injected@0 {
+				#io-channel-cells = <1>;
+				reg = <0x0>;
+				clocks = <&rcc 0 168>;
+				st,injected;
+				status = "disabled";
+			};
+
+			adc2: adc2-slave@100 {
+				#io-channel-cells = <1>;
+				reg = <0x100>;
+				clocks = <&rcc 0 169>;
+				status = "disabled";
+			};
+
+			jadc2: adc2-injected@100 {
+				#io-channel-cells = <1>;
+				reg = <0x100>;
+				clocks = <&rcc 0 169>;
+				st,injected;
+				status = "disabled";
+			};
+
+			adc3: adc3-slave@200 {
+				#io-channel-cells = <1>;
+				reg = <0x200>;
+				clocks = <&rcc 0 170>;
+				status = "disabled";
+			};
+
+			jadc3: adc3-injected@200 {
+				#io-channel-cells = <1>;
+				reg = <0x200>;
+				clocks = <&rcc 0 170>;
+				st,injected;
+				status = "disabled";
+			};
+		};
+
 		syscfg: system-config@40013800 {
 			compatible = "syscon";
 			reg = <0x40013800 0x400>;
@@ -332,6 +388,12 @@
 					slew-rate = <2>;
 				};
 			};
+
+			adc3_in8_pin: adc@0 {
+				pins {
+					pinmux = <STM32F429_PF10_FUNC_ANALOG>;
+				};
+			};
 		};
 
 		rcc: rcc@40023810 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
