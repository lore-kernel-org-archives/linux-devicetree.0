From: Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: [PATCH 1/3] ARM: dts: qcom: Add binding for the qcom coincell charger
Date: Mon, 13 Jul 2015 16:39:30 -0700
Message-ID: <1436830772-32632-1-git-send-email-tim.bird@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This binding is used to configure the driver for the coincell charger
found in Qualcomm PMICs.

Signed-off-by: Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
---
 .../bindings/power/qcom,coincell-charger.txt       | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/qcom,coincell-charger.txt

diff --git a/Documentation/devicetree/bindings/power/qcom,coincell-charger.txt b/Documentation/devicetree/bindings/power/qcom,coincell-charger.txt
new file mode 100644
index 0000000..bf39e2a
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/qcom,coincell-charger.txt
@@ -0,0 +1,44 @@
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
+Examples:
+
+	qcom,coincell@2800 {
+		compatible = "qcom,pm8941-coincell";
+		reg = <0x2800>;
+
+		qcom,rset-ohms = <2100>;
+		qcom,vset-millivolts = <3000>;
+		qcom,charge-enable;
+	};
--
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
