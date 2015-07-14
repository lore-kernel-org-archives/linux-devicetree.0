From: Tim Bird <tim.bird@sonymobile.com>
Subject: [PATCH v2 1/3] ARM: dts: qcom: Add binding for the qcom coincell charger
Date: Tue, 14 Jul 2015 16:26:18 -0700
Message-ID: <1436916380-3599-1-git-send-email-tim.bird@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: arnd@arndb.de, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, bjorn.andersson@sonymobile.com
List-Id: devicetree@vger.kernel.org

This binding is used to configure the driver for the coincell charger
found in Qualcomm PMICs.

Signed-off-by: Tim Bird <tim.bird@sonymobile.com>
---

Changes in v2:
 - remove 'qcom,' from example node name
 - Added reference to parent node pm8941@0 and binding doc for it

 .../bindings/power/qcom,coincell-charger.txt       | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/qcom,coincell-charger.txt

diff --git a/Documentation/devicetree/bindings/power/qcom,coincell-charger.txt b/Documentation/devicetree/bindings/power/qcom,coincell-charger.txt
new file mode 100644
index 0000000..f0316c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/qcom,coincell-charger.txt
@@ -0,0 +1,50 @@
+Qualcomm Coincell Charger:
+
+The hardware block controls charging for a coincell or capacitor that is
+used to provide power backup for certain features of the power management
+IC (PMIC)
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be: "qcom,pm8941-coincell"
+
+- reg:
+	Usage: required
+	Value type: <u32>
+	Definition: base address of the coincell charger registers
+
+- qcom,rset-ohms:
+	Usage: required
+	Value type: <u32>
+	Definition: resistance (in ohms) for current-limiting resistor
+		must be one of: 800, 1200, 1700, 2100
+
+- qcom,vset-millivolts:
+	Usage: required
+	Value type: <u32>
+	Definition: voltage (in millivolts) to apply for charging
+		must be one of: 2500, 3000, 3100, 3200
+
+- qcom,charge-enable:
+	Usage: optional
+	Value type: <u32> or <none>
+	Definition: definining this property, with an optional non-zero
+		value, enables charging
+
+This charger is a sub-node of one of the 8941 PMIC blocks, and is specified
+as a child node in DTS of that node.  See ../mfd/qcom,spmi-pmic.txt and
+../mfd/qcom-pm8xxx.txt
+
+Examples:
+
+	pm8941@0 {
+		coincell@2800 {
+			compatible = "qcom,pm8941-coincell";
+			reg = <0x2800>;
+
+			qcom,rset-ohms = <2100>;
+			qcom,vset-millivolts = <3000>;
+			qcom,charge-enable;
+		};
+	};
-- 
1.8.2.2
