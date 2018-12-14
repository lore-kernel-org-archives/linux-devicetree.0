From: jakob.wuhrer@gmail.com
Subject: [PATCH 2/2] arm64: dts: qcom: Add more msm8996 uarts
Date: Fri, 14 Dec 2018 18:01:31 +0100
Message-ID: <1544806891-12516-2-git-send-email-jakob.wuhrer@gmail.com>
References: <1544806891-12516-1-git-send-email-jakob.wuhrer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544806891-12516-1-git-send-email-jakob.wuhrer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org
Cc: Jakob Wuhrer <jakobwuhrer@airmail.cc>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Jakob Wuhrer <jakobwuhrer@airmail.cc>

msm8996 has 12 uarts, but the devicetree only lists 3. Add the
pinmuxing and the main devicetree entries for the others.

Signed-off-by: Jakob Wuhrer <jakobwuhrer@airmail.cc>
---
 arch/arm64/boot/dts/qcom/msm8996-pins.dtsi | 524 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi      |  80 +++++
 2 files changed, 604 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
index 1d1f7f9..99056b6 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
@@ -495,4 +495,528 @@
 			bias-disable;
 		};
 	};
+
+	blsp1_uart0_2pins_default: blsp1_uart0_2pins {
+		pinmux {
+			function = "blsp_uart1";
+			pins = "gpio0", "gpio1";
+		};
+		pinconf {
+			pins = "gpio0", "gpio1";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart0_2pins_sleep: blsp1_uart0_2pins_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio0", "gpio1";
+		};
+		pinconf {
+			pins = "gpio0", "gpio1";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart0_4pins_default: blsp1_uart0_4pins {
+		pinmux {
+			function = "blsp_uart1";
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+		};
+
+		pinconf {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart0_4pins_sleep: blsp1_uart0_4pins_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+		};
+
+		pinconf {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart1_2pins_default: blsp1_uart1_2pins {
+		pinmux {
+			function = "blsp_uart2";
+			pins = "gpio41", "gpio42";
+		};
+		pinconf {
+			pins = "gpio41", "gpio42";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart1_2pins_sleep: blsp1_uart1_2pins_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio41", "gpio42";
+		};
+		pinconf {
+			pins = "gpio41", "gpio42";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart1_4pins_default: blsp1_uart1_4pins {
+		pinmux {
+			function = "blsp_uart2";
+			pins = "gpio41", "gpio42", "gpio43", "gpio44";
+		};
+
+		pinconf {
+			pins = "gpio41", "gpio42", "gpio43", "gpio44";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart1_4pins_sleep: blsp1_uart1_4pins_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio41", "gpio42", "gpio43", "gpio44";
+		};
+
+		pinconf {
+			pins = "gpio41", "gpio42", "gpio43", "gpio44";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart2_2pins_default: blsp1_uart2_2pins {
+		pinmux {
+			function = "blsp_uart3";
+			pins = "gpio45", "gpio46";
+		};
+		pinconf {
+			pins = "gpio45", "gpio46";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart2_2pins_sleep: blsp1_uart2_2pins_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio45", "gpio46";
+		};
+		pinconf {
+			pins = "gpio45", "gpio46";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart2_4pins_default: blsp1_uart2_4pins {
+		pinmux {
+			function = "blsp_uart3";
+			pins = "gpio45", "gpio46", "gpio47", "gpio48";
+		};
+
+		pinconf {
+			pins = "gpio45", "gpio46", "gpio47", "gpio48";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart2_4pins_sleep: blsp1_uart2_4pins_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio45", "gpio46", "gpio47", "gpio48";
+		};
+
+		pinconf {
+			pins = "gpio45", "gpio46", "gpio47", "gpio48";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart3_2pins_default: blsp1_uart3_2pins {
+		pinmux {
+			function = "blsp_uart4";
+			pins = "gpio65", "gpio66";
+		};
+		pinconf {
+			pins = "gpio65", "gpio66";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart3_2pins_sleep: blsp1_uart3_2pins_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio65", "gpio66";
+		};
+		pinconf {
+			pins = "gpio65", "gpio66";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart3_4pins_default: blsp1_uart3_4pins {
+		pinmux {
+			function = "blsp_uart4";
+			pins = "gpio65", "gpio66", "gpio67", "gpio68";
+		};
+
+		pinconf {
+			pins = "gpio65", "gpio66", "gpio67", "gpio68";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart3_4pins_sleep: blsp1_uart3_4pins_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio65", "gpio66", "gpio67", "gpio68";
+		};
+
+		pinconf {
+			pins = "gpio65", "gpio66", "gpio67", "gpio68";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart4_2pins_default: blsp1_uart4_2pins {
+		pinmux {
+			function = "blsp_uart5";
+			pins = "gpio81", "gpio82";
+		};
+		pinconf {
+			pins = "gpio81", "gpio82";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart4_2pins_sleep: blsp1_uart4_2pins_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio81", "gpio82";
+		};
+		pinconf {
+			pins = "gpio81", "gpio82";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart4_4pins_default: blsp1_uart4_4pins {
+		pinmux {
+			function = "blsp_uart5";
+			pins = "gpio81", "gpio82", "gpio83", "gpio84";
+		};
+
+		pinconf {
+			pins = "gpio81", "gpio82", "gpio83", "gpio84";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart4_4pins_sleep: blsp1_uart4_4pins_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio81", "gpio82", "gpio83", "gpio84";
+		};
+
+		pinconf {
+			pins = "gpio81", "gpio82", "gpio83", "gpio84";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart5_2pins_default: blsp1_uart5_2pins {
+		pinmux {
+			function = "blsp_uart6";
+			pins = "gpio25", "gpio26";
+		};
+		pinconf {
+			pins = "gpio25", "gpio26";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart5_2pins_sleep: blsp1_uart5_2pins_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio25", "gpio26";
+		};
+		pinconf {
+			pins = "gpio25", "gpio26";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart5_4pins_default: blsp1_uart5_4pins {
+		pinmux {
+			function = "blsp_uart6";
+			pins = "gpio25", "gpio26", "gpio27", "gpio28";
+		};
+
+		pinconf {
+			pins = "gpio25", "gpio26", "gpio27", "gpio28";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart5_4pins_sleep: blsp1_uart5_4pins_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio25", "gpio26", "gpio27", "gpio28";
+		};
+
+		pinconf {
+			pins = "gpio25", "gpio26", "gpio27", "gpio28";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart0_2pins_default: blsp2_uart0_2pins {
+		pinmux {
+			function = "blsp_uart7";
+			pins = "gpio53", "gpio54";
+		};
+		pinconf {
+			pins = "gpio53", "gpio54";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart0_2pins_sleep: blsp2_uart0_2pins_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio53", "gpio54";
+		};
+		pinconf {
+			pins = "gpio53", "gpio54";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart0_4pins_default: blsp2_uart0_4pins {
+		pinmux {
+			function = "blsp_uart7";
+			pins = "gpio53", "gpio54", "gpio55", "gpio56";
+		};
+
+		pinconf {
+			pins = "gpio53", "gpio54", "gpio55", "gpio56";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart0_4pins_sleep: blsp2_uart0_4pins_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio53", "gpio54", "gpio55", "gpio56";
+		};
+
+		pinconf {
+			pins = "gpio53", "gpio54", "gpio55", "gpio56";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart3_2pins_default: blsp2_uart3_2pins {
+		pinmux {
+			function = "blsp_uart10";
+			pins = "gpio8", "gpio9";
+		};
+		pinconf {
+			pins = "gpio8", "gpio9";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart3_2pins_sleep: blsp2_uart3_2pins_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio8", "gpio9";
+		};
+		pinconf {
+			pins = "gpio8", "gpio9";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart3_4pins_default: blsp2_uart3_4pins {
+		pinmux {
+			function = "blsp_uart10";
+			pins = "gpio8", "gpio9", "gpio10", "gpio11";
+		};
+
+		pinconf {
+			pins = "gpio8", "gpio9", "gpio10", "gpio11";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart3_4pins_sleep: blsp2_uart3_4pins_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio8", "gpio9", "gpio10", "gpio11";
+		};
+
+		pinconf {
+			pins = "gpio8", "gpio9", "gpio10", "gpio11";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart4_2pins_alt_default: blsp2_uart4_2pins_alt {
+		pinmux {
+			function = "blsp_uart11";
+			pins = "gpio100", "gpio101";
+		};
+		pinconf {
+			pins = "gpio100", "gpio101";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart4_2pins_alt_sleep: blsp2_uart4_2pins_alt_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio100", "gpio101";
+		};
+		pinconf {
+			pins = "gpio100", "gpio101";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart4_2pins_default: blsp2_uart4_2pins {
+		pinmux {
+			function = "blsp_uart11";
+			pins = "gpio58", "gpio59";
+		};
+		pinconf {
+			pins = "gpio58", "gpio59";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart4_2pins_sleep: blsp2_uart4_2pins_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio58", "gpio59";
+		};
+		pinconf {
+			pins = "gpio58", "gpio59";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart4_4pins_default: blsp2_uart4_4pins {
+		pinmux {
+			function = "blsp_uart11";
+			pins = "gpio58", "gpio59", "gpio60", "gpio61";
+		};
+
+		pinconf {
+			pins = "gpio58", "gpio59", "gpio60", "gpio61";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart4_4pins_sleep: blsp2_uart4_4pins_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio58", "gpio59", "gpio60", "gpio61";
+		};
+
+		pinconf {
+			pins = "gpio58", "gpio59", "gpio60", "gpio61";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart5_2pins_default: blsp2_uart5_2pins {
+		pinmux {
+			function = "blsp_uart12";
+			pins = "gpio85", "gpio86";
+		};
+		pinconf {
+			pins = "gpio85", "gpio86";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart5_2pins_sleep: blsp2_uart5_2pins_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio85", "gpio86";
+		};
+		pinconf {
+			pins = "gpio85", "gpio86";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart5_4pins_default: blsp2_uart5_4pins {
+		pinmux {
+			function = "blsp_uart12";
+			pins = "gpio85", "gpio86", "gpio87", "gpio88";
+		};
+
+		pinconf {
+			pins = "gpio85", "gpio86", "gpio87", "gpio88";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart5_4pins_sleep: blsp2_uart5_4pins_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio85", "gpio86", "gpio87", "gpio88";
+		};
+
+		pinconf {
+			pins = "gpio85", "gpio86", "gpio87", "gpio88";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 13bb964..c2a5062 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -435,6 +435,16 @@
 			#clock-cells = <1>;
 		};
 
+		blsp1_uart0: serial@756f000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x0756f000 0x1000>;
+			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART1_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			status = "disabled";
+		};
+
 		blsp1_uart1: serial@7570000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0x07570000 0x1000>;
@@ -445,6 +455,76 @@
 			status = "disabled";
 		};
 
+		blsp1_uart2: serial@7571000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x07571000 0x1000>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART3_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			status = "disabled";
+		};
+
+		blsp1_uart3: serial@7572000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x07572000 0x1000>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART4_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			status = "disabled";
+		};
+
+		blsp1_uart4: serial@7573000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x07573000 0x1000>;
+			interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART5_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			status = "disabled";
+		};
+
+		blsp1_uart5: serial@7574000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x07574000 0x1000>;
+			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART6_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			status = "disabled";
+		};
+
+		blsp2_uart3: serial@75b2000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x075b2000 0x1000>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_UART4_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			status = "disabled";
+		};
+
+		blsp2_uart4: serial@75b3000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x075b3000 0x1000>;
+			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_UART5_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			status = "disabled";
+		};
+
+		blsp2_uart5: serial@75b4000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x075b4000 0x1000>;
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_UART6_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			status = "disabled";
+		};
+
 		blsp1_spi0: spi@7575000 {
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0x07575000 0x600>;
-- 
1.8.3.1
