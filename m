From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: [PATCH 1/2] arm64: dts: qcom: 8x16: Add UART1 configuration nodes
Date: Sat, 12 Sep 2015 16:03:14 +0300
Message-ID: <1442062995-13523-1-git-send-email-ivan.ivanov@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add devicetree bindings for UART1 pins and device
controller with DMA channel specifiers.

Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi | 29 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi      | 12 ++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
index 568956859088..1330a7a6bcf1 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
@@ -13,6 +13,35 @@

 &msmgpio {

+	blsp1_uart1_default: blsp1_uart1_default {
+		pinmux {
+			function = "blsp_uart1";
+			//	TX, RX, CTS_N, RTS_N
+			pins = "gpio0", "gpio1",
+			       "gpio2", "gpio3";
+		};
+		pinconf {
+			pins = "gpio0", "gpio1",
+			       "gpio2", "gpio3";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart1_sleep: blsp1_uart1_sleep {
+		pinmux {
+			function = "blsp_uart1";
+			pins = "gpio0", "gpio1",
+			       "gpio2", "gpio3";
+		};
+		pinconf {
+			pins = "gpio0", "gpio1",
+			       "gpio2", "gpio3";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+	};
+
 	blsp1_uart2_default: blsp1_uart2_default {
 		pinmux {
 			function = "blsp_uart2";
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 5911de008dd5..f10ff7a2d0e3 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -102,6 +102,18 @@
 			reg = <0x1800000 0x80000>;
 		};

+		blsp1_uart1: serial@78af000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x78af000 0x200>;
+			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART1_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp_dma 1>, <&blsp_dma 0>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		blsp1_uart2: serial@78b0000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0x78b0000 0x200>;
--
1.9.1
