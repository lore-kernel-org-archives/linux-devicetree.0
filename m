From: Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: [PATCH v3 1/3] ARM: dts: qcom: Add binding for the qcom coincell charger
Date: Thu, 16 Jul 2015 16:55:31 -0700
Message-ID: <1437090933-1232-1-git-send-email-tim.bird@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org
List-Id: devicetree@vger.kernel.org

This binding is used to configure the driver for the coincell charger
found in Qualcomm PMICs.

Signed-off-by: Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
---

Changes in v3:
 - change charge-enable property to charger-disable
Changes in v2:
 - remove 'qcom,' from example node name
 - Added reference to parent node pm8941@0 and binding doc for it

 .../bindings/power/qcom,coincell-charger.txt       | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/qcom,coincell-charger.txt

diff --git a/Documentation/devicetree/bindings/power/qcom,coincell-charger.txt b/Documentation/devicetree/bindings/power/qcom,coincell-charger.txt
new file mode 100644
index 0000000..0e6d875
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/qcom,coincell-charger.txt
@@ -0,0 +1,48 @@
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
+- qcom,charger-disable:
+	Usage: optional
+	Value type: <boolean>
+	Definition: definining this property disables charging
+
+This charger is a sub-node of one of the 8941 PMIC blocks, and is specified
+as a child node in DTS of that node.  See ../mfd/qcom,spmi-pmic.txt and
+../mfd/qcom-pm8xxx.txt
+
+Example:
+
+	pm8941@0 {
+		coincell@2800 {
+			compatible = "qcom,pm8941-coincell";
+			reg = <0x2800>;
+
+			qcom,rset-ohms = <2100>;
+			qcom,vset-millivolts = <3000>;
+		};
+	};
-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
