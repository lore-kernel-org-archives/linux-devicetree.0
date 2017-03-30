From: Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v2 3/8] ARM: dts: stm32: Enable DCMI support on STM32F429 MCU
Date: Thu, 30 Mar 2017 17:27:42 +0200
Message-ID: <1490887667-8880-4-git-send-email-hugues.fruchet@st.com>
References: <1490887667-8880-1-git-send-email-hugues.fruchet@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490887667-8880-1-git-send-email-hugues.fruchet-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>
---
 arch/arm/boot/dts/stm32f429.dtsi | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index ee0da97..e1ff978 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -736,6 +736,29 @@
 					slew-rate = <3>;
 				};
 			};
+
+			dcmi_pins: dcmi_pins@0 {
+				pins {
+					pinmux = <STM32F429_PA4_FUNC_DCMI_HSYNC>,
+						 <STM32F429_PB7_FUNC_DCMI_VSYNC>,
+						 <STM32F429_PA6_FUNC_DCMI_PIXCLK>,
+						 <STM32F429_PC6_FUNC_DCMI_D0>,
+						 <STM32F429_PC7_FUNC_DCMI_D1>,
+						 <STM32F429_PC8_FUNC_DCMI_D2>,
+						 <STM32F429_PC9_FUNC_DCMI_D3>,
+						 <STM32F429_PC11_FUNC_DCMI_D4>,
+						 <STM32F429_PD3_FUNC_DCMI_D5>,
+						 <STM32F429_PB8_FUNC_DCMI_D6>,
+						 <STM32F429_PE6_FUNC_DCMI_D7>,
+						 <STM32F429_PC10_FUNC_DCMI_D8>,
+						 <STM32F429_PC12_FUNC_DCMI_D9>,
+						 <STM32F429_PD6_FUNC_DCMI_D10>,
+						 <STM32F429_PD2_FUNC_DCMI_D11>;
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <3>;
+				};
+			};
 		};
 
 		rcc: rcc@40023810 {
@@ -805,6 +828,20 @@
 			status = "disabled";
 		};
 
+		dcmi: dcmi@50050000 {
+			compatible = "st,stm32-dcmi";
+			reg = <0x50050000 0x400>;
+			interrupts = <78>;
+			resets = <&rcc STM32F4_AHB2_RESET(DCMI)>;
+			clocks = <&rcc 0 STM32F4_AHB2_CLOCK(DCMI)>;
+			clock-names = "mclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&dcmi_pins>;
+			dmas = <&dma2 1 1 0x414 0x3>;
+			dma-names = "tx";
+			status = "disabled";
+		};
+
 		rng: rng@50060800 {
 			compatible = "st,stm32-rng";
 			reg = <0x50060800 0x400>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
