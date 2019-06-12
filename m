From: Nisha Kumari <nishakumari@codeaurora.org>
Subject: [PATCH 2/4] arm64: dts: qcom: pmi8998: Add nodes for LAB and IBB regulators
Date: Wed, 12 Jun 2019 16:30:50 +0530
Message-ID: <1560337252-27193-3-git-send-email-nishakumari@codeaurora.org>
References: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, broonie@kernel.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, agross@kernel.org
Cc: lgirdwood@gmail.com, mark.rutland@arm.com, david.brown@linaro.org, linux-kernel@vger.kernel.org, kgunda@codeaurora.org, rnayak@codeaurora.org, Nisha Kumari <nishakumari@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch adds devicetree nodes for LAB and IBB regulators.

Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/pmi8998.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
index da3285e..6c8539f 100644
--- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -36,5 +36,27 @@
 		reg = <0x3 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		labibb: qcom-lab-ibb-regulator {
+			compatible = "qcom,lab-ibb-regulator";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ibb_regulator: qcom,ibb@dc00 {
+				reg = <0xdc00>;
+				regulator-name = "ibb_reg";
+
+				interrupts = <0x3 0xdc 0x2 IRQ_TYPE_EDGE_RISING>;
+				interrupt-names = "ibb-sc-err";
+			};
+
+			lab_regulator: qcom,lab@de00 {
+				reg = <0xde00>;
+				regulator-name = "lab_reg";
+
+				interrupts = <0x3 0xde 0x0 IRQ_TYPE_EDGE_RISING>;
+				interrupt-names = "lab-sc-err";
+			};
+		};
 	};
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
