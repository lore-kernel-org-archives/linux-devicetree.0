From: Ilia Lin <ilialin@codeaurora.org>
Subject: [PATCH 2/2] dt-bindings: Add support for SAW documentation
Date: Sun,  4 Mar 2018 14:31:49 +0200
Message-ID: <1520166709-554-3-git-send-email-ilialin@codeaurora.org>
References: <1520166709-554-1-git-send-email-ilialin@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1520166709-554-1-git-send-email-ilialin@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, mark.rutland@arm.com
Cc: ilialin@codeaurora.org, amit.kucheria@linaro.org, nicolas.dechesne@linaro.org, celster@codeaurora.org, tfinkel@codeaurora.org
List-Id: devicetree@vger.kernel.org

Add support for SAW controlled regulators in 8x96.
Document it.

Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
---
 .../bindings/regulator/qcom,spmi-regulator.txt     | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
index 57d2c65..406f2e5 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
@@ -110,6 +110,11 @@ Qualcomm SPMI Regulators
 	Definition: Reference to regulator supplying the input pin, as
 		    described in the data sheet.
 
+- qcom,saw-reg:
+	Usage: optional
+	Value type: <phandle>
+	Description: Reference to syscon node defining the SAW registers.
+
 
 The regulator node houses sub-nodes for each regulator within the device. Each
 sub-node is identified using the node's name, with valid values listed for each
@@ -201,6 +206,17 @@ see regulator.txt - with additional custom properties described below:
 			2 = 0.55 uA
 			3 = 0.75 uA
 
+- qcom,saw-slave:
+	Usage: optional
+	Value type: <boo>
+	Description: SAW controlled gang slave. Will not be configured.
+
+- qcom,saw-leader:
+	Usage: optional
+	Value type: <boo>
+	Description: SAW controlled gang leader. Will be configured as
+		     SAW regulator.
+
 Example:
 
 	regulators {
@@ -221,3 +237,32 @@ Example:
 
 		....
 	};
+
+Example 2:
+
+	saw3: syscon@9A10000 {
+		compatible = "syscon";
+		reg = <0x9A10000 0x1000>;
+	};
+
+	...
+
+	spm-regulators {
+		compatible = "qcom,pm8994-regulators";
+		qcom,saw-reg = <&saw3>;
+		s8 {
+			qcom,saw-slave;
+		};
+		s9 {
+			qcom,saw-slave;
+		};
+		s10 {
+			qcom,saw-slave;
+		};
+		pm8994_s11_saw: s11 {
+			qcom,saw-leader;
+			regulator-always-on;
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1140000>;
+		};
+	};
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
