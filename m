From: Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v3 1/2] arm64: dts: msm: add PDC device bindings for sdm845
Date: Fri, 24 Aug 2018 13:11:10 -0600
Message-ID: <20180824191111.14571-1-ilina@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marc.zyngier@arm.com, bjorn.andersson@linaro.org, sboyd@kernel.org, evgreen@chromium.org, linus.walleij@linaro.org
Cc: rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, andy.gross@linaro.org, dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
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
index b3d7af097edf..0208f8557ffa 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -966,6 +966,15 @@
 			};
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
 		spmi_bus: spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0xc440000 0x1100>,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
