From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH v3 3/5] devicetree: soc: Add Qualcomm SMD based RPM DT binding
Date: Mon, 27 Jul 2015 20:20:31 -0700
Message-ID: <1438053633-6659-4-git-send-email-bjorn.andersson@sonymobile.com>
References: <1438053633-6659-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438053633-6659-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>
List-Id: devicetree@vger.kernel.org

Add binding documentation for the Qualcomm Resource Power Manager (RPM)
using shared memory (Qualcomm SMD) as transport mechanism. This is found
in 8974 and newer based devices.

The binding currently describes the rpm itself and the regulator
subnodes.

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---

Changes since v2:
- Moved from mfd

 .../devicetree/bindings/soc/qcom,smd-rpm.txt       | 117 +++++++++++++++++++++
 1 file changed, 117 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom,smd-rpm.txt

diff --git a/Documentation/devicetree/bindings/soc/qcom,smd-rpm.txt b/Documentation/devicetree/bindings/soc/qcom,smd-rpm.txt
new file mode 100644
index 000000000000..e27f5c4c54fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom,smd-rpm.txt
@@ -0,0 +1,117 @@
+Qualcomm Resource Power Manager (RPM) over SMD
+
+This driver is used to interface with the Resource Power Manager (RPM) found in
+various Qualcomm platforms. The RPM allows each component in the system to vote
+for state of the system resources, such as clocks, regulators and bus
+frequencies.
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be one of:
+		    "qcom,rpm-msm8974"
+
+- qcom,smd-channels:
+	Usage: required
+	Value type: <stringlist>
+	Definition: Shared Memory channel used for communication with the RPM
+
+= SUBDEVICES
+
+The RPM exposes resources to its subnodes. The below bindings specify the set
+of valid subnodes that can operate on these resources.
+
+== Regulators
+
+Regulator nodes are identified by their compatible:
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be one of:
+		    "qcom,rpm-pm8841-regulators"
+		    "qcom,rpm-pm8941-regulators"
+
+- vdd_s1-supply:
+- vdd_s2-supply:
+- vdd_s3-supply:
+- vdd_s4-supply:
+- vdd_s5-supply:
+- vdd_s6-supply:
+- vdd_s7-supply:
+- vdd_s8-supply:
+	Usage: optional (pm8841 only)
+	Value type: <phandle>
+	Definition: reference to regulator supplying the input pin, as
+		    described in the data sheet
+
+- vdd_s1-supply:
+- vdd_s2-supply:
+- vdd_s3-supply:
+- vdd_l1_l3-supply:
+- vdd_l2_lvs1_2_3-supply:
+- vdd_l4_l11-supply:
+- vdd_l5_l7-supply:
+- vdd_l6_l12_l14_l15-supply:
+- vdd_l8_l16_l18_l19-supply:
+- vdd_l9_l10_l17_l22-supply:
+- vdd_l13_l20_l23_l24-supply:
+- vdd_l21-supply:
+- vin_5vs-supply:
+	Usage: optional (pm8941 only)
+	Value type: <phandle>
+	Definition: reference to regulator supplying the input pin, as
+		    described in the data sheet
+
+The regulator node houses sub-nodes for each regulator within the device. Each
+sub-node is identified using the node's name, with valid values listed for each
+of the pmics below.
+
+pm8841:
+	s1, s2, s3, s4, s5, s6, s7, s8
+
+pm8941:
+	s1, s2, s3, s4, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12, l13,
+	l14, l15, l16, l17, l18, l19, l20, l21, l22, l23, l24, lvs1, lvs2,
+	lvs3, 5vs1, 5vs2
+
+The content of each sub-node is defined by the standard binding for regulators -
+see regulator.txt.
+
+= EXAMPLE
+
+	smd {
+		compatible = "qcom,smd";
+
+		rpm {
+			interrupts = <0 168 1>;
+			qcom,ipc = <&apcs 8 0>;
+			qcom,smd-edge = <15>;
+
+			rpm_requests {
+				compatible = "qcom,rpm-msm8974";
+				qcom,smd-channels = "rpm_requests";
+
+				pm8941-regulators {
+					compatible = "qcom,rpm-pm8941-regulators";
+					vdd_l13_l20_l23_l24-supply = <&pm8941_boost>;
+
+					pm8941_s3: s3 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+					};
+
+					pm8941_boost: s4 {
+						regulator-min-microvolt = <5000000>;
+						regulator-max-microvolt = <5000000>;
+					};
+
+					pm8941_l20: l20 {
+						regulator-min-microvolt = <2950000>;
+						regulator-max-microvolt = <2950000>;
+					};
+				};
+			};
+		};
+	};
+
-- 
1.8.2.2
