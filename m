Return-Path: <vkoul@kernel.org>
From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 4/6] arm64: dts: qcom: qcs404: Enable blsp1_uart3 for qcs404-evb
Date: Sun, 24 Mar 2019 22:02:07 +0530
Message-Id: <20190324163209.17312-5-vkoul@kernel.org>
In-Reply-To: <20190324163209.17312-1-vkoul@kernel.org>
References: <20190324163209.17312-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Abhinav Asati <asatiabhi@codeaurora.org>, Vinod Koul <vkoul@kernel.org>
List-ID: <devicetree@vger.kernel.org>

From: Shawn Guo <shawn.guo@linaro.org>

It defines pinctrl settings for blsp1_uart3 in board level dts and
enable the device by toggling 'status'.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
Signed-off-by: Abhinav Asati <asatiabhi@codeaurora.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 323f9633084b..d4fadeaa0bbc 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -7,6 +7,7 @@
 / {
 	aliases {
 		serial0 = &blsp1_uart2;
+		serial1 = &blsp1_uart3;
 	};
 
 	chosen {
@@ -137,6 +138,11 @@
 };
 
 &tlmm {
+	blsp1_uart3_default: blsp1-uart3-default {
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	sdc1_on: sdc1-on {
 		clk {
 			pins = "sdc1_clk";
@@ -205,3 +211,7 @@
 		bias-disable;
 	};
 };
+
+&blsp1_uart3 {
+	status = "okay";
+};
-- 
2.20.1
