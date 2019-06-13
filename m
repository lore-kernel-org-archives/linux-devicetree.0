From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v3 6/7] dt-bindings: qcom_spmi: Document pms405 support
Date: Thu, 13 Jun 2019 07:24:16 -0700
Message-ID: <20190613142416.8985-1-jeffrey.l.hugo@gmail.com>
References: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org
Cc: agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>

The PMS405 supports 5 SMPS and 13 LDO regulators.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 .../regulator/qcom,spmi-regulator.txt         | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
index ba94bc2d407a..19cffb239094 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
@@ -10,6 +10,7 @@ Qualcomm SPMI Regulators
 			"qcom,pm8941-regulators"
 			"qcom,pm8994-regulators"
 			"qcom,pmi8994-regulators"
+			"qcom,pms405-regulators"
 
 - interrupts:
 	Usage: optional
@@ -111,6 +112,29 @@ Qualcomm SPMI Regulators
 	Definition: Reference to regulator supplying the input pin, as
 		    described in the data sheet.
 
+- vdd_s1-supply:
+- vdd_s2-supply:
+- vdd_s3-supply:
+- vdd_s4-supply:
+- vdd_s5-supply:
+- vdd_l1-supply:
+- vdd_l2-supply:
+- vdd_l3-supply:
+- vdd_l4-supply:
+- vdd_l5-supply:
+- vdd_l6-supply:
+- vdd_l7-supply:
+- vdd_l8-supply:
+- vdd_l9-supply:
+- vdd_l10-supply:
+- vdd_l11-supply:
+- vdd_l12-supply:
+- vdd_l13-supply:
+	Usage: optional (pms405 only)
+	Value type: <phandle>
+	Definition: Reference to regulator supplying the input pin, as
+		    described in the data sheet.
+
 - qcom,saw-reg:
 	Usage: optional
 	Value type: <phandle>
-- 
2.17.1
