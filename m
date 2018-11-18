From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 1/3] arm64: dts: qcom: qcs404: Specify pinctrl state for UART
Date: Sun, 18 Nov 2018 12:01:33 -0800
Message-ID: <20181118200135.25258-2-bjorn.andersson@linaro.org>
References: <20181118200135.25258-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181118200135.25258-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

BLSP1 UART2 is used as debug uart on the EVB development board, define
pinmux state for the UART in the platform dtsi and pinconf state for it
in the board dts.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi     | 14 ++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index a39924efebe4..2ed9b0a0e5f2 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -186,3 +186,17 @@
 		};
 	};
 };
+
+/* PINCTRL - additions to nodes defined in qcs404.dtsi */
+
+&blsp1_uart2_default {
+	rx {
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	tx {
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 9b5c16562bbe..9ec5c85fcb81 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -272,6 +272,18 @@
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+
+			blsp1_uart2_default: blsp1-uart2-default {
+				rx {
+					pins = "gpio18";
+					function = "blsp_uart_rx_a2";
+				};
+
+				tx {
+					pins = "gpio17";
+					function = "blsp_uart_tx_a2";
+				};
+			};
 		};
 
 		gcc: clock-controller@1800000 {
@@ -343,6 +355,8 @@
 			clock-names = "core", "iface";
 			dmas = <&blsp1_dma 5>, <&blsp1_dma 4>;
 			dma-names = "rx", "tx";
+			pinctrl-names = "default";
+			pinctrl-0 = <&blsp1_uart2_default>;
 			status = "okay";
 		};
 
-- 
2.18.0
