Return-Path: <vkoul@kernel.org>
From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 6/6] arm64: dts: qcom: qcs404: Remove default setting of controlled-remotely for BAM DMA
Date: Sun, 24 Mar 2019 22:02:09 +0530
Message-Id: <20190324163209.17312-7-vkoul@kernel.org>
In-Reply-To: <20190324163209.17312-1-vkoul@kernel.org>
References: <20190324163209.17312-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Khasim Syed Mohammed <khasim.mohammed@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Vinod Koul <vkoul@kernel.org>
List-ID: <devicetree@vger.kernel.org>

From: Khasim Syed Mohammed <khasim.mohammed@linaro.org>

The property controlled-remotely should not be set by default
for qcs-404 device, it should be set based on the secure boot
options (TZ or ATF) preferred by the platform. Hence, the
controlled-remotely property is moved to platform specific
dts files.

Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 8 ++++++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi     | 2 --
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index d4fadeaa0bbc..b04e38ae163f 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -215,3 +215,11 @@
 &blsp1_uart3 {
 	status = "okay";
 };
+
+&blsp1_dma {
+	qcom,controlled-remotely;
+};
+
+&blsp2_dma {
+	qcom,controlled-remotely;
+};
diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 32f2f51bbf7f..ffedf9640af7 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -435,7 +435,6 @@
 			clocks = <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "bam_clk";
 			#dma-cells = <1>;
-			qcom,controlled-remotely = <1>;
 			qcom,ee = <0>;
 			status = "okay";
 		};
@@ -680,7 +679,6 @@
 			clocks = <&gcc GCC_BLSP2_AHB_CLK>;
 			clock-names = "bam_clk";
 			#dma-cells = <1>;
-			qcom,controlled-remotely = <1>;
 			qcom,ee = <0>;
 			status = "disabled";
 		};
-- 
2.20.1
