From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 7/7] devicetree: bindings: Document PM8921/8058 PMICs
Date: Mon, 23 Dec 2013 12:46:03 -0800
Message-ID: <1387831563-13535-8-git-send-email-sboyd@codeaurora.org>
References: <1387831563-13535-1-git-send-email-sboyd@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387831563-13535-1-git-send-email-sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

PM8921 and PM8058 are PMICs found paired with MSM8960 and MSM8660
devices respectively. They contain subdevices such as keypads,
RTC, regulators, clocks, etc.

Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Signed-off-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 .../devicetree/bindings/mfd/qcom,pm8xxx.txt        | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/qcom,pm8xxx.txt

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8xxx.txt b/Documentation/devicetree/bindings/mfd/qcom,pm8xxx.txt
new file mode 100644
index 0000000..e3fe625
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8xxx.txt
@@ -0,0 +1,63 @@
+Qualcomm PM8xxx PMIC multi-function devices
+
+PROPERTIES
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be one of:
+		    "qcom,pm8058"
+		    "qcom,pm8921"
+
+- #address-cells:
+	Usage: required
+	Value type: <u32>
+	Definition: must be 1
+
+- #size-cells:
+	Usage: required
+	Value type: <u32>
+	Definition: must be 0
+
+- interrupts:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: specifies the interrupt that indicates a subdevice
+		    has generated an interrupt (summary interrupt). The
+		    format of the specifier is defined by the binding document
+		    describing the node's interrupt parent.
+
+- #interrupt-cells:
+	Usage: required
+	Value type : <u32>
+	Definition: must be 2. Specifies the number of cells needed to encode
+		    an interrupt source. The 1st cell contains the interrupt
+		    number. The 2nd cell is the trigger type and level flags
+		    encoded as follows:
+
+			1 = low-to-high edge triggered
+			2 = high-to-low edge triggered
+			4 = active high level-sensitive
+			8 = active low level-sensitive
+
+- interrupt-controller:
+	Usage: required
+	Value type: <empty>
+	Definition: identifies this node as an interrupt controller
+
+EXAMPLE
+
+	pmicintc: pmic@0 {
+		compatible = "qcom,pm8921";
+		interrupts = <104 8>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pwrkey {
+			compatible = "qcom,pm8921-pwrkey";
+			interrupt-parent = <&pmicintc>;
+			interrupts = <50 1>, <51 1>;
+		};
+	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
