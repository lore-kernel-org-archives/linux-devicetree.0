From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: [PATCH v2 1/2] arm64: dts: qcom: 8x16: UART1 add CTS_N, RTS_N pin configurations
Date: Fri, 18 Sep 2015 16:18:53 +0300
Message-ID: <1442582334-29387-2-git-send-email-ivan.ivanov@linaro.org>
References: <1442582334-29387-1-git-send-email-ivan.ivanov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442582334-29387-1-git-send-email-ivan.ivanov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add devicetree bindings for UART1 CTS_N and RTS_N pins.

Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
index 42941b977c48..f9b74bb14d31 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
@@ -16,10 +16,13 @@
 	blsp1_uart1_default: blsp1_uart1_default {
 		pinmux {
 			function = "blsp_uart1";
-			pins = "gpio0", "gpio1";
+			//	TX, RX, CTS_N, RTS_N
+			pins = "gpio0", "gpio1",
+			       "gpio2", "gpio3";
 		};
 		pinconf {
-			pins = "gpio0", "gpio1";
+			pins = "gpio0", "gpio1",
+			       "gpio2", "gpio3";
 			drive-strength = <16>;
 			bias-disable;
 		};
@@ -28,10 +31,12 @@
 	blsp1_uart1_sleep: blsp1_uart1_sleep {
 		pinmux {
 			function = "gpio";
-			pins = "gpio0", "gpio1";
+			pins = "gpio0", "gpio1",
+			       "gpio2", "gpio3";
 		};
 		pinconf {
-			pins = "gpio0", "gpio1";
+			pins = "gpio0", "gpio1",
+			       "gpio2", "gpio3";
 			drive-strength = <2>;
 			bias-pull-down;
 		};
--
1.9.1
