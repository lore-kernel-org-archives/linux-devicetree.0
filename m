From: Nisha Kumari <nishakumari@codeaurora.org>
Subject: [PATCH 1/4] dt-bindings: regulator: Add labibb regulator
Date: Wed, 12 Jun 2019 16:30:49 +0530
Message-ID: <1560337252-27193-2-git-send-email-nishakumari@codeaurora.org>
References: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, broonie@kernel.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, agross@kernel.org
Cc: lgirdwood@gmail.com, mark.rutland@arm.com, david.brown@linaro.org, linux-kernel@vger.kernel.org, kgunda@codeaurora.org, rnayak@codeaurora.org, Nisha Kumari <nishakumari@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Adding the devicetree binding for labibb regulator.

Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
---
 .../bindings/regulator/qcom-labibb-regulator.txt   | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt
new file mode 100644
index 0000000..79aad6f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt
@@ -0,0 +1,57 @@
+Qualcomm's LAB(LCD AMOLED Boost)/IBB(Inverting Buck Boost) Regulator
+
+LAB can be used as a positive boost power supply and IBB can be used as a negative
+boost power supply for display panels.
+
+Main node required properties:
+
+- compatible:			Must be:
+				"qcom,lab-ibb-regulator"
+- #address-cells:		Must be 1
+- #size-cells:			Must be 0
+
+LAB subnode required properties:
+
+- reg:				Specifies the SPMI address and size for this peripheral.
+- regulator-name:		A string used to describe the regulator.
+- interrupts:			Specify the interrupts as per the interrupt
+				encoding.
+- interrupt-names:		Interrupt names to match up 1-to-1 with
+				the interrupts specified in 'interrupts'
+				property.
+
+IBB subnode required properties:
+
+- reg:				Specifies the SPMI address and size for this peripheral.
+- regulator-name:		A string used to describe the regulator.
+- interrupts:			Specify the interrupts as per the interrupt
+				encoding.
+- interrupt-names:		Interrupt names to match up 1-to-1 with
+				the interrupts specified in 'interrupts'
+				property.
+
+Example:
+	pmi8998_lsid1: pmic@3 {
+		qcom-labibb-regulator {
+			compatible = "qcom,lab-ibb-regulator";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			lab_regulator: qcom,lab@de00 {
+				reg = <0xde00>;
+				regulator-name = "lab_reg";
+
+				interrupts = <0x3 0xde 0x0 IRQ_TYPE_EDGE_RISING>;
+				interrupt-names = "lab-sc-err";
+			};
+
+			ibb_regulator: qcom,ibb@dc00 {
+				reg = <0xdc00>;
+				regulator-name = "ibb_reg";
+
+				interrupts = <0x3 0xdc 0x2 IRQ_TYPE_EDGE_RISING>;
+				interrupt-names = "ibb-sc-err";
+			};
+
+		};
+	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
