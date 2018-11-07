From: Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH RESEND v3 1/2] arm64: dts: msm: add PDC device bindings for sdm845
Date: Wed,  7 Nov 2018 14:51:08 -0700
Message-ID: <20181107215109.10720-1-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, bjorn.andersson@linaro.org
Cc: rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add PDC interrupt controller device bindings for SDM845.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
Changes in v3:
	- Fix PDC map, use GIC SPI port number for hwirq
Changes in v2:
	- Order by address
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b72bdb0a31a5..09f26ae9f803 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1256,6 +1256,15 @@
 			#power-domain-cells = <1>;
 		};
 
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,sdm845-pdc";
+			reg = <0xb220000 0x30000>;
+			qcom,pdc-ranges = <0 480 94>, <94 609 15>, <115 630 7>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
 		tsens0: thermal-sensor@c263000 {
 			compatible = "qcom,sdm845-tsens", "qcom,tsens-v2";
 			reg = <0xc263000 0x1ff>, /* TM */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
