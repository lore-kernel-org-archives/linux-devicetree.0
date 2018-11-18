From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 2/3] arm64: dts: qcom: qcs404: Define remaining UARTs
Date: Sun, 18 Nov 2018 12:01:34 -0800
Message-ID: <20181118200135.25258-3-bjorn.andersson@linaro.org>
References: <20181118200135.25258-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181118200135.25258-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the BLSP2 BAM and add the remaining four UARTs found on the QCS404
platform.

Note that these has not been tested.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 84 ++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 9ec5c85fcb81..ca00987d6400 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -273,6 +273,16 @@
 			interrupt-controller;
 			#interrupt-cells = <2>;
 
+			blsp1_uart0_default: blsp1-uart0-default {
+				pins = "gpio30", "gpio31", "gpio32", "gpio33";
+				function = "blsp_uart0";
+			};
+
+			blsp1_uart1_default: blsp1-uart1-default {
+				pins = "gpio22", "gpio23";
+				function = "blsp_uart1";
+			};
+
 			blsp1_uart2_default: blsp1-uart2-default {
 				rx {
 					pins = "gpio18";
@@ -284,6 +294,16 @@
 					function = "blsp_uart_tx_a2";
 				};
 			};
+
+			blsp1_uart3_default: blsp1-uart3-default {
+				pins = "gpio82", "gpio83", "gpio84", "gpio85";
+				function = "blsp_uart3";
+			};
+
+			blsp2_uart0_default: blsp2-uart0-default {
+				pins = "gpio26", "gpio27", "gpio28", "gpio29";
+				function = "blsp_uart5";
+			};
 		};
 
 		gcc: clock-controller@1800000 {
@@ -347,6 +367,32 @@
 			status = "okay";
 		};
 
+		blsp1_uart0: serial@78af000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x078af000 0x200>;
+			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART0_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp1_dma 1>, <&blsp1_dma 0>;
+			dma-names = "rx", "tx";
+			pinctrl-names = "default";
+			pinctrl-0 = <&blsp1_uart0_default>;
+			status = "disabled";
+		};
+
+		blsp1_uart1: serial@78b0000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x078b0000 0x200>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART1_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp1_dma 3>, <&blsp1_dma 2>;
+			dma-names = "rx", "tx";
+			pinctrl-names = "default";
+			pinctrl-0 = <&blsp1_uart1_default>;
+			status = "disabled";
+		};
+
 		blsp1_uart2: serial@78b1000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0x078b1000 0x200>;
@@ -360,6 +406,44 @@
 			status = "okay";
 		};
 
+		blsp1_uart3: serial@78b2000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x078b2000 0x200>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART3_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp1_dma 7>, <&blsp1_dma 6>;
+			dma-names = "rx", "tx";
+			pinctrl-names = "default";
+			pinctrl-0 = <&blsp1_uart3_default>;
+			status = "disabled";
+		};
+
+		blsp2_dma: dma@7ac4000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x07ac4000 0x17000>;
+			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,controlled-remotely = <1>;
+			qcom,ee = <0>;
+			status = "disabled";
+		};
+
+		blsp2_uart0: serial@7aef000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x07aef000 0x200>;
+			interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_UART0_APPS_CLK>, <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp2_dma 1>, <&blsp2_dma 0>;
+			dma-names = "rx", "tx";
+			pinctrl-names = "default";
+			pinctrl-0 = <&blsp2_uart0_default>;
+			status = "disabled";
+		};
+
 		intc: interrupt-controller@b000000 {
 			compatible = "qcom,msm-qgic2";
 			interrupt-controller;
-- 
2.18.0
